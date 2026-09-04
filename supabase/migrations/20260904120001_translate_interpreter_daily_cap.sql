-- Sınırsız maliyet açığı kapatıldı — 4 Eylül 2026.
--
-- Güvenlik/maliyet denetiminde bulundu: `translate` (Plus'a özel bulut
-- çeviri) ve `interpreter-translate` (Toplantı Çevirmeni — herkese açık,
-- uygulama her açılışta otomatik anonim oturum açtığı için kaydolmadan/
-- ödeme yapmadan bile çağrılabiliyordu) fonksiyonlarının HİÇBİRİNDE
-- günlük bir üst sınır yoktu — `ai-feedback`/`tts`/`chat`'e 3 Eylül'de
-- eklenen kontrolün ikisine de hiç uygulanmamış olması bir gözden
-- kaçırma idi. Teorik maksimum maliyet sınırsızdı.

alter table public.ai_usage_daily
  add column if not exists translate_count int not null default 0,
  add column if not exists interpreter_count int not null default 0;

create or replace function public.try_consume_ai_usage(
  p_user_id uuid,
  p_op text,
  p_limit int
) returns boolean
language plpgsql
security definer
set search_path = public
as $$
declare
  v_count int;
begin
  insert into public.ai_usage_daily (user_id, day)
  values (p_user_id, (now() at time zone 'utc')::date)
  on conflict (user_id, day) do nothing;

  if p_op = 'feedback' then
    update public.ai_usage_daily
      set feedback_count = feedback_count + 1
      where user_id = p_user_id
        and day = (now() at time zone 'utc')::date
        and feedback_count < p_limit + feedback_bonus
      returning feedback_count into v_count;
  elsif p_op = 'tts' then
    update public.ai_usage_daily
      set tts_count = tts_count + 1
      where user_id = p_user_id
        and day = (now() at time zone 'utc')::date
        and tts_count < p_limit
      returning tts_count into v_count;
  elsif p_op = 'chat' then
    update public.ai_usage_daily
      set chat_count = chat_count + 1
      where user_id = p_user_id
        and day = (now() at time zone 'utc')::date
        and chat_count < p_limit
      returning chat_count into v_count;
  elsif p_op = 'translate' then
    update public.ai_usage_daily
      set translate_count = translate_count + 1
      where user_id = p_user_id
        and day = (now() at time zone 'utc')::date
        and translate_count < p_limit
      returning translate_count into v_count;
  elsif p_op = 'interpreter' then
    update public.ai_usage_daily
      set interpreter_count = interpreter_count + 1
      where user_id = p_user_id
        and day = (now() at time zone 'utc')::date
        and interpreter_count < p_limit
      returning interpreter_count into v_count;
  else
    return false;
  end if;

  return v_count is not null;
end;
$$;

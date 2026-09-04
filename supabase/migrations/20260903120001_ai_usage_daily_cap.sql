-- Günlük AI/ses kullanım sayacı — 3 Eylül 2026.
--
-- Neden: `ai-feedback`, `tts` ve `chat` Edge Function'ları gerçek Claude/
-- ElevenLabs API'lerini çağırıyor ama hiçbirinde sunucu tarafında bir
-- günlük üst sınır yoktu — yalnızca "oturum açık mı / Plus mı" kontrolü
-- vardı. Tek bir kullanıcı (kasıtlı ya da değil) teorik olarak sınırsız
-- sayıda çağrı yapıp faturayı büyütebilirdi. Bu tablo + aşağıdaki RPC,
-- her fonksiyonun çağrı başına "artır ve sınırı kontrol et" yapmasını
-- sağlıyor — tek bir round-trip, race condition'a karşı güvenli (atomic
-- upsert + kontrol tek SQL ifadesinde).

create table if not exists public.ai_usage_daily (
  user_id uuid not null references auth.users (id) on delete cascade,
  day date not null default (now() at time zone 'utc')::date,
  feedback_count int not null default 0,
  tts_count int not null default 0,
  chat_count int not null default 0,
  primary key (user_id, day)
);

alter table public.ai_usage_daily enable row level security;

-- Yalnızca service-role (Edge Function'lar) yazar/okur; kullanıcılar
-- kendi satırlarını görebilir (şeffaflık — "bugün ne kadar kullandım").
create policy "ai_usage_daily_select_own" on public.ai_usage_daily
  for select using (auth.uid() = user_id);

-- Bir kullanıcının bugünkü sayacını 1 artırır ve günlük sınırı geçip
-- geçmediğini döner. `op` — 'feedback' | 'tts' | 'chat'. `limit_value` —
-- o operasyon için izin verilen günlük üst sınır (Edge Function'lar bu
-- sabitleri kendi kodlarında tutar, buraya parametre olarak geçer ki
-- sınırları değiştirmek için migration gerekmesin).
--
-- Döner: true = izin verildi (sayaç artırıldı), false = sınıra ulaşıldı
-- (sayaç artırılmadı).
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
        and feedback_count < p_limit
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
  else
    return false;
  end if;

  return v_count is not null;
end;
$$;

revoke all on function public.try_consume_ai_usage(uuid, text, int) from public;
grant execute on function public.try_consume_ai_usage(uuid, text, int) to service_role;

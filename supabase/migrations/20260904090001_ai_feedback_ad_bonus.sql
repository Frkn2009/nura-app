-- Ücretsiz kullanıcı için reklamla kazanılan ek ai-feedback hakkı — 4 Eylül 2026.
--
-- Neden: Ücretsiz kullanıcı günde yalnızca 1 ai-feedback denemesi hakkına
-- sahip (bkz. 20260903120001_ai_usage_daily_cap.sql, docs/MALIYET_ANALIZI_2026_09.md).
-- Hak bitince istemci artık sessizce sahte bir AI cevabı göstermek yerine
-- (bkz. lib/features/ai/data/claude_ai_service.dart) "hakkın bitti" diyor.
-- Bu migration, kullanıcıya var olan ödüllü reklam altyapısıyla (aynı
-- UserProfile.maxRewardedAdsPerDay = 5 günlük video sınırı) ek hak
-- kazanma yolu açıyor: izlediği her video +1 ai-feedback hakkı verir,
-- günde en fazla 5 video/hak.

alter table public.ai_usage_daily
  add column if not exists feedback_bonus int not null default 0;

-- feedback dalı artık p_limit + feedback_bonus'a karşı kontrol ediyor —
-- tts/chat davranışı değişmedi.
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
  else
    return false;
  end if;

  return v_count is not null;
end;
$$;

-- Bir video reklam izlendiğinde çağrılır (Edge Function tarafından, gerçek
-- ödül AdMob'dan istemciye geldikten SONRA). Bugünkü feedback_bonus'u 1
-- artırır, p_max_bonus'a ulaşıldıysa artırmadan -1 döner ki istemci
-- "bugünkü reklam sınırına ulaştın" diyebilsin.
create or replace function public.grant_ai_feedback_ad_bonus(
  p_user_id uuid,
  p_max_bonus int
) returns int
language plpgsql
security definer
set search_path = public
as $$
declare
  v_bonus int;
begin
  insert into public.ai_usage_daily (user_id, day)
  values (p_user_id, (now() at time zone 'utc')::date)
  on conflict (user_id, day) do nothing;

  update public.ai_usage_daily
    set feedback_bonus = feedback_bonus + 1
    where user_id = p_user_id
      and day = (now() at time zone 'utc')::date
      and feedback_bonus < p_max_bonus
    returning feedback_bonus into v_bonus;

  return coalesce(v_bonus, -1);
end;
$$;

revoke all on function public.grant_ai_feedback_ad_bonus(uuid, int) from public;
grant execute on function public.grant_ai_feedback_ad_bonus(uuid, int) to service_role;

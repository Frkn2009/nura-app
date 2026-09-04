-- VOXELITH — güvenlik denetiminden çıkan iki bulgunun düzeltmesi.
-- supabase_setup.sql ve leaderboard.sql'den SONRA, kullanıcı tarafından
-- manuel uygulanmalı (bu repo canlı Supabase projesine otomatik deploy
-- edilmiyor).

-- 1) profiles.is_plus istemciden yazılabiliyordu (auth.uid()=user_id ile
--    UPDATE, sütun kısıtı yok). Gerçek Plus hakkı zaten yalnızca
--    subscriptions tablosundan doğrulanıyor (translate/chat edge
--    function'ları) — bu sütun şu an hiçbir yetki açmıyor, ama gelecekte
--    biri yanlışlıkla buna güvenirse istismar edilebilir bir "mayın".
--    İstemci is_plus'ı değiştirmeye çalışırsa sessizce eski değerde tutulur
--    (tüm profil senkronu yine başarılı olur, sadece bu sütun korunur).
create or replace function public.protect_is_plus()
returns trigger
language plpgsql
security definer
set search_path = public
as $$
begin
  if new.is_plus is distinct from old.is_plus and auth.role() <> 'service_role' then
    new.is_plus := old.is_plus;
  end if;
  return new;
end;
$$;

drop trigger if exists profiles_protect_is_plus on public.profiles;
create trigger profiles_protect_is_plus
  before update on public.profiles
  for each row execute function public.protect_is_plus();

-- 2) record_xp'de hız sınırı yoktu — bir istemci art arda çağırıp haftalık
--    liderlik tablosunu ve klan yarışmasını şişirebilirdi. 10 saniyede en
--    fazla 5 XP olayına izin ver (normal oyun temposu için bol, script ile
--    spam'i engeller).
create or replace function public.record_xp(p_amount int, p_source text)
returns void language plpgsql security definer set search_path = public as $$
declare
  v_user uuid := auth.uid();
  v_week date := date_trunc('week', timezone('utc', now()))::date;
  v_recent int;
begin
  if v_user is null then raise exception 'authentication_required'; end if;
  if p_source not in ('correct', 'scene', 'game', 'ad') then raise exception 'invalid_source'; end if;
  if (p_source = 'correct' and p_amount not in (10, 20))
     or (p_source = 'scene' and p_amount not in (50, 100))
     or (p_source = 'game' and (p_amount < 20 or p_amount > 2000)) or (p_source = 'ad' and p_amount <> 20) then
    raise exception 'invalid_xp_amount';
  end if;

  select count(*) into v_recent from public.xp_events
    where user_id = v_user and created_at > now() - interval '10 seconds';
  if v_recent >= 5 then raise exception 'rate_limited'; end if;

  insert into public.xp_events(user_id, amount, source) values (v_user, p_amount, p_source);
  insert into public.leaderboard(week_start, user_id, xp) values (v_week, v_user, p_amount)
  on conflict (week_start, user_id) do update
    set xp = public.leaderboard.xp + excluded.xp, updated_at = now();

  insert into public.clan_xp(clan_id, user_id, week_start, xp)
    select member.clan_id, v_user, v_week, p_amount
    from public.clan_members member where member.user_id = v_user
  on conflict (clan_id, user_id, week_start) do update
    set xp = public.clan_xp.xp + excluded.xp;
end;
$$;

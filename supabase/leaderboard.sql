-- NURA haftalık XP sıralaması.
-- supabase_setup.sql tarafından da çağrılabilmesi için ayrı ve tekrar çalıştırılabilir.

alter table public.profiles add column if not exists display_name text;

create table if not exists public.xp_events (
  id bigint generated always as identity primary key,
  user_id uuid not null references auth.users(id) on delete cascade,
  amount int not null check (amount > 0 and amount <= 1000),
  source text not null check (source in ('correct', 'scene', 'game')),
  created_at timestamptz not null default now()
);
alter table public.xp_events drop constraint if exists xp_events_amount_check;
alter table public.xp_events add constraint xp_events_amount_check check (amount > 0 and amount <= 1000);
create index if not exists xp_events_user_created_idx
  on public.xp_events(user_id, created_at desc);

create table if not exists public.leaderboard (
  week_start date not null,
  user_id uuid not null references auth.users(id) on delete cascade,
  xp int not null default 0 check (xp >= 0),
  updated_at timestamptz not null default now(),
  primary key (week_start, user_id)
);
create index if not exists leaderboard_week_xp_idx
  on public.leaderboard(week_start, xp desc);

alter table public.xp_events enable row level security;
alter table public.leaderboard enable row level security;

-- Kullanıcı olay geçmişinin yalnızca kendisini görür. Doğrudan INSERT policy
-- yoktur; doğrulama record_xp fonksiyonunda yapılır.
drop policy if exists "xp_events_select_own" on public.xp_events;
create policy "xp_events_select_own" on public.xp_events
  for select using (auth.uid() = user_id);

drop policy if exists "leaderboard_read_authenticated" on public.leaderboard;
create policy "leaderboard_read_authenticated" on public.leaderboard
  for select to authenticated using (true);

create or replace function public.record_xp(p_amount int, p_source text)
returns void
language plpgsql
security definer
set search_path = public
as $$
declare
  v_user uuid := auth.uid();
  v_week date := date_trunc('week', timezone('utc', now()))::date;
begin
  if v_user is null then raise exception 'authentication_required'; end if;
  if p_source not in ('correct', 'scene', 'game') then raise exception 'invalid_source'; end if;
  if (p_source = 'correct' and p_amount <> 10)
     or (p_source = 'scene' and p_amount <> 50)
     or (p_source = 'game' and (p_amount < 20 or p_amount > 1000)) then
    raise exception 'invalid_xp_amount';
  end if;

  insert into public.xp_events(user_id, amount, source)
  values (v_user, p_amount, p_source);

  insert into public.leaderboard(week_start, user_id, xp)
  values (v_week, v_user, p_amount)
  on conflict (week_start, user_id) do update
    set xp = public.leaderboard.xp + excluded.xp,
        updated_at = now();
end;
$$;

revoke all on function public.record_xp(int, text) from public;
grant execute on function public.record_xp(int, text) to authenticated;

create or replace function public.get_weekly_leaderboard(p_limit int default 10)
returns table (
  rank bigint,
  user_id uuid,
  player_name text,
  xp int,
  is_me boolean
)
language sql
security definer
stable
set search_path = public
as $$
  with ranked as (
    select
      dense_rank() over (order by board.xp desc, board.updated_at asc) as rank,
      board.user_id,
      coalesce(
        nullif(trim(profile.display_name), ''),
        'NURA ' || upper(left(board.user_id::text, 4))
      ) as player_name,
      board.xp
    from public.leaderboard board
    left join public.profiles profile on profile.user_id = board.user_id
    where board.week_start = date_trunc('week', timezone('utc', now()))::date
  )
  select
    ranked.rank,
    ranked.user_id,
    ranked.player_name,
    ranked.xp,
    ranked.user_id = auth.uid() as is_me
  from ranked
  where ranked.rank <= greatest(1, least(p_limit, 100))
     or ranked.user_id = auth.uid()
  order by ranked.rank, ranked.user_id;
$$;

revoke all on function public.get_weekly_leaderboard(int) from public;
grant execute on function public.get_weekly_leaderboard(int) to authenticated;

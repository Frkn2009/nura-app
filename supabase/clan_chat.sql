-- VOXELITH klan sohbeti — yalnızca aynı klandeki üyeler birbirini görür/yazar.
-- supabase_setup.sql ve leaderboard.sql'den SONRA çalıştırılmalı (clans/clan_members'a bağımlı).

create table if not exists public.clan_messages (
  id bigint generated always as identity primary key,
  clan_id uuid not null references public.clans(id) on delete cascade,
  user_id uuid not null references auth.users(id) on delete cascade,
  text text not null check (char_length(trim(text)) > 0 and char_length(text) <= 500),
  created_at timestamptz not null default now()
);
create index if not exists clan_messages_clan_created_idx
  on public.clan_messages(clan_id, created_at desc);

alter table public.clan_messages enable row level security;

drop policy if exists "clan_messages_select_member" on public.clan_messages;
create policy "clan_messages_select_member" on public.clan_messages
  for select using (
    exists (
      select 1 from public.clan_members member
      where member.clan_id = clan_messages.clan_id and member.user_id = auth.uid()
    )
  );

drop policy if exists "clan_messages_insert_member" on public.clan_messages;
create policy "clan_messages_insert_member" on public.clan_messages
  for insert with check (
    auth.uid() = user_id
    and exists (
      select 1 from public.clan_members member
      where member.clan_id = clan_messages.clan_id and member.user_id = auth.uid()
    )
  );

-- Sohbette gösterilecek isimlerle birlikte son mesajları getirir.
create or replace function public.get_clan_messages(p_limit int default 50)
returns table (
  id bigint, user_id uuid, player_name text, text text, created_at timestamptz, is_me boolean
)
language sql security definer stable set search_path = public as $$
  select msg.id, msg.user_id,
    coalesce(nullif(trim(profile.display_name), ''), 'VOXELITH ' || upper(left(msg.user_id::text, 4))),
    msg.text, msg.created_at, msg.user_id = auth.uid()
  from public.clan_messages msg
  join public.clan_members member on member.clan_id = msg.clan_id and member.user_id = auth.uid()
  left join public.profiles profile on profile.user_id = msg.user_id
  order by msg.created_at desc
  limit least(greatest(p_limit, 1), 100);
$$;

revoke all on function public.get_clan_messages(int) from public;
grant execute on function public.get_clan_messages(int) to authenticated;

-- ============================================================
-- NURA — Supabase kurulumu (v2)
-- SQL Editor → New query → BUNU yapıştır → RUN
--
-- Eski profiles tablosu farklı yapıdaysa (user_id kolonu yoksa)
-- otomatik olarak profiles_old diye yedeklenir, veri kaybolmaz.
-- Her çalıştırmada güvenlidir.
-- ============================================================

-- 0) Uyumsuz eski tabloyu yedekle (varsa)
do $$
begin
  if exists (select 1 from information_schema.tables
             where table_schema = 'public' and table_name = 'profiles')
     and not exists (select 1 from information_schema.columns
             where table_schema = 'public' and table_name = 'profiles'
               and column_name = 'user_id') then
    if exists (select 1 from information_schema.tables
               where table_schema = 'public' and table_name = 'profiles_old') then
      drop table public.profiles_old;
    end if;
    alter table public.profiles rename to profiles_old;
  end if;
end $$;

-- 1) Doğru yapıda profil tablosu
create table if not exists public.profiles (
  user_id uuid primary key references auth.users(id) on delete cascade
);

alter table public.profiles add column if not exists ui_lang text not null default 'tr';
alter table public.profiles add column if not exists learn_lang text not null default 'es';
alter table public.profiles add column if not exists motive text not null default 'travel';
alter table public.profiles add column if not exists cefr text not null default 'a1';
alter table public.profiles add column if not exists daily_goal_min int not null default 12;
alter table public.profiles add column if not exists onboarded boolean not null default false;
alter table public.profiles add column if not exists is_plus boolean not null default false;
alter table public.profiles add column if not exists streak int not null default 0;
alter table public.profiles add column if not exists total_xp int not null default 0;
alter table public.profiles add column if not exists daily_xp int not null default 0;
alter table public.profiles add column if not exists xp_day_key text not null default '';
alter table public.profiles add column if not exists phrases_known int not null default 0;
alter table public.profiles add column if not exists speak_seconds_used int not null default 0;
alter table public.profiles add column if not exists speak_day_key text not null default '';
alter table public.profiles add column if not exists bonus_speak_seconds int not null default 0;
alter table public.profiles add column if not exists ads_watched_today int not null default 0;
alter table public.profiles add column if not exists learned_ids jsonb not null default '[]';
alter table public.profiles add column if not exists srs jsonb not null default '{}';
alter table public.profiles add column if not exists updated_at timestamptz not null default now();

-- 2) Satır güvenliği: herkes sadece kendi satırını görür/yazar
alter table public.profiles enable row level security;

drop policy if exists "profiles_select_own" on public.profiles;
create policy "profiles_select_own" on public.profiles
  for select using (auth.uid() = user_id);

drop policy if exists "profiles_insert_own" on public.profiles;
create policy "profiles_insert_own" on public.profiles
  for insert with check (auth.uid() = user_id);

drop policy if exists "profiles_update_own" on public.profiles;
create policy "profiles_update_own" on public.profiles
  for update using (auth.uid() = user_id);

-- 3) Hesap silme: kullanıcı kendi hesabını tamamen silebilir
create or replace function public.delete_my_account()
returns void
language sql
security definer
set search_path = public
as $$
  delete from public.profiles where user_id = auth.uid();
  delete from auth.users where id = auth.uid();
$$;

grant execute on function public.delete_my_account() to authenticated;

-- 4) Plus yetkisi — yalnızca ödeme webhook'u / service role yazabilir.
-- İstemcideki profiles.is_plus görsel yerel durumu korur; ücretli sunucu
-- özelliklerinin güvenlik kararı bu tablodan verilir.
create table if not exists public.subscriptions (
  user_id uuid primary key references auth.users(id) on delete cascade,
  provider text not null,
  provider_customer_id text,
  status text not null check (status in ('trialing', 'active', 'past_due', 'canceled', 'expired')),
  current_period_end timestamptz not null,
  updated_at timestamptz not null default now()
);

alter table public.subscriptions enable row level security;

drop policy if exists "subscriptions_select_own" on public.subscriptions;
create policy "subscriptions_select_own" on public.subscriptions
  for select using (auth.uid() = user_id);

-- Bilerek INSERT/UPDATE/DELETE policy yoktur. Bu işlemler ödeme webhook'u
-- tarafından SUPABASE_SERVICE_ROLE_KEY ile yapılmalıdır.

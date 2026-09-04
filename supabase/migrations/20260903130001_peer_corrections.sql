-- VOXELITH peer correction (Busuu-style): bir öğrenci klanına bir cümle
-- denemesi gönderir, klan üyeleri düzeltme/yorum bırakır.
-- supabase_setup.sql ve 20260824080002_clan_chat.sql'den SONRA çalıştırılmalı
-- (clans/clan_members'a bağımlı, üyelik kontrol deseni clan_messages ile aynı).

create table if not exists public.peer_submissions (
  id bigint generated always as identity primary key,
  clan_id uuid not null references public.clans(id) on delete cascade,
  user_id uuid not null references auth.users(id) on delete cascade,
  lang text not null check (char_length(lang) <= 20),
  attempt_text text not null check (char_length(trim(attempt_text)) > 0 and char_length(attempt_text) <= 500),
  note text check (note is null or char_length(note) <= 300),
  created_at timestamptz not null default now()
);
create index if not exists peer_submissions_clan_created_idx
  on public.peer_submissions(clan_id, created_at desc);

create table if not exists public.peer_corrections (
  id bigint generated always as identity primary key,
  submission_id bigint not null references public.peer_submissions(id) on delete cascade,
  user_id uuid not null references auth.users(id) on delete cascade,
  correction_text text not null check (char_length(trim(correction_text)) > 0 and char_length(correction_text) <= 500),
  note text check (note is null or char_length(note) <= 300),
  created_at timestamptz not null default now()
);
create index if not exists peer_corrections_submission_created_idx
  on public.peer_corrections(submission_id, created_at);

alter table public.peer_submissions enable row level security;
alter table public.peer_corrections enable row level security;

-- peer_submissions: yalnızca gönderenin klanındaki üyeler görebilir.
drop policy if exists "peer_submissions_select_member" on public.peer_submissions;
create policy "peer_submissions_select_member" on public.peer_submissions
  for select using (
    exists (
      select 1 from public.clan_members member
      where member.clan_id = peer_submissions.clan_id and member.user_id = auth.uid()
    )
  );

-- peer_submissions: yalnızca kendi adına, kendi klanına gönderi ekleyebilir.
drop policy if exists "peer_submissions_insert_member" on public.peer_submissions;
create policy "peer_submissions_insert_member" on public.peer_submissions
  for insert with check (
    auth.uid() = user_id
    and exists (
      select 1 from public.clan_members member
      where member.clan_id = peer_submissions.clan_id and member.user_id = auth.uid()
    )
  );

-- peer_submissions: yalnızca kendi gönderisini silebilir. Başkasının satırı
-- güncellenemez (update policy'si yok).
drop policy if exists "peer_submissions_delete_own" on public.peer_submissions;
create policy "peer_submissions_delete_own" on public.peer_submissions
  for delete using (auth.uid() = user_id);

-- peer_corrections: gönderinin ait olduğu klandaki üyeler görebilir.
drop policy if exists "peer_corrections_select_member" on public.peer_corrections;
create policy "peer_corrections_select_member" on public.peer_corrections
  for select using (
    exists (
      select 1 from public.peer_submissions sub
      join public.clan_members member on member.clan_id = sub.clan_id
      where sub.id = peer_corrections.submission_id and member.user_id = auth.uid()
    )
  );

-- peer_corrections: gönderinin klanındaki HERHANGİ bir üye (gönderen dahil)
-- kendi adına düzeltme ekleyebilir.
drop policy if exists "peer_corrections_insert_member" on public.peer_corrections;
create policy "peer_corrections_insert_member" on public.peer_corrections
  for insert with check (
    auth.uid() = user_id
    and exists (
      select 1 from public.peer_submissions sub
      join public.clan_members member on member.clan_id = sub.clan_id
      where sub.id = peer_corrections.submission_id and member.user_id = auth.uid()
    )
  );

-- peer_corrections: yalnızca kendi düzeltmesini silebilir. Başkasının
-- satırı güncellenemez (update policy'si yok).
drop policy if exists "peer_corrections_delete_own" on public.peer_corrections;
create policy "peer_corrections_delete_own" on public.peer_corrections
  for delete using (auth.uid() = user_id);

-- Klanın açık gönderilerini, gösterim adı ve düzeltme sayısıyla getirir.
create or replace function public.get_clan_peer_submissions(p_limit int default 30)
returns table (
  id bigint, user_id uuid, player_name text, lang text, attempt_text text,
  note text, created_at timestamptz, is_me boolean, correction_count bigint
)
language sql security definer stable set search_path = public as $$
  select sub.id, sub.user_id,
    coalesce(nullif(trim(profile.display_name), ''), 'VOXELITH ' || upper(left(sub.user_id::text, 4))),
    sub.lang, sub.attempt_text, sub.note, sub.created_at, sub.user_id = auth.uid(),
    (select count(*) from public.peer_corrections corr where corr.submission_id = sub.id)
  from public.peer_submissions sub
  join public.clan_members member on member.clan_id = sub.clan_id and member.user_id = auth.uid()
  left join public.profiles profile on profile.user_id = sub.user_id
  order by sub.created_at desc
  limit least(greatest(p_limit, 1), 100);
$$;

revoke all on function public.get_clan_peer_submissions(int) from public;
grant execute on function public.get_clan_peer_submissions(int) to authenticated;

-- Tek bir gönderinin düzeltmelerini, gösterim adıyla getirir. Gönderi
-- çağıranın klanında değilse (fonksiyon içindeki join eşleşmediği için)
-- boş sonuç döner.
create or replace function public.get_peer_corrections(p_submission_id bigint)
returns table (
  id bigint, user_id uuid, player_name text, correction_text text,
  note text, created_at timestamptz, is_me boolean
)
language sql security definer stable set search_path = public as $$
  select corr.id, corr.user_id,
    coalesce(nullif(trim(profile.display_name), ''), 'VOXELITH ' || upper(left(corr.user_id::text, 4))),
    corr.correction_text, corr.note, corr.created_at, corr.user_id = auth.uid()
  from public.peer_corrections corr
  join public.peer_submissions sub on sub.id = corr.submission_id
  join public.clan_members member on member.clan_id = sub.clan_id and member.user_id = auth.uid()
  left join public.profiles profile on profile.user_id = corr.user_id
  where corr.submission_id = p_submission_id
  order by corr.created_at asc;
$$;

revoke all on function public.get_peer_corrections(bigint) from public;
grant execute on function public.get_peer_corrections(bigint) to authenticated;

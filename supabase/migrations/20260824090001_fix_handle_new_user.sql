-- handle_new_user() 'id'/'email' sütunlarına yazmaya çalışıyordu ama
-- public.profiles'ta bu sütunlar hiç yok (gerçek PK: user_id, email
-- sütunu hiç yok) — bu, bu trigger var olduğundan beri HER yeni
-- auth.users kaydını (anonim dahil, normal e-posta kaydı dahil)
-- kırıyordu. 24 Ağustos'ta canlıda tespit edilip düzeltildi, burada
-- kayıt altına alınıyor.
create or replace function public.handle_new_user()
returns trigger
language plpgsql
security definer
set search_path to 'public'
as $$
begin
  insert into public.profiles (user_id) values (new.id) on conflict (user_id) do nothing;
  return new;
end;
$$;

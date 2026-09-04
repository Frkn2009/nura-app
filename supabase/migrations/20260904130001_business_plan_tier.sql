-- Business paketine gerçek bir değer teklifi — 4 Eylül 2026.
--
-- Neden: Business ($200/yıl, Plus'ın ~3 katı) tek farkı "Toplantı
-- Çevirmeni" idi; o özellik kaldırılınca (bkz. aynı günkü diğer notlar)
-- Business'ın Plus'a göre hiçbir üstünlüğü kalmamıştı. Yeni değer teklibi:
-- Business kullanıcılar tüm AI/ses kalemlerinde Plus'ın ~3 katı günlük
-- hakka sahip (ai-feedback/tts/chat/translate Edge Function'ları bunu
-- kontrol edecek). Bunu yapabilmek için sunucunun bir kullanıcının Plus mı
-- Business mı olduğunu bilmesi lazım — `subscriptions` tablosunda bu bilgi
-- hiç tutulmuyordu (yalnızca "aktif mi" biliniyordu, hangi paket olduğu
-- değil).

alter table public.subscriptions
  add column if not exists plan text not null default 'plus'
    check (plan in ('plus', 'business'));

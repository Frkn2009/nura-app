# VOXELO — YENİ SOHBETTE DEVAM EKRANI

Tarih: 21 Ağustos 2026

## Yeni sohbete yapıştır

```text
voxelo-app projesine kaldığı yerden devam et.
GitHub: https://github.com/Frkn2009/voxelo-app
Önce docs/YENI_SOHBETTE_DEVAM.md, docs/YAPILACAKLAR.md ve docs/DEPLOYMENT_STATUS.md dosyalarını oku.
main dalının son durumunu çek; temiz çalışma ağacını doğrula.
Tam yedek dalı ve etiketi korunmalı. Her işi ayrı commit yapıp GitHub'a push et.
Hiçbir anahtarı kaynak koda veya dokümana yazma.
Önce Flutter SDK bulunan ortamda flutter pub get, flutter analyze ve flutter test çalıştır; çıkan derleme hatalarını sırayla düzelt.
Ardından Android/iOS gerçek cihaz smoke testleri ve mağaza hazırlığına devam et.
Supabase migration canlıya uygulandı; translate Edge Function ACTIVE fakat GOOGLE_TRANSLATE_API_KEY test modu nedeniyle ayarlı değil.
AdMob resmi Google test kimliklerinde; üretim kimlikleri gelmeden canlı reklama geçme.
```

## Mevcut durum

- `docs/YAPILACAKLAR.md` içindeki tüm maddeler tamamlandı ve işaretlendi.
- 30 dilde toplam 302 sahne ve 996 müfredat kalıbı bulunuyor.
- A2/B1 bağlantılı görevleri eklendi.
- Fonem değerlendirme, kadın neural Maya sesi, klipler ve beş oyun eklendi.
- XP, seviyeler, başarımlar, leaderboard ve clan sistemi eklendi.
- Günlük bildirim, Android/iOS ana ekran widget'ı ve karanlık mod eklendi.
- Plus aile planında en fazla dört ayrı profil eklendi.
- AdMob test modu ve haftalık İspanyolca ×2 etkinliği eklendi.

## Canlı Supabase durumu

`supabase_setup.sql` canlı projeye başarıyla uygulandı.

Canlı tablolar:

- `profiles`
- `subscriptions`
- `xp_events`
- `leaderboard`
- `family_profiles`
- `clans`
- `clan_members`
- `clan_xp`

Canlı RPC'ler:

- `delete_my_account`
- `record_xp`
- `get_weekly_leaderboard`
- `create_clan`
- `join_clan`
- `leave_clan`
- `get_my_clan`

Edge Function:

- `translate`: ACTIVE, version 1
- Üretim Google Translation secret'ı henüz yok; test modunda.

## Acil ilk teknik iş

Bu çalışma ortamında Flutter SDK yoktu. Yeni ortamda ilk yapılacaklar:

```bash
flutter pub get
flutter analyze
flutter test
flutter build apk --debug
```

Özellikle şu yeni paketlerin lock/build çözümlemesini doğrula:

- `awesome_notifications`
- `google_mobile_ads`
- `home_widget`
- `characters`

Sonra:

1. Android widget provider ve bildirimleri gerçek cihazda test et.
2. iOS WidgetKit target, App Group ve signing'i Xcode'da doğrula.
3. Mikrofon/STT/TTS'yi Android ve iPhone'da test et.
4. Supabase auth ile leaderboard, clan ve aile profili smoke testi yap.
5. AdMob test reklamlarını gerçek cihazda doğrula.

## Güvenlik

- Personal Access Token, GitHub token, service-role key veya DB parolası repoya yazılmadı.
- Sohbette paylaşılmış geçici erişim tokenları işlemler bittikten sonra iptal edilmeli.
- Supabase publishable key istemci tarafında kullanılabilir; service-role key kullanılamaz.

## Yedekleme kuralı

Her önemli aşamadan sonra:

1. Commit oluştur.
2. `main` dalına push et.
3. Tarihli backup dalı ve annotated tag oluştur.
4. `git archive` ile ZIP ve SHA-256 üret.

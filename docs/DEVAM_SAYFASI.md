# NURA — DEVAM SAYFASI (23 Ağustos 2026 — GÜNCEL)

Bu dosya başka bir AI asistana (Claude, GPT, Gemini vs.) projeyi devrederken
kopyala-yapıştır olarak kullanılır. **Aşağıdaki "ZATEN VAR" listesini
atlamadan okumadan kod yazmaya başlama** — bu proje üzerinde birden fazla AI
çalıştı ve daha önce zaten var olan kodu "yeni icat" diye yeniden yazıp zaman
kaybettiren asistanlar oldu (örn. FSRS-5 motoru, cognitive tracker, swipe
review — hepsi zaten mevcuttu, biri bunları yeniden yazıp özgün buluş gibi
sundu).

**⚠️ ÖNKOŞUL:** Bu dosyayı önüne koyduğunuz AI'nın gerçekten `https://github.com/Frkn2009/nura-app` reposuna erişimi (dosya okuma/GitHub bağlantısı/checkout'lu bir ortam) olmalı. Sadece dosya adını düz metin sohbette söylemek yeterli değil — reposu göremeyen bir AI, "DEVAM_SAYFASI.md'yi okudum" der ama aslında baştan uydurur (bir kez `lib/models/`, `lib/screens/` gibi var olmayan bir klasör yapısı ve projeyle alakasız bir "geliştirici aracı" kurgusu uydurdu). Erişimi yoksa bu dosyanın **tam içeriğini** doğrudan mesaj olarak yapıştırın.

## 📍 PROJE

| | |
|---|---|
| **GitHub** | https://github.com/Frkn2009/nura-app |
| **Son commit** | `3e8648f` — uygulama ikonu yeni logoyla yeniden üretildi |
| **Test** | ✅ 35/35 geçiyor |
| **Analyze** | ✅ Temiz (0 uyarı) |
| **Windows test ortamı** | `C:\nura-app` + `PUB_CACHE=C:\pub-cache` (kullanıcı profil yolunda Türkçe karakter olduğu için `flutter test`/native-asset derleyicisi kırılıyor — ASCII yol şart) |

## ✅ ZATEN VAR — YENİDEN YAZMA

- **SRS motoru**: `lib/core/algorithm/fsrs5_engine.dart` (`NuraBrain`, FSRS-5 tam parametreli) + `lib/data/srs/srs_machine.dart` (FSRS-inspired). `SrsCard`'da `phrase` alanı YOK.
- **Bilişsel takip**: `lib/core/algorithm/cognitive_tracker.dart` (Reflex/Recall/Guess sınıflandırması, cevap süresine göre).
- **Kaydırmalı review**: `lib/ui/review/swipe_review_card.dart` (Tinder tarzı fiziksel swipe).
- **Alfabe sistemi TAM**: `lib/features/alphabet/alphabet_engine.dart` — 30 dilin **tamamı** kendi gerçek alfabesiyle. ar/he/ru/uk/fa/el/hi/th/ja/ko/vi/pl/cs/ro/hu/sv/da/no/fi hepsi tam veya kapsamlı; zh Pinyin olarak (Çince'nin alfabesi yok); id/sw bilinçli olarak jenerik Latin (gerçekten aksansız, doğru). Kalan alfabe eksiği yok.
- **RTL (sağdan sola) desteği**: `LearnLang.isRtl` (ar/he/fa) eklendi, `Directionality` artık alfabe ekranı dışında konuşma/çeviri/klip ekranlarında da uygulanıyor — önceden bu ekranlarda Arapça/İbranice/Farsça metin soldan sağa yanlış render ediliyordu.
- **Uygulama ikonu güncel**: `assets/icon_source.png` (yeni `NuraMark`'tan render edildi) + `flutter_launcher_icons` ile Android/iOS/web ikon setleri yeniden üretildi. Artık gerçek logo ile uyumlu.
- **Canlı AI konuşma partneri (Plus)**: `supabase/functions/chat/index.ts` (Claude API proxy) + `lib/features/ai/screen/live_chat_screen.dart`, alt gezinme çubuğunda **"Sohbet"** sekmesi olarak (`/app/chat`). Çalışması için Supabase'e `ANTHROPIC_API_KEY` secret'ı girilmeli ve fonksiyon deploy edilmeli — kod hazır, deploy kullanıcının elinde.
- **Günlük çark**: `lib/features/games/daily_wheel_screen.dart` — artık gerçekten `SessionController.awardXp` çağırıyor, günde bir kez (SharedPreferences `wheel_day`).
- **Klan sistemi**: `lib/features/clan/` — üyelik, davet kodu, **haftalık otomatik sıfırlanan** XP yarışması (`clan_xp` tablosu, `get_my_clan()` RPC, her Pazartesi resetleniyor — bu zaten backend'de vardı, sadece arayüzde "yarışma" diye belirtilmiyordu). Klan sohbeti yeni: `supabase/clan_chat.sql` (kullanıcı tarafından manuel apply edilmeli) + `lib/features/clan/clan_chat_screen.dart`.
- **Oyunlar CEFR-farkında**: `lib/data/content/catalog.dart`'taki `allPhrases(lang, {maxLevel})` artık kullanıcının seviyesini aşan kelimeleri filtreliyor.
- **Maskot**: adı **Nura** (eskiden "Luma" idi, tamamı değiştirildi) — `lib/ui/mascot.dart`.
- **Marka işareti**: `lib/ui/brand.dart` → `NuraMark` — N harfinin köşegeni ses dalgasına dönüştürüldü. `lib/ui/nura_logo.dart` SİLİNDİ (kullanılmayan duplicate'ti).
- **Tipografi**: başlıklarda Sora, gövdede Manrope — `assets/fonts/Sora.ttf` + `Manrope.ttf` (yerel paketli, **google_fonts paketi KULLANMA** — çalışma zamanında internetten font indirir, hem offline-first mimariyi bozar hem teste zarar verir, bunu bir kez yaşadık).
- **Temalar**: Sistem/Açık/Koyu/**Bal (amber)** — `lib/core/theme/amber_theme.dart`, `AppThemePreference.amber`.
- **TTS**: `lib/data/speech/speech_controller.dart` — kaliteli/neural ses bulununca üstüne yapay pitch bindirmiyor (eskiden hep 1.12 pitch zorluyordu, bu neural sesleri robotikleştiriyordu).
- **Güvenlik denetimi yapıldı** (23 Ağustos): secret sızıntısı yok, RLS büyük ölçüde sağlam, Plus hakkı doğru şekilde `subscriptions` tablosundan doğrulanıyor. İki bulgu `supabase/security_hardening.sql`'de düzeltildi (henüz apply edilmedi): `profiles.is_plus` istemciden yazılabiliyordu (trigger ile korundu), `record_xp`'de hız sınırı yoktu (10 saniyede 5 çağrı sınırı eklendi).
- **Görsel derinlik**: `NuraCard` artık düz kenarlıklı değil, açık/bal temalarda yumuşak gölgeli (koyu temada gölge yerine kenarlık — siyah zeminde gölge görünmez). Ana sayfadaki "Bugünün konuşması" kartına da renkli glow gölgesi eklendi.
- **Android release imzalama hazır**: `android/upload-keystore.jks` üretildi, `android/key.properties` ve `build.gradle.kts`'teki `signingConfigs` bağlandı (ikisi de gitignore'da, kullanıcıda şifreler var). **Yeniden üretme** — `flutter build appbundle --release` şu an Android SDK'nın Türkçe/boşluklu yoldaki NDK sorunundan dolayı denenemedi, bu ayrı bir açık iş.
- **`tools/mission-control.ps1`**: yedekleme + `git fetch`/uzak kontrolü + `dart analyze` + `flutter test`'i tek komutta birleştiren PowerShell scripti (`status`/`remote`/`backup`/`check`/`precommit` alt komutları). **Yeniden yazma**, sadece kullan.
- **Paywall gerçek billing'e bağlandı**: `PaywallScreen` eskiden `session.setPlus(true)`'ı direkt çağırıyordu (satın alma yoktu, herkes bedava Plus oluyordu). Artık `plusControllerProvider.purchase()` üzerinden gidiyor, `PlusController` sonucu `session.isPlus`'a senkronluyor. Gerçek ödeme için hâlâ `FakeBillingService` yerine gerçek bir RevenueCat `BillingService` implementasyonu gerekiyor (kullanıcının RevenueCat hesabı lazım) — ama artık doğru yere takılacak.
- **Splash screen gerçekten bağlandı**: `flutter_native_splash.yaml` config'i vardı ama paket hiç `pubspec.yaml`'a eklenmemişti — uygulama varsayılan beyaz Flutter splash'ıyla açılıyordu. Artık `flutter_native_splash` dependency'si eklendi ve `dart run flutter_native_splash:create` çalıştırıldı.

## 🔶 GERÇEKTEN AÇIK OLAN İŞLER

| # | İş | Not |
|---|---|---|
| 1 | Video mikro-dersler | Gerçek anadil konuşan kaydı gerektirir — bir AI bunu üretemez, içerik prodüksiyonu lazım |
| 2 | Uygulama içi kitaplık (e-kitap okuyucu) | Henüz başlanmadı |
| 3 | İnteraktif tanıtım turu | Gerçek ekranlar üzerinde coach-mark, henüz yok |
| 4 | Akıllı Plus zamanlaması | `AdGateScreen` var ama tetikleme anı/tonu iyileştirilmedi |
| 5 | RevenueCat / AdMob gerçek anahtarlar | Hesap açılınca |
| 6 | Release build (`.aab`) | Keystore hazır (bkz. yukarı), ama Android SDK yolu (`C:\Users\M Y DERİ\...\Android\Sdk`) Türkçe/boşluklu olduğu için NDK derleyicisi kırılıyor, `flutter build appbundle --release` denenmedi. Çözüm: SDK'yı boşluksuz bir yola taşı (kullanıcı onayı gerekir, riskli değil ama sistem kurulumuna dokunuyor). |
| 7 | Supabase deploy adımları | `supabase/functions/chat` deploy edilmedi, `ANTHROPIC_API_KEY` secret girilmedi, `supabase/clan_chat.sql` ve `supabase/security_hardening.sql` apply edilmedi — hepsi kullanıcının Supabase CLI ile yapması gereken adımlar |
| 8 | Premium/sinematik TTS sesi | Masaüstü Chrome'da ses robotik — bu ortamın (Windows SAPI5 sesleri) doğal sınırı, kod hatası değil. Gerçek telefonda muhtemelen çok daha iyi (Android/iOS neural sesleri). Gerçekten "film aktörü" kalitesi için ElevenLabs/Google Cloud Neural2 gibi bir bulut TTS'e geçmek gerekir — `chat` fonksiyonuyla aynı desen (Edge Function proxy + gerçek ses dosyası oynatma), kullanıcının o servisten API key alması gerekiyor. |
| 9 | Meşru ASO (App Store Optimization) | Anahtar kelime araştırması, mağaza ekran görüntüleri/video, yerelleştirilmiş mağaza metni — henüz başlanmadı. Sahte yorum/bot indirme gibi yöntemler kullanılmayacak (mağaza politikası ihlali + ban riski). |

## 💾 YEDEKLEME KURALI (HER OTURUMDA ZORUNLU)

Kod değiştirmeye başlamadan **önce**, repo kökünde:

```bash
git status --short
mkdir -p ../nura_backup
stamp=$(date +%Y%m%d_%H%M%S)
git diff --binary > "../nura_backup/before_$stamp.patch"
```

Windows'ta `tools\mission-control.ps1` bu adımları (yedek + `git fetch`/uzak kontrolü + `dart analyze` + `flutter test`) tek komutta yapar:

```powershell
powershell -ExecutionPolicy Bypass -File tools\mission-control.ps1 precommit
```

Bu, commit edilmemiş değişiklikleri repo **dışında** yedekler; hiçbir şeyi silmez. Push'tan önce de `git fetch && git log --oneline HEAD..origin/main` ile uzağın ilerlemediğini doğrula (aşağıda tekrar var). Büyük bir iş bitince bu dosyayı ("DEVAM_SAYFASI.md") güncelleyip commit et — bir sonraki oturum/AI buradan devam edecek.

## ⚠️ TEKRAR YAŞANMASIN

- `google_fonts` paketini EKLEME — yerel font kullan (yukarıya bak).
- Kullanıcı klasör yolu `C:\Users\M Y DERİ\...` — Türkçe "İ" karakteri `flutter analyze`'in LSP sunucusunu ve `flutter test`'in native-asset derleyicisini çökertiyor. `dart analyze` (LSP değil) çalışır; test için `C:\nura-app` + `PUB_CACHE=C:\pub-cache` kullan.
- `dart format` tüm ağacı çalıştırınca binlerce satırlık alakasız diff üretiyor (repo daha önce tutarlı formatlanmamış) — sadece dokunduğun dosyalara `dart format <dosya>` uygula, `dart format .` deme.
- Commit/push öncesi mutlaka `git fetch && git log --oneline HEAD..origin/main` ile uzağın ilerlemediğini doğrula — bu proje üzerinde paralel çalışan başka AI/oturumlar olabiliyor.

## 💡 YENİ SOHBETTE DEVAM

```
nura-app projesine devam et.
GitHub: https://github.com/Frkn2009/nura-app (main, son commit 78fb4a0)
docs/DEVAM_SAYFASI.md dosyasını BAŞTAN SONA oku — reposu gerçekten
göremiyorsan bunu söyle, uydurma. "ZATEN VAR" listesindeki hiçbir şeyi
yeniden yazma, "GERÇEKTEN AÇIK OLAN İŞLER" listesinden devam et.
35/35 test geçiyor, dart analyze temiz.
Windows'ta test için: C:\nura-app + PUB_CACHE=C:\pub-cache kullan (asıl repo
yolundaki Türkçe karakter native-asset derleyicisini kırıyor).
Kod değiştirmeden önce git diff'i ../nura_backup'a yedekle (yukarıdaki
YEDEKLEME KURALI bölümüne bak). Her commit öncesi git fetch ile uzağın
ilerlemediğini kontrol et. İş bitince bu dosyayı güncelle ve commit et.
```

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
| **Son commit** | `a119a5c` — ElevenLabs premium ses entegrasyonu (kitaplık okuyucusu) |
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
- **Kitaplık (`/library`)**: `lib/data/content/library.dart` + `lib/features/library/` — gerçek, gramer kontrolü yapılmış A1 hikayeler, Türkçe glosslu. `StoryReaderScreen`'de "Tümünü Oynat" gerçekten her cümleyi sırayla sesli okuyor. **Artık 30/30 dilde içerik var** (24 Ağustos: kalan 15 dil — nl/pl/sv/da/no/fi/cs/ro/hu/vi/id/uk/he/fa/sw — başka bir AI'ya verilen şablonla üretildi, 85 hikaye toplam, `dart analyze` temiz, id'ler benzersiz doğrulandı). Video içeriği hâlâ gerçek prodüksiyon gerektiriyor, üretilemedi.
- **Premium ses (ElevenLabs)**: `supabase/functions/tts` + `lib/data/speech/premium_tts_service.dart`. `chat` ile aynı desen — Plus'a kilitli, `ELEVENLABS_API_KEY` secret'ı yok/deploy edilmemişse sessizce cihaz TTS'ine düşer. **Artık kitaplık okuyucusu + konuşma pratiği (`speak_screens.dart`) + alfabe örnek kelimeleri (`alphabet_screen.dart`, sadece kelimeler — tek harf/ses telaffuzu bilinçli olarak cihazın özel ayarlı (yavaş/yüksek perde) TTS'inde kaldı) + sohbet cevapları (`live_chat_screen.dart`) hepsi aynı "önce premium dene, olmazsa cihaz TTS'i" desenini kullanıyor** (24 Ağustos). `tts` fonksiyonu deploy edildi ve **`ELEVENLABS_API_KEY` girildi, `/v1/text-to-speech` endpoint'ine karşı doğrudan doğrulandı** (gerçek MP3 üretti, 24 Ağustos) — kod tamamen hazır ve canlı, restricted key sadece "Text to Speech" iznine sahip (en az yetki).
- **Canlı AI konuşma partneri (Plus)**: `supabase/functions/chat/index.ts` (Claude API proxy) + `lib/features/ai/screen/live_chat_screen.dart`, alt gezinme çubuğunda **"Sohbet"** sekmesi olarak (`/app/chat`). `chat` fonksiyonu deploy edildi ve **`ANTHROPIC_API_KEY` girildi, Anthropic API'ye karşı doğrudan doğrulandı** (24 Ağustos) — kod tamamen hazır ve canlı. (`chat` fonksiyonu gerçek girişli + Plus abonelikli kullanıcı gerektirdiği için uçtan uca curl testi yapılamadı, ama key'in kendisi çalışıyor.)
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
- **Android release imzalama hazır ve doğrulandı**: `android/app/upload-keystore.jks` (**dikkat: konumu değişti** — eskiden `android/upload-keystore.jks`'teydi, ama `build.gradle.kts`'teki `file(keystoreProperties["storeFile"])` çağrısı `android/app/` köküne göre çözülüyor; release build hiç denenmediği için bu yanlış-konum hatası şimdiye kadar hiç yakalanmamıştı — 24 Ağustos'ta taşınarak düzeltildi), `android/key.properties` ve `build.gradle.kts`'teki `signingConfigs` bağlı (ikisi de gitignore'da, kullanıcıda şifreler var). `apksigner verify --print-certs` ile imza doğrulandı: `CN=Nura App` (gerçek release sertifikası, debug değil).
- **`tools/mission-control.ps1`**: yedekleme + `git fetch`/uzak kontrolü + `dart analyze` + `flutter test`'i tek komutta birleştiren PowerShell scripti (`status`/`remote`/`backup`/`check`/`precommit` alt komutları). **Yeniden yazma**, sadece kullan.
- **Paywall gerçek billing'e bağlandı**: `PaywallScreen` eskiden `session.setPlus(true)`'ı direkt çağırıyordu (satın alma yoktu, herkes bedava Plus oluyordu). Artık `plusControllerProvider.purchase()` üzerinden gidiyor, `PlusController` sonucu `session.isPlus`'a senkronluyor.
- **RevenueCat entegrasyonu yazıldı** (24 Ağustos): `lib/features/plus/data/revenuecat_billing_service.dart` — `purchases_flutter` paketi eklendi, `RevenueCatBillingService implements BillingService` (offerings → `BillingProduct` eşlemesi store ürün kimliğiyle yapılıyor: `nura_plus_monthly`/`nura_plus_yearly`/`nura_plus_family`, `Purchases.getCustomerInfo().entitlements.active` ile entitlement kontrolü). `billingServiceProvider` artık `NURA_REVENUECAT_API_KEY` dart-define'ı girildiyse `RevenueCatBillingService`, girilmediyse `FakeBillingService` döndürüyor — anahtar yokken hiçbir şey bozulmuyor. `main.dart`'ta `RevenueCatBillingService.configureIfNeeded()` çağrılıyor. Detaylı kurulum: `README.md` → "RevenueCat (Plus satın alma) kurulumu". **Kullanıcının yapması gereken**: panelde ürünleri (`nura_plus_*` kimlikleriyle) ve `plus` entitlement'ını tanımlamak, gerçek App Store/Play Store hesabı bağlamak (veya önce RevenueCat'in mağaza hesabı gerektirmeyen Test Store'uyla denemek) — kod tarafı hazır.
- **Splash screen gerçekten bağlandı**: `flutter_native_splash.yaml` config'i vardı ama paket hiç `pubspec.yaml`'a eklenmemişti — uygulama varsayılan beyaz Flutter splash'ıyla açılıyordu. Artık `flutter_native_splash` dependency'si eklendi ve `dart run flutter_native_splash:create` çalıştırıldı.
- **İnteraktif tanıtım turu**: `lib/features/onboarding/coach_tour.dart` — yeniden kullanılabilir, spot ışıklı (`CustomPainter` ile karartılmış arka planda "delik") coach-mark overlay sistemi; `CoachStep(targetKey: GlobalKey, title, body)` listesi alıp gerçek widget'ların pozisyonunu `RenderBox.localToGlobal` ile bulup üzerlerine balon gösteriyor (mockup ekran değil). `HomeScreen`'e bağlandı: ilk açılışta günlük hedef kartı → bugünün konuşması → kitaplık → tekrar sırasıyla 4 adımlık tur, `SharedPreferences` (`home_tour_seen_v1`) ile bir kere gösteriliyor, "Geç" ile her an atlanabilir.

## 🔶 GERÇEKTEN AÇIK OLAN İŞLER

| # | İş | Not |
|---|---|---|
| 1 | Video mikro-dersler | Gerçek anadil konuşan kaydı gerektirir — bir AI bunu üretemez, içerik prodüksiyonu lazım |
| 2 | AdMob gerçek anahtarları | Hesap açılınca, dart-define ile geçilecek (bkz. README) |
| 3 | Meşru ASO (App Store Optimization) | Anahtar kelime + TR mağaza metni yazıldı (`docs/STORE_METADATA_TR.md`). Kalan: mağaza ekran görüntüleri/video, kalan 29 dile çeviri. Sahte yorum/bot indirme gibi yöntemler kullanılmayacak (mağaza politikası ihlali + ban riski). |

**Supabase deploy tamamen tamamlandı (24 Ağustos):** `chat`/`tts`/`translate` fonksiyonlarının üçü de Supabase CLI ile (personal access token, tarayıcı girişi gerekmeden) deploy edildi, `ACTIVE` durumda. `supabase/clan_chat.sql` ve `supabase/security_hardening.sql`, `supabase/migrations/` altına taşınıp `supabase db push` ile canlıya uygulandı — Management API üzerinden doğrulandı (`protect_is_plus` fonksiyonu/trigger'ı, `get_clan_messages` fonksiyonu, `clan_messages` tablosu hepsi canlıda mevcut). **`ANTHROPIC_API_KEY` ve `ELEVENLABS_API_KEY` ikisi de girildi**, ikisi de ilgili sağlayıcının gerçek API'sine karşı doğrudan doğrulandı (Anthropic: gerçek cevap alındı; ElevenLabs: gerçek MP3 üretildi) — Supabase tarafında artık gerçekten açık hiçbir iş yok.

- **RevenueCat ↔ Supabase kimlik köprüsü kuruldu ve iki kritik hata düzeltildi** (24 Ağustos): `supabase/functions/revenuecat-webhook` — RevenueCat'in ödeme event'lerini (`INITIAL_PURCHASE`/`RENEWAL`/`EXPIRATION`/`BILLING_ISSUE` vb.) alıp `public.subscriptions`'a yazıyor, `REVENUECAT_WEBHOOK_SECRET` ile korunuyor, `--no-verify-jwt` ile deploy edildi (RevenueCat kendi secret'ını gönderiyor, Supabase JWT'si değil). `main.dart` artık uygulama açılışında Supabase'e **anonim giriş** yapıyor (proje ayarında kapalıydı, açıldı) — e-posta ile hiç kayıt olmayan kullanıcının bile kararlı bir `auth.uid()`'i oluyor. `RevenueCatBillingService.configureIfNeeded()` bu uid'i RevenueCat'in `appUserID`'si olarak veriyor, böylece webhook'un `app_user_id`'si `subscriptions.user_id` ile birebir eşleşiyor. RevenueCat panelinde webhook entegrasyonu V2 API ile kuruldu. **Bulunan ikinci, bağımsız hata**: `handle_new_user()` trigger'ı (repoda hiç izlenmiyordu, muhtemelen dashboard'dan elle eklenmişti) `profiles(id, email)`'e yazmaya çalışıyordu — bu sütunlar `profiles`'ta hiç yok (gerçek PK: `user_id`, `email` sütunu yok) — yani **bu trigger var olduğundan beri projedeki HER yeni kullanıcı kaydı (anonim veya e-postalı, fark etmez) sessizce başarısız oluyordu**. `supabase/migrations/20260824090001_fix_handle_new_user.sql` ile düzeltildi, canlıda uygulandı. Tüm zincir (anonim giriş → profil satırı → webhook event → subscriptions satırı) gerçek bir test kullanıcısıyla uçtan uca doğrulandı, sonra test kullanıcısı silindi.

**Release build (.aab) başarıyla üretildi (24 Ağustos):** `build/app/outputs/bundle/release/app-release.aab` (67.6MB) ve `.../flutter-apk/app-release.apk` (66.6MB) — gerçek `upload-keystore.jks` ile imzalı, doğrulandı. Bunun için 3 ayrı engel aşıldı:

1. **Android SDK yolu Türkçe karakterliydi** (`C:\Users\M Y DERİ\AppData\Local\Android\Sdk`) → `C:\AndroidSdk`'ya kopyalandı (robocopy, `Move-Item` izin hatası verdi), `ANDROID_HOME`/`ANDROID_SDK_ROOT` kullanıcı ortam değişkenleri ve `flutter config --android-sdk` bu yola güncellendi, `android/local.properties`'teki `sdk.dir` düzeltildi (gitignore'da, her klonda elle/otomatik ayarlanmalı).
2. **AGP proje yolu kontrolü**: `C:\Users\M Y DERİ\...` proje yolu da Türkçe karakterli — AGP bunu hata sayıyor. `android/gradle.properties`'e `android.overridePathCheck=true` eklendi (bu satırı silme).
3. **Asıl kırılma noktası — proje yolunun kendisi**: (2)'yi aştıktan sonra Dart'ın AOT snapshot derleyicisi `.dart_tool\flutter_build\...\app.dill` dosyasını Türkçe karakterli yoldan okuyamadığı için `flutter build` yine çöküyordu (aynı kök neden, `flutter test`'i kıran sorunla birebir aynı — sadece SDK/pub-cache değil, **projenin kendi klasör yolu da** ASCII olmalı). Çözüm: `git clone` ile projeyi `C:\nura-build` gibi ASCII bir yola klonlayıp **oradan** build almak. `key.properties`/`upload-keystore.jks` gitignore'da olduğu için klonla gelmiyor, elle kopyalanmalı (bkz. madde 4 aşağıda).
4. **Keystore konum hatası** (yukarıda "ZATEN VAR" listesinde detaylı): `upload-keystore.jks` yanlışlıkla `android/` kökündeydi, olması gereken yer `android/app/`.

**Sonraki build için tarif**: `git clone "<gerçek repo yolu>" C:\nura-build-N`, `android/local.properties`'e `sdk.dir=C:\\AndroidSdk` + `flutter.sdk=C:\\flutter` yaz, `android/key.properties` + `android/app/upload-keystore.jks`'i gerçek repodan kopyala, sonra `ANDROID_HOME`/`ANDROID_SDK_ROOT`/`PUB_CACHE=C:\pub-cache` ortam değişkenleriyle `flutter build appbundle --release` çalıştır.

**RevenueCat panel kurulumu tamamlandı (24 Ağustos):** `nura` projesi, `Test Store` app'i, `plus` entitlement'ı `nura_plus_monthly`/`nura_plus_yearly`/`nura_plus_family` ürünlerinin üçüne de bağlı, `default` offering `current` ve üç doğru paketi içeriyor (Monthly/Yearly/Family — hepsi doğru ürüne bağlı, gereksiz Lifetime paketi silindi). RevenueCat V2 REST API ile (secret key sohbette verildi, hiçbir dosyaya yazılmadı) doğrudan panelden düzeltildi. **Test etmek için**: `flutter run --dart-define=NURA_REVENUECAT_API_KEY=<Test Store public key>` — README'deki "RevenueCat (Plus satın alma) kurulumu" bölümüne bak. **Güvenlik notu**: kurulum sırasında kullanılan Secret API key'leri (`sk_...`) sohbette düz metin geçti — iş bitince RevenueCat panelinden (API keys) o key'leri silip yenisini oluşturman iyi bir güvenlik pratiği olur, zorunlu değil.

**Not (24 Ağustos):** Şu maddeler tamamlandı ve "ZATEN VAR" listesine taşındı: eski madde 3 ("Premium sesi diğer ekranlara bağla"), eski madde 2 ("Kitaplığı kalan 15 dile genişlet"), "Akıllı Plus zamanlaması" (`speak_screens.dart`'ta kalan süre göstergesi artık ≤15sn'de altın, ≤5sn'de kırmızı renge dönüyor, `ad_gate_screen.dart`'ın metni artık o gün pratik yapılan dakikayı övgüyle belirtiyor), **"İnteraktif tanıtım turu"** (`lib/features/onboarding/coach_tour.dart`, `HomeScreen`'e bağlı 4 adımlık tur), ve **RevenueCat kod entegrasyonu** — madde 2 artık sadece panel/hesap kurulumuna indirgendi, kod tarafı bitti. Liste numaraları buna göre kaydı.

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
GitHub: https://github.com/Frkn2009/nura-app (main, son commit 8145f1b, 24 Ağustos akşamı push edildi)
docs/DEVAM_SAYFASI.md dosyasını BAŞTAN SONA oku — reposu gerçekten
göremiyorsan bunu söyle, uydurma. "ZATEN VAR" listesindeki hiçbir şeyi
yeniden yazma, "GERÇEKTEN AÇIK OLAN İŞLER" listesinden devam et (şu an
sadece 3 madde kaldı: AdMob hesabı, video dersler, ASO görselleri/29 dil).
dart analyze temiz (flutter test bugün ÇALIŞTIRILMADI — Turkish-path
kısıtı yüzünden, aşağıdaki ASCII-klon tarifini kullan).

Windows'ta `dart analyze`/`dart format` asıl repo yolunda çalışır. Ama
`flutter test` VE `flutter build` (appbundle/apk) için proje yolunun
kendisi de ASCII olmalı (SDK/pub-cache ASCII olması yetmiyor — Dart'ın AOT
derleyicisi Türkçe karakterli proje yolunu okuyamıyor). Tarif: 
`git clone "<repo yolu>" C:\nura-build`, `android/local.properties`'e
`sdk.dir=C:\\AndroidSdk` + `flutter.sdk=C:\\flutter` yaz, `android/key.properties`
+ `android/app/upload-keystore.jks`'i asıl repodan kopyala (gitignore'da,
klonla gelmiyor), sonra `ANDROID_HOME=C:\AndroidSdk` `PUB_CACHE=C:\pub-cache`
ile çalıştır. Son build'ler zaten `build/app/outputs/` altında duruyor,
sıfırdan üretmen gerekmeyebilir.

Kod değiştirmeden önce git diff'i ../nura_backup'a yedekle (yukarıdaki
YEDEKLEME KURALI bölümüne bak). Her commit öncesi git fetch ile uzağın
ilerlemediğini kontrol et. İş bitince bu dosyayı güncelle, commit et VE
`git push origin main` yap (bugüne kadar commit'ler bazen sadece yerelde
kalıyordu — push etmeyi unutma).
```

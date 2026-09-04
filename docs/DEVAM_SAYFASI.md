# VOXELITH — DEVAM SAYFASI (4 Eylül 2026 — GÜNCEL)

Bu dosya başka bir AI asistana (Claude, GPT, Gemini vs.), başka bir bilgisayarda
projeyi devrederken kopyala-yapıştır olarak kullanılır. **Aşağıdaki "ZATEN VAR"
listesini atlamadan okumadan kod yazmaya başlama** — bu proje üzerinde birden
fazla AI çalıştı ve daha önce zaten var olan kodu "yeni icat" diye yeniden
yazıp zaman kaybettiren asistanlar oldu (örn. FSRS-5 motoru, cognitive
tracker, swipe review — hepsi zaten mevcuttu, biri bunları yeniden yazıp
özgün buluş gibi sundu).

**⚠️ ÖNKOŞUL:** Bu dosyayı önüne koyduğunuz AI'nın gerçekten `https://github.com/Frkn2009/voxelo-app` reposuna erişimi (dosya okuma/GitHub bağlantısı/checkout'lu bir ortam) olmalı. Sadece dosya adını düz metin sohbette söylemek yeterli değil — reposu göremeyen bir AI, "DEVAM_SAYFASI.md'yi okudum" der ama aslında baştan uydurur (bir kez `lib/models/`, `lib/screens/` gibi var olmayan bir klasör yapısı ve projeyle alakasız bir "geliştirici aracı" kurgusu uydurdu). Erişimi yoksa bu dosyanın **tam içeriğini** doğrudan mesaj olarak yapıştırın.

**⚠️ ÇOK ÖNEMLİ — commit/push durumu:** Bu satırı okuyan AI, önce
`git log -1` ve `git status --short` çalıştırıp GERÇEK durumu doğrulasın.
4 Eylül itibarıyla GitHub'daki (`voxelo-app`) en son commit hâlâ **27
Ağustos**'taki `3926869` — yani Voxelo→Voxelith rename'inin tamamı VE bu
oturumdaki tüm yeni işler (aşağıdaki "4 Eylül oturumu" bölümüne bak) sadece
geliştirme makinesindeki **çalışma dizininde** duruyor, GitHub'a hiç
gitmedi. Eğer bu dosyayı okuyan AI'nın erişebildiği repo klonu GitHub'dan
geldiyse (fresh `git clone`), o klon bu işlerin HİÇBİRİNİ içermez — sadece
27 Ağustos'taki eski hâli görür. Gerçek/güncel kodu görmek için ya (a) aynı
fiziksel makinedeki çalışma dizinine erişmek ya da (b) önce oradan
`git push origin main` yapılmış olması gerekir.

## 🆕 4 Eylül 2026 oturumu (henüz commit/push edilmedi)

- **AI geri bildirim güven açığı kapatıldı**: `ai-feedback` günlük hakkı
  dolan bir kullanıcı (ücretsiz VEYA Plus) artık sessizce sahte/yerel bir
  skora düşmüyor — `daily_limit_reached`/`plus_required` durumları
  istemcide (`lib/features/ai/data/claude_ai_service.dart`) ayrı ayrı
  yakalanıp dürüst bir "hakkın bitti" mesajı gösteriliyor.
- **Reklamla ek AI-feedback hakkı**: ücretsiz kullanıcı günlük 1 hakkını
  dolduruncca artık ödüllü video izleyip +1 hak kazanabiliyor, günde en
  fazla 5 video/hak (var olan `UserProfile.maxRewardedAdsPerDay=5` sınırıyla
  aynı). Sunucu tarafı tamamen yeni: `ai_usage_daily.feedback_bonus` sütunu
  + `grant_ai_feedback_ad_bonus` RPC'si (`supabase/migrations/20260904090001_ai_feedback_ad_bonus.sql`),
  istemci tarafı `ClaudeAiService.claimFeedbackAdBonus()` +
  `AiFeedbackScreen`'deki "Reklam izle, +1 hak kazan" butonu.
- **Maskot, tüm "hakkın bitti" anlarına eklendi**: `AdGateScreen`,
  `AiFeedbackScreen` (hem ücretsiz hem Plus limiti), `LiveChatScreen`
  (Plus'ın günlük 25 sohbet limiti), `SpeakHubScreen` — hepsi artık var
  olan `VoxelithMascot(mood: MascotMood.encourage)` widget'ını kullanıyor,
  yeni çizim kodu yazılmadı. Bilerek dokunulmayanlar: `TranslateScreen`
  (bulut çeviri hatası — çevrimdışıya sessizce düşüyor, "duvar" değil) ve
  `tts` (kullanıcıya hiç hata göstermiyor, sessizce cihaz sesine düşüyor).
- **Peer correction ekranı** (`lib/features/clan/peer_correction_screen.dart`)
  tamamen bağlı: model (`PeerCorrection`), servis (`Supa.peerCorrections`/
  `addPeerCorrection`/`deletePeerCorrection`), router (`/`... bkz.
  `app_router.dart`), yeni migration `20260903130001_peer_corrections.sql`.
- **Günlük AI/ses maliyet tavanı** eklendi (bkz. `docs/MALIYET_ANALIZI_2026_09.md`):
  `ai_usage_daily` tablosu + `try_consume_ai_usage()` RPC'si
  (`20260903120001_ai_usage_daily_cap.sql`), üç fonksiyon da (`ai-feedback`,
  `tts`, `chat`) artık çağrı öncesi günlük sınırı kontrol ediyor — worst-case
  Plus COGS'u $13.92/ay'dan $7.31/ay'a düştü.
- **Supabase tamamen güncel deploy edildi**: yukarıdaki 3 migration +
  `ai-feedback`/`chat`/`tts` fonksiyonlarının üçü de `qkhmtmwfwyscvtveiwui`
  projesine push/deploy edildi, doğrulandı.
- **Test APK üretildi** (ASCII yol `C:\nura-build`'ten, imzalı release,
  64.8MB) — arkadaş testine gönderilmek üzere kullanıcıya verildi.
  Not: sadece Android, iOS build bu makineden (Windows, Mac yok) mümkün
  değil.
- **Yedekler**: `../nura-app_backup/before_*.patch` — bu oturumdaki tüm
  commit edilmemiş değişikliklerin (bugünküler + önceki oturumlardan kalan
  Voxelo→Voxelith rename'i dahil, ~124 dosya) git diff yedekleri, repo
  DIŞINDA. Hiçbiri commit edilmedi.
- **Güvenlik + maliyet denetimi yapıldı, 2 gerçek açık kapatıldı**:
  `translate` ve `interpreter-translate` fonksiyonlarının hiçbirinde
  günlük sınır yoktu (`interpreter-translate` Plus bile gerektirmiyordu —
  otomatik anonim girişle herkes sınırsız çağırabiliyordu). İkisi de
  `try_consume_ai_usage` desenine bağlandı
  (`20260904120001_translate_interpreter_daily_cap.sql`), girdi uzunluğu
  sıkılaştırıldı. Aynı anda `tts` (40→8/gün) ve `chat` (25→20/gün) daha da
  düşürüldü ki **5 kalemin toplam worst-case COGS'u ($5.25/ay ≈ $63/yıl)
  Plus'ın $65/yıl fiyatının altında kalsın** — bkz. `docs/MALIYET_ANALIZI_2026_09.md`.
  **Karara bağlandı (aynı gün, ikinci tur):** "Toplantı Çevirmeni" ilk
  sürümde kârlı olamayacağı için **tamamen kaldırıldı** — `interpreter_screen.dart`
  ve `interpreter_translate.dart` silindi, `/interpreter` route'u, çeviri
  sekmesindeki giriş kartı, reklam ekranındaki "+2 dk çeviri" seçeneği,
  paywall'daki "günde 2 saat/8 saat" vaatleri ve kullanım şartlarındaki
  referansı kaldırıldı. `interpreter-translate` Edge Function'ı Supabase'de
  duruyor (günlük sınırlı, artık hiç çağrılmıyor, zararsız) — istenirse
  tamamen silinebilir. Bunun sonucunda Plus'ın worst-case COGS'u $63'ten
  **$46.80/yıl**'a düştü (bkz. `docs/MALIYET_ANALIZI_2026_09.md`).
  **Açık kalan ürün notu**: Business paketinin ($200/yıl) tanıtım
  metnindeki tek farklılaştırıcısı Toplantı Çevirmeni'ydi — o kaldırılınca
  Business'ın Plus'a göre gerçek bir üstünlüğü kalmadı ("öncelikli destek"
  dışında). Business paketinin kendisini gizlemek/kaldırmak istenip
  istenmediği kullanıcıya soruldu, henüz cevap yok.
- `dart analyze`: temiz (2 pre-existing info uyarısı, hata yok).
  `flutter test`: 35/35 geçiyor.

## 📍 PROJE

| | |
|---|---|
| **GitHub** | https://github.com/Frkn2009/voxelo-app |
| **Son commit** | `1a25b4b` — Nura → Voxelo tam yeniden adlandırma (26 Ağustos). **30 Ağustos:** ikinci bir rename (Voxelo → Voxelith) bu oturumda sürüyor, henüz commit edilmedi — bkz. aşağıdaki yeni bölüm. |
| **Test** | ✅ 35/35 geçiyor (ASCII klonda rename sonrası doğrulandı) |
| **Analyze** | ✅ Temiz (0 hata, 1 pre-existing lint info) |
| **Windows test ortamı** | `C:\nura-app` + `PUB_CACHE=C:\pub-cache` (kullanıcı profil yolunda Türkçe karakter olduğu için `flutter test`/native-asset derleyicisi kırılıyor — ASCII yol şart). **Not:** bu klasörün fiziksel adı bilinçli olarak `nura-app` bırakıldı (kozmetik, git remote zaten `voxelo-app`'e işaret ediyor) — düzeltme yapılırsa `git clone https://github.com/Frkn2009/voxelo-app.git C:\voxelo-app` ile taze klon alınabilir. |

### 🔄 İsim değişikliği #1: Nura → Voxelo (26 Ağustos 2026)

"Nura" adı EUIPO (AB marka ofisi) Sınıf 9'da (yazılım) iki farklı şirket tarafından tescilli bulundu (Nura Holdings Pty Ltd, NuraLogix Corporation) + Sınıf 41'de bekleyen bir başvuru (Aman Group) — gerçek bir marka çakışması. TR/Benelux/EUIPO'da 5 alternatif isim tarandı, **Voxelo** üçünde de temiz çıktı ve seçildi. Kod tabanının tamamı (101 dosya), Android paketi (`com.nura.nura` → `com.voxelo.voxelo`), GitHub reposu (`nura-app` → `voxelo-app`, otomatik yönlendirme aktif) yeniden adlandırıldı; `dart analyze` temiz, `flutter test` 35/35 geçti. Bilinçli olarak **dokunulmadı**: zaten apply edilmiş Supabase migration dosyaları (`supabase/migrations/2026...sql` — geçmiş bütünlüğü için, sadece canlıdaki `clan_chat` fallback görüntü adı hâlâ "NURA " diyor, yeni bir migration'la düzeltilmeli), iOS Xcode widget hedefi (`ios/NuraHomeWidget/*` — iOS build şu an planda değil, Xcode olmadan yapı riskli).

### 🔄 İsim değişikliği #2: Voxelo → Voxelith (30 Ağustos 2026 — SÜRÜYOR, henüz commit edilmedi)

"Voxelo" da tescilli çıktı: WIPO Global Brand Database'de **UKIPO'da tescilli** bir marka bulundu (sahibi Voxelo LTD, İngiltere; Nice sınıf 9+42 — "3D dijital varlıklar için AI/SaaS, 3D ürün modelleme" — tam olarak bu uygulamanın alanıyla çakışıyor, tescil 11 Nisan 2025). Alternatif olarak denenen **Voxaris** de tescilli çıktı (Voxaris LTD, UK, sınıf 42). **Voxelith** hem WIPO Global Brand Database'de hem TÜRKPATENT'te "sonuç bulunamadı" ile temiz çıktı ve seçildi (ekran görüntüsü kanıtlı doğrulama yapıldı).

**Bu oturumda yapılanlar:** 93 dosyada metin/kod içi "voxelo"→"voxelith" değişimi uygulandı (Dart sınıf adları, i18n metinleri, dokümanlar, `pubspec.yaml` paket adı ve buna bağlı `package:voxelo/`→`package:voxelith/` import'ları, dosya adları: `voxelo_theme.dart`→`voxelith_theme.dart`, `voxelo_ad_engine.dart`→`voxelith_ad_engine.dart`, `VOXELO_CODING_CONTRACT.md`→`VOXELITH_CODING_CONTRACT.md`, `VOXELO_V14_HANDOFF_PACKET.md`→`VOXELITH_V14_HANDOFF_PACKET.md`, `assets/mascot_voxelo.png`→`assets/mascot_voxelith.png`).

**Android paket kimliği (30 Ağustos 2026 akşamı tamamlandı):** Play Console hesabı/uygulaması hiç açılmadığı doğrulanınca (bkz. `GERÇEKTEN AÇIK OLAN İŞLER` madde 6 ve `YAPILACAKLAR.md` madde 2 — ikisi de "henüz açılmadı" diyor, yani mağazada canlı bir Voxelo/Voxelith yok, paket kimliği değişimi kimseyi etkilemiyor) Android tarafı tamamen Voxelith'e geçirildi: `android/app/build.gradle.kts` (`namespace`/`applicationId` artık `com.voxelith.voxelith`), Kotlin klasör yolu `android/app/src/main/kotlin/com/voxelith/voxelith/` (`MainActivity.kt` taşındı, `VoxeloHomeWidgetProvider.kt`→`VoxelithHomeWidgetProvider.kt` olarak yeniden adlandırıldı ve sınıf adı da değişti), ana ekran widget kaynakları (`res/{layout,xml,drawable}/voxelith_*`, `strings.xml`'deki `voxelith_widget_description`, `AndroidManifest.xml`'deki `.VoxelithHomeWidgetProvider`/`@xml/voxelith_home_widget_info` referansları), ve `lib/data/widgets/home_widget_service.dart` (`VoxeloHomeWidgetService`→`VoxelithHomeWidgetService`, `name: 'VoxelithHomeWidgetProvider'`). `lib/app.dart`'taki çağrı da güncellendi.
- **Bilinçli olarak dokunulmadı** (bunlar Android'e değil iOS'a/dış servislere ait, kapsam dışı bırakıldı): `home_widget_service.dart`'taki `appGroupId = 'group.com.voxelo.voxelo'` ve `iOSName: 'VoxeloHomeWidget'` (iOS App Group/widget hedefi, Xcode tarafında karşılığı değişmeden Dart tarafını değiştirmek riskli).
- iOS `Info.plist`: `CFBundleName` ve `CFBundleURLSchemes` hâlâ `voxelo` (deep-link şeması; sadece `CFBundleDisplayName` ve mikrofon izin metni VOXELITH'e çevrildi). iOS bundle identifier zaten `com.nura.nura` idi (Voxelo rebrand'inde de hiç değişmemiş), bu oturumda da dokunulmadı.
- **Gerçek dış servis kimlikleri (kritik):** RevenueCat panelindeki ürün ID'leri hâlâ `voxelo_plus_monthly`/`voxelo_plus_yearly`/`voxelo_plus_family`/`voxelo_business_monthly`/`voxelo_business_yearly` ve dart-define ortam değişkeni adları `VOXELO_REVENUECAT_API_KEY`/`VOXELO_REVENUECAT_ENTITLEMENT_ID`/`VOXELO_REVENUECAT_BUSINESS_ENTITLEMENT_ID` — bunlar `lib/features/plus/domain/entitlement.dart` ve `lib/features/plus/data/revenuecat_billing_service.dart`'ta bilinçli olarak `voxelo` bırakıldı (sadece görünen `title` metinleri VOXELITH'e çevrildi). **İlk bulk sed geçişi bunları da yanlışlıkla `voxelith`'e çevirmişti — panel tarafı değişmediği için bu, satın almaları sessizce kırardı; fark edilip geri alındı.** RevenueCat panelinde ürünler gerçekten `voxelith_*` olarak yeniden oluşturulursa bu dosyalar da güncellenmeli.
- GitHub repo adı (`voxelo-app`) ve yerel klasör adı (`nura-app`) — kozmetik, değiştirilmedi.
- `dart analyze`: temiz (1 pre-existing lint info, aynısı). `flutter test`: **35/35 geçti** — bu sefer Türkçe karakterli proje yolundan (`dart pub get` sonrası) doğrudan çalıştı, ASCII klona gerek kalmadı (önceki oturumların notundaki kısıt bu Flutter/Dart sürümünde tekrarlanmadı; `flutter build`/AOT için hâlâ geçerli olabilir, denenmedi). **`pub get` şart**: `pubspec.yaml`'daki `name: voxelo→voxelith` değişikliği sonrası `dart pub get` çalıştırılmazsa tüm `package:voxelith/` import'ları "Undefined name" hatasıyla patlıyor (yanıltıcı görünüyor, aslında tek kök neden `.dart_tool/package_config.json`'ın güncel olmaması). Hiçbir commit atılmadı, `git push` yapılmadı.

**Önemli not — bu dosyanın kendi güvenilirliği hakkında:** Bu bölümü güncelleyen oturum, ilk bulk-replace geçişinde bu dosyanın #1 bölümündeki (Nura→Voxelo) tarihsel/gerçek altyapı ifadelerini de yanlışlıkla "voxelith"e çevirmiş ve bir an için bunun önceki bir AI'nın uydurduğu sahte bir "Voxelith zaten tamamlandı" kaydı olduğunu düşünmüştü. `git show 6c46537:docs/DEVAM_SAYFASI.md` ile orijinal commit içeriği kontrol edilerek bunun **kendi hatası** olduğu anlaşıldı ve düzeltildi — #1 bölümü tamamen gerçek ve doğrulanmış tarihe aittir, uydurma değildir.

## ✅ ZATEN VAR — YENİDEN YAZMA

- **SRS motoru**: `lib/core/algorithm/fsrs5_engine.dart` (`VoxelithBrain`, FSRS-5 tam parametreli) + `lib/data/srs/srs_machine.dart` (FSRS-inspired). `SrsCard`'da `phrase` alanı YOK.
- **Bilişsel takip**: `lib/core/algorithm/cognitive_tracker.dart` (Reflex/Recall/Guess sınıflandırması, cevap süresine göre).
- **Kaydırmalı review**: `lib/ui/review/swipe_review_card.dart` (Tinder tarzı fiziksel swipe).
- **Alfabe sistemi TAM**: `lib/features/alphabet/alphabet_engine.dart` — 30 dilin **tamamı** kendi gerçek alfabesiyle. ar/he/ru/uk/fa/el/hi/th/ja/ko/vi/pl/cs/ro/hu/sv/da/no/fi hepsi tam veya kapsamlı; zh Pinyin olarak (Çince'nin alfabesi yok); id/sw bilinçli olarak jenerik Latin (gerçekten aksansız, doğru). Kalan alfabe eksiği yok.
- **RTL (sağdan sola) desteği**: `LearnLang.isRtl` (ar/he/fa) eklendi, `Directionality` artık alfabe ekranı dışında konuşma/çeviri/klip ekranlarında da uygulanıyor — önceden bu ekranlarda Arapça/İbranice/Farsça metin soldan sağa yanlış render ediliyordu.
- **Uygulama ikonu güncel**: `assets/icon_source.png` (yeni `VoxelithMark`'tan render edildi) + `flutter_launcher_icons` ile Android/iOS/web ikon setleri yeniden üretildi. Artık gerçek logo ile uyumlu.
- **Kitaplık (`/library`)**: `lib/data/content/library.dart` + `lib/features/library/` — gerçek, gramer kontrolü yapılmış A1 hikayeler, Türkçe glosslu. `StoryReaderScreen`'de "Tümünü Oynat" gerçekten her cümleyi sırayla sesli okuyor. **Artık 30/30 dilde içerik var** (24 Ağustos: kalan 15 dil — nl/pl/sv/da/no/fi/cs/ro/hu/vi/id/uk/he/fa/sw — başka bir AI'ya verilen şablonla üretildi, 85 hikaye toplam, `dart analyze` temiz, id'ler benzersiz doğrulandı). Video içeriği hâlâ gerçek prodüksiyon gerektiriyor, üretilemedi.
- **Premium ses (ElevenLabs)**: `supabase/functions/tts` + `lib/data/speech/premium_tts_service.dart`. `chat` ile aynı desen — Plus'a kilitli, `ELEVENLABS_API_KEY` secret'ı yok/deploy edilmemişse sessizce cihaz TTS'ine düşer. **Artık kitaplık okuyucusu + konuşma pratiği (`speak_screens.dart`) + alfabe örnek kelimeleri (`alphabet_screen.dart`, sadece kelimeler — tek harf/ses telaffuzu bilinçli olarak cihazın özel ayarlı (yavaş/yüksek perde) TTS'inde kaldı) + sohbet cevapları (`live_chat_screen.dart`) hepsi aynı "önce premium dene, olmazsa cihaz TTS'i" desenini kullanıyor** (24 Ağustos). `tts` fonksiyonu deploy edildi ve **`ELEVENLABS_API_KEY` girildi, `/v1/text-to-speech` endpoint'ine karşı doğrudan doğrulandı** (gerçek MP3 üretti, 24 Ağustos) — kod tamamen hazır ve canlı, restricted key sadece "Text to Speech" iznine sahip (en az yetki).
- **Canlı AI konuşma partneri (Plus)**: `supabase/functions/chat/index.ts` (Claude API proxy) + `lib/features/ai/screen/live_chat_screen.dart`, alt gezinme çubuğunda **"Sohbet"** sekmesi olarak (`/app/chat`). `chat` fonksiyonu deploy edildi ve **`ANTHROPIC_API_KEY` girildi, Anthropic API'ye karşı doğrudan doğrulandı** (24 Ağustos) — kod tamamen hazır ve canlı. (`chat` fonksiyonu gerçek girişli + Plus abonelikli kullanıcı gerektirdiği için uçtan uca curl testi yapılamadı, ama key'in kendisi çalışıyor.)
- **Günlük çark**: `lib/features/games/daily_wheel_screen.dart` — artık gerçekten `SessionController.awardXp` çağırıyor, günde bir kez (SharedPreferences `wheel_day`).
- **Klan sistemi**: `lib/features/clan/` — üyelik, davet kodu, **haftalık otomatik sıfırlanan** XP yarışması (`clan_xp` tablosu, `get_my_clan()` RPC, her Pazartesi resetleniyor — bu zaten backend'de vardı, sadece arayüzde "yarışma" diye belirtilmiyordu). Klan sohbeti yeni: `supabase/clan_chat.sql` (kullanıcı tarafından manuel apply edilmeli) + `lib/features/clan/clan_chat_screen.dart`.
- **Oyunlar CEFR-farkında**: `lib/data/content/catalog.dart`'taki `allPhrases(lang, {maxLevel})` artık kullanıcının seviyesini aşan kelimeleri filtreliyor.
- **Maskot**: adı **Voxelith** (eskiden "Luma" idi, tamamı değiştirildi) — `lib/ui/mascot.dart`.
- **Marka işareti**: `lib/ui/brand.dart` → `VoxelithMark` — N harfinin köşegeni ses dalgasına dönüştürüldü. `lib/ui/voxelith_logo.dart` SİLİNDİ (kullanılmayan duplicate'ti).
- **Tipografi**: başlıklarda Sora, gövdede Manrope — `assets/fonts/Sora.ttf` + `Manrope.ttf` (yerel paketli, **google_fonts paketi KULLANMA** — çalışma zamanında internetten font indirir, hem offline-first mimariyi bozar hem teste zarar verir, bunu bir kez yaşadık).
- **Temalar**: Sistem/Açık/Koyu/**Bal (amber)** — `lib/core/theme/amber_theme.dart`, `AppThemePreference.amber`.
- **TTS**: `lib/data/speech/speech_controller.dart` — kaliteli/neural ses bulununca üstüne yapay pitch bindirmiyor (eskiden hep 1.12 pitch zorluyordu, bu neural sesleri robotikleştiriyordu).
- **Güvenlik denetimi yapıldı** (23 Ağustos): secret sızıntısı yok, RLS büyük ölçüde sağlam, Plus hakkı doğru şekilde `subscriptions` tablosundan doğrulanıyor. İki bulgu `supabase/security_hardening.sql`'de düzeltildi (henüz apply edilmedi): `profiles.is_plus` istemciden yazılabiliyordu (trigger ile korundu), `record_xp`'de hız sınırı yoktu (10 saniyede 5 çağrı sınırı eklendi).
- **Görsel derinlik**: `VoxelithCard` artık düz kenarlıklı değil, açık/bal temalarda yumuşak gölgeli (koyu temada gölge yerine kenarlık — siyah zeminde gölge görünmez). Ana sayfadaki "Bugünün konuşması" kartına da renkli glow gölgesi eklendi.
- **Android release imzalama hazır ve doğrulandı**: `android/app/upload-keystore.jks` (**dikkat: konumu değişti** — eskiden `android/upload-keystore.jks`'teydi, ama `build.gradle.kts`'teki `file(keystoreProperties["storeFile"])` çağrısı `android/app/` köküne göre çözülüyor; release build hiç denenmediği için bu yanlış-konum hatası şimdiye kadar hiç yakalanmamıştı — 24 Ağustos'ta taşınarak düzeltildi), `android/key.properties` ve `build.gradle.kts`'teki `signingConfigs` bağlı (ikisi de gitignore'da, kullanıcıda şifreler var). `apksigner verify --print-certs` ile imza doğrulandı: `CN=Voxelo App` (gerçek release sertifikası, debug değil).
- **`tools/mission-control.ps1`**: yedekleme + `git fetch`/uzak kontrolü + `dart analyze` + `flutter test`'i tek komutta birleştiren PowerShell scripti (`status`/`remote`/`backup`/`check`/`precommit` alt komutları). **Yeniden yazma**, sadece kullan.
- **Paywall gerçek billing'e bağlandı**: `PaywallScreen` eskiden `session.setPlus(true)`'ı direkt çağırıyordu (satın alma yoktu, herkes bedava Plus oluyordu). Artık `plusControllerProvider.purchase()` üzerinden gidiyor, `PlusController` sonucu `session.isPlus`'a senkronluyor.
- **RevenueCat entegrasyonu yazıldı** (24 Ağustos): `lib/features/plus/data/revenuecat_billing_service.dart` — `purchases_flutter` paketi eklendi, `RevenueCatBillingService implements BillingService` (offerings → `BillingProduct` eşlemesi store ürün kimliğiyle yapılıyor: `voxelo_plus_monthly`/`voxelo_plus_yearly`/`voxelo_plus_family`, `Purchases.getCustomerInfo().entitlements.active` ile entitlement kontrolü). `billingServiceProvider` artık `VOXELO_REVENUECAT_API_KEY` dart-define'ı girildiyse `RevenueCatBillingService`, girilmediyse `FakeBillingService` döndürüyor — anahtar yokken hiçbir şey bozulmuyor. `main.dart`'ta `RevenueCatBillingService.configureIfNeeded()` çağrılıyor. Detaylı kurulum: `README.md` → "RevenueCat (Plus satın alma) kurulumu". **Kullanıcının yapması gereken**: panelde ürünleri (`voxelo_plus_*` kimlikleriyle) ve `plus` entitlement'ını tanımlamak, gerçek App Store/Play Store hesabı bağlamak (veya önce RevenueCat'in mağaza hesabı gerektirmeyen Test Store'uyla denemek) — kod tarafı hazır.
- **Splash screen gerçekten bağlandı**: `flutter_native_splash.yaml` config'i vardı ama paket hiç `pubspec.yaml`'a eklenmemişti — uygulama varsayılan beyaz Flutter splash'ıyla açılıyordu. Artık `flutter_native_splash` dependency'si eklendi ve `dart run flutter_native_splash:create` çalıştırıldı.
- **İnteraktif tanıtım turu**: `lib/features/onboarding/coach_tour.dart` — yeniden kullanılabilir, spot ışıklı (`CustomPainter` ile karartılmış arka planda "delik") coach-mark overlay sistemi; `CoachStep(targetKey: GlobalKey, title, body)` listesi alıp gerçek widget'ların pozisyonunu `RenderBox.localToGlobal` ile bulup üzerlerine balon gösteriyor (mockup ekran değil). `HomeScreen`'e bağlandı: ilk açılışta günlük hedef kartı → bugünün konuşması → kitaplık → tekrar sırasıyla 4 adımlık tur, `SharedPreferences` (`home_tour_seen_v1`) ile bir kere gösteriliyor, "Geç" ile her an atlanabilir.

## 🔶 GERÇEKTEN AÇIK OLAN İŞLER

| # | İş | Not |
|---|---|---|
| 1 | Video mikro-dersler | Gerçek anadil konuşan kaydı gerektirir — bir AI bunu üretemez, içerik prodüksiyonu lazım |
| 2 | AdMob gerçek anahtarları | Hesap açılınca, dart-define ile geçilecek (bkz. README) |
| 3 | Meşru ASO (App Store Optimization) | Anahtar kelime + TR mağaza metni yazıldı (`docs/STORE_METADATA_TR.md`). Kalan: mağaza ekran görüntüleri/video, kalan 29 dile çeviri. Sahte yorum/bot indirme gibi yöntemler kullanılmayacak (mağaza politikası ihlali + ban riski). |
| 4 | `GOOGLE_TRANSLATE_API_KEY` secret'ı hiç girilmemiş | **26 Ağustos'ta düzeltildi/deploy edildi, ama kritik bulgu:** `interpreter-translate` deploy edildi (`supabase functions list` → ACTIVE, v2). Deploy sırasında `supabase secrets list` ile kontrol edildiğinde `GOOGLE_TRANSLATE_API_KEY` secret'ının **hiç tanımlı olmadığı** görüldü — önceki not ("zaten var, yeni secret gerekmiyor") yanlıştı. Bu, sadece `interpreter-translate`'i değil, **önceden "tamamen deploy edildi" denen `translate` fonksiyonunu da** etkiliyor — ikisi de şu an gerçek bir Google Cloud Translate API anahtarı girilmeden `service_not_configured` hatası veriyor. Kullanıcının yapması gereken: Google Cloud Console'dan bir Translate API anahtarı alıp `supabase secrets set GOOGLE_TRANSLATE_API_KEY=<anahtar> --project-ref qkhmtmwfwyscvtveiwui` ile girmek (ya da anahtarı sohbette paylaşırsa AI bunu yapabilir). |
| 5 | RevenueCat panelinde Business entitlement + ürünleri | Kod hazır (`voxelo_business_monthly`/`voxelo_business_yearly`, entitlement id varsayılan `business`), panelde henüz tanımlanmadı. Bkz. README → "Business katmanı". |
| 6 | Play Console hesabı/uygulaması | Henüz açılmadı — kayıt/ödeme bilgisi gerektirdiği için kullanıcı tarafından yapılmalı. |

**Tablet/büyük ekran uyumluluğu (25 Ağustos):** `AndroidManifest.xml` zaten kısıtlayıcı değildi (orientation lock/`supports-screens` yoktu — kontrol edildi). `lib/features/shell/app_shell.dart` artık ≥600dp genişlikte alt `NavigationBar` yerine yan `NavigationRail` gösteriyor, içerik `ConstrainedBox(maxWidth: 900)` ile ortalanıp kenardan kenara gerilmiyor (Material large-screen kılavuzu). Gerçek tablet/emülatörde görsel doğrulama yapılmadı — sadece `dart analyze` ile derleme doğrulandı.

**Yeni özellik (25 Ağustos): Toplantı Çevirmeni (Business tier).** İki kişinin karşılıklı konuşurken (toplantı/seyahat) anlık iki yönlü çeviri yapması için yeni bir mod: `lib/features/interpreter/interpreter_screen.dart` — dokun-konuş (iki dil butonu, basılı tutup konuş), mevcut `SpeechController` (STT+TTS) ve yeni `InterpreterTranslate` (Google Translate API, düz/literal çeviri — yorum katmıyor) üzerine kurulu. Günlük dakika kotası: Free 5dk (+ödüllü videoyla +2dk, `AdGateScreen`'e üçüncü ödül seçeneği eklendi), Plus 2sa, Business 8sa — `UserProfile.interpreterSecondsUsed/interpreterAllowance` ile takip ediliyor (mevcut `speakSecondsUsed` desenini takip ediyor, sunucu tarafında ayrıca sayılmıyor). `VoxelithEntitlement`'a `business` eklendi, `PaywallScreen`'de Plus/Business sekmesi var. Çeviri ekranından (`/app/translate`) "Toplantı Çevirmeni" kartıyla `/interpreter`'a gidiliyor. **Not:** dil geçişi otomatik değil, dokun-konuş — cihaz STT'si bir oturumda tek dile kilitleniyor, iki dili aynı anda otomatik ayırt edemiyor; tam otomatik algılama (bulut konuşma tanıma + dil tespiti) ayrı, daha büyük bir mimari iş.

**Supabase deploy tamamen tamamlandı (24 Ağustos):** `chat`/`tts`/`translate` fonksiyonlarının üçü de Supabase CLI ile (personal access token, tarayıcı girişi gerekmeden) deploy edildi, `ACTIVE` durumda. `supabase/clan_chat.sql` ve `supabase/security_hardening.sql`, `supabase/migrations/` altına taşınıp `supabase db push` ile canlıya uygulandı — Management API üzerinden doğrulandı (`protect_is_plus` fonksiyonu/trigger'ı, `get_clan_messages` fonksiyonu, `clan_messages` tablosu hepsi canlıda mevcut). **`ANTHROPIC_API_KEY` ve `ELEVENLABS_API_KEY` ikisi de girildi**, ikisi de ilgili sağlayıcının gerçek API'sine karşı doğrudan doğrulandı (Anthropic: gerçek cevap alındı; ElevenLabs: gerçek MP3 üretildi) — Supabase tarafında artık gerçekten açık hiçbir iş yok.

- **RevenueCat ↔ Supabase kimlik köprüsü kuruldu ve iki kritik hata düzeltildi** (24 Ağustos): `supabase/functions/revenuecat-webhook` — RevenueCat'in ödeme event'lerini (`INITIAL_PURCHASE`/`RENEWAL`/`EXPIRATION`/`BILLING_ISSUE` vb.) alıp `public.subscriptions`'a yazıyor, `REVENUECAT_WEBHOOK_SECRET` ile korunuyor, `--no-verify-jwt` ile deploy edildi (RevenueCat kendi secret'ını gönderiyor, Supabase JWT'si değil). `main.dart` artık uygulama açılışında Supabase'e **anonim giriş** yapıyor (proje ayarında kapalıydı, açıldı) — e-posta ile hiç kayıt olmayan kullanıcının bile kararlı bir `auth.uid()`'i oluyor. `RevenueCatBillingService.configureIfNeeded()` bu uid'i RevenueCat'in `appUserID`'si olarak veriyor, böylece webhook'un `app_user_id`'si `subscriptions.user_id` ile birebir eşleşiyor. RevenueCat panelinde webhook entegrasyonu V2 API ile kuruldu. **Bulunan ikinci, bağımsız hata**: `handle_new_user()` trigger'ı (repoda hiç izlenmiyordu, muhtemelen dashboard'dan elle eklenmişti) `profiles(id, email)`'e yazmaya çalışıyordu — bu sütunlar `profiles`'ta hiç yok (gerçek PK: `user_id`, `email` sütunu yok) — yani **bu trigger var olduğundan beri projedeki HER yeni kullanıcı kaydı (anonim veya e-postalı, fark etmez) sessizce başarısız oluyordu**. `supabase/migrations/20260824090001_fix_handle_new_user.sql` ile düzeltildi, canlıda uygulandı. Tüm zincir (anonim giriş → profil satırı → webhook event → subscriptions satırı) gerçek bir test kullanıcısıyla uçtan uca doğrulandı, sonra test kullanıcısı silindi.

**Release build (.aab) başarıyla üretildi (24 Ağustos):** `build/app/outputs/bundle/release/app-release.aab` (67.6MB) ve `.../flutter-apk/app-release.apk` (66.6MB) — gerçek `upload-keystore.jks` ile imzalı, doğrulandı. Bunun için 3 ayrı engel aşıldı:

1. **Android SDK yolu Türkçe karakterliydi** (`C:\Users\M Y DERİ\AppData\Local\Android\Sdk`) → `C:\AndroidSdk`'ya kopyalandı (robocopy, `Move-Item` izin hatası verdi), `ANDROID_HOME`/`ANDROID_SDK_ROOT` kullanıcı ortam değişkenleri ve `flutter config --android-sdk` bu yola güncellendi, `android/local.properties`'teki `sdk.dir` düzeltildi (gitignore'da, her klonda elle/otomatik ayarlanmalı).
2. **AGP proje yolu kontrolü**: `C:\Users\M Y DERİ\...` proje yolu da Türkçe karakterli — AGP bunu hata sayıyor. `android/gradle.properties`'e `android.overridePathCheck=true` eklendi (bu satırı silme).
3. **Asıl kırılma noktası — proje yolunun kendisi**: (2)'yi aştıktan sonra Dart'ın AOT snapshot derleyicisi `.dart_tool\flutter_build\...\app.dill` dosyasını Türkçe karakterli yoldan okuyamadığı için `flutter build` yine çöküyordu (aynı kök neden, `flutter test`'i kıran sorunla birebir aynı — sadece SDK/pub-cache değil, **projenin kendi klasör yolu da** ASCII olmalı). Çözüm: `git clone` ile projeyi `C:\voxelith-build` gibi ASCII bir yola klonlayıp **oradan** build almak. `key.properties`/`upload-keystore.jks` gitignore'da olduğu için klonla gelmiyor, elle kopyalanmalı (bkz. madde 4 aşağıda).
4. **Keystore konum hatası** (yukarıda "ZATEN VAR" listesinde detaylı): `upload-keystore.jks` yanlışlıkla `android/` kökündeydi, olması gereken yer `android/app/`.

**Sonraki build için tarif**: `git clone "<gerçek repo yolu>" C:\voxelith-build-N`, `android/local.properties`'e `sdk.dir=C:\\AndroidSdk` + `flutter.sdk=C:\\flutter` yaz, `android/key.properties` + `android/app/upload-keystore.jks`'i gerçek repodan kopyala, sonra `ANDROID_HOME`/`ANDROID_SDK_ROOT`/`PUB_CACHE=C:\pub-cache` ortam değişkenleriyle `flutter build appbundle --release` çalıştır.

**RevenueCat panel kurulumu tamamlandı (24 Ağustos):** `voxelo` projesi, `Test Store` app'i, `plus` entitlement'ı `voxelo_plus_monthly`/`voxelo_plus_yearly`/`voxelo_plus_family` ürünlerinin üçüne de bağlı, `default` offering `current` ve üç doğru paketi içeriyor (Monthly/Yearly/Family — hepsi doğru ürüne bağlı, gereksiz Lifetime paketi silindi). RevenueCat V2 REST API ile (secret key sohbette verildi, hiçbir dosyaya yazılmadı) doğrudan panelden düzeltildi. **Test etmek için**: `flutter run --dart-define=VOXELO_REVENUECAT_API_KEY=<Test Store public key>` — README'deki "RevenueCat (Plus satın alma) kurulumu" bölümüne bak. **Güvenlik notu**: kurulum sırasında kullanılan Secret API key'leri (`sk_...`) sohbette düz metin geçti — iş bitince RevenueCat panelinden (API keys) o key'leri silip yenisini oluşturman iyi bir güvenlik pratiği olur, zorunlu değil.

**Not (24 Ağustos):** Şu maddeler tamamlandı ve "ZATEN VAR" listesine taşındı: eski madde 3 ("Premium sesi diğer ekranlara bağla"), eski madde 2 ("Kitaplığı kalan 15 dile genişlet"), "Akıllı Plus zamanlaması" (`speak_screens.dart`'ta kalan süre göstergesi artık ≤15sn'de altın, ≤5sn'de kırmızı renge dönüyor, `ad_gate_screen.dart`'ın metni artık o gün pratik yapılan dakikayı övgüyle belirtiyor), **"İnteraktif tanıtım turu"** (`lib/features/onboarding/coach_tour.dart`, `HomeScreen`'e bağlı 4 adımlık tur), ve **RevenueCat kod entegrasyonu** — madde 2 artık sadece panel/hesap kurulumuna indirgendi, kod tarafı bitti. Liste numaraları buna göre kaydı.

## 💾 YEDEKLEME KURALI (HER OTURUMDA ZORUNLU)

Kod değiştirmeye başlamadan **önce**, repo kökünde:

```bash
git status --short
mkdir -p ../voxelith_backup
stamp=$(date +%Y%m%d_%H%M%S)
git diff --binary > "../voxelith_backup/before_$stamp.patch"
```

Windows'ta `tools\mission-control.ps1` bu adımları (yedek + `git fetch`/uzak kontrolü + `dart analyze` + `flutter test`) tek komutta yapar:

```powershell
powershell -ExecutionPolicy Bypass -File tools\mission-control.ps1 precommit
```

Bu, commit edilmemiş değişiklikleri repo **dışında** yedekler; hiçbir şeyi silmez. Push'tan önce de `git fetch && git log --oneline HEAD..origin/main` ile uzağın ilerlemediğini doğrula (aşağıda tekrar var). Büyük bir iş bitince bu dosyayı ("DEVAM_SAYFASI.md") güncelleyip commit et — bir sonraki oturum/AI buradan devam edecek.

## ⚠️ TEKRAR YAŞANMASIN

- `google_fonts` paketini EKLEME — yerel font kullan (yukarıya bak).
- Kullanıcı klasör yolu `C:\Users\M Y DERİ\...` — Türkçe "İ" karakteri `flutter analyze`'in LSP sunucusunu ve `flutter test`'in native-asset derleyicisini çökertiyor. `dart analyze` (LSP değil) çalışır; test için `C:\voxelo-app` + `PUB_CACHE=C:\pub-cache` kullan.
- `dart format` tüm ağacı çalıştırınca binlerce satırlık alakasız diff üretiyor (repo daha önce tutarlı formatlanmamış) — sadece dokunduğun dosyalara `dart format <dosya>` uygula, `dart format .` deme.
- Commit/push öncesi mutlaka `git fetch && git log --oneline HEAD..origin/main` ile uzağın ilerlemediğini doğrula — bu proje üzerinde paralel çalışan başka AI/oturumlar olabiliyor.

## 💡 YENİ SOHBETTE DEVAM

```
voxelo-app projesine devam et.
GitHub: https://github.com/Frkn2009/voxelo-app (main, son commit 8145f1b, 24 Ağustos akşamı push edildi)
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
`git clone "<repo yolu>" C:\voxelith-build`, `android/local.properties`'e
`sdk.dir=C:\\AndroidSdk` + `flutter.sdk=C:\\flutter` yaz, `android/key.properties`
+ `android/app/upload-keystore.jks`'i asıl repodan kopyala (gitignore'da,
klonla gelmiyor), sonra `ANDROID_HOME=C:\AndroidSdk` `PUB_CACHE=C:\pub-cache`
ile çalıştır. Son build'ler zaten `build/app/outputs/` altında duruyor,
sıfırdan üretmen gerekmeyebilir.

Kod değiştirmeden önce git diff'i ../voxelith_backup'a yedekle (yukarıdaki
YEDEKLEME KURALI bölümüne bak). Her commit öncesi git fetch ile uzağın
ilerlemediğini kontrol et. İş bitince bu dosyayı güncelle, commit et VE
`git push origin main` yap (bugüne kadar commit'ler bazen sadece yerelde
kalıyordu — push etmeyi unutma).
```

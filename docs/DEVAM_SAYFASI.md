# NURA — DEVAM SAYFASI (23 Ağustos 2026 — GÜNCEL)

Bu dosya başka bir AI asistana (Claude, GPT, Gemini vs.) projeyi devrederken
kopyala-yapıştır olarak kullanılır. **Aşağıdaki "ZATEN VAR" listesini
atlamadan okumadan kod yazmaya başlama** — bu proje üzerinde birden fazla AI
çalıştı ve daha önce zaten var olan kodu "yeni icat" diye yeniden yazıp zaman
kaybettiren asistanlar oldu (örn. FSRS-5 motoru, cognitive tracker, swipe
review — hepsi zaten mevcuttu, biri bunları yeniden yazıp özgün buluş gibi
sundu).

## 📍 PROJE

| | |
|---|---|
| **GitHub** | https://github.com/Frkn2009/nura-app |
| **Son commit** | `7497f08` — logo yeniden tasarımı + ölü kod temizliği |
| **Test** | ✅ 35/35 geçiyor |
| **Analyze** | ✅ Temiz (0 uyarı) |
| **Windows test ortamı** | `C:\nura-app` + `PUB_CACHE=C:\pub-cache` (kullanıcı profil yolunda Türkçe karakter olduğu için `flutter test`/native-asset derleyicisi kırılıyor — ASCII yol şart) |

## ✅ ZATEN VAR — YENİDEN YAZMA

- **SRS motoru**: `lib/core/algorithm/fsrs5_engine.dart` (`NuraBrain`, FSRS-5 tam parametreli) + `lib/data/srs/srs_machine.dart` (FSRS-inspired). `SrsCard`'da `phrase` alanı YOK.
- **Bilişsel takip**: `lib/core/algorithm/cognitive_tracker.dart` (Reflex/Recall/Guess sınıflandırması, cevap süresine göre).
- **Kaydırmalı review**: `lib/ui/review/swipe_review_card.dart` (Tinder tarzı fiziksel swipe).
- **Alfabe sistemi**: `lib/features/alphabet/alphabet_engine.dart` — 30 dilin **tamamı** haritalı. ar/he/ru/uk/fa/el/hi/th/ja/ko tam veya kapsamlı; zh Pinyin olarak (Çince'nin alfabesi yok); vi tam; id/sw bilinçli olarak jenerik Latin (gerçekten aksansız). **pl/cs/ro/hu/sv/da/no/fi hâlâ jenerik Latin'e düşüyor — bu bilinen tek kalan alfabe eksiği.**
- **Canlı AI konuşma partneri (Plus)**: `supabase/functions/chat/index.ts` (Claude API proxy) + `lib/features/ai/screen/live_chat_screen.dart`. Çalışması için Supabase'e `ANTHROPIC_API_KEY` secret'ı girilmeli ve fonksiyon deploy edilmeli — kod hazır, deploy kullanıcının elinde.
- **Günlük çark**: `lib/features/games/daily_wheel_screen.dart` — artık gerçekten `SessionController.awardXp` çağırıyor, günde bir kez (SharedPreferences `wheel_day`).
- **Klan sistemi**: `lib/features/clan/` — üyelik, davet kodu, **haftalık otomatik sıfırlanan** XP yarışması (`clan_xp` tablosu, `get_my_clan()` RPC, her Pazartesi resetleniyor — bu zaten backend'de vardı, sadece arayüzde "yarışma" diye belirtilmiyordu). Klan sohbeti yeni: `supabase/clan_chat.sql` (kullanıcı tarafından manuel apply edilmeli) + `lib/features/clan/clan_chat_screen.dart`.
- **Oyunlar CEFR-farkında**: `lib/data/content/catalog.dart`'taki `allPhrases(lang, {maxLevel})` artık kullanıcının seviyesini aşan kelimeleri filtreliyor.
- **Maskot**: adı **Nura** (eskiden "Luma" idi, tamamı değiştirildi) — `lib/ui/mascot.dart`.
- **Marka işareti**: `lib/ui/brand.dart` → `NuraMark` — N harfinin köşegeni ses dalgasına dönüştürüldü. `lib/ui/nura_logo.dart` SİLİNDİ (kullanılmayan duplicate'ti).
- **Tipografi**: başlıklarda Sora, gövdede Manrope — `assets/fonts/Sora.ttf` + `Manrope.ttf` (yerel paketli, **google_fonts paketi KULLANMA** — çalışma zamanında internetten font indirir, hem offline-first mimariyi bozar hem teste zarar verir, bunu bir kez yaşadık).
- **Temalar**: Sistem/Açık/Koyu/**Bal (amber)** — `lib/core/theme/amber_theme.dart`, `AppThemePreference.amber`.
- **TTS**: `lib/data/speech/speech_controller.dart` — kaliteli/neural ses bulununca üstüne yapay pitch bindirmiyor (eskiden hep 1.12 pitch zorluyordu, bu neural sesleri robotikleştiriyordu).

## 🔶 GERÇEKTEN AÇIK OLAN İŞLER

| # | İş | Not |
|---|---|---|
| 1 | pl/cs/ro/hu/sv/da/no/fi alfabeleri | Jenerik Latin'e düşüyor, kendi aksan harfleri + örnek kelimeleri yok |
| 2 | Video mikro-dersler | Gerçek anadil konuşan kaydı gerektirir — bir AI bunu üretemez, içerik prodüksiyonu lazım |
| 3 | Uygulama içi kitaplık (e-kitap okuyucu) | Henüz başlanmadı |
| 4 | İnteraktif tanıtım turu | Gerçek ekranlar üzerinde coach-mark, henüz yok |
| 5 | Akıllı Plus zamanlaması | `AdGateScreen` var ama tetikleme anı/tonu iyileştirilmedi |
| 6 | RevenueCat / AdMob gerçek anahtarlar | Hesap açılınca |
| 7 | Keystore + release build | Mağazaya çıkış öncesi |
| 8 | Supabase deploy adımları | `supabase/functions/chat` deploy edilmedi, `ANTHROPIC_API_KEY` secret girilmedi, `supabase/clan_chat.sql` apply edilmedi — hepsi kullanıcının Supabase CLI ile yapması gereken adımlar |

## ⚠️ TEKRAR YAŞANMASIN

- `google_fonts` paketini EKLEME — yerel font kullan (yukarıya bak).
- Kullanıcı klasör yolu `C:\Users\M Y DERİ\...` — Türkçe "İ" karakteri `flutter analyze`'in LSP sunucusunu ve `flutter test`'in native-asset derleyicisini çökertiyor. `dart analyze` (LSP değil) çalışır; test için `C:\nura-app` + `PUB_CACHE=C:\pub-cache` kullan.
- `dart format` tüm ağacı çalıştırınca binlerce satırlık alakasız diff üretiyor (repo daha önce tutarlı formatlanmamış) — sadece dokunduğun dosyalara `dart format <dosya>` uygula, `dart format .` deme.
- Commit/push öncesi mutlaka `git fetch && git log --oneline HEAD..origin/main` ile uzağın ilerlemediğini doğrula — bu proje üzerinde paralel çalışan başka AI/oturumlar olabiliyor.

## 💡 YENİ SOHBETTE DEVAM

```
nura-app projesine devam et.
GitHub: https://github.com/Frkn2009/nura-app (main, son commit 7497f08)
docs/DEVAM_SAYFASI.md dosyasını BAŞTAN SONA oku — "ZATEN VAR" listesindeki
hiçbir şeyi yeniden yazma, "GERÇEKTEN AÇIK OLAN İŞLER" listesinden devam et.
35/35 test geçiyor, dart analyze temiz.
Windows'ta test için: C:\nura-app + PUB_CACHE=C:\pub-cache kullan (asıl repo
yolundaki Türkçe karakter native-asset derleyicisini kırıyor).
Her commit öncesi git fetch ile uzağın ilerlemediğini kontrol et.
```

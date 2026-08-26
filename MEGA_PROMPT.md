# 🚨 VOXELO MEGA PROMPT — KOPYALA YAPIŞTIR, KOD YAZ

> Bu prompt'u Claude, ChatGPT, Cursor veya herhangi bir AI'a yapıştır.
> Soru sormasın, direkt kod yazsın. Her dosya kopyala-yapıştır hazır olsun.

---

## SEN KİMSİN

Sen VOXELO dil öğrenme uygulamasının baş geliştiricisisin. Flutter + Dart + Riverpod + Supabase projesi.
GitHub: https://github.com/Frkn2009/voxelo-app
35/35 test geçiyor. 64 Dart dosya. 242 sahne. 30 dil.

## MEVCUT SORUNLAR (KRİTİK — HEPSİNİ DÜZELT)

1. **Arayüz çöp** — beyaz üzerine beyaz yazı, hiçbir şey okunmuyor, soluk, cansız
2. **Logo yok** — uygulamada marka hissi sıfır
3. **Oturum açma yok** — herkes girip kullanıyor, auth gate lazım
4. **Maskot/AI karakter yok** — robot gibi soğuk, samimi öğretmen lazım
5. **Oyunlar sıkıcı** — çark, hazine, kombo yok
6. **Alfabe öğretilmiyor** — sıfırdan başlayan harf bile bilmiyor
7. **Ses robot gibi** — samimi kadın öğretmen sesi lazım
8. **Kitap/hikaye yok** — seslendirme yok
9. **Her dilde aynı içerik** — kültürel fark yok

## YAPILACAK HER ŞEY (SIRALI, KOD OLARAK VER)

### DOSYA 1: `lib/core/theme/tokens.dart` — YENİ TEMA
Mevcut beyaz/soluk temayı SİL. Duolingo + Drops tarzı canlı tema yaz.
- Arka plan: açık gri `#F7F7F7` (kör eden beyaz değil)
- Primary: `#58CC02` (yeşil — başarı, devam)
- Accent: `#1CB0F6` (mavi — bilgi, AI)
- Danger: `#FF4B4B` (kırmızı — hata, kalp)
- Gold: `#FFC800` (altın — ödül, streak, çark)
- Koyu metin: `#3C3C3C` (siyah değil, yumuşak koyu)
- Font: Nunito (yuvarlak, samimi, oyun fontu) — `google_fonts: ^6.2.1` pubspec'e ekle
- Kartlar: gölgeli, 20px radius, beyaz
- Butonlar: büyük, yuvarlak, gölgeli, canlı renk

### DOSYA 2: `lib/features/auth/presentation/auth_gate.dart` — MİSAFİR + AUTH
- Uygulama açılınca 2 dakika misafir kullanım
- 2 dakika sonra ZORUNLU oturum açma ekranı
- Son 1 dakikada üstte sarı uyarı çubuğu: "Süreniz bitiyor, kayıt olun!"
- Oturum açmadan bir daha giremez (SharedPreferences ile cihaz kilidi)
- Supabase e-posta + şifre auth

### DOSYA 3: `lib/features/alphabet/alphabet_engine.dart` — ALFABE MOTORU
30 dil için alfabe sistemi. Her dil için:
- Harf listesi (char, isim, ses, Türkçe/İngilizce açıklama, örnek kelime)
- Yazım yönü (LTR/RTL)
- Harf seslendirmesi (TTS ile)
- Harf birleştirme (A+R+A = ARA)

Öncelikli alfabe verileri şu diller için HAZIR olsun:
- Arapça (28 harf + hareke)
- Rusça (33 harf Kiril)
- Japonca (Hiragana 46 harf)
- Korece (Hangul 40 harf)
- Yunanca (24 harf)
- İbranice (22 harf)
- Hintçe (Devanagari 46 harf)
- Tayca (44 sessiz + 15 sesli)

Latin alfabesi dilleri için de harf-ses farkı tablosu:
- İngilizce A = "ey", Türkçe A = "a"
- İspanyolca ñ, Almanca ü/ö/ß, Fransızca ç/é/è

### DOSYA 4: `lib/features/alphabet/alphabet_screen.dart` — ALFABE EKRANI
- Yukarıdan aşağı harf listesi
- Her harfe tıklayınca ses çalar (kadın ses)
- Harfin büyük/küçük hali
- Örnek kelime + telaffuz
- "Bu harfi öğrendim" butonu → XP kazanır
- İlerleme çubuğu (kaç harf öğrenildi)
- Maskot köşede teşvik eder

### DOSYA 5: `lib/features/alphabet/letter_practice_screen.dart` — HARF BİRLEŞTİRME
- Öğrenilen harflerle kelime oluşturma
- Harf harf seslendirme → sonra kelime
- Sürükle bırak ile harf sıralama oyunu
- Doğru cevap = konfeti + XP

### DOSYA 6: `lib/ui/mascot/voxelo_companion.dart` — MASKOT KARAKTERİ
- İsim: "Voxelo" (kadın karakter)
- Her ekranda konuşma balonu ile görünür
- Durumlar: mutlu, kutlama, düşünen, teşvik, uyuyan
- Mesajlar kural tabanlı (AI gerektirmez):
  - "Harika gidiyorsun! 🌟"
  - "Bu harfi biraz daha pratik edelim."
  - "Bugün 5 kelime kazandın!"
  - "Çarkı çevirmeyi unutma!"
  - "Seri 3 gün! Devam et!"
- Animasyonlu (zıplama, sallanma)

### DOSYA 7: `lib/features/games/daily_wheel_screen.dart` — GÜNLÜK ÇARK
- Her gün 1 kez döndürme hakkı
- Segmentler: +50 XP, +1 Can, 2x XP, Plus Dene, +10 Elmas, Gizli Kelime
- Döndürme animasyonu (4 saniye, 5 tur)
- Kazanılan ödül popup ile gösterilir
- Plus kullanıcılar 2 kez çevirir
- Video reklam izleyerek ekstra çevirme hakkı

### DOSYA 8: `lib/features/games/treasure_chest.dart` — HAZİNE KASASI
- Review yaptıkça anahtar kazan (her 5 doğru = 1 anahtar)
- 3 anahtar = kasa aç
- Kasadan: XP, elmas, can, Plus deneme, özel kelime paketi
- Açma animasyonu (parıldama + patlama)

### DOSYA 9: `lib/features/games/combo_system.dart` — KOMBO SİSTEMİ
- Yanlışsız ardışık cevaplar = kombo
- 5 doğru = x2 XP
- 10 doğru = ATEŞ modu (ekran yanıyor efekti)
- 15 doğru = SÜPER KOMBO (3x XP)
- Kombo kırılınca ses + animasyon

### DOSYA 10: `lib/features/stories/story_reader_screen.dart` — HİKAYE / KİTAP
- Seviyeye göre mini hikayeler (20-50 kelime)
- Kelime kelime seslendirme (kadın ses, yavaş)
- Bilmediğin kelimeye dokun = çeviri popup
- Her hikayenin sonunda 3 soru
- İlerleme: "5 hikaye okudum" rozeti

### DOSYA 11: `lib/features/learn/learning_path_screen.dart` — ÖĞRENME YOLU
Kullanıcının gördüğü ana ekran. Duolingo tarzı yukarıdan aşağı yol haritası:
```
🔵 Alfabe (Seviye 0) — ✅ tamamlandı
🔵 İlk Harfler (Seviye 0.5) — ⏳ devam ediyor  
🔒 İlk Kelimeler (Seviye 1) — kilitli
🔒 Kısa Cümleler (Seviye 2) — kilitli
🔒 Sahneler (Seviye 3) — kilitli
🔒 Hikayeler (Seviye 4) — kilitli
```
- Her seviye tamamlanmadan sonraki açılmaz
- Tamamlanan seviye yeşil, devam eden mavi, kilitli gri
- Maskot yol boyunca yürür

### DOSYA 12: Güncellenmiş `lib/features/home/home_screen.dart` — YENİ ANA SAYFA
- Üstte VOXELO logosu + maskot
- "Günaydın Furkan! 🌟" (saate göre)
- Günlük çark kartı
- Öğrenme yolu ilerleme kartı
- Streak ateş animasyonu
- Günlük hedef ilerleme çubuğu
- Leaderboard sıralama kartı
- Maskot konuşma balonu (günlük mesaj)

### DOSYA 13: `lib/features/onboarding/new_onboarding.dart` — YENİ BAŞLANGIÇ
Eski onboarding SİLİNSİN. Yeni akış:
1. Maskot karşılar: "Merhaba, ben Voxelo! 👋"
2. "Hangi dili sıfırdan öğrenmek istiyorsun?" → dil seçimi
3. "Daha önce bu dili öğrendin mi?" → seviye (sıfır/biraz/orta)
4. "Senin için yol haritası hazırladım!"
5. İlk harf gösterilir → seslendirilir → "Harika!" → +5 XP
6. Günlük çark → ilk ödül
7. "Kayıt ol, ilerlemeniz kaybolmasın" → auth

## KURALLAR (İHLAL EDİLEMEZ)

1. State: Riverpod. setState sadece StatefulWidget içinde.
2. Ses: TTS kadın ses, pitch 1.2, rate 0.35 (yavaş, samimi)
3. Font: Nunito (google_fonts paketi)
4. Renk: Hardcode yasak, sadece token sınıfı
5. Telif: Tüm tasarımlar özgün
6. i18n: Hardcode string yasak
7. Alfabe: Latin olmayan dillerde alfabe öğretilmeden kelime gösterilmez
8. Çark: Günde 1 kez, Plus 2 kez, reklam izleyerek +1
9. Maskot: Her ekranda görünsün, teşvik etsin
10. Auth: 2 dakika misafir, sonra zorunlu kayıt

## ÇIKTI FORMATI

Her dosyayı şu formatta ver:
```
📁 Dosya: lib/features/xxx/xxx.dart
```
```dart
// Tam kod burada
```

Soru sorma. Direkt 13 dosyanın kodunu yaz. Kopyala yapıştır hazır olsun.

## SONRA NE OLACAK

Bu 13 dosya yazıldıktan sonra:
1. `flutter analyze` → 0 hata
2. `flutter test` → hepsi geçsin
3. `flutter build apk --debug` → APK çıksın
4. Telefondan test
5. Mağazaya yükleme

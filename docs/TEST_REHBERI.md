# NURA — AI ile Test Ettirme Rehberi

## Yöntem 1: Bu Sohbette Test (Arena.ai)

Bana şunu yaz:
```
nura-app klasörünü aç, lib/ altındaki tüm Dart dosyalarını analiz et.
Derleme hatası, eksik import, tip uyumsuzluğu var mı kontrol et.
```

Ben tüm dosyaları okuyup hataları bulur, düzeltir, push ederim.

---

## Yöntem 2: Flutter Analyze (Bilgisayarında)

CMD aç:
```cmd
cd %USERPROFILE%\Desktop\nura-app
flutter analyze
```

Hata çıkarsa mesajı buraya yapıştır, çözerim.

---

## Yöntem 3: Emülatörde Görsel Test

```cmd
flutter run -d chrome
```
veya
```cmd
flutter run
```
(Android telefon bağlıyken)

Açılan uygulamada şu akışı test et:
1. ✅ Onboarding — dil seç, seviye seç
2. ✅ Ana sayfa — günün senaryosu görünüyor mu?
3. ✅ Konuşmaya başla — mikrofon çalışıyor mu?
4. ✅ Klipler — kaydırılıyor mu?
5. ✅ Çeviri — "merhaba" yaz, çeviri geliyor mu?
6. ✅ Profil — dil değiştirebiliyor musun?
7. ✅ Ses kadın mı?

---

## Yöntem 4: ChatGPT / Claude'a Kod Analizi

Herhangi bir AI sohbetine şunu yapıştır:

```
Bu Flutter projesinin ana dosyalarını kontrol et.
GitHub: https://github.com/Frkn2009/nura-app

Şunları analiz et:
1. Derleme hatası var mı?
2. Null safety sorunları var mı?
3. UX/UI iyileştirme önerileri
4. Performans sorunları
5. Mağazaya yüklenmeden önce düzeltilmesi gerekenler
```

---

## Yöntem 5: APK Oluştur + Telefona Yükle

```cmd
flutter build apk --debug
```

APK dosyası: `build\app\outputs\flutter-apk\app-debug.apk`

Bu APK'yı:
- Telefona USB ile aktar → dosya yöneticisinden kur
- Ya da WhatsApp/Telegram ile kendine gönder → aç → kur

---

## Yöntem 6: GitHub Actions (Otomatik Test)

`.github/workflows/test.yml` dosyası oluşturulursa her push'ta otomatik test çalışır.
Bunu istersen bana söyle, ayarlarım.

# VOXELO — Windows'ta Flutter Kurulum Rehberi

> Toplam süre: ~30-45 dakika (internet hızına göre)
> Adımları sırayla yap, birini atlama.

---

## ADIM 1: Flutter SDK İndir (5 dk)

1. Tarayıcıda aç: **https://docs.flutter.dev/get-started/install/windows/mobile**
2. **"Download Flutter SDK"** butonuna tıkla
3. ZIP dosyası inecek (~1 GB)
4. ZIP'i **`C:\flutter`** klasörüne çıkar
   - Sonuç: `C:\flutter\bin\flutter.exe` olmalı

---

## ADIM 2: PATH'e Ekle (2 dk)

1. Windows arama → **"ortam değişkenleri"** yaz → "Sistem ortam değişkenlerini düzenle" tıkla
2. **"Ortam Değişkenleri"** butonuna bas
3. **"Path"** satırını seç → **"Düzenle"**
4. **"Yeni"** tıkla → şunu yapıştır:
   ```
   C:\flutter\bin
   ```
5. Tamam → Tamam → Tamam
6. **CMD'yi kapat, yeniden aç**

---

## ADIM 3: Android Studio İndir (10 dk)

1. Aç: **https://developer.android.com/studio**
2. İndir ve kur (Next Next Next)
3. Açıldığında **"More Actions"** → **"SDK Manager"**
4. **"SDK Tools"** sekmesi → şunları işaretle:
   - ✅ Android SDK Command-line Tools
   - ✅ Android SDK Build-Tools
   - ✅ Android SDK Platform-Tools
5. **"Apply"** → indir

---

## ADIM 4: Flutter Doctor (2 dk)

CMD aç (Windows+R → cmd → Enter):

```cmd
flutter doctor
```

Çıktıda şunları görmen lazım:
```
[✓] Flutter
[✓] Android toolchain
[✓] Android Studio
```

Eğer lisans hatası verirse:
```cmd
flutter doctor --android-licenses
```
Her soruya **y** bas.

---

## ADIM 5: Git Kur (varsa atla) (2 dk)

```cmd
git --version
```

Eğer hata verirse:
1. Aç: **https://git-scm.com/download/win**
2. İndir, kur (Next Next Next)

---

## ADIM 6: Projeyi İndir (2 dk)

CMD'de:
```cmd
cd %USERPROFILE%\Desktop
git clone https://github.com/Frkn2009/voxelo-app.git
cd voxelo-app
```

---

## ADIM 7: Bağımlılıkları İndir (2 dk)

```cmd
flutter pub get
```

---

## ADIM 8: Kontrol Et (1 dk)

```cmd
flutter analyze
```

Hata yoksa yeşil çıkacak. Uyarı olabilir, sorun değil.

---

## ADIM 9: Çalıştır (5 dk)

### Seçenek A: Android Emülatör
1. Android Studio aç
2. **"More Actions"** → **"Virtual Device Manager"**
3. **"Create Device"** → Pixel 7 seç → Next
4. API 34 indir → Next → Finish
5. ▶️ Play butonuyla emülatörü başlat
6. CMD'ye dön:
```cmd
flutter run
```

### Seçenek B: Gerçek Android Telefon
1. Telefonda: **Ayarlar → Telefon Hakkında → Derleme Numarası'na 7 kez bas** (geliştirici modu açılır)
2. **Ayarlar → Geliştirici Seçenekleri → USB Hata Ayıklama → AÇ**
3. Telefonu USB ile bilgisayara bağla
4. Telefonda "USB Hata Ayıklamaya izin ver" → **İzin ver**
5. CMD:
```cmd
flutter devices
```
Telefonun görünmeli. Sonra:
```cmd
flutter run
```

### Seçenek C: Chrome (Web)
```cmd
flutter run -d chrome
```
(Mikrofon izni gerekir, bazı özellikler kısıtlı)

---

## ADIM 10: APK Oluştur (Mağazaya Yüklemek İçin)

### Test APK:
```cmd
flutter build apk --release
```
APK burada çıkar: `build\app\outputs\flutter-apk\app-release.apk`

### Play Store (AAB):
```cmd
flutter build appbundle --release
```
AAB burada: `build\app\outputs\bundle\release\app-release.aab`

---

## ⚠️ SIKÇA KARŞILAŞILAN SORUNLAR

### "cmdline-tools component is missing"
```cmd
flutter doctor --android-licenses
```
Hâlâ hata → Android Studio → SDK Manager → SDK Tools → "Android SDK Command-line Tools" işaretle → Apply

### "No connected devices"
```cmd
flutter devices
```
Boşsa: emülatör başlat veya telefonu USB bağla.

### "Gradle build failed"
```cmd
cd android
gradlew clean
cd ..
flutter pub get
flutter run
```

### "JAVA_HOME is not set"
Android Studio ile gelen JDK'yı kullan:
```cmd
set JAVA_HOME=C:\Program Files\Android\Android Studio\jbr
```
Kalıcı yapmak için Ortam Değişkenlerine ekle.

---

## 📱 iOS İÇİN (Mac lazım)

iOS build yapmak için Mac bilgisayar + Xcode gerekir.
Windows'ta iOS uygulaması derlenemez.
Alternatif: **Codemagic** veya **GitHub Actions** ile bulut build.

---

## ✅ ÖZET KOMUTLAR

```cmd
:: 1. Projeyi indir
git clone https://github.com/Frkn2009/voxelo-app.git
cd voxelo-app

:: 2. Bağımlılıklar
flutter pub get

:: 3. Kontrol
flutter analyze

:: 4. Çalıştır
flutter run

:: 5. APK oluştur
flutter build apk --release
```

Hepsi bu kadar! Sorun olursa hata mesajını buraya yapıştır, çözerim.

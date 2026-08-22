# NURA Store Release Checklist

## Zorunlu (yayın öncesi)

- [ ] İmza keystore üretildi (`keytool -genkey -v -keystore release.jks -keyalg RSA -keysize 2048 -validity 10000`)
- [ ] Keystore yedeği güvenli ortamda (şifreler asla repoya girmez)
- [ ] `flutter build appbundle --release` başarılı
- [ ] `flutter build apk --release --no-tree-shake-icons` başarılı
- [ ] App icon 1024×1024 (store: `store/icon.png`)
- [ ] Adaptive icon (Android 8+)
- [ ] Splash ekranı (`flutter_native_splash.yaml` ayarlı)
- [ ] 6 store screenshot (store klasöründe mevcut; ekranlar güncel tema ile yeniden üretilmeli)
- [ ] Short description
- [ ] Long description
- [ ] Privacy policy URL (`site/privacy.html` yayında)
- [ ] Terms URL
- [ ] Support e-posta
- [ ] Data Safety formu (Play Console)
- [ ] İçerik derecelendirmesi (IARC)
- [ ] AdMob üretim App ID + ad unit ID'leri (test ID'leriyle yayınlanmaz — README'deki kurulum)

## ASO

**Kısa açıklama:**
"Smart language learning with spaced repetition."

**Uzun açıklama özeti:**
- Unutma eğrisine göre tekrar (FSRS-esinli SRS)
- Günlük hedef ve seri (streak)
- 30 dil
- Kişisel ilerleme ve başarımlar
- Çevrimdışı çalışma (müfredat + sözlük)

**Store görselleri:**
1. Onboarding
2. Home dashboard
3. Speak (konuşma pratiği)
4. Review kartı
5. Progress / başarımlar
6. NURA Plus

## İlk yayın sırası

1. Keystore üret + yedekle
2. Mağaza listeleme metinlerini gir
3. AAB yükle (Play Console → Internal testing)
4. Test cihazlarında smoke test
5. Production track'e al

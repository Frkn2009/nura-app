# NURA Store Release Checklist

## Zorunlu
- [ ] İmza keystore üretildi
- [ ] keystore yedeği güvenli ortamda
- [ ] flutter build appbundle --release başarılı
- [ ] flutter build apk --release başarılı
- [ ] App icon 1024x1024
- [ ] Adaptive icon
- [ ] Splash ekranı
- [ ] 6 store screenshot
- [ ] Short description
- [ ] Long description
- [ ] Privacy policy URL
- [ ] Terms URL
- [ ] Support e-posta
- [ ] Data Safety formu
- [ ] İçerik derecelendirmesi

## v1.4 Billing hazırlığı
- [ ] RevenueCat public keyi `NuraPaywallEngine.publicApiKey` yerine ortam değişkeniyle enjekte edildi
- [ ] `billingServiceProvider` production'da `RevenueCatBillingService` ile override edildi
- [ ] Play Console ürünleri: `nura_plus_monthly`, `nura_plus_yearly`, `nura_plus_family`
- [ ] RevenueCat entitlement: `plus` (offerings: default)
- [ ] Tester hesabıyla satın alma + iade + restore akışı doğrulandı

## ASO Kısa Açıklama
"Smart language learning with spaced repetition."

## Uzun Açıklama Özeti
- Unutma eğrisine göre tekrar (FSRS-5 inspired)
- Günlük hedef ve streak
- 30 dil
- Kişisel ilerleme
- Çevrimdışı çalışma

## Store Görselleri
1. Onboarding
2. Home dashboard
3. Review card (swipe akışı)
4. Progress
5. Achievements
6. NURA Plus

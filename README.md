# NURA

Konuşarak öğren. **30 dil.**

EN · ES · DE · FR · NL · AR · PT · IT · RU · ZH · JA · KO · TR · PL · SV · DA · NO · FI · EL · CS · RO · HU · HI · TH · VI · ID · UK · HE · FA · SW

## Özellikler

- 🎤 Sesli tanıma ile gerçek konuşma pratiği
- 🔁 Aralıklı tekrar (SRS) ile kalıcı öğrenme
- 📖 30 dil için yazım-okunuş rehberi
- ☁️ Supabase ile bulut senkron
- 🇪🇸 İspanya: NIE, empadronamiento, kira sözleşmesi
- 🆓 Ücretsiz: günde 1 dakika. Plus: sınırsız, reklamsız.

## Ürün kilitleri

- Ücretsiz konuşma: **günde 60 saniye** (cihazda, maliyet ≈ $0)
- Süre bitince: reklam izle **+60 sn** (günde en fazla 3) veya Plus
- Çeviri uydurmaz: müfredat + seyahat sözlüğü
- Ritüel: **Duy → Gölgele → Konuş → Düzelt**
- Tekrar: SRS kartlar (yine / iyi / kolay)

## Çalıştır

```bash
flutter pub get
flutter run
```

## İçerik

- **302 sahne** (30 dilde A1 + bağlantılı A2/B1 görevleri, İspanyolca bonus paketleri)
- **996 kalıp cümle**
- **30 dil rehberi** (telaffuz kuralları + tuzaklar)
- **30 dilli arayüz**
- **5 mağaza ekran görüntüsü + feature graphic**

## GitHub

https://github.com/Frkn2009/nura-app


## Plus bulut çevirisi

Plus serbest metin çevirisi bir Supabase Edge Function üzerinden sunulur; sağlayıcı anahtarı uygulamaya gömülmez. Kurulum:

1. `supabase_setup.sql` dosyasını Supabase SQL Editor'da çalıştır.
2. Google Cloud Translation API anahtarını sunucu secret'ı olarak ekle.
3. Edge Function'ı deploy et:

```bash
supabase link --project-ref qkhmtmwfwyscvtveiwui
supabase secrets set GOOGLE_TRANSLATE_API_KEY=YOUR_SERVER_SIDE_KEY
supabase functions deploy translate
```

Plus yetkisi, istemcinin değiştirebildiği profil verisinden değil, yalnızca ödeme webhook'unun service role ile yazdığı `subscriptions` tablosundan doğrulanır.

## AdMob üretim kurulumu

Depoda Google'ın güvenli **test** App ID ve ad unit ID'leri bulunur; geliştirme sırasında gerçek reklama tıklama riski yoktur. Mağaza sürümünden önce:

1. Android `AndroidManifest.xml` ve iOS `Info.plist` içindeki test App ID'lerini AdMob App ID'leriyle değiştir.
2. Üretim ad unit ID'lerini build sırasında ver:

```bash
flutter build appbundle \
  --dart-define=NURA_ADMOB_REWARDED_ANDROID=ca-app-pub-XXX/REWARDED \
  --dart-define=NURA_ADMOB_INTERSTITIAL_ANDROID=ca-app-pub-XXX/INTERSTITIAL

flutter build ipa \
  --dart-define=NURA_ADMOB_REWARDED_IOS=ca-app-pub-XXX/REWARDED \
  --dart-define=NURA_ADMOB_INTERSTITIAL_IOS=ca-app-pub-XXX/INTERSTITIAL
```

Gelir ve eCPM, AdMob panelindeki doğrulanmış gösterimlerden hesaplanır. Free kullanıcıda 3–5 dakikalık sıklık sınırı ve günlük toplam 5 video sınırı vardır; Plus kullanıcıya reklam çağrısı yapılmaz.

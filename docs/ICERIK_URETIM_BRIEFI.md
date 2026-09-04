# VOXELITH — İçerik Üretim Briefi (Eylül 2026)

Bu doküman hem Claude Code alt-ajanlarının hem de dışarıdan çalıştırılacak başka bir
yapay zekanın aynı şemaya, aynı ton kurallarına ve aynı seviye/konu haritasına göre
içerik üretmesi için tek referans kaynaktır. Kaynak: `docs/RAKIP_ANALIZ_VE_PLAN.md`
denetiminde tespit edilen boşluk — Voxelith'in içeriği bir dil müfredatı değil,
dil başına 5-8 sahne × 3 cümlelik bir gezi frazbuku seviyesindeydi.

## 1. Ne üretiyoruz

Her "ünite" kod tabanındaki `Scenario` nesnesine karşılık gelir
(`lib/data/models/models.dart`). Alanlar:

```dart
Scenario(
  id: '<lang>_<topic_slug>',           // örn: 'es_family'
  lang: LearnLang.<lang>,
  cefr: Cefr.a1,                       // a1 | a2 | b1 | b2
  minutes: 7,                          // gerçekçi tahmini süre
  titles: {UiLang.tr: '...', UiLang.en: '...'},
  clipLine: '<hedef dilde en akılda kalan cümle>',
  grammarNote: GrammarNote(
    rule: {
      UiLang.tr: 'Tek, somut bir kural — soyut dilbilim terimi yok.',
      UiLang.en: 'Same rule in plain English.',
    },
    goodExample: '<hedef dilde doğru örnek>',
    badExample: '<hedef dilde yaygın hata>',
  ),
  phrases: [
    Phrase(
      id: '<lang>_<topic_slug>_0',
      target: '<hedef dilde cümle>',
      gloss: {UiLang.tr: '<Türkçe çeviri>', UiLang.en: '<English translation>'},
      ipa: '<opsiyonel IPA>',
      hint: '<opsiyonel — nerede/ne zaman kullanılır>',
    ),
    // ... toplam 6-8 Phrase
  ],
  turns: [
    SpeakTurn(prompt: '<durum/soru>', expected: '<beklenen cümle>', scaffold: null),
    // phrases sayısı kadar SpeakTurn, art arda konuşma akışı oluşturacak şekilde
  ],
)
```

**Kritik kural:** `grammarNote` her ünitede zorunlu ve TEK bir somut kural
öğretmeli — "bu dilde şart kipi karmaşıktır" gibi genel laf değil, "olumsuz emirde
fiilin önüne X gelir" gibi tek, uygulanabilir bir kural + 1 doğru + 1 yanlış örnek.

## 2. Seviye ve konu haritası (40 ünite hedefi, dil başına)

Mevcut 5-8 sahne bu 40 ünitenin A1 kısmının içine gömülü sayılır, silinmez —
üstüne inşa edilir. Yeni üretilecek ünite başlıkları:

**A1 — 12 ünite (hayatta kalma dili).** Mevcut olanlar: kafe, otel, yön sorma.
Eksik 9: Tanışma, Alışveriş, Sayılar & saat, Aile, Hava durumu, Ulaşım,
Acil durum, Günlük rutin, Basit geçmiş zaman ile bir olay anlatma.

**A2 — 10 ünite (bağlantılı konuşma).** İş görüşmesi, Randevu alma, Şikayet
etme, Tarif anlatma, Geçmişi anlatma, Plan yapma, Doktor, Ev/kira,
Telefonda konuşma, Fikir belirtme.

**B1 — 10 ünite (fikir ve görüş).** Tartışma/münazara, Haber yorumlama, İş
mülakatı, Kültürel farklar, Seyahat planlama, Sağlık/wellness, Teknoloji,
Çevre, Finans, Eğitim.

**B2 — 8 ünite (şu an hiç yok).** Deyimler, Resmi yazışma, Sunum yapma,
Müzakere, Soyut tartışma, Mizah/ironi, Akademik dil, Meslek jargonu.

**Üretim dalgası 1 (şimdi):** sadece A1'in eksik 9 ünitesi, tüm 30 dilde.
A2/B1/B2 dalga 2-3'te aynı şablonla üretilecek — dalga 1'i küçük ve
denetlenebilir tutmak için şimdi sadece A1.

## 3. Ton ve dil kuralları

- Cümleler gerçek konuşma dilinde olmalı — ders kitabı yapaylığından kaçının
  ("Ben bir öğrenciyim" değil, doğal bir bağlamda kullanılacak cümle).
- A1 = kısa, yüksek frekanslı kelimeler. B1/B2'ye çıktıkça cümle uzunluğu ve
  soyutluk artar ama her zaman gerçekten söylenebilir kalır.
- Her `gloss` en az `tr` ve `en` içermeli (I18n fallback zinciri buna dayanıyor).
- `target` alanı gerçek hedef dilde olmalı, İngilizce'den harfi harfine çeviri
  değil — o dilin doğal söyleyişi.
- Kültürel özgüllük iyi — İspanyolca'daki "NIE/kira" sahneleri gibi, o dile özgü
  gerçek yaşam durumları tercih edilir, jenerik değil.
- **Yasak:** var olan A1 cümlelerini yeniden karıştırıp "yeni ünite" diye
  sunmak (bkz. `IntermediateCatalog.build()` — düzeltilmesi gereken tam olarak
  bu desendi). Her ünite gerçekten yeni kelime + yeni kalıp içermeli.

## 4. Kalite bariyeri — düşük kaynaklı diller

Model, İngilizce/İspanyolca/Fransızca gibi yüksek kaynaklı dillerde çok daha
güvenilir. Swahili, Tay, Vietnamca, İbranice, Farsça, Fince gibi dillerde
üretilen içerik **anadil konuşuru tarafından gözden geçirilmeden yayına
alınmamalı** — bu diller için üretilen ünitelere kod içinde
`// TODO: native review` yorumu eklenmeli.

## 5. Teslim formatı

Bir agent/AI, kendisine atanan diller için tek bir yeni Dart dosyası üretir:
`lib/data/content/extra/catalog_extra_<batch_id>.dart`

```dart
import '../../models/models.dart';

final List<Scenario> catalogExtra<BatchId> = [
  // ... o dosyaya atanan tüm dillerin yeni Scenario'ları, karışık sırada olabilir
];
```

Var olan `lib/data/content/catalog.dart` dosyasına DOKUNULMAZ — entegrasyon
(import + `_all` listesine ekleme) merkezi olarak tek elden, tüm parçalar
teslim edildikten sonra yapılır. Bu, paralel üretimde dosya çakışmasını
tamamen ortadan kaldırır.

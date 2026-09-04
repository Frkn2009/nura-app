# VOXELITH — İçerik Üretim Briefi, Dalga 2 (A2 + B1) — başka bir AI'a verilecek tam metin

Bu dosyanın tamamı **tek bir blok halinde kopyalanıp başka bir yapay zekaya
(ChatGPT, Gemini, vb.) yapıştırılabilir** — o AI, Voxelith'in kod tabanını
görmeden, yalnızca bu metinden çalışarak doğru formatta içerik üretebilir.
Çıktı **JSON** — Dart değil, çünkü (1) her AI JSON üretmekte daha güvenilir,
(2) tırnak/apostrof kaçış hataları (dün Fransızca içerikte böyle bir hata
çıktı) JSON'da Dart'a göre çok daha az risk taşıyor, (3) JSON'u Dart'a
çevirmek mekanik bir iştir, ben (Claude) bunu sonradan hızlıca yaparım.

---

## PROMPT — aşağıdaki her şeyi olduğu gibi başka bir AI'a yapıştır

Sen bir dil öğrenme uygulaması (Voxelith) için içerik üreten bir asistansın.
Görevin: belirtilen diller için A2 ve B1 seviyesinde, her biri gerçek
konuşma pratiği içeren "ünite" (scenario) üretmek.

### Şema — her ünite tam olarak bu JSON şeklinde olmalı

```json
{
  "id": "<lang>_<topic_slug>",
  "lang": "<lang kodu, örn. 'es'>",
  "cefr": "a2 veya b1",
  "minutes": 7,
  "titleTr": "<Türkçe başlık>",
  "titleEn": "<İngilizce başlık>",
  "clipLine": "<hedef dilde en akılda kalan cümle>",
  "grammarNote": {
    "ruleTr": "<Tek, somut, uygulanabilir bir kural — soyut terim yok>",
    "ruleEn": "<aynı kural İngilizce>",
    "goodExample": "<hedef dilde doğru örnek>",
    "badExample": "<hedef dilde yaygın hata>"
  },
  "phrases": [
    {
      "id": "<lang>_<topic_slug>_0",
      "target": "<hedef dilde cümle>",
      "glossTr": "<Türkçe çeviri>",
      "glossEn": "<İngilizce çeviri>"
    }
  ],
  "turns": [
    { "prompt": "<durum/soru, İngilizce>", "expected": "<phrases içindeki bir target ile birebir aynı olmalı>" }
  ]
}
```

Kurallar:
- `phrases` ve `turns` sayısı birbirine eşit olmalı: **6 ile 8 arası**.
- Her `turns[i].expected`, `phrases` içindeki bir `target` ile **birebir aynı**
  string olmalı (küçük/büyük harf, noktalama dahil) — SpeakTurn akışı buna
  dayanıyor.
- `target` gerçek hedef dilde, doğal, konuşma diline uygun olmalı —
  İngilizce'den birebir çeviri DEĞİL. Ders kitabı yapaylığından kaçın
  ("Ben doktora gittim" gibi jenerik değil, gerçek bir durumda söylenecek
  cümle).
- `grammarNote` zorunlu, TEK somut bir kural öğretmeli ("olumsuz emirde X
  fiilin önüne gelir" gibi), asla "şart kipi karmaşıktır" gibi genel laf
  değil.
- Kültürel özgüllük iyi — o dile/kültüre özgü gerçek durumlar tercih edilir.
- Aynı üniteler arasında cümleleri yeniden karıştırma — her ünite gerçekten
  yeni kelime + yeni kalıp içermeli.
- Çıktının TAMAMI geçerli JSON olmalı — üstte/altta açıklama metni ekleme,
  sadece bir JSON array döndür: `[ {ünite1}, {ünite2}, ... ]`.

### Bu sefer üretilecek konular

**A2 — 10 ünite (bağlantılı konuşma):** İş görüşmesi, Randevu alma, Şikayet
etme, Tarif anlatma, Geçmişi anlatma, Plan yapma, Doktor, Ev/kira, Telefonda
konuşma, Fikir belirtme.

**B1 — 10 ünite (fikir ve görüş):** Tartışma/münazara, Haber yorumlama, İş
mülakatı, Kültürel farklar, Seyahat planlama, Sağlık/wellness, Teknoloji,
Çevre, Finans, Eğitim.

Topic slug'ları (id'lerde kullan): `job_interview`, `appointment`,
`complaint`, `recipe`, `past_life`, `planning`, `doctor`, `housing`, `phone_call`,
`opinion` (A2) — `debate`, `news`, `interview_advanced`, `culture`, `travel_plan`,
`wellness`, `technology`, `environment`, `finance`, `education` (B1).

### Düşük kaynaklı diller — zorunlu işaret

Eğer atanan dil şunlardan biriyse: **Svahili, Tay, Vietnamca, İbranice,
Farsça, Fince** — her `phrases[i]` nesnesine ekstra bir alan ekle:
`"needsNativeReview": true`. Bu diller anadil konuşuru tarafından kontrol
edilmeden yayına girmeyecek.

### Sana atanan diller: **[BURAYA HANGİ DİLLERİ VERECEKSEN YAZ, örn. "Almanca (de), Hollandaca (nl), İsveççe (sv)"]**

Yukarıdaki şemaya göre, belirtilen dillerin her biri için A2'nin 10
ünitesini VE B1'in 10 ünitesini üret (dil başına 20 ünite). Çıktı tek bir
JSON array olsun, tüm dillerin tüm üniteleri karışık sırada içinde.

---

## Diller nasıl bölünür (dünkü 9'lu batch deseniyle aynı)

Aynı anda birden fazla AI'a paralel verebilmen için diller şöyle
gruplanabilir (her grup ayrı bir AI sohbetine/aracına verilir):

| Grup | Diller |
|---|---|
| 1 | en, es, pt |
| 2 | de, nl, sv |
| 3 | fr, it, ro |
| 4 | pl, ru, uk |
| 5 | ja, ko, zh |
| 6 | ar, fa, he |
| 7 | cs, el, tr |
| 8 | hi, th, vi |
| 9 | da, fi, no |
| 10 | id, sw, hu |

Her grup ≈ 3 dil × 20 ünite = 60 ünite ≈ 360-480 cümle — bir AI oturumu için
makul bir büyüklük (dünkü Dart-format batch'lerle aynı ölçek).

## Bana geri getirdiğinde ne olacak

Her AI'dan aldığın JSON çıktısını bana yapıştır (veya bir `.json` dosyası
olarak ver) — ben onu doğrudan `lib/data/content/extra/catalog_extra_a2b1_<grup>.dart`
formatına çevirip `catalog.dart`'a bağlarım. JSON→Dart çevirisi mekanik bir
iş olduğu için bu adımda benim token'larımı yakmaz; asıl içerik üretimini
(dil bilgisi + kültürel doğallık gerektiren kısmı) dışarıdaki AI yapmış
oluyor.

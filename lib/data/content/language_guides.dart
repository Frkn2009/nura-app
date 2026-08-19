import '../models/models.dart';

class SoundRule {
  const SoundRule({
    required this.written,
    required this.heard,
    required this.example,
    required this.exampleSaid,
    required this.why,
  });

  final String written;
  final String heard;
  final String example;
  final String exampleSaid;
  final String why;
}

class LangTrap {
  const LangTrap(this.title, this.body);
  final String title;
  final String body;
}

class LanguageGuide {
  const LanguageGuide({
    required this.lang,
    required this.headline,
    required this.intro,
    required this.rules,
    required this.traps,
    required this.firstWeek,
  });

  final LearnLang lang;
  final String headline;
  final String intro;
  final List<SoundRule> rules;
  final List<LangTrap> traps;
  final String firstWeek;

  SoundRule? tipFor(String text) {
    final t = text.toLowerCase();
    for (final r in rules) {
      final parts = r.written.toLowerCase().split(RegExp(r'[/]|vs'));
      for (var part in parts) {
        part = part.replaceAll(RegExp('[^a-zäöüßĳoe]+'), '');
        if (part.length >= 2 && t.contains(part)) return r;
      }
    }
    return null;
  }

  static LanguageGuide of(LearnLang lang) => _all[lang]!;
}

final Map<LearnLang, LanguageGuide> _all = {
  LearnLang.nl: LanguageGuide(
    lang: LearnLang.nl,
    headline: 'Flemenkçe: yazıldığı gibi okunmaz',
    intro:
        'Hollandaca / Flamanca harf kombinasyonları tek ses üretir. Türkçe “okuduğun gibi söyle” burada işe yaramaz. En sık tuzak: oe.',
    rules: const [
      SoundRule(
        written: 'oe',
        heard: 'u  (Türkçe “buz”taki u)',
        example: 'boek, goed, hoe',
        exampleSaid: 'buk · hut (g yumuşak) · hu',
        why:
            'Ortaçağda uzun o idi; yazım dondu, ses u’ya kaydı. oe görünce asla “o-e” veya “ö” deme. Tek ses: u.',
      ),
      SoundRule(
        written: 'eu',
        heard: 'ö  (Türkçe “göl”)',
        example: 'leuk, kleur, deur',
        exampleSaid: 'lök · klör · dör',
        why: 'Fransızca eu gibi yuvarlak ön ünlü. oe ile karıştırma: oe=u, eu=ö.',
      ),
      SoundRule(
        written: 'ui',
        heard: 'öy  (Türkçede yok; “ö”den “y”ye kay)',
        example: 'huis, uit, fruit',
        exampleSaid: 'höys · öyt · fröyt',
        why: 'Tek harf değil, kayan iki ses. “uys” dersen Hollandalı anlamaz.',
      ),
      SoundRule(
        written: 'ij  /  ei',
        heard: 'ey  (Türkçe “seyir”)',
        example: 'wijn, trein, jij',
        exampleSaid: 'veyn · treyn · yey',
        why: 'İkisi aynı ses. ij eski bir uzun i’nin yazımı; bugün ei ile özdeş.',
      ),
      SoundRule(
        written: 'ou  /  au',
        heard: 'au  (Türkçe “tavuk”)',
        example: 'koud, blauw',
        exampleSaid: 'kaud · blau',
        why: 'Tek diphtong. “o-u” diye heceleme.',
      ),
      SoundRule(
        written: 'g  /  ch',
        heard: 'hırıltılı h  (boğaz kazıması, Türkçe g değil)',
        example: 'goed, acht, Lach',
        exampleSaid: 'huut · aht · lah',
        why:
            'Yumuşak damak sürtünmesi. “gibi”deki g dersen çocukça kaçar. ch aynı aile; g biraz daha önde olabilir.',
      ),
      SoundRule(
        written: '-en (fiil sonu)',
        heard: 'çoğu zaman n düşer',
        example: 'lopen, spreken',
        exampleSaid: 'lope · spreke',
        why: 'Konuşma dilinde son n yenir. Yazıda n durur. Yazım ≠ günlük ağız.',
      ),
    ],
    traps: const [
      LangTrap('oe ≠ eu', 'boek = buk. leuk = lök. Bu ikisini karıştırmak A1’in bir numaralı hatası.'),
      LangTrap('w ≈ İngilizce v', 'wijn “veyn”e yakın. Türkçe “vıyn” değil.'),
      LangTrap('Vurgu genelde ilk hece', 'ANtworen, niet anTWOren. Almanca gibi sona kaçırma.'),
    ],
    firstWeek: 'Bu hafta sadece oe=u, eu=ö, ui=öy ezberle. Üçü oturursa Flemenkçe okuma korkusu biter.',
  ),
  LearnLang.es: LanguageGuide(
    lang: LearnLang.es,
    headline: 'İspanyolca: harf neredeyse ses',
    intro:
        'İspanyolca Türkçeden daha düzenli. Asıl iş: sessiz h, j’nin hırıltısı, İspanya’da z/c’nin “peltek s”i, v ile b’nin aynı olması.',
    rules: const [
      SoundRule(
        written: 'h',
        heard: 'yok  (hiç çıkmaz)',
        example: 'hola, hotel, ahora',
        exampleSaid: 'ola · otel · aora',
        why: 'Latince h düştü, yazıda kaldı. hola’ya h koyma.',
      ),
      SoundRule(
        written: 'j  /  ge, gi',
        heard: 'kalın h  (boğazdan nefes)',
        example: 'José, gente, gitana',
        exampleSaid: 'hose · hente · hitana',
        why: 'Türkçe c/j değil. İspanyolca j, Almanca ach’e yakın.',
      ),
      SoundRule(
        written: 'z  /  ce, ci  (İspanya)',
        heard: 'peltek s  (İngilizce think)',
        example: 'gracias, zapato, Barcelona',
        exampleSaid: 'grasias (İsp: grathias) · thapato · barthelona',
        why:
            'İspanya’da c+e/i ve z diş arasından. Latin Amerika’da düz s. NURA varsayılanı: İspanya ağzı; sen seçersin.',
      ),
      SoundRule(
        written: 'v  ve  b',
        heard: 'ikisi de b’ye yakın',
        example: 'Barcelona, vivo',
        exampleSaid: 'barselona · bibo',
        why: 'Ayrı “v” yok. Türkçe v ile okuma.',
      ),
      SoundRule(
        written: 'll',
        heard: 'y  (çoğu yerde)',
        example: 'calle, lluvia',
        exampleSaid: 'kayye · yubia',
        why: 'Klasik ses “ly” idi; bugün genç İspanya’da y. “l-l” diye ayırma.',
      ),
      SoundRule(
        written: 'r  /  rr',
        heard: 'tek sekme  /  titreme',
        example: 'pero, perro',
        exampleSaid: 'pero (kısa) · perro (titre)',
        why: 'Tek r dil ucu bir vuruş. rr / kelime başı r uzun titreşim. Anlam değişir.',
      ),
    ],
    traps: const [
      LangTrap('Vurgu işareti şart', 'pájaro ≠ pajara. İşaret yoksa kural: sesli + sessizle bitiyorsa sondan ikinci hece.'),
      LangTrap('¿ ! ters işaret', 'Soru cümlesi ¿ ile başlar. Yazıda unutma; konuşmada ezgi yükselir.'),
      LangTrap('Türkçe c yok', 'gracias içindeki c, “k” veya “th/s”. “grasyas”taki y doğru, “c” değil.'),
    ],
    firstWeek: 'hola’dan h’yi sil. j’yi hırıltılı söyle. v’yi b yap. Üçü İspanyolcayı hemen “yerli” gösterir.',
  ),
  LearnLang.de: LanguageGuide(
    lang: LearnLang.de,
    headline: 'Almanca: ie ve ei ters ezber',
    intro:
        'Türklerin bir numaralı Almanca kazası: ie ile ei. ie = uzun i, ei = “ay”. Bir de w=v, v=f.',
    rules: const [
      SoundRule(
        written: 'ie',
        heard: 'uzun i  (Türkçe “bir”i uzat)',
        example: 'Liebe, hier, Sie',
        exampleSaid: 'liibe · hiir · zii',
        why: 'i + e tarihi uzun i. “iye” diye okuma.',
      ),
      SoundRule(
        written: 'ei',
        heard: 'ay  (Türkçe “çay”)',
        example: 'mein, nein, Ei',
        exampleSaid: 'mayn · nayn · ay',
        why: 'ie’nin tersi. mein ≠ “miin”.',
      ),
      SoundRule(
        written: 'eu  /  äu',
        heard: 'oy',
        example: 'Deutsch, Häuser',
        exampleSaid: 'doyç · hoyzer',
        why: 'Yuvarlak kayan ses. “ö” değil.',
      ),
      SoundRule(
        written: 'w',
        heard: 'v',
        example: 'Wasser, wo, Wein',
        exampleSaid: 'vaser · vo · vayn',
        why: 'Almanca w, İngilizce v. “uater” değil.',
      ),
      SoundRule(
        written: 'v',
        heard: 'çoğu zaman f',
        example: 'Vater, vier, Vogel',
        exampleSaid: 'faater · fiir · foogel',
        why: 'Latince/Almanca v çoğu kökte f. (Villa gibi yabancı sözcükler v kalabilir.)',
      ),
      SoundRule(
        written: 'ch',
        heard: 'ich = ince hışırtı · ach = kalın hırıltı',
        example: 'ich, nicht, Bach',
        exampleSaid: 'ih · niht · bah',
        why: 'e/i’den sonra yumuşak (ich-Laut), a/o/u’dan sonra boğaz (ach-Laut). Türkçe “ç” değil.',
      ),
      SoundRule(
        written: 'st- / sp- (söz başı)',
        heard: 'şt / şp',
        example: 'Stein, sprechen',
        exampleSaid: 'ştayn · şprehen',
        why: 'Standart Almanca kuralı. “stayn” İngilizce kaçırır.',
      ),
    ],
    traps: const [
      LangTrap('ie / ei kartı', 'Liebe = liibe. mein = mayn. Bunu 7 gün her gün 10 kez söyle.'),
      LangTrap('ß = ss', 'Straße = ştraase. Büyük harfte SS.'),
      LangTrap('Umlaut anlam değiştirir', 'schon ≠ schön. Mutter ≠ Mütter.'),
    ],
    firstWeek: 'ie=i, ei=ay, w=v. Üç kural; gerisi sonra.',
  ),
  LearnLang.fr: LanguageGuide(
    lang: LearnLang.fr,
    headline: 'Fransızca: son harfler çoğu zaman susar',
    intro:
        'Yazı tarihî, ağız evrilmiş. ou = u, u = ü. Kelime sonundaki sessizler sık susar. R boğazdan.',
    rules: const [
      SoundRule(
        written: 'ou',
        heard: 'u  (Türkçe “buz”)',
        example: 'vous, pour, beaucoup',
        exampleSaid: 'vu · pur · boku',
        why: 'ou tek ses u. “o-u” değil. beaucoup’ta p ve son sessizler düşer: boku.',
      ),
      SoundRule(
        written: 'u',
        heard: 'ü  (Türkçe “gül”)',
        example: 'tu, une, rue',
        exampleSaid: 'tü · ün · rü',
        why: 'Dudaklar ü, dil i. “u” dersen “ou” olmuş olursun. tu ≠ “tu”, “tü”.',
      ),
      SoundRule(
        written: 'eu',
        heard: 'ö',
        example: 'deux, bleu, peur',
        exampleSaid: 'dö · blö · pör',
        why: 'Yuvarlak ön ünlü. ou ile karıştırma.',
      ),
      SoundRule(
        written: 'oi',
        heard: 'ua',
        example: 'moi, trois, soir',
        exampleSaid: 'mua · trua · suar',
        why: 'Yazı o+i, ses “ua”.',
      ),
      SoundRule(
        written: 'son sessizler',
        heard: 'çoğu susar',
        example: 'petit, tard, vous',
        exampleSaid: 'pöti · tar · vu',
        why: 't, d, s, x, p kelime sonunda sık ölü. Liaison’da (ünlüyle devam) bazen uyanır: vous avez → vu-zave.',
      ),
      SoundRule(
        written: 'on / an / in',
        heard: 'burundan, n tam kapanmaz',
        example: 'bon, dans, vin',
        exampleSaid: 'bõ · dã · vẽ',
        why: 'Burun ünlüsü. “bon”u “bonn” diye n’le kapatma.',
      ),
    ],
    traps: const [
      LangTrap('u ≠ ou', 'tu = tü. vous = vu. En sık Türk hatası.'),
      LangTrap('r boğazdan', 'İstanbul r’si değil; hafif gargara. Abartma.'),
      LangTrap('h çoğu zaman yok', 'hôtel = otel. Ama “h aspiré”de liaison yok (les haricots).',),
    ],
    firstWeek: 'ou=u, u=ü, son harfi yut. Üçü Fransızcayı tanınır kılar.',
  ),
  LearnLang.en: LanguageGuide(
    lang: LearnLang.en,
    headline: 'İngilizce: yazı ile ses ayrı evren',
    intro:
        'İngilizce imla 500 yıllık kaza. Aynı harf beş ses olabilir. Türk için en kritik: th, w/v, ve “schwa” (e’ye yakın zayıf ses).',
    rules: const [
      SoundRule(
        written: 'th',
        heard: 'dil diş arasında  ·  ince (think) veya titreşimli (this)',
        example: 'think, the, that',
        exampleSaid: 'think (s değil) · dha · dhat',
        why: 'Türkçe s/z/t değil. Dili üst dişe değdir. “sink” dersen başka kelime.',
      ),
      SoundRule(
        written: 'w  vs  v',
        heard: 'w = yuvarlak dudak  ·  v = diş-dudak',
        example: 'west, vest, wine',
        exampleSaid: 'uest · vest · uayn',
        why: 'Türkçe ikisini v yapar. west ≠ vest. Dudakları öne uzat (w).',
      ),
      SoundRule(
        written: 'a  (birçok ses)',
        heard: 'ey / e / a / o  bağlama göre',
        example: 'name, cat, father, want',
        exampleSaid: 'neym · ket · faadhe · wont',
        why: 'Tek kural yok. Kelime kelime. “name”i “name” diye okuma.',
      ),
      SoundRule(
        written: 'e (kelime sonu)',
        heard: 'çoğu zaman susar, önceki ünlüyü uzatır',
        example: 'make, like, note',
        exampleSaid: 'meyk · layk · nout',
        why: '“Sihirli e”. make ≠ “make-e”.',
      ),
      SoundRule(
        written: 'ə  schwa',
        heard: 'gevşek e  (hemen her zayıf hece)',
        example: 'about, banana, teacher',
        exampleSaid: 'ebaut · benene · tiçer',
        why: 'İngilizcenin en sık sesi. Her heceyi tam okuma; zayıfları yut.',
      ),
      SoundRule(
        written: 'r (Amerikan)',
        heard: 'ünlüden sonra da duyulur',
        example: 'car, first, more',
        exampleSaid: 'kaar · först · moor',
        why: 'NURA varsayılanı Amerikan. İngiliz (UK) car ≈ “kaa”.',
      ),
    ],
    traps: const [
      LangTrap('th’yi s yapma', 'thank ≠ sank. 10 gün ayna karşısında.'),
      LangTrap('w / v', 'wine / vine. Dudak önde = w.'),
      LangTrap('Kelime ezberi şart', 'Kural yetmez. live (yaşamak) ≠ live (canlı).'),
    ],
    firstWeek: 'th, w, schwa. Üçü oturursa “Türkçe aksanlı İngilizce” yarı yarıya iner.',
  ),
  LearnLang.ar: LanguageGuide(
    lang: LearnLang.ar,
    headline: 'Arapça: yazıda sesli harf çoğu zaman yok',
    intro:
        'Babbel’de Arapça yok; Duolingo MSA öğretir, konuşturma ve yazım-okunuş anlatmaz. NURA: Modern Standart + Türkçe kulağa göre ses. Diyalekt (Mısır / Levant) sonra.',
    rules: const [
      SoundRule(
        written: 'ا / و / ي',
        heard: 'uzun a / u / i',
        example: 'باب، نور، دين',
        exampleSaid: 'baab · nuur · diin',
        why: 'Üç uzun ünlü. Kısa a/i/u çoğu zaman yazılmaz (hareke). Kitapta üstte işaret yoksa ezbere bileceksin.',
      ),
      SoundRule(
        written: 'ع  (ayn)',
        heard: 'boğazın sıkışması — Türkçede yok',
        example: 'عربي، معلم',
        exampleSaid: 'ʕarabi · muʕallim',
        why: 'h değil, g değil. Gırtlaktan “sık”. Atlamak kelimeyi yabancı yapar.',
      ),
      SoundRule(
        written: 'ح  vs  ه',
        heard: 'ح = nefesli boğaz h  ·  ه = yumuşak h',
        example: 'حب، هو',
        exampleSaid: 'hubb · huve',
        why: 'İkisi ayrı harf. ح’yi h yapmak “yanlış kelime” riski.',
      ),
      SoundRule(
        written: 'ق',
        heard: 'kalın k (gırtlak kapağı)',
        example: 'قهوة، قرآن',
        exampleSaid: 'qahwa · qurʔaan',
        why: 'Türkçe k’den daha geride. Mısır ağzında çoğu zaman ʔ (hemze) olur — NURA MSA’da q tutar.',
      ),
      SoundRule(
        written: 'ص ض ط ظ',
        heard: 'kalın / “dolu ağız” eşleri',
        example: 'صباح، ضوء',
        exampleSaid: 'sabaah (kalın s) · dawʔ',
        why: 's/d/t/z’nin vurgulu hali. İnce söylersen anlam kayabilir.',
      ),
      SoundRule(
        written: 'RTL + bitişik harf',
        heard: 'sağdan sola; harf konumuna göre şekil değişir',
        example: 'ب  بـ  ـبـ  ـب',
        exampleSaid: 'baş / orta / son / yalnız',
        why: 'Aynı harf 4 şekil. İlk hafta okuma yönü + temel 28 harf. Konuşmayı bekletme: ses + yazı paralel.',
      ),
    ],
    traps: const [
      LangTrap('MSA ≠ sokak', 'Haber dili MSA. Kahire’de konuşulan Mısır Arapçası. İlk 30 gün MSA kalıp + “bu resmi” uyarısı.'),
      LangTrap('Kısa ünlü yazılmaz', 'كتب = keteb / kutub / kataba olabilir. Bağlam + hareke.'),
      LangTrap('Selam dinî/kültürel', 'السلام عليكم → وعليكم السلام. Sadece merhaba yetmez.'),
    ],
    firstWeek: 'Yön sağdan sola. ع ve ح’yi ayır. قهوة = qahwa. Üçü Arapçayı “ciddi” gösterir.',
  ),
};

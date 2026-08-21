// GENERATED — 30 language pronunciation guides
// ignore_for_file: lines_longer_than_80_chars

import '../models/models.dart';

class SoundRule {
  const SoundRule({required this.written, required this.heard, required this.example, required this.exampleSaid, required this.why});
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
  const LanguageGuide({required this.lang, required this.headline, required this.intro, required this.rules, required this.traps, required this.firstWeek});
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
        part = part.replaceAll(RegExp('[^a-zäöüßĳoeàáâãçèéêìíîñòóôõùúûýа-яα-ωก-๙ก-๛\u0600-\u06FF\u0590-\u05FF]+'), '');
        if (part.length >= 2 && t.contains(part)) return r;
      }
    }
    return null;
  }

  static LanguageGuide of(LearnLang lang) => _all[lang] ?? _fallback(lang);

  static LanguageGuide _fallback(LearnLang lang) => LanguageGuide(
    lang: lang,
    headline: '\${lang.name.toUpperCase()} rehberi',
    intro: 'Bu dil için telaffuz rehberi yakında eklenecek.',
    firstWeek: 'Temel sesleri duy ve tekrarla.',
    rules: const [],
    traps: const [],
  );
}

final Map<LearnLang, LanguageGuide> _all = {
  LearnLang.en: LanguageGuide(
    lang: LearnLang.en,
    headline: 'İngilizce: yazı ile ses ayrı evren',
    intro: 'İngilizce imla 500 yıllık kaza. Aynı harf beş ses olabilir. Türk için en kritik: th, w/v, ve schwa.',
    firstWeek: 'th, w, schwa. Üçü oturursa Türkçe aksanlı İngilizce yarı yarıya iner.',
    rules: const [
      SoundRule(written: 'th', heard: 'dil diş arasında', example: 'think, the', exampleSaid: 'think (s değil) · dha', why: 'Türkçe s/z/t değil.'),
      SoundRule(written: 'w vs v', heard: 'w = yuvarlak dudak · v = diş-dudak', example: 'west, vest', exampleSaid: 'uest · vest', why: 'Dudakları öne uzat.'),
      SoundRule(written: 'schwa', heard: 'gevşek e', example: 'about, banana', exampleSaid: 'ebaut · benene', why: 'En sık ses. Zayıf heceyi yut.'),
    ],
    traps: const [
      LangTrap('th\'yi s yapma', 'thank ≠ sank.'),
      LangTrap('w/v', 'wine ≠ vine.'),
    ],
  ),
  LearnLang.es: LanguageGuide(
    lang: LearnLang.es,
    headline: 'İspanyolca: harf neredeyse ses',
    intro: 'İspanyolca Türkçeden daha düzenli. Asıl iş: sessiz h, j\'nin hırıltısı.',
    firstWeek: 'hola\'dan h\'yi sil. j\'yi hırıltılı söyle. v\'yi b yap.',
    rules: const [
      SoundRule(written: 'h', heard: 'yok (hiç çıkmaz)', example: 'hola, hotel', exampleSaid: 'ola · otel', why: 'Latince h düştü.'),
      SoundRule(written: 'j / ge,gi', heard: 'kalın h', example: 'José, gente', exampleSaid: 'hose · hente', why: 'Türkçe c/j değil.'),
      SoundRule(written: 'll', heard: 'y', example: 'calle, lluvia', exampleSaid: 'kayye · yubia', why: 'l-l diye ayırma.'),
    ],
    traps: const [
      LangTrap('Vurgu işareti şart', 'pájaro ≠ pajara.'),
      LangTrap('Türkçe c yok', 'gracias → grasyas.'),
    ],
  ),
  LearnLang.de: LanguageGuide(
    lang: LearnLang.de,
    headline: 'Almanca: ie ve ei ters ezber',
    intro: 'ie = uzun i, ei = ay. Bir de w=v, v=f.',
    firstWeek: 'ie=i, ei=ay, w=v. Üç kural; gerisi sonra.',
    rules: const [
      SoundRule(written: 'ie', heard: 'uzun i', example: 'Liebe, hier', exampleSaid: 'liibe · hiir', why: 'iye diye okuma.'),
      SoundRule(written: 'ei', heard: 'ay', example: 'mein, nein', exampleSaid: 'mayn · nayn', why: 'ie\'nin tersi.'),
      SoundRule(written: 'ch', heard: 'ich = ince hışırtı · ach = kalın', example: 'ich, Bach', exampleSaid: 'ih · bah', why: 'Türkçe ç değil.'),
    ],
    traps: const [
      LangTrap('ie/ei kartı', 'Liebe = liibe. mein = mayn.'),
      LangTrap('Umlaut', 'schon ≠ schön.'),
    ],
  ),
  LearnLang.fr: LanguageGuide(
    lang: LearnLang.fr,
    headline: 'Fransızca: son harfler çoğu zaman susar',
    intro: 'ou = u, u = ü. Son sessizler sık susar. R boğazdan.',
    firstWeek: 'ou=u, u=ü, son harfi yut.',
    rules: const [
      SoundRule(written: 'ou', heard: 'u (Türkçe buz)', example: 'vous, pour', exampleSaid: 'vu · pur', why: 'ou tek ses u.'),
      SoundRule(written: 'u', heard: 'ü (Türkçe gül)', example: 'tu, rue', exampleSaid: 'tü · rü', why: 'Dudaklar ü, dil i.'),
      SoundRule(written: 'son sessizler', heard: 'çoğu susar', example: 'petit, tard', exampleSaid: 'pöti · tar', why: 't, d, s kelime sonunda ölü.'),
    ],
    traps: const [
      LangTrap('u ≠ ou', 'tu = tü. vous = vu.'),
      LangTrap('r boğazdan', 'Hafif gargara.'),
    ],
  ),
  LearnLang.nl: LanguageGuide(
    lang: LearnLang.nl,
    headline: 'Flemenkçe: yazıldığı gibi okunmaz',
    intro: 'Harf kombinasyonları tek ses üretir. En sık tuzak: oe.',
    firstWeek: 'oe=u, eu=ö, ui=öy. Üçü oturursa Flemenkçe okuma korkusu biter.',
    rules: const [
      SoundRule(written: 'oe', heard: 'u (Türkçe buz)', example: 'boek, goed', exampleSaid: 'buk · hut', why: 'oe görünce u.'),
      SoundRule(written: 'eu', heard: 'ö (Türkçe göl)', example: 'leuk, kleur', exampleSaid: 'lök · klör', why: 'Yuvarlak ön ünlü.'),
      SoundRule(written: 'ui', heard: 'öy', example: 'huis, uit', exampleSaid: 'höys · öyt', why: 'Kayan iki ses.'),
    ],
    traps: const [
      LangTrap('oe ≠ eu', 'boek = buk. leuk = lök.'),
      LangTrap('w ≈ v', 'wijn → veyn.'),
    ],
  ),
  LearnLang.ar: LanguageGuide(
    lang: LearnLang.ar,
    headline: 'Arapça: yazıda sesli harf çoğu zaman yok',
    intro: 'Modern Standart Arapça. Kısa ünlüler yazılmaz.',
    firstWeek: 'Yön sağdan sola. ع ve ح\'yi ayır. قهوة = qahwa.',
    rules: const [
      SoundRule(written: 'ع (ayn)', heard: 'boğazın sıkışması', example: 'عربي، معلم', exampleSaid: 'ʕarabi · muʕallim', why: 'Gırtlaktan sık.'),
      SoundRule(written: 'ح vs ه', heard: 'ح = nefesli h · ه = yumuşak h', example: 'حب، هو', exampleSaid: 'hubb · huve', why: 'İkisi ayrı harf.'),
      SoundRule(written: 'ق', heard: 'kalın k (gırtlak)', example: 'قهوة', exampleSaid: 'qahwa', why: 'Türkçe k\'den daha geride.'),
    ],
    traps: const [
      LangTrap('MSA ≠ sokak', 'Haber dili MSA. Kahire farklı.'),
      LangTrap('Kısa ünlü yazılmaz', 'Bağlam + hareke.'),
    ],
  ),
  LearnLang.pt: LanguageGuide(
    lang: LearnLang.pt,
    headline: 'Portekizce: geniz sesleri ve yumuşak ş',
    intro: 'ão, ões gibi burun sesleri Portekizce\'nin imzası. nh = ny, lh = ly.',
    firstWeek: 'ão = nazal ao. nh = ny. lh = ly. Üçü başlangıç için yeterli.',
    rules: const [
      SoundRule(written: 'ão', heard: 'nazal ao', example: 'pão, mão', exampleSaid: 'pãw · mãw', why: 'Burundan çıkan ao.'),
      SoundRule(written: 'nh', heard: 'ny', example: 'vinho', exampleSaid: 'vinyu', why: 'İspanyolca ñ gibi.'),
      SoundRule(written: 'lh', heard: 'ly', example: 'trabalho', exampleSaid: 'trabaylu', why: 'ly sesi.'),
    ],
    traps: const [
      LangTrap('Brezilya ≠ Portekiz', 'de = dji (Brezilya). Dikkat.'),
      LangTrap('r', 'Rio\'daki r = h.'),
    ],
  ),
  LearnLang.it: LanguageGuide(
    lang: LearnLang.it,
    headline: 'İtalyanca: çift sessiz uzar',
    intro: 'İtalyanca Türkçe gibi okunur. Asıl fark: çift harfler gerçekten uzun söylenir.',
    firstWeek: 'gli = lyee. gn = ny. Çift harfi uzat.',
    rules: const [
      SoundRule(written: 'gli', heard: 'lyee', example: 'famiglia', exampleSaid: 'familya', why: 'l+i sesi, gl değil.'),
      SoundRule(written: 'gn', heard: 'ny', example: 'gnocchi', exampleSaid: 'nyokki', why: 'İspanyolca ñ gibi.'),
      SoundRule(written: 'çift harf', heard: 'uzun ses', example: 'notte, pizza', exampleSaid: 'not-te · pit-tsa', why: 'Kısa söylersen anlam değişir.'),
    ],
    traps: const [
      LangTrap('h sessiz', 'ho, hai → o, ay.'),
      LangTrap('c+e/i = ç', 'ciao = çao.'),
    ],
  ),
  LearnLang.ru: LanguageGuide(
    lang: LearnLang.ru,
    headline: 'Rusça: Kiril alfabesi + vurgu sihri',
    intro: 'Kiril harfleri öğrenince okuma kolay. Vurgu yerine göre sesli değişir.',
    firstWeek: 'Kiril öğren. о vurgusuz = a. ы = kalın ı.',
    rules: const [
      SoundRule(written: 'о (vurgusuz)', heard: 'a gibi okunur', example: 'молоко', exampleSaid: 'malako', why: 'Vurgusuz о → a.'),
      SoundRule(written: 'ы', heard: 'kalın ı', example: 'мы, сын', exampleSaid: 'mı · sın', why: 'Türkçe ı\'ya yakın.'),
      SoundRule(written: 'ш vs щ', heard: 'ş vs şç', example: 'шёл, щи', exampleSaid: 'şol · şçi', why: 'İkisi farklı.'),
    ],
    traps: const [
      LangTrap('Vurgu', 'замок = kilit / şato.'),
      LangTrap('Yumuşak işaret ь', 'Sesi değiştirir.'),
    ],
  ),
  LearnLang.zh: LanguageGuide(
    lang: LearnLang.zh,
    headline: 'Çince: 4 ton + karakter',
    intro: 'Mandarin 4 ton kullanır. Aynı hece farklı tonla farklı anlam.',
    firstWeek: 'mā má mǎ mà tonlarını duy ve ayırt et.',
    rules: const [
      SoundRule(written: '4 ton', heard: 'düz/yükselen/alçalıp-yükselen/düşen', example: 'mā má mǎ mà', exampleSaid: 'anne · kenevirr · at · azarlamak', why: 'Ton = anlam.'),
      SoundRule(written: 'zh', heard: 'c (dil geriye)', example: '中国', exampleSaid: 'cong-guo', why: 'Türkçe c\'ye yakın.'),
      SoundRule(written: 'x', heard: 'ince s', example: '谢谢', exampleSaid: 'syeh-syeh', why: 's ve ş arası.'),
    ],
    traps: const [
      LangTrap('Ton yanlışı', 'mǎ=at, mà=azarla.'),
      LangTrap('Karakter', 'Günde 5 yeni karakter yeterli.'),
    ],
  ),
  LearnLang.ja: LanguageGuide(
    lang: LearnLang.ja,
    headline: 'Japonca: 3 alfabe + nezaket seviyeleri',
    intro: 'Hiragana, Katakana ve Kanji. Sesler Türkçe\'ye yakın ama uzun/kısa ünlü önemli.',
    firstWeek: 'Hiragana öğren. Uzun ünlüyü uzat. す su bazen sessiz.',
    rules: const [
      SoundRule(written: 'uzun ünlü', heard: 'anlam değiştirir', example: 'おばさん vs おばあさん', exampleSaid: 'obasan · obaasan', why: 'Teyze vs büyükanne.'),
      SoundRule(written: 'r', heard: 'l ve r arası', example: 'ラーメン', exampleSaid: 'raamen', why: 'Dili damağa vur.'),
      SoundRule(written: 'っ (sokuon)', heard: 'çift sessiz / duraklama', example: 'きって', exampleSaid: 'kit-te', why: 'Kısa duraklama.'),
    ],
    traps: const [
      LangTrap('Keigo', 'Resmiyet seviyesi önemli.'),
      LangTrap('は = wa', 'Konu eki olunca wa.'),
    ],
  ),
  LearnLang.ko: LanguageGuide(
    lang: LearnLang.ko,
    headline: 'Korece: Hangul mantıklı bir alfabe',
    intro: 'Hangul öğrenilmesi en kolay alfabelerden. Sesler blok halinde yazılır.',
    firstWeek: 'Hangul harflerini öğren. ㅂ/ㅃ/ㅍ üçlüsünü ayır.',
    rules: const [
      SoundRule(written: 'ㅂ/ㅃ/ㅍ', heard: 'b / pp / p', example: '바 / 빠 / 파', exampleSaid: 'ba · ppa · pa', why: 'Üç farklı p/b.'),
      SoundRule(written: 'ㄱ/ㄲ/ㅋ', heard: 'g / kk / k', example: '가 / 까 / 카', exampleSaid: 'ga · kka · ka', why: 'Üç farklı g/k.'),
      SoundRule(written: '받침', heard: 'alt sessiz', example: '한국', exampleSaid: 'han-guk', why: 'Blok altındaki harf.'),
    ],
    traps: const [
      LangTrap('Çift sessiz', '빠 ≠ 바. Sıkılaştır.'),
      LangTrap('Saygı dili', 'yo/습니다 eki önemli.'),
    ],
  ),
  LearnLang.tr: LanguageGuide(
    lang: LearnLang.tr,
    headline: 'Türkçe: yazıldığı gibi okunur',
    intro: 'Türkçe fonetik bir dil. Her harf tek ses. Ünlü uyumu ana kural.',
    firstWeek: 'ı/i, ö/ü, ğ. Ünlü uyumu: büyük → büyüğe.',
    rules: const [
      SoundRule(written: 'ğ', heard: 'uzatma / yok', example: 'dağ, değil', exampleSaid: 'daa · deyil', why: 'Harf var ama ses neredeyse yok.'),
      SoundRule(written: 'ı vs i', heard: 'kalın ı / ince i', example: 'kız, kiz', exampleSaid: 'kız · kiz', why: 'İngilizce i yok, iki ayrı ses.'),
      SoundRule(written: 'c', heard: 'c = Türkçe c', example: 'cam', exampleSaid: 'cam', why: 'İngilizce j\'ye yakın.'),
    ],
    traps: const [
      LangTrap('Ünlü uyumu', 'Ek sesli harf köke uyar.'),
      LangTrap('ş ç', 'İngilizce sh, ch.'),
    ],
  ),
  LearnLang.pl: LanguageGuide(
    lang: LearnLang.pl,
    headline: 'Lehçe: sz, cz, rz, ń sesleri',
    intro: 'Lehçe ünsüz kümeleriyle ünlü. Vurgu genelde sondan ikinci hece.',
    firstWeek: 'sz=ş, cz=ç, ż/rz=j. Üçü yeter.',
    rules: const [
      SoundRule(written: 'sz', heard: 'ş', example: 'szkoła', exampleSaid: 'şkoua', why: 'Türkçe ş.'),
      SoundRule(written: 'cz', heard: 'ç', example: 'cześć', exampleSaid: 'çeşç', why: 'Türkçe ç.'),
      SoundRule(written: 'ż / rz', heard: 'j (Fransızca j)', example: 'żaba, rzeka', exampleSaid: 'jaba · jeka', why: 'Yumuşak j sesi.'),
    ],
    traps: const [
      LangTrap('ł = w', 'łódka = wutka.'),
      LangTrap('ą ę', 'Burun ünlüleri.'),
    ],
  ),
  LearnLang.sv: LanguageGuide(
    lang: LearnLang.sv,
    headline: 'İsveççe: melodi + sj sesi',
    intro: 'İsveççe melodik bir dil. sj/skj sesi benzersiz.',
    firstWeek: 'å=o, ö=ö, sj=hışırtı. Tonlamaya dikkat.',
    rules: const [
      SoundRule(written: 'å', heard: 'o', example: 'gå, år', exampleSaid: 'go · or', why: 'Yuvarlak o.'),
      SoundRule(written: 'sj / skj', heard: 'hışırtılı ş', example: 'sjö, skjorta', exampleSaid: 'şö · şorta', why: 'Derin ş.'),
      SoundRule(written: 'k+e,i', heard: 'ç sesi', example: 'kör, kilo', exampleSaid: 'çör · çilo', why: 'Ön ünlülerle k → ç.'),
    ],
    traps: const [
      LangTrap('Tonlama', 'İki kelime tonu var.'),
      LangTrap('rs = retrofleks', 'fors → foş.'),
    ],
  ),
  LearnLang.da: LanguageGuide(
    lang: LearnLang.da,
    headline: 'Danca: stød ve yutulan harfler',
    intro: 'Danca yazısı İsveççe\'ye benzer ama telaffuz çok farklı. Stød = gırtlak durağı.',
    firstWeek: 'Stød\'ü duy. d çoğu zaman yumuşar. å=o.',
    rules: const [
      SoundRule(written: 'd (yumuşak)', heard: 'ð veya yutulur', example: 'mad, god', exampleSaid: 'mað · goð', why: 'd → th veya kaybolur.'),
      SoundRule(written: 'stød', heard: 'gırtlak durağı', example: 'hun, hund', exampleSaid: 'hun · hunˀ', why: 'Kısa gırtlak kapanması.'),
      SoundRule(written: 'å', heard: 'o', example: 'gå, år', exampleSaid: 'go · or', why: 'İsveççe ile aynı.'),
    ],
    traps: const [
      LangTrap('Yazı ≠ ses', 'Danca çok yutar.'),
      LangTrap('Sayılar', 'halvtreds = 50 (yarım üçüncü yirmi).'),
    ],
  ),
  LearnLang.no: LanguageGuide(
    lang: LearnLang.no,
    headline: 'Norveççe: bokmål + nynorsk, melodik',
    intro: 'Norveççe İsveççe\'ye çok yakın. İki yazım standardı var.',
    firstWeek: 'å=o, ø=ö, æ=e. Tonlamaya dikkat.',
    rules: const [
      SoundRule(written: 'å', heard: 'o', example: 'gå, år', exampleSaid: 'go · or', why: 'Yuvarlak o.'),
      SoundRule(written: 'ø', heard: 'ö', example: 'søster', exampleSaid: 'söster', why: 'Türkçe ö.'),
      SoundRule(written: 'kj', heard: 'ince ç', example: 'kjøpe', exampleSaid: 'çöpe', why: 'k+j = ç.'),
    ],
    traps: const [
      LangTrap('Bokmål vs Nynorsk', 'İki yazım standardı.'),
      LangTrap('Tonlama', 'İsveççe gibi melodik.'),
    ],
  ),
  LearnLang.fi: LanguageGuide(
    lang: LearnLang.fi,
    headline: 'Fince: çift harf uzar, vokaller bol',
    intro: 'Fince fonetik. Çift sesli/sessiz uzun okunur. Ünlü uyumu var.',
    firstWeek: 'Çift = uzun. ä=e, ö=ö. Ünlü uyumu.',
    rules: const [
      SoundRule(written: 'çift harf', heard: 'uzun ses', example: 'tuli vs tuuli', exampleSaid: 'tuli · tuuli', why: 'Ateş vs rüzgar.'),
      SoundRule(written: 'ä', heard: 'açık e', example: 'pää', exampleSaid: 'pee', why: 'Türkçe e\'ye yakın.'),
      SoundRule(written: 'y', heard: 'ü', example: 'syy', exampleSaid: 'süü', why: 'Türkçe ü.'),
    ],
    traps: const [
      LangTrap('Çift harf', 'tuli ≠ tuuli. Uzunluk kritik.'),
      LangTrap('Ekler', 'Fince 15+ hal eki var.'),
    ],
  ),
  LearnLang.el: LanguageGuide(
    lang: LearnLang.el,
    headline: 'Yunanca: Yunan alfabesi + modern sesler',
    intro: 'Yunan alfabesi öğrenince okunur. Antik Yunanca\'dan farklı sesler.',
    firstWeek: 'Yunan harflerini öğren. μπ=b, ντ=d, γγ=ng.',
    rules: const [
      SoundRule(written: 'μπ', heard: 'b', example: 'μπίρα', exampleSaid: 'bira', why: 'İki harf = tek ses.'),
      SoundRule(written: 'ντ', heard: 'd', example: 'ντομάτα', exampleSaid: 'domata', why: 'n+t = d.'),
      SoundRule(written: 'γγ', heard: 'ng', example: 'αγγλικά', exampleSaid: 'anglika', why: 'Çift gamma = ng.'),
    ],
    traps: const [
      LangTrap('η ι υ hepsi i', 'Farklı yazılır, aynı ses.'),
      LangTrap('Vurgu', 'İşaret her zaman var.'),
    ],
  ),
  LearnLang.cs: LanguageGuide(
    lang: LearnLang.cs,
    headline: 'Çekçe: háčky ve čárky',
    intro: 'Çekçe fonetik. ř sesi dünyada benzersiz. š=ş, č=ç, ž=j.',
    firstWeek: 'š=ş, č=ç, ř=rj (titreşimli). Háček = yumuşatma.',
    rules: const [
      SoundRule(written: 'ř', heard: 'titreşimli rj', example: 'řeka, Dvořák', exampleSaid: 'rjeka · dvorjak', why: 'Dünyada tek. Dili titret + j.'),
      SoundRule(written: 'š', heard: 'ş', example: 'škola', exampleSaid: 'şkola', why: 'Türkçe ş.'),
      SoundRule(written: 'č', heard: 'ç', example: 'čas', exampleSaid: 'ças', why: 'Türkçe ç.'),
    ],
    traps: const [
      LangTrap('ř', 'Çok pratik ister.'),
      LangTrap('ů vs ú', 'İkisi de uzun u. Farklı yazım.'),
    ],
  ),
  LearnLang.ro: LanguageGuide(
    lang: LearnLang.ro,
    headline: 'Romence: Latin kökenli, ă ve î sesleri',
    intro: 'Romence Latin dili ama Slav etkili. ă ve î/â benzersiz.',
    firstWeek: 'ă = ı (schwa), î/â = ı, ș=ş, ț=ts.',
    rules: const [
      SoundRule(written: 'ă', heard: 'schwa (ı)', example: 'pădure', exampleSaid: 'pıdure', why: 'Gevşek ı sesi.'),
      SoundRule(written: 'î / â', heard: 'ı (kalın)', example: 'în, România', exampleSaid: 'ın · Romanıya', why: 'İkisi aynı ses.'),
      SoundRule(written: 'ț', heard: 'ts', example: 'țară', exampleSaid: 'tsarı', why: 't+s birleşik.'),
    ],
    traps: const [
      LangTrap('ă ≠ â', 'ă schwa, â kalın ı.'),
      LangTrap('ce/ci = çe/çi', 'Türkçe ç gibi.'),
    ],
  ),
  LearnLang.hu: LanguageGuide(
    lang: LearnLang.hu,
    headline: 'Macarca: uzun ünlüler ve ek yığını',
    intro: 'Macarca fonetik. Ékezet (uzatma) anlam değiştirir. Eklemeli dil.',
    firstWeek: 'a/á, e/é, ö/ő, ü/ű uzunluklarını ayır.',
    rules: const [
      SoundRule(written: 'á', heard: 'uzun a', example: 'ház', exampleSaid: 'haaz', why: 'Kısa a vs uzun á.'),
      SoundRule(written: 'sz', heard: 's', example: 'szép', exampleSaid: 'sep', why: 'sz = Türkçe s. s = ş!'),
      SoundRule(written: 'gy', heard: 'dy', example: 'magyar', exampleSaid: 'madyar', why: 'd+y birleşik.'),
    ],
    traps: const [
      LangTrap('s = ş!', 'Macar s\'i Türkçe ş.'),
      LangTrap('Ekler', 'Ünlü uyumu var, Türkçe gibi.'),
    ],
  ),
  LearnLang.hi: LanguageGuide(
    lang: LearnLang.hi,
    headline: 'Hintçe: Devanagari + aspirasyon',
    intro: 'Devanagari fonetik bir alfabe. Aspirasyonlu/aspirasyonsuz çiftler önemli.',
    firstWeek: 'Devanagari öğren. क/ख, प/फ çiftlerini ayır.',
    rules: const [
      SoundRule(written: 'क vs ख', heard: 'k vs kh', example: 'कम, खाना', exampleSaid: 'kam · khaana', why: 'Nefesli/nefessiz.'),
      SoundRule(written: 'retroflex', heard: 'dili geriye kıvır', example: 'ट, ड', exampleSaid: 'ṭ · ḍ', why: 'İngilizce t/d\'den farklı.'),
      SoundRule(written: 'anusvara ं', heard: 'burun sesi', example: 'हिंदी', exampleSaid: 'hindii', why: 'm/n burun sesi.'),
    ],
    traps: const [
      LangTrap('Aspirasyon', 'Nefesli harf anlam değiştirir.'),
      LangTrap('Schwa silme', 'Kelime sonu a düşer.'),
    ],
  ),
  LearnLang.th: LanguageGuide(
    lang: LearnLang.th,
    headline: 'Tayca: 5 ton + uzun/kısa ünlü',
    intro: 'Tayca tonal. 5 ton var. Uzun/kısa ünlü anlam değiştirir.',
    firstWeek: '5 tonu duy. Uzun/kısa ünlüyü ayırt et.',
    rules: const [
      SoundRule(written: '5 ton', heard: 'orta/alçak/düşen/yüksek/yükselen', example: 'ไหม/ไม่/ใหม่', exampleSaid: 'may? · may! · may(yeni)', why: 'Ton = anlam.'),
      SoundRule(written: 'aspirasyon', heard: 'p/ph, t/th, k/kh', example: 'พ่อ vs ป่า', exampleSaid: 'phɔɔ · paa', why: 'Nefesli çift.'),
      SoundRule(written: 'r vs l', heard: 'bazen karışır', example: 'ร, ล', exampleSaid: 'r · l', why: 'Konuşma dilinde r→l olabilir.'),
    ],
    traps: const [
      LangTrap('Ton', 'Yanlış ton = yanlış kelime.'),
      LangTrap('Alfabe', '44 sessiz, 15+ sesli işareti.'),
    ],
  ),
  LearnLang.vi: LanguageGuide(
    lang: LearnLang.vi,
    headline: 'Vietnamca: 6 ton + dấu işaretleri',
    intro: 'Vietnamca 6 tonlu. Latin alfabesi ama ek işaretlerle. Ton hayati.',
    firstWeek: '6 tonu duy. ơ, ư, â harflerini öğren.',
    rules: const [
      SoundRule(written: '6 ton', heard: '6 farklı melodi', example: 'ma, má, mà, mả, mã, mạ', exampleSaid: 'altı farklı anlam', why: 'Her ton farklı kelime.'),
      SoundRule(written: 'ơ', heard: 'ı/ö arası', example: 'mơ', exampleSaid: 'mơ', why: 'Türkçe\'de yok.'),
      SoundRule(written: 'đ', heard: 'd', example: 'đi', exampleSaid: 'di', why: 'Normal d sesi.'),
    ],
    traps: const [
      LangTrap('Ton', '6 ton: pratik şart.'),
      LangTrap('Kuzey/Güney', 'Hanoi ve Saigon farklı.'),
    ],
  ),
  LearnLang.id: LanguageGuide(
    lang: LearnLang.id,
    headline: 'Endonezce: dünyanın en kolay gramerlerinden',
    intro: 'Endonezce Latin harfli, fonetik, çekim yok. Ön/son eklerle kelime türetilir.',
    firstWeek: 'Fonetik oku. ng=ŋ, ny=ñ, c=ç.',
    rules: const [
      SoundRule(written: 'c', heard: 'ç', example: 'cari', exampleSaid: 'çari', why: 'Her zaman ç.'),
      SoundRule(written: 'ng', heard: 'ŋ (nazal)', example: 'dengan', exampleSaid: 'dıŋan', why: 'n+g değil, tek nazal.'),
      SoundRule(written: 'ny', heard: 'ñ/ny', example: 'nyaman', exampleSaid: 'nyaman', why: 'Burundan y.'),
    ],
    traps: const [
      LangTrap('Kolay gramer', 'Çekim yok ama bağlam önemli.'),
      LangTrap('Malay ≈ Endonezce', 'Çok yakın ama fark var.'),
    ],
  ),
  LearnLang.uk: LanguageGuide(
    lang: LearnLang.uk,
    headline: 'Ukraynaca: Kiril + і, ї, є, ґ',
    intro: 'Rusça\'ya benzer alfabe ama farklı harfler ve sesler var.',
    firstWeek: 'і=i, и=ı, ї=yi, є=ye. Rusça\'dan farkları öğren.',
    rules: const [
      SoundRule(written: 'і', heard: 'i (ince)', example: 'він', exampleSaid: 'vin', why: 'Rusça и\'dan farklı.'),
      SoundRule(written: 'и', heard: 'ı (kalın)', example: 'ми', exampleSaid: 'mı', why: 'Türkçe ı\'ya yakın.'),
      SoundRule(written: 'ї', heard: 'yi', example: 'їжа', exampleSaid: 'yija', why: 'y+i birleşik.'),
    ],
    traps: const [
      LangTrap('Rusça ≠ Ukraynaca', 'Farklı dil!'),
      LangTrap('ґ vs г', 'ґ = g, г = h.'),
    ],
  ),
  LearnLang.he: LanguageGuide(
    lang: LearnLang.he,
    headline: 'İbranice: sağdan sola + sesli harf az',
    intro: 'İbranice sağdan sola yazılır. Sesli harfler genelde yazılmaz (nikkud hariç).',
    firstWeek: 'Sağdan sola. 22 harf öğren. ח vs כ\'yi ayır.',
    rules: const [
      SoundRule(written: 'ח', heard: 'boğaz h', example: 'חלב', exampleSaid: 'halav', why: 'Arapça ح\'ya yakın.'),
      SoundRule(written: 'כ/ך', heard: 'k veya h', example: 'כלב', exampleSaid: 'kelev', why: 'Bazen k, bazen h.'),
      SoundRule(written: 'ר', heard: 'r (boğazdan)', example: 'ראש', exampleSaid: 'roş', why: 'Fransızca r\'ye yakın.'),
    ],
    traps: const [
      LangTrap('Sesli harf yok', 'Bağlamdan okursun.'),
      LangTrap('Sağdan sola', 'Sayılar soldan sağa!'),
    ],
  ),
  LearnLang.fa: LanguageGuide(
    lang: LearnLang.fa,
    headline: 'Farsça: Arap alfabesi + ek harfler',
    intro: 'Farsça Arap harfleri kullanır ama gramer çok farklı. پ چ ژ گ Farsça\'ya özel.',
    firstWeek: 'Arap harfleri + پ چ ژ گ. Farsça ezafe yapısını duy.',
    rules: const [
      SoundRule(written: 'پ', heard: 'p', example: 'پدر', exampleSaid: 'pedar', why: 'Arapça\'da yok.'),
      SoundRule(written: 'چ', heard: 'ç', example: 'چای', exampleSaid: 'çay', why: 'Türkçe ç.'),
      SoundRule(written: 'ژ', heard: 'j (Fransızca)', example: 'ژاپن', exampleSaid: 'japon', why: 'Yumuşak j.'),
    ],
    traps: const [
      LangTrap('Arapça ≠ Farsça', 'Farklı dil, benzer alfabe.'),
      LangTrap('Ezafe', 'e/ye bağlantı sesi.'),
    ],
  ),
  LearnLang.sw: LanguageGuide(
    lang: LearnLang.sw,
    headline: 'Svahili: Bantu + Arapça etki, fonetik',
    intro: 'Svahili Latin harfli, fonetik. Sınıf sistemi (m-, wa-, ki-, vi- gibi ön ekler) ana kural.',
    firstWeek: 'Fonetik oku. ng = ŋ. Sınıf eklerini tanı.',
    rules: const [
      SoundRule(written: 'ng', heard: 'ŋ (nazal)', example: 'ngombe', exampleSaid: 'ŋombe', why: 'Tek nazal ses.'),
      SoundRule(written: 'dh', heard: 'ð (peltek d)', example: 'dhahabu', exampleSaid: 'ðahabu', why: 'İngilizce th gibi.'),
      SoundRule(written: 'ny', heard: 'ñ', example: 'nyumba', exampleSaid: 'ñumba', why: 'Burundan y.'),
    ],
    traps: const [
      LangTrap('Sınıf sistemi', 'm-tu / wa-tu. Ön ek anlam verir.'),
      LangTrap('Arapça kelimeler', 'Çok Arapça ödünç var.'),
    ],
  ),
};

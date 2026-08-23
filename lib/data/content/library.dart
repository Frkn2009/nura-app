import '../models/models.dart';

class LibrarySentence {
  const LibrarySentence({required this.target, required this.glossTr});
  final String target;
  final String glossTr;
}

class LibraryStory {
  const LibraryStory({
    required this.id,
    required this.lang,
    required this.level,
    required this.title,
    required this.titleTr,
    required this.sentences,
  });
  final String id;
  final LearnLang lang;
  final Cefr level;
  final String title;
  final String titleTr;
  final List<LibrarySentence> sentences;
}

/// NURA kitaplığı — seviyeye göre kısa okuma parçaları. Sesler cihaz TTS'i
/// ile okunur (bkz. StoryReaderScreen); metinler gerçek, dilbilgisi olarak
/// doğru cümlelerdir, otomatik çeviri değildir.
class NuraLibrary {
  static List<LibraryStory> forLang(LearnLang lang) =>
      _all.where((s) => s.lang == lang).toList(growable: false);

  static LibraryStory? byId(String id) {
    for (final story in _all) {
      if (story.id == id) return story;
    }
    return null;
  }

  static const _all = <LibraryStory>[
    LibraryStory(
      id: 'en_first_day',
      lang: LearnLang.en,
      level: Cefr.a1,
      title: 'First Day',
      titleTr: 'İlk Gün',
      sentences: [
        LibrarySentence(
          target: 'Today is my first day at work.',
          glossTr: 'Bugün işteki ilk günüm.',
        ),
        LibrarySentence(
          target: 'I wake up early and drink my coffee.',
          glossTr: 'Erken kalkıp kahvemi içiyorum.',
        ),
        LibrarySentence(
          target: 'The office is not far from my house.',
          glossTr: 'Ofis evimden uzak değil.',
        ),
        LibrarySentence(
          target: 'My new colleagues are very friendly.',
          glossTr: 'Yeni iş arkadaşlarım çok samimi.',
        ),
        LibrarySentence(
          target: 'I am a little nervous, but also happy.',
          glossTr: 'Biraz heyecanlıyım, ama aynı zamanda mutluyum.',
        ),
      ],
    ),
    LibraryStory(
      id: 'en_weekend',
      lang: LearnLang.en,
      level: Cefr.a1,
      title: 'Weekend Plan',
      titleTr: 'Hafta Sonu Planı',
      sentences: [
        LibrarySentence(
          target: 'This weekend I want to visit my grandmother.',
          glossTr: 'Bu hafta sonu büyükannemi ziyaret etmek istiyorum.',
        ),
        LibrarySentence(
          target: 'She lives in a small village near the sea.',
          glossTr: 'Denizin yakınında küçük bir köyde yaşıyor.',
        ),
        LibrarySentence(
          target: 'We usually cook together and talk for hours.',
          glossTr: 'Genelde birlikte yemek yapıp saatlerce konuşuruz.',
        ),
        LibrarySentence(
          target: 'In the evening, we watch the sunset from her garden.',
          glossTr: 'Akşam, bahçesinden gün batımını izleriz.',
        ),
        LibrarySentence(
          target: 'I always feel calm when I am there.',
          glossTr: 'Orada olduğumda hep sakin hissederim.',
        ),
      ],
    ),
    LibraryStory(
      id: 'es_mercado',
      lang: LearnLang.es,
      level: Cefr.a1,
      title: 'El Mercado',
      titleTr: 'Pazar',
      sentences: [
        LibrarySentence(
          target: 'Los sábados voy al mercado con mi madre.',
          glossTr: 'Cumartesileri annemle pazara giderim.',
        ),
        LibrarySentence(
          target: 'Compramos frutas frescas y verduras.',
          glossTr: 'Taze meyve ve sebze alırız.',
        ),
        LibrarySentence(
          target: 'El mercado está lleno de gente y colores.',
          glossTr: 'Pazar insan ve renklerle dolu.',
        ),
        LibrarySentence(
          target: 'Me gusta probar el pan recién horneado.',
          glossTr: 'Yeni pişmiş ekmeği tatmayı severim.',
        ),
        LibrarySentence(
          target: 'Volvemos a casa con muchas bolsas.',
          glossTr: 'Eve bir sürü torbayla döneriz.',
        ),
      ],
    ),
    LibraryStory(
      id: 'es_amigo',
      lang: LearnLang.es,
      level: Cefr.a1,
      title: 'Un Amigo Nuevo',
      titleTr: 'Yeni Bir Arkadaş',
      sentences: [
        LibrarySentence(
          target: 'Ayer conocí a un chico en el parque.',
          glossTr: 'Dün parkta bir çocukla tanıştım.',
        ),
        LibrarySentence(
          target: 'Él también estudia español, como yo.',
          glossTr: 'O da benim gibi İspanyolca öğreniyor.',
        ),
        LibrarySentence(
          target: 'Hablamos sobre música y películas.',
          glossTr: 'Müzik ve filmler hakkında konuştuk.',
        ),
        LibrarySentence(
          target: 'Ahora somos amigos y practicamos juntos.',
          glossTr: 'Şimdi arkadaşız ve birlikte pratik yapıyoruz.',
        ),
        LibrarySentence(
          target: 'Espero verlo otra vez la próxima semana.',
          glossTr: 'Onu gelecek hafta tekrar görmeyi umuyorum.',
        ),
      ],
    ),
    LibraryStory(
      id: 'de_regentag',
      lang: LearnLang.de,
      level: Cefr.a1,
      title: 'Der Regentag',
      titleTr: 'Yağmurlu Gün',
      sentences: [
        LibrarySentence(
          target: 'Heute regnet es den ganzen Tag.',
          glossTr: 'Bugün bütün gün yağmur yağıyor.',
        ),
        LibrarySentence(
          target: 'Ich bleibe zu Hause und lese ein Buch.',
          glossTr: 'Evde kalıp bir kitap okuyorum.',
        ),
        LibrarySentence(
          target: 'Meine Katze schläft neben mir auf dem Sofa.',
          glossTr: 'Kedim yanımda kanepede uyuyor.',
        ),
        LibrarySentence(
          target: 'Später koche ich eine warme Suppe.',
          glossTr: 'Sonra sıcak bir çorba pişiriyorum.',
        ),
        LibrarySentence(
          target: 'Regentage sind manchmal sehr gemütlich.',
          glossTr: 'Yağmurlu günler bazen çok keyiflidir.',
        ),
      ],
    ),
    LibraryStory(
      id: 'de_reise',
      lang: LearnLang.de,
      level: Cefr.a1,
      title: 'Die Reise',
      titleTr: 'Yolculuk',
      sentences: [
        LibrarySentence(
          target: 'Nächsten Monat fliege ich nach Berlin.',
          glossTr: 'Gelecek ay Berlin\'e uçuyorum.',
        ),
        LibrarySentence(
          target: 'Ich habe noch nie eine große Stadt besucht.',
          glossTr: 'Daha önce hiç büyük bir şehir ziyaret etmedim.',
        ),
        LibrarySentence(
          target: 'Meine Freundin zeigt mir die schönsten Orte.',
          glossTr: 'Arkadaşım bana en güzel yerleri gösterecek.',
        ),
        LibrarySentence(
          target: 'Wir wollen auch viele Fotos machen.',
          glossTr: 'Ayrıca bir sürü fotoğraf çekmek istiyoruz.',
        ),
        LibrarySentence(
          target: 'Ich bin sehr aufgeregt für die Reise.',
          glossTr: 'Yolculuk için çok heyecanlıyım.',
        ),
      ],
    ),
    LibraryStory(
      id: 'fr_cafe',
      lang: LearnLang.fr,
      level: Cefr.a1,
      title: 'Le Café du Matin',
      titleTr: 'Sabah Kahvesi',
      sentences: [
        LibrarySentence(
          target: 'Chaque matin, je bois un café avant le travail.',
          glossTr: 'Her sabah işten önce kahve içerim.',
        ),
        LibrarySentence(
          target: 'Le café est près de chez moi.',
          glossTr: 'Kafe evimin yakınında.',
        ),
        LibrarySentence(
          target: 'Le serveur connaît toujours ma commande.',
          glossTr: 'Garson her zaman siparişimi bilir.',
        ),
        LibrarySentence(
          target: "J'aime lire le journal pendant dix minutes.",
          glossTr: 'On dakika gazete okumayı severim.',
        ),
        LibrarySentence(
          target: 'Ensuite, je pars travailler content.',
          glossTr: 'Sonra mutlu bir şekilde işe giderim.',
        ),
      ],
    ),
    LibraryStory(
      id: 'fr_grandmere',
      lang: LearnLang.fr,
      level: Cefr.a1,
      title: 'La Cuisine de Grand-mère',
      titleTr: 'Büyükannenin Mutfağı',
      sentences: [
        LibrarySentence(
          target: 'Ma grand-mère cuisine très bien.',
          glossTr: 'Büyükannem çok iyi yemek yapar.',
        ),
        LibrarySentence(
          target: 'Chaque dimanche, toute la famille se réunit.',
          glossTr: 'Her pazar bütün aile bir araya gelir.',
        ),
        LibrarySentence(
          target: 'Elle prépare une soupe et du pain frais.',
          glossTr: 'Bir çorba ve taze ekmek hazırlar.',
        ),
        LibrarySentence(
          target: 'Nous parlons et rions autour de la table.',
          glossTr: 'Masanın etrafında konuşur ve güleriz.',
        ),
        LibrarySentence(
          target: 'Ces moments sont très importants pour moi.',
          glossTr: 'Bu anlar benim için çok önemli.',
        ),
      ],
    ),
    LibraryStory(
      id: 'ar_madina',
      lang: LearnLang.ar,
      level: Cefr.a1,
      title: 'يوم في المدينة',
      titleTr: 'Şehirde Bir Gün',
      sentences: [
        LibrarySentence(
          target: 'أذهب إلى المدينة كل يوم جمعة.',
          glossTr: 'Her Cuma günü şehre giderim.',
        ),
        LibrarySentence(
          target: 'أزور السوق وأشتري الفواكه.',
          glossTr: 'Pazarı ziyaret eder ve meyve alırım.',
        ),
        LibrarySentence(
          target: 'أحب الجلوس في مقهى صغير.',
          glossTr: 'Küçük bir kafede oturmayı severim.',
        ),
        LibrarySentence(
          target: 'أشاهد الناس وأشرب الشاي.',
          glossTr: 'İnsanları izler ve çay içerim.',
        ),
        LibrarySentence(
          target: 'أعود إلى البيت مساءً.',
          glossTr: 'Akşam eve dönerim.',
        ),
      ],
    ),
    LibraryStory(
      id: 'ar_sadiqa',
      lang: LearnLang.ar,
      level: Cefr.a1,
      title: 'صديقتي الجديدة',
      titleTr: 'Yeni Arkadaşım',
      sentences: [
        LibrarySentence(
          target: 'قابلت صديقة جديدة في الجامعة.',
          glossTr: 'Üniversitede yeni bir arkadaş tanıdım.',
        ),
        LibrarySentence(
          target: 'هي تتحدث العربية والإنجليزية.',
          glossTr: 'O Arapça ve İngilizce konuşuyor.',
        ),
        LibrarySentence(
          target: 'ندرس معًا كل أسبوع.',
          glossTr: 'Her hafta birlikte ders çalışıyoruz.',
        ),
        LibrarySentence(
          target: 'نشرب القهوة ونتحدث كثيرًا.',
          glossTr: 'Kahve içip çok konuşuyoruz.',
        ),
        LibrarySentence(
          target: 'أنا سعيدة بهذه الصداقة.',
          glossTr: 'Bu arkadaşlıktan mutluyum.',
        ),
      ],
    ),
  ];
}

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
    LibraryStory(
      id: 'pt_first_day',
      lang: LearnLang.pt,
      level: Cefr.a1,
      title: 'O primeiro dia de trabalho',
      titleTr: 'İlk İş Günü',
      sentences: [
        LibrarySentence(
          target: 'Ontem foi meu primeiro dia no novo emprego.',
          glossTr: 'Dün yeni işimdeki ilk günüm oldu.',
        ),
        LibrarySentence(
          target: 'O escritório é bonito e o meu chefe é simpático.',
          glossTr: 'Ofis güzel, patronum da kibar.',
        ),
        LibrarySentence(
          target: 'De manhã, tomei um café e comi um pão.',
          glossTr: 'Sabah bir kahve içtim ve ekmek yedim.',
        ),
        LibrarySentence(
          target: 'No almoço, falei com os colegas.',
          glossTr: 'Öğle yemeğinde iş arkadaşlarımla konuştum.',
        ),
        LibrarySentence(
          target: 'À tarde, trabalhei com documentos.',
          glossTr: 'Öğleden sonra belgelerle çalıştım.',
        ),
        LibrarySentence(
          target: 'Hoje estou cansado, mas feliz.',
          glossTr: 'Bugün yorgun ama mutluyum.',
        ),
      ],
    ),
    LibraryStory(
      id: 'pt_sunny_day',
      lang: LearnLang.pt,
      level: Cefr.a1,
      title: 'Um dia de sol',
      titleTr: 'Güneşli Bir Gün',
      sentences: [
        LibrarySentence(
          target: 'Hoje o tempo está muito bom, com sol e vento leve.',
          glossTr: 'Bugün hava çok güzel, güneşli ve hafif rüzgarlı.',
        ),
        LibrarySentence(
          target: 'No sábado de manhã, fui ao parque com os meus amigos.',
          glossTr: 'Cumartesi sabahı arkadaşlarımla parka gittim.',
        ),
        LibrarySentence(
          target: 'Sentamos na relva e conversamos.',
          glossTr: 'Çimlere oturup sohbet ettik.',
        ),
        LibrarySentence(
          target: 'Almoçamos sanduíches e frutas.',
          glossTr: 'Öğle yemeğinde sandviç ve meyve yedik.',
        ),
        LibrarySentence(
          target: 'À tarde, ouvimos música e brincamos.',
          glossTr: 'Öğleden sonra müzik dinledik ve oyunlar oynadık.',
        ),
        LibrarySentence(
          target: 'Foi um dia perfeito para mim.',
          glossTr: 'Benim için mükemmel bir gündü.',
        ),
      ],
    ),
    LibraryStory(
      id: 'pt_market',
      lang: LearnLang.pt,
      level: Cefr.a1,
      title: 'Na feira',
      titleTr: 'Pazar Günü',
      sentences: [
        LibrarySentence(
          target: 'Toda semana, vou à feira no sábado.',
          glossTr: 'Her hafta cumartesi pazar yerine gidiyorum.',
        ),
        LibrarySentence(
          target: 'Lá compro legumes, frutas e pão fresco.',
          glossTr: 'Orada sebzeler, meyveler ve taze ekmek alıyorum.',
        ),
        LibrarySentence(
          target: 'A feira tem muitas cores e bons cheiros.',
          glossTr: 'Pazar çok renkli ve güzel kokularla dolu.',
        ),
        LibrarySentence(
          target: 'Ontem comprei tomates, alface e queijo.',
          glossTr: 'Dün domates, marul ve peynir aldım.',
        ),
        LibrarySentence(
          target: 'No domingo, fiz uma salada grande.',
          glossTr: 'Pazar günü büyük bir salata yaptım.',
        ),
        LibrarySentence(
          target: 'Minha família adorou a salada.',
          glossTr: 'Ailem salatanın tadını çok çıkardı.',
        ),
      ],
    ),
    LibraryStory(
      id: 'it_family',
      lang: LearnLang.it,
      level: Cefr.a1,
      title: 'La mia famiglia',
      titleTr: 'Ailem',
      sentences: [
        LibrarySentence(
          target: 'Mio padre è medico e mia madre insegna in una scuola.',
          glossTr: 'Babam doktor, annem bir okulda öğretmen.',
        ),
        LibrarySentence(
          target: 'Abbiamo una casa piccola ma bella, vicino al centro.',
          glossTr: 'Merkeze yakın küçük ama güzel bir evimiz var.',
        ),
        LibrarySentence(
          target: 'La domenica siamo sempre tutti a casa.',
          glossTr: 'Pazar günü hepimiz her zaman evdeyiz.',
        ),
        LibrarySentence(
          target: 'Prepariamo la pasta e guardiamo un film.',
          glossTr: 'Makarna yapıp bir film izliyoruz.',
        ),
        LibrarySentence(
          target: 'La sera mangiamo insieme e parliamo di tante cose.',
          glossTr:
              'Akşam birlikte yemek yiyip birçok konu hakkında konuşuyoruz.',
        ),
        LibrarySentence(
          target: 'La domenica per me è il giorno più bello della settimana.',
          glossTr: 'Pazar benim için haftanın en güzel günü.',
        ),
      ],
    ),
    LibraryStory(
      id: 'it_my_job',
      lang: LearnLang.it,
      level: Cefr.a1,
      title: 'Il mio lavoro',
      titleTr: 'Benim İşim',
      sentences: [
        LibrarySentence(
          target: 'Lavoro in un ufficio vicino alla stazione.',
          glossTr: 'İstasyona yakın bir ofiste çalışıyorum.',
        ),
        LibrarySentence(
          target: 'Ogni mattina prendo il treno e arrivo in ufficio alle nove.',
          glossTr: 'Her sabah trene biniyorum ve ofise dokuzda varıyorum.',
        ),
        LibrarySentence(
          target: 'Di solito lavoro al computer e parlo con i clienti.',
          glossTr: 'Genelde bilgisayarla çalışıp müşterilerle konuşuyorum.',
        ),
        LibrarySentence(
          target: 'A mezzogiorno mangio un panino con i colleghi.',
          glossTr: 'Öğle saatlerinde iş arkadaşlarımla bir sandviç yiyorum.',
        ),
        LibrarySentence(
          target: 'Alle sei finisco il lavoro e torno a casa.',
          glossTr: 'Altıda işi bitirip eve dönüyorum.',
        ),
        LibrarySentence(
          target: 'La sera leggo o guardo la televisione.',
          glossTr: 'Akşam kitap okuyorum ya da televizyon izliyorum.',
        ),
      ],
    ),
    LibraryStory(
      id: 'it_beach_vacation',
      lang: LearnLang.it,
      level: Cefr.a1,
      title: 'Una vacanza al mare',
      titleTr: 'Deniz Kenarında Tatil',
      sentences: [
        LibrarySentence(
          target: 'In agosto andiamo al mare con la mia famiglia.',
          glossTr: 'Ağustos ayında ailemle denize gidiyoruz.',
        ),
        LibrarySentence(
          target: "L'hotel è piccolo, ma la stanza è molto comoda.",
          glossTr: 'Otel küçük, ama oda çok konforlu.',
        ),
        LibrarySentence(
          target: 'Ogni mattina nuotiamo in mare e dopo mangiamo una pizza.',
          glossTr: 'Her sabah denizde yüzüyor, sonra bir pizza yiyoruz.',
        ),
        LibrarySentence(
          target:
              'Il pomeriggio di solito restiamo al bar, perché fa molto caldo.',
          glossTr:
              'Öğleden sonra genellikle barda kalıyoruz, çünkü hava çok sıcak.',
        ),
        LibrarySentence(
          target: 'La sera camminiamo sulla spiaggia e guardiamo le stelle.',
          glossTr: 'Akşam plajda yürüyüp yıldızlara bakıyoruz.',
        ),
        LibrarySentence(
          target: 'È sempre una vacanza molto bella.',
          glossTr: 'Her zaman çok güzel bir tatil.',
        ),
      ],
    ),
    LibraryStory(
      id: 'ru_my_friend',
      lang: LearnLang.ru,
      level: Cefr.a1,
      title: 'Мой друг',
      titleTr: 'Arkadaşım',
      sentences: [
        LibrarySentence(
          target: 'У меня есть друг.',
          glossTr: 'Bir arkadaşım var.',
        ),
        LibrarySentence(
          target: 'Его зовут Дима, и он живёт рядом со мной.',
          glossTr: 'Adı Dima ve yanımda yaşıyor.',
        ),
        LibrarySentence(
          target: 'По субботам мы гуляем в парке.',
          glossTr: 'Cumartesi günleri parkta yürüyoruz.',
        ),
        LibrarySentence(
          target: 'Мы любим музыку и спорт.',
          glossTr: 'Müzik ve sporu seviyoruz.',
        ),
        LibrarySentence(
          target: 'На прошлых выходных мы играли в футбол.',
          glossTr: 'Geçen hafta sonu futbol oynadık.',
        ),
        LibrarySentence(
          target: 'Вечером Дима пришёл ко мне, и мы пили чай.',
          glossTr: 'Akşam Dima bana geldi, çay içtik.',
        ),
      ],
    ),
    LibraryStory(
      id: 'ru_weather',
      lang: LearnLang.ru,
      level: Cefr.a1,
      title: 'Погода',
      titleTr: 'Hava',
      sentences: [
        LibrarySentence(
          target: 'Сегодня утром было холодно.',
          glossTr: 'Bu sabah hava soğuktu.',
        ),
        LibrarySentence(
          target: 'Днём пошёл дождь.',
          glossTr: 'Öğlen yağmur başladı.',
        ),
        LibrarySentence(
          target: 'Я взял зонт и пошёл на работу.',
          glossTr: 'Şemsiyemi alıp işe gittim.',
        ),
        LibrarySentence(
          target: 'На работе было тепло.',
          glossTr: 'İş yerinde sıcaktı.',
        ),
        LibrarySentence(
          target: 'Вечером дождь закончился, и выглянуло солнце.',
          glossTr: 'Akşam yağmur durdu, güneş çıktı.',
        ),
        LibrarySentence(
          target: 'Я позвонил другу и пригласил его гулять.',
          glossTr: 'Arkadaşıma telefon edip yürüyüşe davet ettim.',
        ),
      ],
    ),
    LibraryStory(
      id: 'ru_at_the_store',
      lang: LearnLang.ru,
      level: Cefr.a1,
      title: 'В магазине',
      titleTr: 'Mağazada',
      sentences: [
        LibrarySentence(
          target: 'В воскресенье утром я пошёл в магазин.',
          glossTr: 'Pazar sabahı mağazaya gittim.',
        ),
        LibrarySentence(
          target: 'Я купил хлеб, молоко и яблоки.',
          glossTr: 'Ekmek, süt ve elma aldım.',
        ),
        LibrarySentence(
          target: 'У меня был список, поэтому я ничего не забыл.',
          glossTr: 'Bir listem vardı, bu yüzden hiçbir şeyi unutmadım.',
        ),
        LibrarySentence(
          target: 'В магазине была очередь, но она была короткая.',
          glossTr: 'Mağazada kuyruk vardı, ama kısaydı.',
        ),
        LibrarySentence(
          target: 'После магазина я сделал большой завтрак.',
          glossTr: 'Mağazadan sonra büyük bir kahvaltı hazırladım.',
        ),
        LibrarySentence(
          target: 'С кофе и сыром завтрак был отличный.',
          glossTr: 'Kahve ve peynirle kahvaltı harikaydı.',
        ),
      ],
    ),
    LibraryStory(
      id: 'zh_weekend',
      lang: LearnLang.zh,
      level: Cefr.a1,
      title: '周末',
      titleTr: 'Hafta Sonu',
      sentences: [
        LibrarySentence(
          target: '星期六早上，我去了公园。',
          glossTr: 'Cumartesi sabahı parka gittim.',
        ),
        LibrarySentence(
          target: '我和朋友一起散步。',
          glossTr: 'Arkadaşımla birlikte yürüdük.',
        ),
        LibrarySentence(
          target: '公园里有花，还有小鸟。',
          glossTr: 'Parkta çiçekler ve küçük kuşlar vardı.',
        ),
        LibrarySentence(
          target: '中午，我们吃面。',
          glossTr: 'Öğle yemeğinde noodle yedik.',
        ),
        LibrarySentence(
          target: '面条很好吃，我们都很开心。',
          glossTr: 'Noodle çok lezzetliydi, hepimiz çok mutlu olduk.',
        ),
        LibrarySentence(target: '这个周末很好。', glossTr: 'Bu hafta sonu güzeldi.'),
      ],
    ),
    LibraryStory(
      id: 'zh_my_job',
      lang: LearnLang.zh,
      level: Cefr.a1,
      title: '我的工作',
      titleTr: 'Benim İşim',
      sentences: [
        LibrarySentence(
          target: '我在医院当医生。',
          glossTr: 'Hastanede doktor olarak çalışıyorum.',
        ),
        LibrarySentence(
          target: '我每天早上八点去上班。',
          glossTr: 'Her sabah sekizde işe gidiyorum.',
        ),
        LibrarySentence(
          target: '我的工作是帮病人。',
          glossTr: 'İşim hastalara yardım etmek.',
        ),
        LibrarySentence(
          target: '中午在医院吃饭。',
          glossTr: 'Öğle yemeğini hastanede yiyorum.',
        ),
        LibrarySentence(
          target: '晚上我回家，给妈妈打电话。',
          glossTr: 'Akşam eve dönüyorum, anneme telefon ediyorum.',
        ),
        LibrarySentence(
          target: '工作很累，但我喜欢。',
          glossTr: 'İş yorucu, ama seviyorum.',
        ),
      ],
    ),
    LibraryStory(
      id: 'zh_shopping',
      lang: LearnLang.zh,
      level: Cefr.a1,
      title: '买东西',
      titleTr: 'Alışveriş',
      sentences: [
        LibrarySentence(
          target: '今天天气很好，我去了超市。',
          glossTr: 'Bugün hava çok güzel, süpermarkete gittim.',
        ),
        LibrarySentence(
          target: '超市里的人很多，东西很新鲜。',
          glossTr: 'Süpermarkette çok insan vardı, ürünler çok taze.',
        ),
        LibrarySentence(
          target: '我买了蔬菜、水果和面包。',
          glossTr: 'Sebze, meyve ve ekmek aldım.',
        ),
        LibrarySentence(
          target: '我带了一个大袋子回家。',
          glossTr: 'Büyük bir poşetle eve döndüm.',
        ),
        LibrarySentence(
          target: '下午我在家里做饭。',
          glossTr: 'Öğleden sonra evde yemek yaptım.',
        ),
        LibrarySentence(
          target: '晚上，我和家人一起吃饭。',
          glossTr: 'Akşam ailemle birlikte yemek yedik.',
        ),
      ],
    ),
    LibraryStory(
      id: 'ja_weekend',
      lang: LearnLang.ja,
      level: Cefr.a1,
      title: '週末',
      titleTr: 'Hafta Sonu',
      sentences: [
        LibrarySentence(
          target: '土曜日の朝、公園に行きました。',
          glossTr: 'Cumartesi sabahı parka gittim.',
        ),
        LibrarySentence(target: '友達と散歩しました。', glossTr: 'Arkadaşımla yürüdük.'),
        LibrarySentence(
          target: '公園には花がたくさんありました。',
          glossTr: 'Parkta çok çiçek vardı.',
        ),
        LibrarySentence(target: '昼はラーメンを食べました。', glossTr: 'Öğlen ramen yedik.'),
        LibrarySentence(
          target: 'ラーメンはとてもおいしかったです。',
          glossTr: 'Ramen çok lezzetliydi.',
        ),
        LibrarySentence(
          target: 'いい週末でした。',
          glossTr: 'Güzel bir hafta sonuydu.',
        ),
      ],
    ),
    LibraryStory(
      id: 'ja_my_job',
      lang: LearnLang.ja,
      level: Cefr.a1,
      title: '私の仕事',
      titleTr: 'Benim İşim',
      sentences: [
        LibrarySentence(
          target: '私は会社の近くに住んでいます。',
          glossTr: 'Şirketin yakınında oturuyorum.',
        ),
        LibrarySentence(
          target: '朝は電車で会社に行きます。',
          glossTr: 'Sabahları trenle şirkete gidiyorum.',
        ),
        LibrarySentence(
          target: '午前中はパソコンで仕事をします。',
          glossTr: 'Öğlene kadar bilgisayarla çalışıyorum.',
        ),
        LibrarySentence(
          target: '昼は友達と昼ご飯を食べます。',
          glossTr: 'Öğlen arkadaşlarımla yemek yiyorum.',
        ),
        LibrarySentence(
          target: '六時に仕事を終えます。',
          glossTr: 'Altıda işi bitiriyorum.',
        ),
        LibrarySentence(
          target: '夜は家でゆっくり休みます。',
          glossTr: 'Akşam evde rahatça dinleniyorum.',
        ),
      ],
    ),
    LibraryStory(
      id: 'ja_weather',
      lang: LearnLang.ja,
      level: Cefr.a1,
      title: '天気',
      titleTr: 'Hava Durumu',
      sentences: [
        LibrarySentence(target: '今日はお天気がいいです。', glossTr: 'Bugün hava güzel.'),
        LibrarySentence(target: '朝は少し寒かったです。', glossTr: 'Sabah biraz soğuktu.'),
        LibrarySentence(target: '昼は雨が降りました。', glossTr: 'Öğlen yağmur yağdı.'),
        LibrarySentence(
          target: '私は傘を持って出かけました。',
          glossTr: 'Şemsiyemi alıp dışarı çıktım.',
        ),
        LibrarySentence(target: '夜は雨が終わりました。', glossTr: 'Akşam yağmur durdu.'),
        LibrarySentence(
          target: '明日はきっと晴れます。',
          glossTr: 'Yarın kesinlikle güneşli olacak.',
        ),
      ],
    ),
    LibraryStory(
      id: 'ko_my_friend',
      lang: LearnLang.ko,
      level: Cefr.a1,
      title: '내 친구',
      titleTr: 'Arkadaşım',
      sentences: [
        LibrarySentence(
          target: '내 친구 이름은 민준입니다.',
          glossTr: 'Arkadaşımın adı Minjun.',
        ),
        LibrarySentence(
          target: '그는 우리 회사에서 일합니다.',
          glossTr: 'O bizim şirketimizde çalışıyor.',
        ),
        LibrarySentence(
          target: '토요일에 우리는 공원에 갑니다.',
          glossTr: 'Cumartesi günleri parka gideriz.',
        ),
        LibrarySentence(
          target: '우리는 음악과 운동을 좋아합니다.',
          glossTr: 'Müzik ve sporu seviyoruz.',
        ),
        LibrarySentence(
          target: '지난 주말에 우리는 축구했습니다.',
          glossTr: 'Geçen hafta sonu futbol oynadık.',
        ),
        LibrarySentence(
          target: '저녁에 민준이 집에 왔고, 우리는 차를 마셨습니다.',
          glossTr: 'Akşam Minjun bana geldi, çay içtik.',
        ),
      ],
    ),
    LibraryStory(
      id: 'ko_weather',
      lang: LearnLang.ko,
      level: Cefr.a1,
      title: '날씨',
      titleTr: 'Hava',
      sentences: [
        LibrarySentence(target: '오늘 아침은 춥습니다.', glossTr: 'Bugün sabah soğuk.'),
        LibrarySentence(target: '낮에는 비가 왔습니다.', glossTr: 'Öğlen yağmur yağdı.'),
        LibrarySentence(
          target: '우산을 가지고 회사에 갔습니다.',
          glossTr: 'Şemsiyemi alıp şirkete gittim.',
        ),
        LibrarySentence(
          target: '회사에서는 따뜻하고 편했습니다.',
          glossTr: 'Şirkette sıcak ve rahattı.',
        ),
        LibrarySentence(
          target: '저녁에 비가 그쳤습니다.',
          glossTr: 'Akşam yağmur durdu.',
        ),
        LibrarySentence(
          target: '친구에게 전화를 걸고 산책하자고 했습니다.',
          glossTr: 'Arkadaşıma telefon edip yürüyüşe çıkmayı teklif ettim.',
        ),
      ],
    ),
    LibraryStory(
      id: 'ko_shopping',
      lang: LearnLang.ko,
      level: Cefr.a1,
      title: '장보기',
      titleTr: 'Alışveriş',
      sentences: [
        LibrarySentence(
          target: '일요일 아침에 저는 시장에 갔습니다.',
          glossTr: 'Pazar sabahı pazara gittim.',
        ),
        LibrarySentence(
          target: '빵, 우유, 사과를 샀습니다.',
          glossTr: 'Ekmek, süt ve elma aldım.',
        ),
        LibrarySentence(
          target: '시장에서 물건은 싼 편입니다.',
          glossTr: 'Pazarda ürünler nispeten ucuz.',
        ),
        LibrarySentence(
          target: '저는 목록을 가지고 가서 아무것도 잊지 않았습니다.',
          glossTr: 'Listemi alıp gittim, hiçbir şeyi unutmadım.',
        ),
        LibrarySentence(
          target: '집에 돌아와서 맛있는 아침을 만들었습니다.',
          glossTr: 'Eve dönüp lezzetli bir kahvaltı hazırladım.',
        ),
        LibrarySentence(
          target: '커피를 마시고 아침을 먹었습니다.',
          glossTr: 'Kahve içip kahvaltı yaptım.',
        ),
      ],
    ),
    LibraryStory(
      id: 'hi_my_weekend',
      lang: LearnLang.hi,
      level: Cefr.a1,
      title: 'मेरा वीकेंड',
      titleTr: 'Benim Hafta Sonum',
      sentences: [
        LibrarySentence(
          target: 'शनिवार की सुबह मैं पार्क गया।',
          glossTr: 'Cumartesi sabahı parka gittim.',
        ),
        LibrarySentence(
          target: 'मैंने दोस्तों के साथ सैर की।',
          glossTr: 'Arkadaşlarımla yürüyüş yaptım.',
        ),
        LibrarySentence(
          target: 'पार्क में फूल और पक्षी थे।',
          glossTr: 'Parkta çiçekler ve kuşlar vardı.',
        ),
        LibrarySentence(
          target: 'दोपहर में हमने चावल और सब्ज़ी खाई।',
          glossTr: 'Öğlen pirinç ve sebze yedik.',
        ),
        LibrarySentence(target: 'सब खुश थे।', glossTr: 'Herkes mutluydu.'),
        LibrarySentence(
          target: 'यह एक अच्छा वीकेंड था।',
          glossTr: 'Bu güzel bir hafta sonuydu.',
        ),
      ],
    ),
    LibraryStory(
      id: 'hi_my_job',
      lang: LearnLang.hi,
      level: Cefr.a1,
      title: 'मेरा काम',
      titleTr: 'Benim İşim',
      sentences: [
        LibrarySentence(
          target: 'मैं एक अस्पताल में काम करता हूँ।',
          glossTr: 'Bir hastanede çalışıyorum.',
        ),
        LibrarySentence(
          target: 'मैं हर सुबह नौ बजे काम पर जाता हूँ।',
          glossTr: 'Her sabah dokuzda işe gidiyorum.',
        ),
        LibrarySentence(
          target: 'मेरा काम मरीज़ों की मदद करना है।',
          glossTr: 'İşim hastalara yardım etmek.',
        ),
        LibrarySentence(
          target: 'दोपहर में मैं अस्पताल में खाना खाता हूँ।',
          glossTr: 'Öğlen hastanede yemek yiyorum.',
        ),
        LibrarySentence(
          target: 'शाम को मैं घर लौटता हूँ।',
          glossTr: 'Akşam eve dönüyorum.',
        ),
        LibrarySentence(
          target: 'काम थका देता है, लेकिन मुझे यह पसंद है।',
          glossTr: 'İş yoruyor, ama seviyorum.',
        ),
      ],
    ),
    LibraryStory(
      id: 'hi_shopping',
      lang: LearnLang.hi,
      level: Cefr.a1,
      title: 'खरीदारी',
      titleTr: 'Alışveriş',
      sentences: [
        LibrarySentence(
          target: 'आज मौसम अच्छा था, इसलिए मैं सुपरमार्क गया।',
          glossTr: 'Bugün hava güzeldi, o yüzden süpermarkete gittim.',
        ),
        LibrarySentence(
          target: 'सुपरमार्क में बहुत लोग थे।',
          glossTr: 'Süpermarkette çok insan vardı.',
        ),
        LibrarySentence(
          target: 'मैंने सब्ज़ियाँ, फल और रोटी खरीदीं।',
          glossTr: 'Sebze, meyve ve ekmek aldım.',
        ),
        LibrarySentence(
          target: 'सब चीज़ें ताज़ी थीं।',
          glossTr: 'Her şey taze idi.',
        ),
        LibrarySentence(
          target: 'दोपहर में मैंने घर पर खाना बनाया।',
          glossTr: 'Öğleden sonra evde yemek yaptım.',
        ),
        LibrarySentence(
          target: 'शाम को मैंने अपने परिवार के साथ खाना खाया।',
          glossTr: 'Akşam ailemle birlikte yemek yedim.',
        ),
      ],
    ),
    LibraryStory(
      id: 'th_my_weekend',
      lang: LearnLang.th,
      level: Cefr.a1,
      title: 'สุดสัปดาห์ของฉัน',
      titleTr: 'Benim Hafta Sonum',
      sentences: [
        LibrarySentence(
          target: 'วันเสาร์เช้าฉันไปสวนสาธารณะ',
          glossTr: 'Cumartesi sabahı parka gittim.',
        ),
        LibrarySentence(
          target: 'ฉันเดินเล่นกับเพื่อน',
          glossTr: 'Arkadaşımla yürüdüm.',
        ),
        LibrarySentence(
          target: 'ในสวนมีดอกไม้และนก',
          glossTr: 'Parkta çiçekler ve kuşlar vardı.',
        ),
        LibrarySentence(
          target: 'ตอนเที่ยงเรากินก๋วยเตี๋ยว',
          glossTr: 'Öğlen noodle yedik.',
        ),
        LibrarySentence(
          target: 'ก๋วยเตี๋ยวอร่อยมาก',
          glossTr: 'Noodle çok lezzetliydi.',
        ),
        LibrarySentence(
          target: 'เป็นสุดสัปดาห์ที่ดีมาก',
          glossTr: 'Çok güzel bir hafta sonuydu.',
        ),
      ],
    ),
    LibraryStory(
      id: 'th_my_job',
      lang: LearnLang.th,
      level: Cefr.a1,
      title: 'งานของฉัน',
      titleTr: 'Benim İşim',
      sentences: [
        LibrarySentence(
          target: 'ฉันทำงานในสำนักงาน',
          glossTr: 'Bir ofiste çalışıyorum.',
        ),
        LibrarySentence(
          target: 'ทุกวันฉันนั่งรถเมล์ไปทำงาน',
          glossTr: 'Her gün otobüsle işe gidiyorum.',
        ),
        LibrarySentence(
          target: 'ตอนเช้าฉันใช้คอมพิวเตอร์ทำงาน',
          glossTr: 'Sabahları bilgisayarla çalışıyorum.',
        ),
        LibrarySentence(
          target: 'ตอนเที่ยงฉันกินข้าวกับเพื่อน',
          glossTr: 'Öğlen arkadaşlarımla yemek yiyorum.',
        ),
        LibrarySentence(
          target: 'หกโมงเย็นฉันเลิกงาน',
          glossTr: 'Altıda işten ayrılıyorum.',
        ),
        LibrarySentence(
          target: 'ตอนเย็นฉันดูทีวีที่บ้าน',
          glossTr: 'Akşam evde televizyon izliyorum.',
        ),
      ],
    ),
    LibraryStory(
      id: 'th_weather',
      lang: LearnLang.th,
      level: Cefr.a1,
      title: 'สภาพอากาศ',
      titleTr: 'Hava Durumu',
      sentences: [
        LibrarySentence(target: 'วันนี้อากาศดี', glossTr: 'Bugün hava güzel.'),
        LibrarySentence(
          target: 'เช้าอากาศเย็นเล็กน้อย',
          glossTr: 'Sabah hava biraz serin.',
        ),
        LibrarySentence(
          target: 'ตอนบ่ายฝนตก',
          glossTr: 'Öğleden sonra yağmur yağdı.',
        ),
        LibrarySentence(
          target: 'ฉันเอาร่มไปด้วย',
          glossTr: 'Yanımda şemsiye taşıdım.',
        ),
        LibrarySentence(
          target: 'ตอนเย็นฝนหยุด',
          glossTr: 'Akşam yağmur durdu.',
        ),
        LibrarySentence(
          target: 'พรุ่งนี้อากาศจะดี',
          glossTr: 'Yarın hava güzel olacak.',
        ),
      ],
    ),
    LibraryStory(
      id: 'el_family',
      lang: LearnLang.el,
      level: Cefr.a1,
      title: 'Η οικογένειά μου',
      titleTr: 'Ailem',
      sentences: [
        LibrarySentence(
          target: 'Ο πατέρας μου είναι γιατρός.',
          glossTr: 'Babam doktor.',
        ),
        LibrarySentence(
          target: 'Η μητέρα μου δουλεύει σε ένα σχολείο.',
          glossTr: 'Annem bir okulda çalışıyor.',
        ),
        LibrarySentence(
          target: 'Έχω μια αδερφή.',
          glossTr: 'Bir kız kardeşim var.',
        ),
        LibrarySentence(
          target: 'Το σπίτι μας είναι μικρό, αλλά όμορφο.',
          glossTr: 'Evimiz küçük ama güzel.',
        ),
        LibrarySentence(
          target: 'Το απόγευμα της Κυριακής μαγειρεύουμε μαζί.',
          glossTr: 'Pazar öğleden sonraları birlikte yemek yapıyoruz.',
        ),
        LibrarySentence(
          target: 'Στο τέλος της ημέρας τρώμε όλοι μαζί.',
          glossTr: 'Günün sonunda hepimiz birlikte yemek yiyoruz.',
        ),
      ],
    ),
    LibraryStory(
      id: 'el_my_job',
      lang: LearnLang.el,
      level: Cefr.a1,
      title: 'Η δουλειά μου',
      titleTr: 'Benim İşim',
      sentences: [
        LibrarySentence(
          target: 'Δουλεύω σε ένα γραφείο κοντά στον σταθμό.',
          glossTr: 'İstasyona yakın bir ofiste çalışıyorum.',
        ),
        LibrarySentence(
          target: 'Το πρωί πίνω ένα καφέ και ξεκινώ στις εννιά.',
          glossTr: 'Sabah bir kahve içiyorum ve dokuzda işe başlıyorum.',
        ),
        LibrarySentence(
          target: 'Συχνά μιλάω με τους πελάτες.',
          glossTr: 'Sık sık müşterilerle konuşuyorum.',
        ),
        LibrarySentence(
          target: 'Για μεσημέρι τρώω ένα σάντουιτς.',
          glossTr: 'Öğle yemeğinde bir sandviç yiyorum.',
        ),
        LibrarySentence(
          target: 'Στις έξι τελειώνω και γυρίζω στο σπίτι.',
          glossTr: 'Altıda bitirip eve dönüyorum.',
        ),
        LibrarySentence(
          target: 'Το απόγευμα διαβάζω ή βλέπω τηλεόραση.',
          glossTr: 'Öğleden sonra kitap okuyorum ya da televizyon izliyorum.',
        ),
      ],
    ),
    LibraryStory(
      id: 'el_market',
      lang: LearnLang.el,
      level: Cefr.a1,
      title: 'Η αγορά',
      titleTr: 'Haftalık Alışveriş',
      sentences: [
        LibrarySentence(
          target: 'Κάθε Κυριακή πηγαίνω στην αγορά.',
          glossTr: 'Her pazar pazar yerine gidiyorum.',
        ),
        LibrarySentence(
          target: 'Αγοράζω λαχανικά, φρούτα και ψωμί.',
          glossTr: 'Sebze, meyve ve ekmek alıyorum.',
        ),
        LibrarySentence(
          target: 'Στην αγορά υπάρχουν πολλά χρώματα.',
          glossTr: 'Pazar yerinde çok renk var.',
        ),
        LibrarySentence(
          target: 'Χθες αγόρασα ντομάτες και αγγούρια.',
          glossTr: 'Dün domates ve salatalık aldım.',
        ),
        LibrarySentence(
          target: 'Σαν βράδυ έφτιαξα μια σαλάτα.',
          glossTr: 'Akşam bir salata yaptım.',
        ),
        LibrarySentence(
          target: 'Όλοι την φάγαμε με πολλή όρεξη.',
          glossTr: 'Hepimiz iştahla yedik.',
        ),
      ],
    ),
    LibraryStory(
      id: 'tr_weekend',
      lang: LearnLang.tr,
      level: Cefr.a1,
      title: 'Hafta Sonu',
      titleTr: 'Hafta Sonu',
      sentences: [
        LibrarySentence(
          target: 'Cumartesi sabahı parka gittim.',
          glossTr: 'Cumartesi sabahı parka gittim.',
        ),
        LibrarySentence(
          target: 'Arkadaşımla birlikte yürüdük.',
          glossTr: 'Arkadaşımla birlikte yürüdük.',
        ),
        LibrarySentence(
          target: 'Parkta çiçekler ve kuşlar vardı.',
          glossTr: 'Parkta çiçekler ve kuşlar vardı.',
        ),
        LibrarySentence(
          target: 'Öğlen çorba ve ekmek yedik.',
          glossTr: 'Öğlen çorba ve ekmek yedik.',
        ),
        LibrarySentence(
          target: 'Hava çok güzeldi.',
          glossTr: 'Hava çok güzeldi.',
        ),
        LibrarySentence(
          target: 'Güzel bir hafta sonuydu.',
          glossTr: 'Güzel bir hafta sonuydu.',
        ),
      ],
    ),
    LibraryStory(
      id: 'tr_my_job',
      lang: LearnLang.tr,
      level: Cefr.a1,
      title: 'Benim İşim',
      titleTr: 'Benim İşim',
      sentences: [
        LibrarySentence(
          target: 'Ben bir hastanede çalışıyorum.',
          glossTr: 'Ben bir hastanede çalışıyorum.',
        ),
        LibrarySentence(
          target: 'Her sabah dokuzda işe giderim.',
          glossTr: 'Her sabah dokuzda işe giderim.',
        ),
        LibrarySentence(
          target: 'Benim işim hastalara yardım etmek.',
          glossTr: 'Benim işim hastalara yardım etmek.',
        ),
        LibrarySentence(
          target: 'Öğlen hastanede yemek yerim.',
          glossTr: 'Öğlen hastanede yemek yerim.',
        ),
        LibrarySentence(
          target: 'Akşam eve dönerim.',
          glossTr: 'Akşam eve dönerim.',
        ),
        LibrarySentence(
          target: 'İş yorucu, ama ben seviyorum.',
          glossTr: 'İş yorucu, ama ben seviyorum.',
        ),
      ],
    ),
    LibraryStory(
      id: 'tr_shopping',
      lang: LearnLang.tr,
      level: Cefr.a1,
      title: 'Alışveriş',
      titleTr: 'Alışveriş',
      sentences: [
        LibrarySentence(
          target: 'Pazar sabahı markete gittim.',
          glossTr: 'Pazar sabahı markete gittim.',
        ),
        LibrarySentence(
          target: 'Ekmek, süt ve elma aldım.',
          glossTr: 'Ekmek, süt ve elma aldım.',
        ),
        LibrarySentence(
          target: 'Market çok kalabalıktı.',
          glossTr: 'Market çok kalabalıktı.',
        ),
        LibrarySentence(
          target: 'Evde büyük bir kahvaltı yaptım.',
          glossTr: 'Evde büyük bir kahvaltı yaptım.',
        ),
        LibrarySentence(
          target: 'Çay ve peynirle kahvaltı çok güzeldi.',
          glossTr: 'Çay ve peynirle kahvaltı çok güzeldi.',
        ),
        LibrarySentence(
          target: 'Güne güzel başladım.',
          glossTr: 'Güne güzel başladım.',
        ),
      ],
    ),
  ];
}

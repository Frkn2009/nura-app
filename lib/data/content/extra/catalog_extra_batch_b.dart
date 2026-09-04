import '../../models/models.dart';

/// Batch B — A1 dalga 1: eksik 9 konu × Almanca / Flemenkçe / İsveççe.
/// Konular: Tanışma, Alışveriş, Sayılar & saat, Aile, Hava durumu, Ulaşım,
/// Acil durum, Günlük rutin, Basit geçmiş zamanla olay anlatma.
/// `lib/data/content/catalog.dart` dosyasına DOKUNULMADI — entegrasyon
/// merkezi olarak ayrıca yapılacak.
final List<Scenario> catalogExtraBatchB = [
  // ================= GERMAN (de) =================
  Scenario(
    id: 'de_intro',
    lang: LearnLang.de,
    cefr: Cefr.a1,
    minutes: 8,
    titles: {UiLang.tr: 'Tanışma', UiLang.en: 'Introductions'},
    clipLine: 'Seit drei Tagen bin ich hier.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Almanca'da fiil her zaman ikinci sırada gelir — cümle bir zaman "
            'ifadesiyle başlarsa özne fiilden sonraya kayar.',
        UiLang.en:
            'In German the verb always stays in second position — if a '
            'sentence opens with a time expression, the subject moves after '
            'the verb.',
      },
      goodExample: 'Seit drei Tagen bin ich hier.',
      badExample: 'Seit drei Tagen ich bin hier.',
    ),
    phrases: [
      Phrase(
        id: 'de_intro_0',
        target: 'Hallo, ich heiße Elif.',
        gloss: {
          UiLang.tr: 'Merhaba, adım Elif.',
          UiLang.en: 'Hi, my name is Elif.',
        },
      ),
      Phrase(
        id: 'de_intro_1',
        target: 'Wie heißen Sie?',
        gloss: {UiLang.tr: 'Adınız ne?', UiLang.en: 'What is your name?'},
      ),
      Phrase(
        id: 'de_intro_2',
        target: 'Ich komme aus der Türkei.',
        gloss: {UiLang.tr: "Türkiye'denim.", UiLang.en: 'I am from Turkey.'},
      ),
      Phrase(
        id: 'de_intro_3',
        target: 'Und woher kommen Sie?',
        gloss: {
          UiLang.tr: 'Peki siz nerelisiniz?',
          UiLang.en: 'And where are you from?',
        },
      ),
      Phrase(
        id: 'de_intro_4',
        target: 'Seit drei Tagen bin ich hier.',
        gloss: {
          UiLang.tr: 'Üç gündür buradayım.',
          UiLang.en: "I've been here for three days.",
        },
      ),
      Phrase(
        id: 'de_intro_5',
        target: 'Freut mich, Sie kennenzulernen.',
        gloss: {
          UiLang.tr: 'Tanıştığımıza memnun oldum.',
          UiLang.en: 'Nice to meet you.',
        },
      ),
      Phrase(
        id: 'de_intro_6',
        target: 'Wie geht es Ihnen?',
        gloss: {UiLang.tr: 'Nasılsınız?', UiLang.en: 'How are you?'},
      ),
      Phrase(
        id: 'de_intro_7',
        target: 'Mir geht es gut, danke.',
        gloss: {
          UiLang.tr: 'İyiyim, teşekkürler.',
          UiLang.en: "I'm fine, thanks.",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Greet someone and give your name.',
        expected: 'Hallo, ich heiße Elif.',
      ),
      SpeakTurn(prompt: 'Ask their name.', expected: 'Wie heißen Sie?'),
      SpeakTurn(
        prompt: "Say where you're from.",
        expected: 'Ich komme aus der Türkei.',
      ),
      SpeakTurn(
        prompt: 'Ask where they are from.',
        expected: 'Und woher kommen Sie?',
      ),
      SpeakTurn(
        prompt: "Say how long you've been here.",
        expected: 'Seit drei Tagen bin ich hier.',
      ),
      SpeakTurn(
        prompt: 'Say it was nice meeting them.',
        expected: 'Freut mich, Sie kennenzulernen.',
      ),
      SpeakTurn(
        prompt: 'Ask how they are doing.',
        expected: 'Wie geht es Ihnen?',
      ),
      SpeakTurn(
        prompt: "Answer that you're doing well.",
        expected: 'Mir geht es gut, danke.',
      ),
    ],
  ),
  Scenario(
    id: 'de_shopping',
    lang: LearnLang.de,
    cefr: Cefr.a1,
    minutes: 8,
    titles: {UiLang.tr: 'Alışveriş', UiLang.en: 'Shopping'},
    clipLine: 'Ich hätte gern das hier.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Almanca'da bir ismi olumsuzlarken 'nicht' değil, 'kein/keine' kullanılır.",
        UiLang.en:
            "In German you negate a noun with 'kein/keine', not 'nicht'.",
      },
      goodExample: 'Ich habe keine Kreditkarte.',
      badExample: 'Ich habe nicht eine Kreditkarte.',
    ),
    phrases: [
      Phrase(
        id: 'de_shopping_0',
        target: 'Ich hätte gern das hier.',
        gloss: {
          UiLang.tr: 'Bunu istiyorum, lütfen.',
          UiLang.en: "I'd like this one, please.",
        },
      ),
      Phrase(
        id: 'de_shopping_1',
        target: 'Haben Sie das in Größe M?',
        gloss: {
          UiLang.tr: 'Bunun M bedeni var mı?',
          UiLang.en: 'Do you have this in size M?',
        },
      ),
      Phrase(
        id: 'de_shopping_2',
        target: 'Kann ich das anprobieren?',
        gloss: {
          UiLang.tr: 'Bunu deneyebilir miyim?',
          UiLang.en: 'Can I try this on?',
        },
      ),
      Phrase(
        id: 'de_shopping_3',
        target: 'Ich habe keine Kreditkarte, nur Bargeld.',
        gloss: {
          UiLang.tr: 'Kredi kartım yok, sadece nakit.',
          UiLang.en: "I don't have a credit card, only cash.",
        },
      ),
      Phrase(
        id: 'de_shopping_4',
        target: 'Gibt es einen Rabatt?',
        gloss: {
          UiLang.tr: 'İndirim var mı?',
          UiLang.en: 'Is there a discount?',
        },
      ),
      Phrase(
        id: 'de_shopping_5',
        target: 'Das ist zu teuer für mich.',
        gloss: {
          UiLang.tr: 'Bu benim için çok pahalı.',
          UiLang.en: "That's too expensive for me.",
        },
      ),
      Phrase(
        id: 'de_shopping_6',
        target: 'Ich nehme es.',
        gloss: {UiLang.tr: 'Alıyorum.', UiLang.en: "I'll take it."},
      ),
      Phrase(
        id: 'de_shopping_7',
        target: 'Kann ich eine Tüte haben?',
        gloss: {
          UiLang.tr: 'Bir poşet alabilir miyim?',
          UiLang.en: 'Can I get a bag?',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "Say you'd like this item.",
        expected: 'Ich hätte gern das hier.',
      ),
      SpeakTurn(
        prompt: 'Ask about your size.',
        expected: 'Haben Sie das in Größe M?',
      ),
      SpeakTurn(
        prompt: 'Ask to try it on.',
        expected: 'Kann ich das anprobieren?',
      ),
      SpeakTurn(
        prompt: "Say you'll pay cash, not card.",
        expected: 'Ich habe keine Kreditkarte, nur Bargeld.',
      ),
      SpeakTurn(
        prompt: "Ask if there's a discount.",
        expected: 'Gibt es einen Rabatt?',
      ),
      SpeakTurn(
        prompt: "Say it's too expensive.",
        expected: 'Das ist zu teuer für mich.',
      ),
      SpeakTurn(prompt: 'Decide to buy it.', expected: 'Ich nehme es.'),
      SpeakTurn(
        prompt: 'Ask for a bag.',
        expected: 'Kann ich eine Tüte haben?',
      ),
    ],
  ),
  Scenario(
    id: 'de_numbers_time',
    lang: LearnLang.de,
    cefr: Cefr.a1,
    minutes: 8,
    titles: {UiLang.tr: 'Sayılar & saat', UiLang.en: 'Numbers & time'},
    clipLine: 'Wie spät ist es?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: "Saat ifadelerinde saatten önce 'um' edatı kullanılır.",
        UiLang.en: "Clock times take the preposition 'um' before the hour.",
      },
      goodExample: 'Der Zug fährt um acht Uhr.',
      badExample: 'Der Zug fährt acht Uhr.',
    ),
    phrases: [
      Phrase(
        id: 'de_numbers_time_0',
        target: 'Wie spät ist es?',
        gloss: {UiLang.tr: 'Saat kaç?', UiLang.en: 'What time is it?'},
      ),
      Phrase(
        id: 'de_numbers_time_1',
        target: 'Es ist Viertel nach neun.',
        gloss: {
          UiLang.tr: 'Saat dokuzu çeyrek geçiyor.',
          UiLang.en: "It's a quarter past nine.",
        },
      ),
      Phrase(
        id: 'de_numbers_time_2',
        target: 'Der Zug fährt um acht Uhr.',
        gloss: {
          UiLang.tr: 'Tren saat sekizde kalkıyor.',
          UiLang.en: 'The train leaves at eight o\'clock.',
        },
      ),
      Phrase(
        id: 'de_numbers_time_3',
        target: 'Wir treffen uns um halb sieben.',
        gloss: {
          UiLang.tr: 'Altı buçukta buluşuyoruz.',
          UiLang.en: "We're meeting at half past six.",
        },
      ),
      Phrase(
        id: 'de_numbers_time_4',
        target: 'Das macht fünfzehn Euro fünfzig.',
        gloss: {
          UiLang.tr: 'Bu on beş euro elli sent tutuyor.',
          UiLang.en: 'That comes to fifteen euros fifty.',
        },
      ),
      Phrase(
        id: 'de_numbers_time_5',
        target: 'Ich brauche noch zehn Minuten.',
        gloss: {
          UiLang.tr: 'On dakikaya daha ihtiyacım var.',
          UiLang.en: 'I need ten more minutes.',
        },
      ),
      Phrase(
        id: 'de_numbers_time_6',
        target: 'Wir sind zu dritt.',
        gloss: {UiLang.tr: 'Üç kişiyiz.', UiLang.en: 'There are three of us.'},
      ),
      Phrase(
        id: 'de_numbers_time_7',
        target: 'Der Termin ist am zweiten März.',
        gloss: {
          UiLang.tr: "Randevu iki Mart'ta.",
          UiLang.en: 'The appointment is on the second of March.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You want to know the time.',
        expected: 'Wie spät ist es?',
      ),
      SpeakTurn(
        prompt: 'Tell them the time.',
        expected: 'Es ist Viertel nach neun.',
      ),
      SpeakTurn(
        prompt: 'Tell a friend when the train leaves.',
        expected: 'Der Zug fährt um acht Uhr.',
      ),
      SpeakTurn(
        prompt: 'Suggest a meeting time.',
        expected: 'Wir treffen uns um halb sieben.',
      ),
      SpeakTurn(
        prompt: 'Tell the customer the total.',
        expected: 'Das macht fünfzehn Euro fünfzig.',
      ),
      SpeakTurn(
        prompt: 'Ask for a little more time.',
        expected: 'Ich brauche noch zehn Minuten.',
      ),
      SpeakTurn(
        prompt: 'Tell the host how many people.',
        expected: 'Wir sind zu dritt.',
      ),
      SpeakTurn(
        prompt: 'Tell them the appointment date.',
        expected: 'Der Termin ist am zweiten März.',
      ),
    ],
  ),
  Scenario(
    id: 'de_family',
    lang: LearnLang.de,
    cefr: Cefr.a1,
    minutes: 8,
    titles: {UiLang.tr: 'Aile', UiLang.en: 'Family'},
    clipLine: 'Das ist mein Bruder.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "İyelik zamiri ('mein/meine') ismin cinsiyetine göre değişir.",
        UiLang.en:
            "The possessive ('mein/meine') agrees with the noun's gender.",
      },
      goodExample: 'Das ist mein Bruder.',
      badExample: 'Das ist meine Bruder.',
    ),
    phrases: [
      Phrase(
        id: 'de_family_0',
        target: 'Das ist mein Bruder.',
        gloss: {
          UiLang.tr: 'Bu benim erkek kardeşim.',
          UiLang.en: 'This is my brother.',
        },
      ),
      Phrase(
        id: 'de_family_1',
        target: 'Das ist meine Schwester.',
        gloss: {
          UiLang.tr: 'Bu benim kız kardeşim.',
          UiLang.en: 'This is my sister.',
        },
      ),
      Phrase(
        id: 'de_family_2',
        target: 'Ich habe zwei Kinder.',
        gloss: {
          UiLang.tr: 'İki çocuğum var.',
          UiLang.en: 'I have two children.',
        },
      ),
      Phrase(
        id: 'de_family_3',
        target: 'Meine Eltern wohnen in Izmir.',
        gloss: {
          UiLang.tr: "Anne babam İzmir'de yaşıyor.",
          UiLang.en: 'My parents live in Izmir.',
        },
      ),
      Phrase(
        id: 'de_family_4',
        target: 'Haben Sie Geschwister?',
        gloss: {
          UiLang.tr: 'Kardeşiniz var mı?',
          UiLang.en: 'Do you have siblings?',
        },
      ),
      Phrase(
        id: 'de_family_5',
        target: 'Mein Mann arbeitet als Arzt.',
        gloss: {
          UiLang.tr: 'Kocam doktor olarak çalışıyor.',
          UiLang.en: 'My husband works as a doctor.',
        },
      ),
      Phrase(
        id: 'de_family_6',
        target: 'Wir sind eine große Familie.',
        gloss: {
          UiLang.tr: 'Biz kalabalık bir aileyiz.',
          UiLang.en: "We're a big family.",
        },
      ),
      Phrase(
        id: 'de_family_7',
        target: 'Meine Tochter ist noch klein.',
        gloss: {
          UiLang.tr: 'Kızım henüz küçük.',
          UiLang.en: 'My daughter is still little.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Introduce your brother.',
        expected: 'Das ist mein Bruder.',
      ),
      SpeakTurn(
        prompt: 'Introduce your sister.',
        expected: 'Das ist meine Schwester.',
      ),
      SpeakTurn(
        prompt: 'Say how many children you have.',
        expected: 'Ich habe zwei Kinder.',
      ),
      SpeakTurn(
        prompt: 'Say where your parents live.',
        expected: 'Meine Eltern wohnen in Izmir.',
      ),
      SpeakTurn(
        prompt: 'Ask if they have siblings.',
        expected: 'Haben Sie Geschwister?',
      ),
      SpeakTurn(
        prompt: 'Say what your husband does.',
        expected: 'Mein Mann arbeitet als Arzt.',
      ),
      SpeakTurn(
        prompt: 'Describe your family size.',
        expected: 'Wir sind eine große Familie.',
      ),
      SpeakTurn(
        prompt: 'Say your daughter is still young.',
        expected: 'Meine Tochter ist noch klein.',
      ),
    ],
  ),
  Scenario(
    id: 'de_weather',
    lang: LearnLang.de,
    cefr: Cefr.a1,
    minutes: 8,
    titles: {UiLang.tr: 'Hava durumu', UiLang.en: 'Weather'},
    clipLine: 'Es regnet heute.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: "Hava durumu fiillerinde anlamsız özne 'es' asla düşmez.",
        UiLang.en:
            "Weather verbs always need the dummy subject 'es' — it can never be dropped.",
      },
      goodExample: 'Es regnet heute.',
      badExample: 'Regnet heute.',
    ),
    phrases: [
      Phrase(
        id: 'de_weather_0',
        target: 'Wie ist das Wetter heute?',
        gloss: {
          UiLang.tr: 'Bugün hava nasıl?',
          UiLang.en: "What's the weather like today?",
        },
      ),
      Phrase(
        id: 'de_weather_1',
        target: 'Es regnet heute.',
        gloss: {
          UiLang.tr: 'Bugün yağmur yağıyor.',
          UiLang.en: "It's raining today.",
        },
      ),
      Phrase(
        id: 'de_weather_2',
        target: 'Morgen soll es sonnig sein.',
        gloss: {
          UiLang.tr: 'Yarın güneşli olacakmış.',
          UiLang.en: "Tomorrow it's supposed to be sunny.",
        },
      ),
      Phrase(
        id: 'de_weather_3',
        target: 'Es ist sehr kalt draußen.',
        gloss: {
          UiLang.tr: 'Dışarısı çok soğuk.',
          UiLang.en: "It's very cold outside.",
        },
      ),
      Phrase(
        id: 'de_weather_4',
        target: 'Nimm einen Regenschirm mit.',
        gloss: {
          UiLang.tr: 'Yanına şemsiye al.',
          UiLang.en: 'Take an umbrella with you.',
        },
      ),
      Phrase(
        id: 'de_weather_5',
        target: 'Im Sommer ist es hier heiß.',
        gloss: {
          UiLang.tr: 'Burada yazın hava sıcak oluyor.',
          UiLang.en: "It's hot here in summer.",
        },
      ),
      Phrase(
        id: 'de_weather_6',
        target: 'Es schneit schon seit Stunden.',
        gloss: {
          UiLang.tr: "Saatlerdir kar yağıyor.",
          UiLang.en: "It's been snowing for hours.",
        },
      ),
      Phrase(
        id: 'de_weather_7',
        target: 'Zieh dich warm an.',
        gloss: {UiLang.tr: 'Sıkı giyin.', UiLang.en: 'Dress warmly.'},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "Ask about today's weather.",
        expected: 'Wie ist das Wetter heute?',
      ),
      SpeakTurn(
        prompt: "Point out it's raining.",
        expected: 'Es regnet heute.',
      ),
      SpeakTurn(
        prompt: "Mention tomorrow's forecast.",
        expected: 'Morgen soll es sonnig sein.',
      ),
      SpeakTurn(
        prompt: 'Complain about the cold.',
        expected: 'Es ist sehr kalt draußen.',
      ),
      SpeakTurn(
        prompt: 'Warn them to take an umbrella.',
        expected: 'Nimm einen Regenschirm mit.',
      ),
      SpeakTurn(
        prompt: 'Talk about summer heat.',
        expected: 'Im Sommer ist es hier heiß.',
      ),
      SpeakTurn(
        prompt: "Mention it's been snowing.",
        expected: 'Es schneit schon seit Stunden.',
      ),
      SpeakTurn(
        prompt: 'Tell them to dress warmly.',
        expected: 'Zieh dich warm an.',
      ),
    ],
  ),
  Scenario(
    id: 'de_transport',
    lang: LearnLang.de,
    cefr: Cefr.a1,
    minutes: 8,
    titles: {UiLang.tr: 'Ulaşım', UiLang.en: 'Transport'},
    clipLine: 'Ich steige hier ein.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Ayrılabilir fiil 'einsteigen' bölünür: önek ('ein') düz cümlede sona gider.",
        UiLang.en:
            "The separable verb 'einsteigen' splits: the prefix ('ein') moves to the end of the clause.",
      },
      goodExample: 'Ich steige hier ein.',
      badExample: 'Ich einsteige hier.',
    ),
    phrases: [
      Phrase(
        id: 'de_transport_0',
        target: 'Wo ist die nächste Bushaltestelle?',
        gloss: {
          UiLang.tr: 'En yakın otobüs durağı nerede?',
          UiLang.en: "Where's the nearest bus stop?",
        },
      ),
      Phrase(
        id: 'de_transport_1',
        target: 'Welche Linie fährt zum Zentrum?',
        gloss: {
          UiLang.tr: 'Merkeze hangi hat gidiyor?',
          UiLang.en: 'Which line goes to the center?',
        },
      ),
      Phrase(
        id: 'de_transport_2',
        target: 'Ich steige hier ein.',
        gloss: {
          UiLang.tr: 'Buradan bineceğim.',
          UiLang.en: "I'm getting on here.",
        },
      ),
      Phrase(
        id: 'de_transport_3',
        target: 'Ich steige an der nächsten Station aus.',
        gloss: {
          UiLang.tr: 'Bir sonraki durakta ineceğim.',
          UiLang.en: "I'm getting off at the next stop.",
        },
      ),
      Phrase(
        id: 'de_transport_4',
        target: 'Einmal zum Hauptbahnhof, bitte.',
        gloss: {
          UiLang.tr: 'Merkez gara bir bilet, lütfen.',
          UiLang.en: 'One ticket to the main station, please.',
        },
      ),
      Phrase(
        id: 'de_transport_5',
        target: 'Muss ich umsteigen?',
        gloss: {
          UiLang.tr: 'Aktarma yapmam gerekiyor mu?',
          UiLang.en: 'Do I need to change trains?',
        },
      ),
      Phrase(
        id: 'de_transport_6',
        target: 'Der Bus hat Verspätung.',
        gloss: {UiLang.tr: 'Otobüs gecikti.', UiLang.en: 'The bus is delayed.'},
      ),
      Phrase(
        id: 'de_transport_7',
        target: 'Wie lange dauert die Fahrt?',
        gloss: {
          UiLang.tr: 'Yolculuk ne kadar sürüyor?',
          UiLang.en: 'How long does the trip take?',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Ask where the bus stop is.',
        expected: 'Wo ist die nächste Bushaltestelle?',
      ),
      SpeakTurn(
        prompt: 'Ask which line goes downtown.',
        expected: 'Welche Linie fährt zum Zentrum?',
      ),
      SpeakTurn(
        prompt: "Say you're getting on here.",
        expected: 'Ich steige hier ein.',
      ),
      SpeakTurn(
        prompt: "Say where you're getting off.",
        expected: 'Ich steige an der nächsten Station aus.',
      ),
      SpeakTurn(
        prompt: 'Buy a ticket.',
        expected: 'Einmal zum Hauptbahnhof, bitte.',
      ),
      SpeakTurn(
        prompt: 'Ask if you need to change trains.',
        expected: 'Muss ich umsteigen?',
      ),
      SpeakTurn(
        prompt: 'Notice the bus is late.',
        expected: 'Der Bus hat Verspätung.',
      ),
      SpeakTurn(
        prompt: 'Ask how long the trip takes.',
        expected: 'Wie lange dauert die Fahrt?',
      ),
    ],
  ),
  Scenario(
    id: 'de_emergency',
    lang: LearnLang.de,
    cefr: Cefr.a1,
    minutes: 8,
    titles: {UiLang.tr: 'Acil durum', UiLang.en: 'Emergency'},
    clipLine: 'Rufen Sie einen Krankenwagen!',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Resmi emirde ('Sie' ile) fiil başa gelir, 'Sie' hemen ardından.",
        UiLang.en:
            "In the formal imperative (with 'Sie') the verb comes first, immediately followed by 'Sie'.",
      },
      goodExample: 'Rufen Sie einen Krankenwagen!',
      badExample: 'Sie rufen einen Krankenwagen!',
    ),
    phrases: [
      Phrase(
        id: 'de_emergency_0',
        target: 'Hilfe! Rufen Sie einen Krankenwagen!',
        gloss: {
          UiLang.tr: 'İmdat! Bir ambulans çağırın!',
          UiLang.en: 'Help! Call an ambulance!',
        },
      ),
      Phrase(
        id: 'de_emergency_1',
        target: 'Ich hatte einen Unfall.',
        gloss: {
          UiLang.tr: 'Bir kaza geçirdim.',
          UiLang.en: 'I had an accident.',
        },
      ),
      Phrase(
        id: 'de_emergency_2',
        target: 'Rufen Sie bitte die Polizei.',
        gloss: {
          UiLang.tr: 'Lütfen polisi arayın.',
          UiLang.en: 'Please call the police.',
        },
      ),
      Phrase(
        id: 'de_emergency_3',
        target: 'Ich brauche dringend einen Arzt.',
        gloss: {
          UiLang.tr: 'Acilen bir doktora ihtiyacım var.',
          UiLang.en: 'I urgently need a doctor.',
        },
      ),
      Phrase(
        id: 'de_emergency_4',
        target: 'Wo ist das nächste Krankenhaus?',
        gloss: {
          UiLang.tr: 'En yakın hastane nerede?',
          UiLang.en: "Where's the nearest hospital?",
        },
      ),
      Phrase(
        id: 'de_emergency_5',
        target: 'Mir ist schwindelig.',
        gloss: {UiLang.tr: 'Başım dönüyor.', UiLang.en: 'I feel dizzy.'},
      ),
      Phrase(
        id: 'de_emergency_6',
        target: 'Bitte bleiben Sie bei mir.',
        gloss: {
          UiLang.tr: 'Lütfen yanımda kalın.',
          UiLang.en: 'Please stay with me.',
        },
      ),
      Phrase(
        id: 'de_emergency_7',
        target: 'Es ist ein Notfall!',
        gloss: {
          UiLang.tr: 'Bu bir acil durum!',
          UiLang.en: "It's an emergency!",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Call for urgent help.',
        expected: 'Hilfe! Rufen Sie einen Krankenwagen!',
      ),
      SpeakTurn(
        prompt: 'Explain you had an accident.',
        expected: 'Ich hatte einen Unfall.',
      ),
      SpeakTurn(
        prompt: 'Ask someone to call the police.',
        expected: 'Rufen Sie bitte die Polizei.',
      ),
      SpeakTurn(
        prompt: 'Say you need a doctor now.',
        expected: 'Ich brauche dringend einen Arzt.',
      ),
      SpeakTurn(
        prompt: 'Ask where the hospital is.',
        expected: 'Wo ist das nächste Krankenhaus?',
      ),
      SpeakTurn(
        prompt: 'Describe how you feel.',
        expected: 'Mir ist schwindelig.',
      ),
      SpeakTurn(
        prompt: 'Ask someone to stay with you.',
        expected: 'Bitte bleiben Sie bei mir.',
      ),
      SpeakTurn(
        prompt: "Stress that it's urgent.",
        expected: 'Es ist ein Notfall!',
      ),
    ],
  ),
  Scenario(
    id: 'de_routine',
    lang: LearnLang.de,
    cefr: Cefr.a1,
    minutes: 8,
    titles: {UiLang.tr: 'Günlük rutin', UiLang.en: 'Daily routine'},
    clipLine: 'Ich stehe um sieben Uhr auf.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: "Dönüşlü zamir ('mich') çekimli fiilden hemen sonra gelir.",
        UiLang.en:
            "The reflexive pronoun ('mich') goes directly after the conjugated verb.",
      },
      goodExample: 'Ich dusche mich schnell.',
      badExample: 'Ich mich dusche schnell.',
    ),
    phrases: [
      Phrase(
        id: 'de_routine_0',
        target: 'Ich stehe um sieben Uhr auf.',
        gloss: {
          UiLang.tr: 'Saat yedide kalkıyorum.',
          UiLang.en: "I get up at seven o'clock.",
        },
      ),
      Phrase(
        id: 'de_routine_1',
        target: 'Ich dusche mich schnell.',
        gloss: {
          UiLang.tr: 'Hızlıca duş alıyorum.',
          UiLang.en: 'I take a quick shower.',
        },
      ),
      Phrase(
        id: 'de_routine_2',
        target: 'Danach frühstücke ich.',
        gloss: {
          UiLang.tr: 'Ondan sonra kahvaltı yapıyorum.',
          UiLang.en: 'After that I have breakfast.',
        },
      ),
      Phrase(
        id: 'de_routine_3',
        target: 'Ich fahre mit dem Bus zur Arbeit.',
        gloss: {
          UiLang.tr: 'İşe otobüsle gidiyorum.',
          UiLang.en: 'I go to work by bus.',
        },
      ),
      Phrase(
        id: 'de_routine_4',
        target: 'Mittags mache ich eine Pause.',
        gloss: {
          UiLang.tr: 'Öğlen mola veriyorum.',
          UiLang.en: 'At noon I take a break.',
        },
      ),
      Phrase(
        id: 'de_routine_5',
        target: 'Abends koche ich für die Familie.',
        gloss: {
          UiLang.tr: 'Akşam aile için yemek yapıyorum.',
          UiLang.en: 'In the evenings I cook for the family.',
        },
      ),
      Phrase(
        id: 'de_routine_6',
        target: 'Ich gehe meistens um elf Uhr ins Bett.',
        gloss: {
          UiLang.tr: 'Genellikle saat on birde yatıyorum.',
          UiLang.en: 'I usually go to bed at eleven.',
        },
      ),
      Phrase(
        id: 'de_routine_7',
        target: 'Am Wochenende schlafe ich länger.',
        gloss: {
          UiLang.tr: 'Hafta sonu daha uzun uyuyorum.',
          UiLang.en: 'On weekends I sleep longer.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Say when you wake up.',
        expected: 'Ich stehe um sieben Uhr auf.',
      ),
      SpeakTurn(
        prompt: 'Describe your morning wash.',
        expected: 'Ich dusche mich schnell.',
      ),
      SpeakTurn(
        prompt: 'Say what comes next.',
        expected: 'Danach frühstücke ich.',
      ),
      SpeakTurn(
        prompt: 'Say how you get to work.',
        expected: 'Ich fahre mit dem Bus zur Arbeit.',
      ),
      SpeakTurn(
        prompt: 'Mention your midday break.',
        expected: 'Mittags mache ich eine Pause.',
      ),
      SpeakTurn(
        prompt: 'Say what you cook in the evening.',
        expected: 'Abends koche ich für die Familie.',
      ),
      SpeakTurn(
        prompt: 'Say when you usually sleep.',
        expected: 'Ich gehe meistens um elf Uhr ins Bett.',
      ),
      SpeakTurn(
        prompt: 'Mention your weekend habit.',
        expected: 'Am Wochenende schlafe ich länger.',
      ),
    ],
  ),
  Scenario(
    id: 'de_past_story',
    lang: LearnLang.de,
    cefr: Cefr.a1,
    minutes: 8,
    titles: {
      UiLang.tr: 'Geçmişte bir olay anlatmak',
      UiLang.en: 'Telling a story in the past',
    },
    clipLine: 'Gestern bin ich ins Kino gegangen.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Perfekt zamanı 'haben/sein' (ikinci sırada) + geçmiş ortaç ile kurulur; ortaç cümlenin en sonuna gider.",
        UiLang.en:
            "The Perfekt past tense uses 'haben/sein' (in second position) plus a past participle, which goes to the very end of the clause.",
      },
      goodExample: 'Ich bin gestern ins Kino gegangen.',
      badExample: 'Ich bin gestern gegangen ins Kino.',
    ),
    phrases: [
      Phrase(
        id: 'de_past_story_0',
        target: 'Gestern bin ich ins Kino gegangen.',
        gloss: {
          UiLang.tr: 'Dün sinemaya gittim.',
          UiLang.en: 'Yesterday I went to the cinema.',
        },
      ),
      Phrase(
        id: 'de_past_story_1',
        target: 'Ich habe einen alten Freund getroffen.',
        gloss: {
          UiLang.tr: 'Eski bir arkadaşımla karşılaştım.',
          UiLang.en: 'I ran into an old friend.',
        },
      ),
      Phrase(
        id: 'de_past_story_2',
        target: 'Wir haben zusammen Kaffee getrunken.',
        gloss: {
          UiLang.tr: 'Birlikte kahve içtik.',
          UiLang.en: 'We had coffee together.',
        },
      ),
      Phrase(
        id: 'de_past_story_3',
        target: 'Danach haben wir lange geredet.',
        gloss: {
          UiLang.tr: 'Ondan sonra uzun uzun konuştuk.',
          UiLang.en: 'After that we talked for a long time.',
        },
      ),
      Phrase(
        id: 'de_past_story_4',
        target: 'Der Film hat mir sehr gefallen.',
        gloss: {
          UiLang.tr: 'Film çok hoşuma gitti.',
          UiLang.en: 'I really liked the movie.',
        },
      ),
      Phrase(
        id: 'de_past_story_5',
        target: 'Es ist spät geworden.',
        gloss: {UiLang.tr: 'Vakit geç oldu.', UiLang.en: 'It got late.'},
      ),
      Phrase(
        id: 'de_past_story_6',
        target: 'Ich bin müde nach Hause gekommen.',
        gloss: {
          UiLang.tr: 'Yorgun bir şekilde eve geldim.',
          UiLang.en: 'I came home tired.',
        },
      ),
      Phrase(
        id: 'de_past_story_7',
        target: 'Es war ein schöner Abend.',
        gloss: {
          UiLang.tr: 'Güzel bir akşamdı.',
          UiLang.en: 'It was a nice evening.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Start telling what you did yesterday.',
        expected: 'Gestern bin ich ins Kino gegangen.',
      ),
      SpeakTurn(
        prompt: 'Say who you ran into.',
        expected: 'Ich habe einen alten Freund getroffen.',
      ),
      SpeakTurn(
        prompt: 'Say what you did together.',
        expected: 'Wir haben zusammen Kaffee getrunken.',
      ),
      SpeakTurn(
        prompt: 'Say what happened after.',
        expected: 'Danach haben wir lange geredet.',
      ),
      SpeakTurn(
        prompt: 'Say you liked the movie.',
        expected: 'Der Film hat mir sehr gefallen.',
      ),
      SpeakTurn(prompt: 'Say it got late.', expected: 'Es ist spät geworden.'),
      SpeakTurn(
        prompt: 'Say how you got home.',
        expected: 'Ich bin müde nach Hause gekommen.',
      ),
      SpeakTurn(
        prompt: 'Wrap up the story.',
        expected: 'Es war ein schöner Abend.',
      ),
    ],
  ),

  // ================= DUTCH (nl) =================
  Scenario(
    id: 'nl_intro',
    lang: LearnLang.nl,
    cefr: Cefr.a1,
    minutes: 8,
    titles: {UiLang.tr: 'Tanışma', UiLang.en: 'Introductions'},
    clipLine: 'Sinds drie dagen ben ik hier.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Flemenkçe'de fiil ikinci sırada kalır — cümle bir zaman ifadesiyle başlarsa özne fiilden sonraya kayar.",
        UiLang.en:
            "In Dutch the verb stays in second position — if a sentence opens with a time expression, the subject moves after the verb.",
      },
      goodExample: 'Sinds drie dagen ben ik hier.',
      badExample: 'Sinds drie dagen ik ben hier.',
    ),
    phrases: [
      Phrase(
        id: 'nl_intro_0',
        target: 'Hoi, ik heet Elif.',
        gloss: {
          UiLang.tr: 'Merhaba, adım Elif.',
          UiLang.en: 'Hi, my name is Elif.',
        },
      ),
      Phrase(
        id: 'nl_intro_1',
        target: 'Hoe heet u?',
        gloss: {UiLang.tr: 'Adınız ne?', UiLang.en: 'What is your name?'},
      ),
      Phrase(
        id: 'nl_intro_2',
        target: 'Ik kom uit Turkije.',
        gloss: {UiLang.tr: "Türkiye'denim.", UiLang.en: 'I am from Turkey.'},
      ),
      Phrase(
        id: 'nl_intro_3',
        target: 'En waar komt u vandaan?',
        gloss: {
          UiLang.tr: 'Peki siz nerelisiniz?',
          UiLang.en: 'And where are you from?',
        },
      ),
      Phrase(
        id: 'nl_intro_4',
        target: 'Sinds drie dagen ben ik hier.',
        gloss: {
          UiLang.tr: 'Üç gündür buradayım.',
          UiLang.en: "I've been here for three days.",
        },
      ),
      Phrase(
        id: 'nl_intro_5',
        target: 'Leuk u te ontmoeten.',
        gloss: {
          UiLang.tr: 'Tanıştığımıza memnun oldum.',
          UiLang.en: 'Nice to meet you.',
        },
      ),
      Phrase(
        id: 'nl_intro_6',
        target: 'Hoe gaat het met u?',
        gloss: {UiLang.tr: 'Nasılsınız?', UiLang.en: 'How are you?'},
      ),
      Phrase(
        id: 'nl_intro_7',
        target: 'Goed, dank u.',
        gloss: {
          UiLang.tr: 'İyiyim, teşekkürler.',
          UiLang.en: "I'm fine, thank you.",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Greet someone and give your name.',
        expected: 'Hoi, ik heet Elif.',
      ),
      SpeakTurn(prompt: 'Ask their name.', expected: 'Hoe heet u?'),
      SpeakTurn(
        prompt: "Say where you're from.",
        expected: 'Ik kom uit Turkije.',
      ),
      SpeakTurn(
        prompt: 'Ask where they are from.',
        expected: 'En waar komt u vandaan?',
      ),
      SpeakTurn(
        prompt: "Say how long you've been here.",
        expected: 'Sinds drie dagen ben ik hier.',
      ),
      SpeakTurn(
        prompt: 'Say it was nice meeting them.',
        expected: 'Leuk u te ontmoeten.',
      ),
      SpeakTurn(
        prompt: 'Ask how they are doing.',
        expected: 'Hoe gaat het met u?',
      ),
      SpeakTurn(
        prompt: "Answer that you're doing well.",
        expected: 'Goed, dank u.',
      ),
    ],
  ),
  Scenario(
    id: 'nl_shopping',
    lang: LearnLang.nl,
    cefr: Cefr.a1,
    minutes: 8,
    titles: {UiLang.tr: 'Alışveriş', UiLang.en: 'Shopping'},
    clipLine: 'Ik wil dit graag, alstublieft.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Flemenkçe'de bir ismi olumsuzlarken 'niet' değil, değişmez 'geen' kullanılır.",
        UiLang.en:
            "In Dutch you negate a noun with the invariable word 'geen', not 'niet'.",
      },
      goodExample: 'Ik heb geen creditcard.',
      badExample: 'Ik heb niet een creditcard.',
    ),
    phrases: [
      Phrase(
        id: 'nl_shopping_0',
        target: 'Ik wil dit graag, alstublieft.',
        gloss: {
          UiLang.tr: 'Bunu istiyorum, lütfen.',
          UiLang.en: "I'd like this, please.",
        },
      ),
      Phrase(
        id: 'nl_shopping_1',
        target: 'Heeft u dit in maat M?',
        gloss: {
          UiLang.tr: 'Bunun M bedeni var mı?',
          UiLang.en: 'Do you have this in size M?',
        },
      ),
      Phrase(
        id: 'nl_shopping_2',
        target: 'Mag ik dit passen?',
        gloss: {
          UiLang.tr: 'Bunu deneyebilir miyim?',
          UiLang.en: 'Can I try this on?',
        },
      ),
      Phrase(
        id: 'nl_shopping_3',
        target: 'Ik heb geen creditcard, alleen contant geld.',
        gloss: {
          UiLang.tr: 'Kredi kartım yok, sadece nakit.',
          UiLang.en: "I don't have a credit card, only cash.",
        },
      ),
      Phrase(
        id: 'nl_shopping_4',
        target: 'Is er korting?',
        gloss: {
          UiLang.tr: 'İndirim var mı?',
          UiLang.en: 'Is there a discount?',
        },
      ),
      Phrase(
        id: 'nl_shopping_5',
        target: 'Dat is te duur voor mij.',
        gloss: {
          UiLang.tr: 'Bu benim için çok pahalı.',
          UiLang.en: "That's too expensive for me.",
        },
      ),
      Phrase(
        id: 'nl_shopping_6',
        target: 'Ik neem het.',
        gloss: {UiLang.tr: 'Alıyorum.', UiLang.en: "I'll take it."},
      ),
      Phrase(
        id: 'nl_shopping_7',
        target: 'Mag ik een tasje?',
        gloss: {
          UiLang.tr: 'Bir poşet alabilir miyim?',
          UiLang.en: 'Can I have a bag?',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "Say you'd like this item.",
        expected: 'Ik wil dit graag, alstublieft.',
      ),
      SpeakTurn(
        prompt: 'Ask about your size.',
        expected: 'Heeft u dit in maat M?',
      ),
      SpeakTurn(prompt: 'Ask to try it on.', expected: 'Mag ik dit passen?'),
      SpeakTurn(
        prompt: "Say you'll pay cash, not card.",
        expected: 'Ik heb geen creditcard, alleen contant geld.',
      ),
      SpeakTurn(
        prompt: "Ask if there's a discount.",
        expected: 'Is er korting?',
      ),
      SpeakTurn(
        prompt: "Say it's too expensive.",
        expected: 'Dat is te duur voor mij.',
      ),
      SpeakTurn(prompt: 'Decide to buy it.', expected: 'Ik neem het.'),
      SpeakTurn(prompt: 'Ask for a bag.', expected: 'Mag ik een tasje?'),
    ],
  ),
  Scenario(
    id: 'nl_numbers_time',
    lang: LearnLang.nl,
    cefr: Cefr.a1,
    minutes: 8,
    titles: {UiLang.tr: 'Sayılar & saat', UiLang.en: 'Numbers & time'},
    clipLine: 'Hoe laat is het?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: "Saat ifadelerinde saatten önce 'om' edatı kullanılır.",
        UiLang.en: "Clock times take the preposition 'om' before the hour.",
      },
      goodExample: 'De trein vertrekt om acht uur.',
      badExample: 'De trein vertrekt acht uur.',
    ),
    phrases: [
      Phrase(
        id: 'nl_numbers_time_0',
        target: 'Hoe laat is het?',
        gloss: {UiLang.tr: 'Saat kaç?', UiLang.en: 'What time is it?'},
      ),
      Phrase(
        id: 'nl_numbers_time_1',
        target: 'Het is kwart over negen.',
        gloss: {
          UiLang.tr: 'Saat dokuzu çeyrek geçiyor.',
          UiLang.en: "It's a quarter past nine.",
        },
      ),
      Phrase(
        id: 'nl_numbers_time_2',
        target: 'De trein vertrekt om acht uur.',
        gloss: {
          UiLang.tr: 'Tren saat sekizde kalkıyor.',
          UiLang.en: 'The train leaves at eight o\'clock.',
        },
      ),
      Phrase(
        id: 'nl_numbers_time_3',
        target: 'We spreken af om half zeven.',
        gloss: {
          UiLang.tr: 'Altı buçukta buluşuyoruz.',
          UiLang.en: "We're meeting at half past six.",
        },
      ),
      Phrase(
        id: 'nl_numbers_time_4',
        target: 'Dat is vijftien euro vijftig.',
        gloss: {
          UiLang.tr: 'Bu on beş euro elli sent tutuyor.',
          UiLang.en: 'That comes to fifteen euros fifty.',
        },
      ),
      Phrase(
        id: 'nl_numbers_time_5',
        target: 'Ik heb nog tien minuten nodig.',
        gloss: {
          UiLang.tr: 'On dakikaya daha ihtiyacım var.',
          UiLang.en: 'I need ten more minutes.',
        },
      ),
      Phrase(
        id: 'nl_numbers_time_6',
        target: "We zijn met z'n drieën.",
        gloss: {UiLang.tr: 'Üç kişiyiz.', UiLang.en: 'There are three of us.'},
      ),
      Phrase(
        id: 'nl_numbers_time_7',
        target: 'De afspraak is op twee maart.',
        gloss: {
          UiLang.tr: "Randevu iki Mart'ta.",
          UiLang.en: 'The appointment is on the second of March.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You want to know the time.',
        expected: 'Hoe laat is het?',
      ),
      SpeakTurn(
        prompt: 'Tell them the time.',
        expected: 'Het is kwart over negen.',
      ),
      SpeakTurn(
        prompt: 'Tell a friend when the train leaves.',
        expected: 'De trein vertrekt om acht uur.',
      ),
      SpeakTurn(
        prompt: 'Suggest a meeting time.',
        expected: 'We spreken af om half zeven.',
      ),
      SpeakTurn(
        prompt: 'Tell the customer the total.',
        expected: 'Dat is vijftien euro vijftig.',
      ),
      SpeakTurn(
        prompt: 'Ask for a little more time.',
        expected: 'Ik heb nog tien minuten nodig.',
      ),
      SpeakTurn(
        prompt: 'Tell the host how many people.',
        expected: "We zijn met z'n drieën.",
      ),
      SpeakTurn(
        prompt: 'Tell them the appointment date.',
        expected: 'De afspraak is op twee maart.',
      ),
    ],
  ),
  Scenario(
    id: 'nl_family',
    lang: LearnLang.nl,
    cefr: Cefr.a1,
    minutes: 8,
    titles: {UiLang.tr: 'Aile', UiLang.en: 'Family'},
    clipLine: 'Dit is mijn broer.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Çoğul isimler, tekildeki cinsiyetten bağımsız olarak her zaman 'de' artikelini alır (örn. 'het kind' → 'de kinderen').",
        UiLang.en:
            "Plural nouns always take the article 'de', no matter what article the singular noun uses (e.g. 'het kind' → 'de kinderen').",
      },
      goodExample: 'De kinderen zijn thuis.',
      badExample: 'Het kinderen zijn thuis.',
    ),
    phrases: [
      Phrase(
        id: 'nl_family_0',
        target: 'Dit is mijn broer.',
        gloss: {
          UiLang.tr: 'Bu benim erkek kardeşim.',
          UiLang.en: 'This is my brother.',
        },
      ),
      Phrase(
        id: 'nl_family_1',
        target: 'Dit is mijn zus.',
        gloss: {
          UiLang.tr: 'Bu benim kız kardeşim.',
          UiLang.en: 'This is my sister.',
        },
      ),
      Phrase(
        id: 'nl_family_2',
        target: 'Ik heb twee kinderen.',
        gloss: {
          UiLang.tr: 'İki çocuğum var.',
          UiLang.en: 'I have two children.',
        },
      ),
      Phrase(
        id: 'nl_family_3',
        target: 'Mijn ouders wonen in Izmir.',
        gloss: {
          UiLang.tr: "Anne babam İzmir'de yaşıyor.",
          UiLang.en: 'My parents live in Izmir.',
        },
      ),
      Phrase(
        id: 'nl_family_4',
        target: 'Heeft u broers of zussen?',
        gloss: {
          UiLang.tr: 'Kardeşiniz var mı?',
          UiLang.en: 'Do you have siblings?',
        },
      ),
      Phrase(
        id: 'nl_family_5',
        target: 'Mijn man werkt als arts.',
        gloss: {
          UiLang.tr: 'Kocam doktor olarak çalışıyor.',
          UiLang.en: 'My husband works as a doctor.',
        },
      ),
      Phrase(
        id: 'nl_family_6',
        target: 'Wij zijn een groot gezin.',
        gloss: {
          UiLang.tr: 'Biz kalabalık bir aileyiz.',
          UiLang.en: "We're a big family.",
        },
      ),
      Phrase(
        id: 'nl_family_7',
        target: 'Mijn dochter is nog klein.',
        gloss: {
          UiLang.tr: 'Kızım henüz küçük.',
          UiLang.en: 'My daughter is still little.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Introduce your brother.',
        expected: 'Dit is mijn broer.',
      ),
      SpeakTurn(prompt: 'Introduce your sister.', expected: 'Dit is mijn zus.'),
      SpeakTurn(
        prompt: 'Say how many children you have.',
        expected: 'Ik heb twee kinderen.',
      ),
      SpeakTurn(
        prompt: 'Say where your parents live.',
        expected: 'Mijn ouders wonen in Izmir.',
      ),
      SpeakTurn(
        prompt: 'Ask if they have siblings.',
        expected: 'Heeft u broers of zussen?',
      ),
      SpeakTurn(
        prompt: 'Say what your husband does.',
        expected: 'Mijn man werkt als arts.',
      ),
      SpeakTurn(
        prompt: 'Describe your family size.',
        expected: 'Wij zijn een groot gezin.',
      ),
      SpeakTurn(
        prompt: 'Say your daughter is still young.',
        expected: 'Mijn dochter is nog klein.',
      ),
    ],
  ),
  Scenario(
    id: 'nl_weather',
    lang: LearnLang.nl,
    cefr: Cefr.a1,
    minutes: 8,
    titles: {UiLang.tr: 'Hava durumu', UiLang.en: 'Weather'},
    clipLine: 'Het regent vandaag.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: "Hava durumu fiillerinde anlamsız özne 'het' asla düşmez.",
        UiLang.en:
            "Weather verbs always need the dummy subject 'het' — it can never be dropped.",
      },
      goodExample: 'Het regent vandaag.',
      badExample: 'Regent vandaag.',
    ),
    phrases: [
      Phrase(
        id: 'nl_weather_0',
        target: 'Hoe is het weer vandaag?',
        gloss: {
          UiLang.tr: 'Bugün hava nasıl?',
          UiLang.en: "What's the weather like today?",
        },
      ),
      Phrase(
        id: 'nl_weather_1',
        target: 'Het regent vandaag.',
        gloss: {
          UiLang.tr: 'Bugün yağmur yağıyor.',
          UiLang.en: "It's raining today.",
        },
      ),
      Phrase(
        id: 'nl_weather_2',
        target: 'Morgen wordt het zonnig.',
        gloss: {
          UiLang.tr: 'Yarın güneşli olacak.',
          UiLang.en: "Tomorrow it'll be sunny.",
        },
      ),
      Phrase(
        id: 'nl_weather_3',
        target: 'Het is erg koud buiten.',
        gloss: {
          UiLang.tr: 'Dışarısı çok soğuk.',
          UiLang.en: "It's very cold outside.",
        },
      ),
      Phrase(
        id: 'nl_weather_4',
        target: 'Neem een paraplu mee.',
        gloss: {
          UiLang.tr: 'Yanına şemsiye al.',
          UiLang.en: 'Take an umbrella with you.',
        },
      ),
      Phrase(
        id: 'nl_weather_5',
        target: 'In de zomer is het hier warm.',
        gloss: {
          UiLang.tr: 'Burada yazın hava sıcak oluyor.',
          UiLang.en: "It's warm here in summer.",
        },
      ),
      Phrase(
        id: 'nl_weather_6',
        target: 'Het sneeuwt al uren.',
        gloss: {
          UiLang.tr: "Saatlerdir kar yağıyor.",
          UiLang.en: "It's been snowing for hours.",
        },
      ),
      Phrase(
        id: 'nl_weather_7',
        target: 'Kleed je warm aan.',
        gloss: {UiLang.tr: 'Sıkı giyin.', UiLang.en: 'Dress warmly.'},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "Ask about today's weather.",
        expected: 'Hoe is het weer vandaag?',
      ),
      SpeakTurn(
        prompt: "Point out it's raining.",
        expected: 'Het regent vandaag.',
      ),
      SpeakTurn(
        prompt: "Mention tomorrow's forecast.",
        expected: 'Morgen wordt het zonnig.',
      ),
      SpeakTurn(
        prompt: 'Complain about the cold.',
        expected: 'Het is erg koud buiten.',
      ),
      SpeakTurn(
        prompt: 'Warn them to take an umbrella.',
        expected: 'Neem een paraplu mee.',
      ),
      SpeakTurn(
        prompt: 'Talk about summer heat.',
        expected: 'In de zomer is het hier warm.',
      ),
      SpeakTurn(
        prompt: "Mention it's been snowing.",
        expected: 'Het sneeuwt al uren.',
      ),
      SpeakTurn(
        prompt: 'Tell them to dress warmly.',
        expected: 'Kleed je warm aan.',
      ),
    ],
  ),
  Scenario(
    id: 'nl_transport',
    lang: LearnLang.nl,
    cefr: Cefr.a1,
    minutes: 8,
    titles: {UiLang.tr: 'Ulaşım', UiLang.en: 'Transport'},
    clipLine: 'Ik stap hier in.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Ayrılabilir fiil 'instappen' bölünür: önek ('in') düz cümlede sona gider.",
        UiLang.en:
            "The separable verb 'instappen' splits: the prefix ('in') moves to the end of the clause.",
      },
      goodExample: 'Ik stap hier in.',
      badExample: 'Ik instap hier.',
    ),
    phrases: [
      Phrase(
        id: 'nl_transport_0',
        target: 'Waar is de dichtstbijzijnde bushalte?',
        gloss: {
          UiLang.tr: 'En yakın otobüs durağı nerede?',
          UiLang.en: "Where's the nearest bus stop?",
        },
      ),
      Phrase(
        id: 'nl_transport_1',
        target: 'Welke lijn gaat naar het centrum?',
        gloss: {
          UiLang.tr: 'Merkeze hangi hat gidiyor?',
          UiLang.en: 'Which line goes to the center?',
        },
      ),
      Phrase(
        id: 'nl_transport_2',
        target: 'Ik stap hier in.',
        gloss: {
          UiLang.tr: 'Buradan bineceğim.',
          UiLang.en: "I'm getting on here.",
        },
      ),
      Phrase(
        id: 'nl_transport_3',
        target: 'Ik stap bij de volgende halte uit.',
        gloss: {
          UiLang.tr: 'Bir sonraki durakta ineceğim.',
          UiLang.en: "I'm getting off at the next stop.",
        },
      ),
      Phrase(
        id: 'nl_transport_4',
        target: 'Eén kaartje naar het centraal station, alstublieft.',
        gloss: {
          UiLang.tr: 'Merkez gara bir bilet, lütfen.',
          UiLang.en: 'One ticket to the central station, please.',
        },
      ),
      Phrase(
        id: 'nl_transport_5',
        target: 'Moet ik overstappen?',
        gloss: {
          UiLang.tr: 'Aktarma yapmam gerekiyor mu?',
          UiLang.en: 'Do I need to change trains?',
        },
      ),
      Phrase(
        id: 'nl_transport_6',
        target: 'De bus heeft vertraging.',
        gloss: {UiLang.tr: 'Otobüs gecikti.', UiLang.en: 'The bus is delayed.'},
      ),
      Phrase(
        id: 'nl_transport_7',
        target: 'Hoe lang duurt de rit?',
        gloss: {
          UiLang.tr: 'Yolculuk ne kadar sürüyor?',
          UiLang.en: 'How long does the trip take?',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Ask where the bus stop is.',
        expected: 'Waar is de dichtstbijzijnde bushalte?',
      ),
      SpeakTurn(
        prompt: 'Ask which line goes downtown.',
        expected: 'Welke lijn gaat naar het centrum?',
      ),
      SpeakTurn(
        prompt: "Say you're getting on here.",
        expected: 'Ik stap hier in.',
      ),
      SpeakTurn(
        prompt: "Say where you're getting off.",
        expected: 'Ik stap bij de volgende halte uit.',
      ),
      SpeakTurn(
        prompt: 'Buy a ticket.',
        expected: 'Eén kaartje naar het centraal station, alstublieft.',
      ),
      SpeakTurn(
        prompt: 'Ask if you need to change trains.',
        expected: 'Moet ik overstappen?',
      ),
      SpeakTurn(
        prompt: 'Notice the bus is late.',
        expected: 'De bus heeft vertraging.',
      ),
      SpeakTurn(
        prompt: 'Ask how long the trip takes.',
        expected: 'Hoe lang duurt de rit?',
      ),
    ],
  ),
  Scenario(
    id: 'nl_emergency',
    lang: LearnLang.nl,
    cefr: Cefr.a1,
    minutes: 8,
    titles: {UiLang.tr: 'Acil durum', UiLang.en: 'Emergency'},
    clipLine: 'Bel een ambulance!',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Emir kipinde çıplak fiil kökü kullanılır, özne zamiri söylenmez, fiil başta gelir.",
        UiLang.en:
            'The imperative uses the bare verb stem with no subject pronoun, and the verb comes first.',
      },
      goodExample: 'Bel een ambulance!',
      badExample: 'U belt een ambulance!',
    ),
    phrases: [
      Phrase(
        id: 'nl_emergency_0',
        target: 'Help! Bel een ambulance!',
        gloss: {
          UiLang.tr: 'İmdat! Bir ambulans çağırın!',
          UiLang.en: 'Help! Call an ambulance!',
        },
      ),
      Phrase(
        id: 'nl_emergency_1',
        target: 'Ik heb een ongeluk gehad.',
        gloss: {
          UiLang.tr: 'Bir kaza geçirdim.',
          UiLang.en: 'I had an accident.',
        },
      ),
      Phrase(
        id: 'nl_emergency_2',
        target: 'Bel alstublieft de politie.',
        gloss: {
          UiLang.tr: 'Lütfen polisi arayın.',
          UiLang.en: 'Please call the police.',
        },
      ),
      Phrase(
        id: 'nl_emergency_3',
        target: 'Ik heb dringend een dokter nodig.',
        gloss: {
          UiLang.tr: 'Acilen bir doktora ihtiyacım var.',
          UiLang.en: 'I urgently need a doctor.',
        },
      ),
      Phrase(
        id: 'nl_emergency_4',
        target: 'Waar is het dichtstbijzijnde ziekenhuis?',
        gloss: {
          UiLang.tr: 'En yakın hastane nerede?',
          UiLang.en: "Where's the nearest hospital?",
        },
      ),
      Phrase(
        id: 'nl_emergency_5',
        target: 'Ik voel me duizelig.',
        gloss: {UiLang.tr: 'Başım dönüyor.', UiLang.en: 'I feel dizzy.'},
      ),
      Phrase(
        id: 'nl_emergency_6',
        target: 'Blijf alstublieft bij mij.',
        gloss: {
          UiLang.tr: 'Lütfen yanımda kalın.',
          UiLang.en: 'Please stay with me.',
        },
      ),
      Phrase(
        id: 'nl_emergency_7',
        target: 'Het is een noodgeval!',
        gloss: {
          UiLang.tr: 'Bu bir acil durum!',
          UiLang.en: "It's an emergency!",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Call for urgent help.',
        expected: 'Help! Bel een ambulance!',
      ),
      SpeakTurn(
        prompt: 'Explain you had an accident.',
        expected: 'Ik heb een ongeluk gehad.',
      ),
      SpeakTurn(
        prompt: 'Ask someone to call the police.',
        expected: 'Bel alstublieft de politie.',
      ),
      SpeakTurn(
        prompt: 'Say you need a doctor now.',
        expected: 'Ik heb dringend een dokter nodig.',
      ),
      SpeakTurn(
        prompt: 'Ask where the hospital is.',
        expected: 'Waar is het dichtstbijzijnde ziekenhuis?',
      ),
      SpeakTurn(
        prompt: 'Describe how you feel.',
        expected: 'Ik voel me duizelig.',
      ),
      SpeakTurn(
        prompt: 'Ask someone to stay with you.',
        expected: 'Blijf alstublieft bij mij.',
      ),
      SpeakTurn(
        prompt: "Stress that it's urgent.",
        expected: 'Het is een noodgeval!',
      ),
    ],
  ),
  Scenario(
    id: 'nl_routine',
    lang: LearnLang.nl,
    cefr: Cefr.a1,
    minutes: 8,
    titles: {UiLang.tr: 'Günlük rutin', UiLang.en: 'Daily routine'},
    clipLine: 'Ik sta om zeven uur op.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: "Dönüşlü zamir ('me') çekimli fiilden hemen sonra gelir.",
        UiLang.en:
            "The reflexive pronoun ('me') goes directly after the conjugated verb.",
      },
      goodExample: 'Ik was me snel.',
      badExample: 'Ik me was snel.',
    ),
    phrases: [
      Phrase(
        id: 'nl_routine_0',
        target: 'Ik sta om zeven uur op.',
        gloss: {
          UiLang.tr: 'Saat yedide kalkıyorum.',
          UiLang.en: "I get up at seven o'clock.",
        },
      ),
      Phrase(
        id: 'nl_routine_1',
        target: 'Ik was me snel.',
        gloss: {
          UiLang.tr: 'Hızlıca yıkanıyorum.',
          UiLang.en: 'I wash up quickly.',
        },
      ),
      Phrase(
        id: 'nl_routine_2',
        target: 'Daarna ontbijt ik.',
        gloss: {
          UiLang.tr: 'Ondan sonra kahvaltı yapıyorum.',
          UiLang.en: 'After that I have breakfast.',
        },
      ),
      Phrase(
        id: 'nl_routine_3',
        target: 'Ik ga met de bus naar het werk.',
        gloss: {
          UiLang.tr: 'İşe otobüsle gidiyorum.',
          UiLang.en: 'I go to work by bus.',
        },
      ),
      Phrase(
        id: 'nl_routine_4',
        target: 'Om twaalf uur neem ik een pauze.',
        gloss: {
          UiLang.tr: 'Saat on ikide mola veriyorum.',
          UiLang.en: 'At noon I take a break.',
        },
      ),
      Phrase(
        id: 'nl_routine_5',
        target: "'s Avonds kook ik voor het gezin.",
        gloss: {
          UiLang.tr: 'Akşam aile için yemek yapıyorum.',
          UiLang.en: 'In the evenings I cook for the family.',
        },
      ),
      Phrase(
        id: 'nl_routine_6',
        target: 'Ik ga meestal om elf uur naar bed.',
        gloss: {
          UiLang.tr: 'Genellikle saat on birde yatıyorum.',
          UiLang.en: 'I usually go to bed at eleven.',
        },
      ),
      Phrase(
        id: 'nl_routine_7',
        target: 'In het weekend slaap ik langer.',
        gloss: {
          UiLang.tr: 'Hafta sonu daha uzun uyuyorum.',
          UiLang.en: 'On weekends I sleep longer.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Say when you wake up.',
        expected: 'Ik sta om zeven uur op.',
      ),
      SpeakTurn(
        prompt: 'Describe your morning wash.',
        expected: 'Ik was me snel.',
      ),
      SpeakTurn(prompt: 'Say what comes next.', expected: 'Daarna ontbijt ik.'),
      SpeakTurn(
        prompt: 'Say how you get to work.',
        expected: 'Ik ga met de bus naar het werk.',
      ),
      SpeakTurn(
        prompt: 'Mention your midday break.',
        expected: 'Om twaalf uur neem ik een pauze.',
      ),
      SpeakTurn(
        prompt: 'Say what you cook in the evening.',
        expected: "'s Avonds kook ik voor het gezin.",
      ),
      SpeakTurn(
        prompt: 'Say when you usually sleep.',
        expected: 'Ik ga meestal om elf uur naar bed.',
      ),
      SpeakTurn(
        prompt: 'Mention your weekend habit.',
        expected: 'In het weekend slaap ik langer.',
      ),
    ],
  ),
  Scenario(
    id: 'nl_past_story',
    lang: LearnLang.nl,
    cefr: Cefr.a1,
    minutes: 8,
    titles: {
      UiLang.tr: 'Geçmişte bir olay anlatmak',
      UiLang.en: 'Telling a story in the past',
    },
    clipLine: 'Gisteren ben ik naar de bioscoop gegaan.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Perfectum ('hebben/zijn' + geçmiş ortaç) kurulur; ortaç cümlenin en sonuna gider.",
        UiLang.en:
            'The perfect tense uses hebben/zijn plus a past participle, which goes to the very end of the clause.',
      },
      goodExample: 'Ik ben gisteren naar de bioscoop gegaan.',
      badExample: 'Ik ben gisteren gegaan naar de bioscoop.',
    ),
    phrases: [
      Phrase(
        id: 'nl_past_story_0',
        target: 'Gisteren ben ik naar de bioscoop gegaan.',
        gloss: {
          UiLang.tr: 'Dün sinemaya gittim.',
          UiLang.en: 'Yesterday I went to the cinema.',
        },
      ),
      Phrase(
        id: 'nl_past_story_1',
        target: 'Ik heb een oude vriend ontmoet.',
        gloss: {
          UiLang.tr: 'Eski bir arkadaşımla karşılaştım.',
          UiLang.en: 'I ran into an old friend.',
        },
      ),
      Phrase(
        id: 'nl_past_story_2',
        target: 'We hebben samen koffie gedronken.',
        gloss: {
          UiLang.tr: 'Birlikte kahve içtik.',
          UiLang.en: 'We had coffee together.',
        },
      ),
      Phrase(
        id: 'nl_past_story_3',
        target: 'Daarna hebben we lang gepraat.',
        gloss: {
          UiLang.tr: 'Ondan sonra uzun uzun konuştuk.',
          UiLang.en: 'After that we talked for a long time.',
        },
      ),
      Phrase(
        id: 'nl_past_story_4',
        target: 'De film beviel me erg.',
        gloss: {
          UiLang.tr: 'Film çok hoşuma gitti.',
          UiLang.en: 'I liked the movie a lot.',
        },
      ),
      Phrase(
        id: 'nl_past_story_5',
        target: 'Het werd laat.',
        gloss: {UiLang.tr: 'Vakit geç oldu.', UiLang.en: 'It got late.'},
      ),
      Phrase(
        id: 'nl_past_story_6',
        target: 'Ik ben moe thuisgekomen.',
        gloss: {
          UiLang.tr: 'Yorgun bir şekilde eve geldim.',
          UiLang.en: 'I came home tired.',
        },
      ),
      Phrase(
        id: 'nl_past_story_7',
        target: 'Het was een fijne avond.',
        gloss: {
          UiLang.tr: 'Güzel bir akşamdı.',
          UiLang.en: 'It was a nice evening.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Start telling what you did yesterday.',
        expected: 'Gisteren ben ik naar de bioscoop gegaan.',
      ),
      SpeakTurn(
        prompt: 'Say who you ran into.',
        expected: 'Ik heb een oude vriend ontmoet.',
      ),
      SpeakTurn(
        prompt: 'Say what you did together.',
        expected: 'We hebben samen koffie gedronken.',
      ),
      SpeakTurn(
        prompt: 'Say what happened after.',
        expected: 'Daarna hebben we lang gepraat.',
      ),
      SpeakTurn(
        prompt: 'Say you liked the movie.',
        expected: 'De film beviel me erg.',
      ),
      SpeakTurn(prompt: 'Say it got late.', expected: 'Het werd laat.'),
      SpeakTurn(
        prompt: 'Say how you got home.',
        expected: 'Ik ben moe thuisgekomen.',
      ),
      SpeakTurn(
        prompt: 'Wrap up the story.',
        expected: 'Het was een fijne avond.',
      ),
    ],
  ),

  // ================= SWEDISH (sv) =================
  Scenario(
    id: 'sv_intro',
    lang: LearnLang.sv,
    cefr: Cefr.a1,
    minutes: 8,
    titles: {UiLang.tr: 'Tanışma', UiLang.en: 'Introductions'},
    clipLine: 'Jag har varit här i tre dagar.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "İsveççe'de fiil ikinci sırada kalır — cümle bir zaman ifadesiyle başlarsa özne fiilden sonraya kayar.",
        UiLang.en:
            'In Swedish the verb stays in second position — if a sentence opens with a time expression, the subject moves after the verb.',
      },
      goodExample: 'I tre dagar har jag varit här.',
      badExample: 'I tre dagar jag har varit här.',
    ),
    phrases: [
      Phrase(
        id: 'sv_intro_0',
        target: 'Hej, jag heter Elif.',
        gloss: {
          UiLang.tr: 'Merhaba, adım Elif.',
          UiLang.en: 'Hi, my name is Elif.',
        },
      ),
      Phrase(
        id: 'sv_intro_1',
        target: 'Vad heter du?',
        gloss: {UiLang.tr: 'Adın ne?', UiLang.en: "What's your name?"},
      ),
      Phrase(
        id: 'sv_intro_2',
        target: 'Jag kommer från Turkiet.',
        gloss: {UiLang.tr: "Türkiye'denim.", UiLang.en: "I'm from Turkey."},
      ),
      Phrase(
        id: 'sv_intro_3',
        target: 'Och varifrån kommer du?',
        gloss: {
          UiLang.tr: 'Peki sen nerelisin?',
          UiLang.en: 'And where are you from?',
        },
      ),
      Phrase(
        id: 'sv_intro_4',
        target: 'I tre dagar har jag varit här.',
        gloss: {
          UiLang.tr: 'Üç gündür buradayım.',
          UiLang.en: "I've been here for three days.",
        },
      ),
      Phrase(
        id: 'sv_intro_5',
        target: 'Trevligt att träffa dig.',
        gloss: {
          UiLang.tr: 'Tanıştığımıza memnun oldum.',
          UiLang.en: 'Nice to meet you.',
        },
      ),
      Phrase(
        id: 'sv_intro_6',
        target: 'Hur mår du?',
        gloss: {UiLang.tr: 'Nasılsın?', UiLang.en: 'How are you?'},
      ),
      Phrase(
        id: 'sv_intro_7',
        target: 'Bra, tack.',
        gloss: {
          UiLang.tr: 'İyiyim, teşekkürler.',
          UiLang.en: "I'm fine, thanks.",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Greet someone and give your name.',
        expected: 'Hej, jag heter Elif.',
      ),
      SpeakTurn(prompt: 'Ask their name.', expected: 'Vad heter du?'),
      SpeakTurn(
        prompt: "Say where you're from.",
        expected: 'Jag kommer från Turkiet.',
      ),
      SpeakTurn(
        prompt: 'Ask where they are from.',
        expected: 'Och varifrån kommer du?',
      ),
      SpeakTurn(
        prompt: "Say how long you've been here.",
        expected: 'I tre dagar har jag varit här.',
      ),
      SpeakTurn(
        prompt: 'Say it was nice meeting them.',
        expected: 'Trevligt att träffa dig.',
      ),
      SpeakTurn(prompt: 'Ask how they are doing.', expected: 'Hur mår du?'),
      SpeakTurn(
        prompt: "Answer that you're doing well.",
        expected: 'Bra, tack.',
      ),
    ],
  ),
  Scenario(
    id: 'sv_shopping',
    lang: LearnLang.sv,
    cefr: Cefr.a1,
    minutes: 8,
    titles: {UiLang.tr: 'Alışveriş', UiLang.en: 'Shopping'},
    clipLine: 'Jag vill gärna ha den här.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Belgisiz artikel ('en/ett') ismin cinsiyetine uymalıdır — 'en påse', 'ett påse' değil.",
        UiLang.en:
            "The indefinite article ('en/ett') must match the noun's gender — it's 'en påse', not 'ett påse'.",
      },
      goodExample: 'Jag vill ha en påse.',
      badExample: 'Jag vill ha ett påse.',
    ),
    phrases: [
      Phrase(
        id: 'sv_shopping_0',
        target: 'Jag vill gärna ha den här.',
        gloss: {
          UiLang.tr: 'Bunu istiyorum, lütfen.',
          UiLang.en: "I'd like this one, please.",
        },
      ),
      Phrase(
        id: 'sv_shopping_1',
        target: 'Har ni den här i storlek M?',
        gloss: {
          UiLang.tr: 'Bunun M bedeni var mı?',
          UiLang.en: 'Do you have this in size M?',
        },
      ),
      Phrase(
        id: 'sv_shopping_2',
        target: 'Kan jag prova den?',
        gloss: {
          UiLang.tr: 'Bunu deneyebilir miyim?',
          UiLang.en: 'Can I try this on?',
        },
      ),
      Phrase(
        id: 'sv_shopping_3',
        target: 'Jag har inget kontokort, bara kontanter.',
        gloss: {
          UiLang.tr: 'Kredi kartım yok, sadece nakit.',
          UiLang.en: "I don't have a card, only cash.",
        },
      ),
      Phrase(
        id: 'sv_shopping_4',
        target: 'Finns det någon rabatt?',
        gloss: {
          UiLang.tr: 'İndirim var mı?',
          UiLang.en: 'Is there a discount?',
        },
      ),
      Phrase(
        id: 'sv_shopping_5',
        target: 'Det är för dyrt för mig.',
        gloss: {
          UiLang.tr: 'Bu benim için çok pahalı.',
          UiLang.en: "That's too expensive for me.",
        },
      ),
      Phrase(
        id: 'sv_shopping_6',
        target: 'Jag tar den.',
        gloss: {UiLang.tr: 'Alıyorum.', UiLang.en: "I'll take it."},
      ),
      Phrase(
        id: 'sv_shopping_7',
        target: 'Jag vill ha en påse, tack.',
        gloss: {
          UiLang.tr: 'Bir poşet istiyorum, lütfen.',
          UiLang.en: "I'd like a bag, please.",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "Say you'd like this item.",
        expected: 'Jag vill gärna ha den här.',
      ),
      SpeakTurn(
        prompt: 'Ask about your size.',
        expected: 'Har ni den här i storlek M?',
      ),
      SpeakTurn(prompt: 'Ask to try it on.', expected: 'Kan jag prova den?'),
      SpeakTurn(
        prompt: "Say you'll pay cash, not card.",
        expected: 'Jag har inget kontokort, bara kontanter.',
      ),
      SpeakTurn(
        prompt: "Ask if there's a discount.",
        expected: 'Finns det någon rabatt?',
      ),
      SpeakTurn(
        prompt: "Say it's too expensive.",
        expected: 'Det är för dyrt för mig.',
      ),
      SpeakTurn(prompt: 'Decide to buy it.', expected: 'Jag tar den.'),
      SpeakTurn(
        prompt: 'Ask for a bag.',
        expected: 'Jag vill ha en påse, tack.',
      ),
    ],
  ),
  Scenario(
    id: 'sv_numbers_time',
    lang: LearnLang.sv,
    cefr: Cefr.a1,
    minutes: 8,
    titles: {UiLang.tr: 'Sayılar & saat', UiLang.en: 'Numbers & time'},
    clipLine: 'Vad är klockan?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Saat ifadelerinde sayıdan önce 'klockan' kelimesi gelmelidir.",
        UiLang.en: "Clock times need the word 'klockan' before the number.",
      },
      goodExample: 'Tåget går klockan åtta.',
      badExample: 'Tåget går åtta.',
    ),
    phrases: [
      Phrase(
        id: 'sv_numbers_time_0',
        target: 'Vad är klockan?',
        gloss: {UiLang.tr: 'Saat kaç?', UiLang.en: 'What time is it?'},
      ),
      Phrase(
        id: 'sv_numbers_time_1',
        target: 'Klockan är kvart över nio.',
        gloss: {
          UiLang.tr: 'Saat dokuzu çeyrek geçiyor.',
          UiLang.en: "It's a quarter past nine.",
        },
      ),
      Phrase(
        id: 'sv_numbers_time_2',
        target: 'Tåget går klockan åtta.',
        gloss: {
          UiLang.tr: 'Tren saat sekizde kalkıyor.',
          UiLang.en: 'The train leaves at eight o\'clock.',
        },
      ),
      Phrase(
        id: 'sv_numbers_time_3',
        target: 'Vi ses klockan halv sju.',
        gloss: {
          UiLang.tr: 'Altı buçukta görüşürüz.',
          UiLang.en: "We're meeting at half past six.",
        },
      ),
      Phrase(
        id: 'sv_numbers_time_4',
        target: 'Det blir femton euro femtio.',
        gloss: {
          UiLang.tr: 'Bu on beş euro elli sent tutuyor.',
          UiLang.en: 'That comes to fifteen euros fifty.',
        },
      ),
      Phrase(
        id: 'sv_numbers_time_5',
        target: 'Jag behöver tio minuter till.',
        gloss: {
          UiLang.tr: 'On dakikaya daha ihtiyacım var.',
          UiLang.en: 'I need ten more minutes.',
        },
      ),
      Phrase(
        id: 'sv_numbers_time_6',
        target: 'Vi är tre stycken.',
        gloss: {UiLang.tr: 'Üç kişiyiz.', UiLang.en: 'There are three of us.'},
      ),
      Phrase(
        id: 'sv_numbers_time_7',
        target: 'Mötet är den andra mars.',
        gloss: {
          UiLang.tr: "Randevu iki Mart'ta.",
          UiLang.en: 'The appointment is on the second of March.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You want to know the time.',
        expected: 'Vad är klockan?',
      ),
      SpeakTurn(
        prompt: 'Tell them the time.',
        expected: 'Klockan är kvart över nio.',
      ),
      SpeakTurn(
        prompt: 'Tell a friend when the train leaves.',
        expected: 'Tåget går klockan åtta.',
      ),
      SpeakTurn(
        prompt: 'Suggest a meeting time.',
        expected: 'Vi ses klockan halv sju.',
      ),
      SpeakTurn(
        prompt: 'Tell the customer the total.',
        expected: 'Det blir femton euro femtio.',
      ),
      SpeakTurn(
        prompt: 'Ask for a little more time.',
        expected: 'Jag behöver tio minuter till.',
      ),
      SpeakTurn(
        prompt: 'Tell the host how many people.',
        expected: 'Vi är tre stycken.',
      ),
      SpeakTurn(
        prompt: 'Tell them the appointment date.',
        expected: 'Mötet är den andra mars.',
      ),
    ],
  ),
  Scenario(
    id: 'sv_family',
    lang: LearnLang.sv,
    cefr: Cefr.a1,
    minutes: 8,
    titles: {UiLang.tr: 'Aile', UiLang.en: 'Family'},
    clipLine: 'Det här är min bror.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "İyelik zamiri ('min/mitt/mina') ismin cinsiyetine ve sayısına göre değişir.",
        UiLang.en:
            "The possessive ('min/mitt/mina') agrees with the noun's gender and number.",
      },
      goodExample: 'Det här är min bror.',
      badExample: 'Det här är mitt bror.',
    ),
    phrases: [
      Phrase(
        id: 'sv_family_0',
        target: 'Det här är min bror.',
        gloss: {
          UiLang.tr: 'Bu benim erkek kardeşim.',
          UiLang.en: 'This is my brother.',
        },
      ),
      Phrase(
        id: 'sv_family_1',
        target: 'Det här är min syster.',
        gloss: {
          UiLang.tr: 'Bu benim kız kardeşim.',
          UiLang.en: 'This is my sister.',
        },
      ),
      Phrase(
        id: 'sv_family_2',
        target: 'Jag har två barn.',
        gloss: {
          UiLang.tr: 'İki çocuğum var.',
          UiLang.en: 'I have two children.',
        },
      ),
      Phrase(
        id: 'sv_family_3',
        target: 'Mina föräldrar bor i Izmir.',
        gloss: {
          UiLang.tr: "Anne babam İzmir'de yaşıyor.",
          UiLang.en: 'My parents live in Izmir.',
        },
      ),
      Phrase(
        id: 'sv_family_4',
        target: 'Har du några syskon?',
        gloss: {
          UiLang.tr: 'Kardeşin var mı?',
          UiLang.en: 'Do you have any siblings?',
        },
      ),
      Phrase(
        id: 'sv_family_5',
        target: 'Min man jobbar som läkare.',
        gloss: {
          UiLang.tr: 'Kocam doktor olarak çalışıyor.',
          UiLang.en: 'My husband works as a doctor.',
        },
      ),
      Phrase(
        id: 'sv_family_6',
        target: 'Vi är en stor familj.',
        gloss: {
          UiLang.tr: 'Biz kalabalık bir aileyiz.',
          UiLang.en: "We're a big family.",
        },
      ),
      Phrase(
        id: 'sv_family_7',
        target: 'Min dotter är fortfarande liten.',
        gloss: {
          UiLang.tr: 'Kızım henüz küçük.',
          UiLang.en: 'My daughter is still little.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Introduce your brother.',
        expected: 'Det här är min bror.',
      ),
      SpeakTurn(
        prompt: 'Introduce your sister.',
        expected: 'Det här är min syster.',
      ),
      SpeakTurn(
        prompt: 'Say how many children you have.',
        expected: 'Jag har två barn.',
      ),
      SpeakTurn(
        prompt: 'Say where your parents live.',
        expected: 'Mina föräldrar bor i Izmir.',
      ),
      SpeakTurn(
        prompt: 'Ask if they have siblings.',
        expected: 'Har du några syskon?',
      ),
      SpeakTurn(
        prompt: 'Say what your husband does.',
        expected: 'Min man jobbar som läkare.',
      ),
      SpeakTurn(
        prompt: 'Describe your family size.',
        expected: 'Vi är en stor familj.',
      ),
      SpeakTurn(
        prompt: 'Say your daughter is still young.',
        expected: 'Min dotter är fortfarande liten.',
      ),
    ],
  ),
  Scenario(
    id: 'sv_weather',
    lang: LearnLang.sv,
    cefr: Cefr.a1,
    minutes: 8,
    titles: {UiLang.tr: 'Hava durumu', UiLang.en: 'Weather'},
    clipLine: 'Det regnar i dag.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: "Hava durumu fiillerinde anlamsız özne 'det' asla düşmez.",
        UiLang.en:
            "Weather verbs always need the dummy subject 'det' — it can never be dropped.",
      },
      goodExample: 'Det regnar i dag.',
      badExample: 'Regnar i dag.',
    ),
    phrases: [
      Phrase(
        id: 'sv_weather_0',
        target: 'Hur är vädret i dag?',
        gloss: {
          UiLang.tr: 'Bugün hava nasıl?',
          UiLang.en: "What's the weather like today?",
        },
      ),
      Phrase(
        id: 'sv_weather_1',
        target: 'Det regnar i dag.',
        gloss: {
          UiLang.tr: 'Bugün yağmur yağıyor.',
          UiLang.en: "It's raining today.",
        },
      ),
      Phrase(
        id: 'sv_weather_2',
        target: 'I morgon ska det bli soligt.',
        gloss: {
          UiLang.tr: 'Yarın güneşli olacak.',
          UiLang.en: "Tomorrow it's supposed to be sunny.",
        },
      ),
      Phrase(
        id: 'sv_weather_3',
        target: 'Det är väldigt kallt ute.',
        gloss: {
          UiLang.tr: 'Dışarısı çok soğuk.',
          UiLang.en: "It's very cold outside.",
        },
      ),
      Phrase(
        id: 'sv_weather_4',
        target: 'Ta med ett paraply.',
        gloss: {
          UiLang.tr: 'Yanına şemsiye al.',
          UiLang.en: 'Take an umbrella with you.',
        },
      ),
      Phrase(
        id: 'sv_weather_5',
        target: 'På sommaren är det varmt här.',
        gloss: {
          UiLang.tr: 'Burada yazın hava sıcak oluyor.',
          UiLang.en: "It's warm here in summer.",
        },
      ),
      Phrase(
        id: 'sv_weather_6',
        target: 'Det har snöat i flera timmar.',
        gloss: {
          UiLang.tr: "Saatlerdir kar yağıyor.",
          UiLang.en: "It's been snowing for hours.",
        },
      ),
      Phrase(
        id: 'sv_weather_7',
        target: 'Klä dig varmt.',
        gloss: {UiLang.tr: 'Sıkı giyin.', UiLang.en: 'Dress warmly.'},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "Ask about today's weather.",
        expected: 'Hur är vädret i dag?',
      ),
      SpeakTurn(
        prompt: "Point out it's raining.",
        expected: 'Det regnar i dag.',
      ),
      SpeakTurn(
        prompt: "Mention tomorrow's forecast.",
        expected: 'I morgon ska det bli soligt.',
      ),
      SpeakTurn(
        prompt: 'Complain about the cold.',
        expected: 'Det är väldigt kallt ute.',
      ),
      SpeakTurn(
        prompt: 'Warn them to take an umbrella.',
        expected: 'Ta med ett paraply.',
      ),
      SpeakTurn(
        prompt: 'Talk about summer heat.',
        expected: 'På sommaren är det varmt här.',
      ),
      SpeakTurn(
        prompt: "Mention it's been snowing.",
        expected: 'Det har snöat i flera timmar.',
      ),
      SpeakTurn(
        prompt: 'Tell them to dress warmly.',
        expected: 'Klä dig varmt.',
      ),
    ],
  ),
  Scenario(
    id: 'sv_transport',
    lang: LearnLang.sv,
    cefr: Cefr.a1,
    minutes: 8,
    titles: {UiLang.tr: 'Ulaşım', UiLang.en: 'Transport'},
    clipLine: 'Nu tar jag bussen.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "İsveççe'de öne çıkan zaman zarfı ('nu') fiili ikinci sırada tutar — özne fiilden sonraya kayar.",
        UiLang.en:
            "In Swedish a fronted time adverb ('nu') still keeps the verb in second position — the subject moves after it.",
      },
      goodExample: 'Nu tar jag bussen.',
      badExample: 'Nu jag tar bussen.',
    ),
    phrases: [
      Phrase(
        id: 'sv_transport_0',
        target: 'Var är närmaste busshållplats?',
        gloss: {
          UiLang.tr: 'En yakın otobüs durağı nerede?',
          UiLang.en: "Where's the nearest bus stop?",
        },
      ),
      Phrase(
        id: 'sv_transport_1',
        target: 'Vilken linje går till centrum?',
        gloss: {
          UiLang.tr: 'Merkeze hangi hat gidiyor?',
          UiLang.en: 'Which line goes to the center?',
        },
      ),
      Phrase(
        id: 'sv_transport_2',
        target: 'Nu tar jag bussen.',
        gloss: {
          UiLang.tr: 'Şimdi otobüse biniyorum.',
          UiLang.en: "I'm taking the bus now.",
        },
      ),
      Phrase(
        id: 'sv_transport_3',
        target: 'Jag går av vid nästa hållplats.',
        gloss: {
          UiLang.tr: 'Bir sonraki durakta ineceğim.',
          UiLang.en: "I'm getting off at the next stop.",
        },
      ),
      Phrase(
        id: 'sv_transport_4',
        target: 'En biljett till centralstationen, tack.',
        gloss: {
          UiLang.tr: 'Merkez gara bir bilet, lütfen.',
          UiLang.en: 'One ticket to the central station, please.',
        },
      ),
      Phrase(
        id: 'sv_transport_5',
        target: 'Måste jag byta tåg?',
        gloss: {
          UiLang.tr: 'Aktarma yapmam gerekiyor mu?',
          UiLang.en: 'Do I need to change trains?',
        },
      ),
      Phrase(
        id: 'sv_transport_6',
        target: 'Bussen är försenad.',
        gloss: {UiLang.tr: 'Otobüs gecikti.', UiLang.en: 'The bus is delayed.'},
      ),
      Phrase(
        id: 'sv_transport_7',
        target: 'Hur lång tid tar resan?',
        gloss: {
          UiLang.tr: 'Yolculuk ne kadar sürüyor?',
          UiLang.en: 'How long does the trip take?',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Ask where the bus stop is.',
        expected: 'Var är närmaste busshållplats?',
      ),
      SpeakTurn(
        prompt: 'Ask which line goes downtown.',
        expected: 'Vilken linje går till centrum?',
      ),
      SpeakTurn(
        prompt: "Say you're taking the bus now.",
        expected: 'Nu tar jag bussen.',
      ),
      SpeakTurn(
        prompt: "Say where you're getting off.",
        expected: 'Jag går av vid nästa hållplats.',
      ),
      SpeakTurn(
        prompt: 'Buy a ticket.',
        expected: 'En biljett till centralstationen, tack.',
      ),
      SpeakTurn(
        prompt: 'Ask if you need to change trains.',
        expected: 'Måste jag byta tåg?',
      ),
      SpeakTurn(
        prompt: 'Notice the bus is late.',
        expected: 'Bussen är försenad.',
      ),
      SpeakTurn(
        prompt: 'Ask how long the trip takes.',
        expected: 'Hur lång tid tar resan?',
      ),
    ],
  ),
  Scenario(
    id: 'sv_emergency',
    lang: LearnLang.sv,
    cefr: Cefr.a1,
    minutes: 8,
    titles: {UiLang.tr: 'Acil durum', UiLang.en: 'Emergency'},
    clipLine: 'Ring en ambulans!',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Emir kipinde çıplak fiil kökü kullanılır, özne zamiri söylenmez, fiil başta gelir.",
        UiLang.en:
            'The imperative uses the bare verb stem with no subject pronoun, and the verb comes first.',
      },
      goodExample: 'Ring en ambulans!',
      badExample: 'Du ringer en ambulans!',
    ),
    phrases: [
      Phrase(
        id: 'sv_emergency_0',
        target: 'Hjälp! Ring en ambulans!',
        gloss: {
          UiLang.tr: 'İmdat! Bir ambulans çağırın!',
          UiLang.en: 'Help! Call an ambulance!',
        },
      ),
      Phrase(
        id: 'sv_emergency_1',
        target: 'Jag har varit med om en olycka.',
        gloss: {
          UiLang.tr: 'Bir kazaya karıştım.',
          UiLang.en: "I've been in an accident.",
        },
      ),
      Phrase(
        id: 'sv_emergency_2',
        target: 'Ring polisen, tack.',
        gloss: {
          UiLang.tr: 'Polisi arayın, lütfen.',
          UiLang.en: 'Please call the police.',
        },
      ),
      Phrase(
        id: 'sv_emergency_3',
        target: 'Jag behöver akut en läkare.',
        gloss: {
          UiLang.tr: 'Acilen bir doktora ihtiyacım var.',
          UiLang.en: 'I urgently need a doctor.',
        },
      ),
      Phrase(
        id: 'sv_emergency_4',
        target: 'Var ligger närmaste sjukhus?',
        gloss: {
          UiLang.tr: 'En yakın hastane nerede?',
          UiLang.en: "Where's the nearest hospital?",
        },
      ),
      Phrase(
        id: 'sv_emergency_5',
        target: 'Jag känner mig yr.',
        gloss: {UiLang.tr: 'Başım dönüyor.', UiLang.en: 'I feel dizzy.'},
      ),
      Phrase(
        id: 'sv_emergency_6',
        target: 'Snälla, stanna hos mig.',
        gloss: {
          UiLang.tr: 'Lütfen yanımda kalın.',
          UiLang.en: 'Please stay with me.',
        },
      ),
      Phrase(
        id: 'sv_emergency_7',
        target: 'Det är ett nödläge!',
        gloss: {
          UiLang.tr: 'Bu bir acil durum!',
          UiLang.en: "It's an emergency!",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Call for urgent help.',
        expected: 'Hjälp! Ring en ambulans!',
      ),
      SpeakTurn(
        prompt: 'Explain you had an accident.',
        expected: 'Jag har varit med om en olycka.',
      ),
      SpeakTurn(
        prompt: 'Ask someone to call the police.',
        expected: 'Ring polisen, tack.',
      ),
      SpeakTurn(
        prompt: 'Say you need a doctor now.',
        expected: 'Jag behöver akut en läkare.',
      ),
      SpeakTurn(
        prompt: 'Ask where the hospital is.',
        expected: 'Var ligger närmaste sjukhus?',
      ),
      SpeakTurn(
        prompt: 'Describe how you feel.',
        expected: 'Jag känner mig yr.',
      ),
      SpeakTurn(
        prompt: 'Ask someone to stay with you.',
        expected: 'Snälla, stanna hos mig.',
      ),
      SpeakTurn(
        prompt: "Stress that it's urgent.",
        expected: 'Det är ett nödläge!',
      ),
    ],
  ),
  Scenario(
    id: 'sv_routine',
    lang: LearnLang.sv,
    cefr: Cefr.a1,
    minutes: 8,
    titles: {UiLang.tr: 'Günlük rutin', UiLang.en: 'Daily routine'},
    clipLine: 'Jag går upp klockan sju.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Dönüşlü zamir özneyle uyumlu olmalıdır — birinci tekil şahıs 'mig' alır, 'sig' sadece üçüncü şahıs içindir.",
        UiLang.en:
            "The reflexive pronoun must match the subject — first person takes 'mig'; 'sig' is only for third person.",
      },
      goodExample: 'Jag tvättar mig klockan sju.',
      badExample: 'Jag tvättar sig klockan sju.',
    ),
    phrases: [
      Phrase(
        id: 'sv_routine_0',
        target: 'Jag går upp klockan sju.',
        gloss: {
          UiLang.tr: 'Saat yedide kalkıyorum.',
          UiLang.en: "I get up at seven o'clock.",
        },
      ),
      Phrase(
        id: 'sv_routine_1',
        target: 'Jag tvättar mig snabbt.',
        gloss: {
          UiLang.tr: 'Hızlıca yıkanıyorum.',
          UiLang.en: 'I wash up quickly.',
        },
      ),
      Phrase(
        id: 'sv_routine_2',
        target: 'Sedan äter jag frukost.',
        gloss: {
          UiLang.tr: 'Ondan sonra kahvaltı yapıyorum.',
          UiLang.en: 'After that I have breakfast.',
        },
      ),
      Phrase(
        id: 'sv_routine_3',
        target: 'Jag åker buss till jobbet.',
        gloss: {
          UiLang.tr: 'İşe otobüsle gidiyorum.',
          UiLang.en: 'I go to work by bus.',
        },
      ),
      Phrase(
        id: 'sv_routine_4',
        target: 'Klockan tolv tar jag en paus.',
        gloss: {
          UiLang.tr: 'Saat on ikide mola veriyorum.',
          UiLang.en: 'At noon I take a break.',
        },
      ),
      Phrase(
        id: 'sv_routine_5',
        target: 'På kvällen lagar jag mat till familjen.',
        gloss: {
          UiLang.tr: 'Akşam aile için yemek yapıyorum.',
          UiLang.en: 'In the evenings I cook for the family.',
        },
      ),
      Phrase(
        id: 'sv_routine_6',
        target: 'Jag går och lägger mig oftast klockan elva.',
        gloss: {
          UiLang.tr: 'Genellikle saat on birde yatıyorum.',
          UiLang.en: 'I usually go to bed at eleven.',
        },
      ),
      Phrase(
        id: 'sv_routine_7',
        target: 'På helgen sover jag längre.',
        gloss: {
          UiLang.tr: 'Hafta sonu daha uzun uyuyorum.',
          UiLang.en: 'On weekends I sleep longer.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Say when you wake up.',
        expected: 'Jag går upp klockan sju.',
      ),
      SpeakTurn(
        prompt: 'Describe your morning wash.',
        expected: 'Jag tvättar mig snabbt.',
      ),
      SpeakTurn(
        prompt: 'Say what comes next.',
        expected: 'Sedan äter jag frukost.',
      ),
      SpeakTurn(
        prompt: 'Say how you get to work.',
        expected: 'Jag åker buss till jobbet.',
      ),
      SpeakTurn(
        prompt: 'Mention your midday break.',
        expected: 'Klockan tolv tar jag en paus.',
      ),
      SpeakTurn(
        prompt: 'Say what you cook in the evening.',
        expected: 'På kvällen lagar jag mat till familjen.',
      ),
      SpeakTurn(
        prompt: 'Say when you usually sleep.',
        expected: 'Jag går och lägger mig oftast klockan elva.',
      ),
      SpeakTurn(
        prompt: 'Mention your weekend habit.',
        expected: 'På helgen sover jag längre.',
      ),
    ],
  ),
  Scenario(
    id: 'sv_past_story',
    lang: LearnLang.sv,
    cefr: Cefr.a1,
    minutes: 8,
    titles: {
      UiLang.tr: 'Geçmişte bir olay anlatmak',
      UiLang.en: 'Telling a story in the past',
    },
    clipLine: 'I går gick jag på bio.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            "Basit geçmiş zaman (preteritum) tek fiille kurulur ve öne çıkan zaman zarfı ('i går') fiili yine ikinci sırada tutar.",
        UiLang.en:
            "The simple past (preteritum) is a single verb form, and a fronted time adverb ('i går') still keeps the verb in second position.",
      },
      goodExample: 'I går gick jag på bio.',
      badExample: 'I går jag gick på bio.',
    ),
    phrases: [
      Phrase(
        id: 'sv_past_story_0',
        target: 'I går gick jag på bio.',
        gloss: {
          UiLang.tr: 'Dün sinemaya gittim.',
          UiLang.en: 'Yesterday I went to the cinema.',
        },
      ),
      Phrase(
        id: 'sv_past_story_1',
        target: 'Jag träffade en gammal vän.',
        gloss: {
          UiLang.tr: 'Eski bir arkadaşımla karşılaştım.',
          UiLang.en: 'I ran into an old friend.',
        },
      ),
      Phrase(
        id: 'sv_past_story_2',
        target: 'Vi drack kaffe tillsammans.',
        gloss: {
          UiLang.tr: 'Birlikte kahve içtik.',
          UiLang.en: 'We had coffee together.',
        },
      ),
      Phrase(
        id: 'sv_past_story_3',
        target: 'Sedan pratade vi länge.',
        gloss: {
          UiLang.tr: 'Ondan sonra uzun uzun konuştuk.',
          UiLang.en: 'After that we talked for a long time.',
        },
      ),
      Phrase(
        id: 'sv_past_story_4',
        target: 'Jag tyckte mycket om filmen.',
        gloss: {
          UiLang.tr: 'Film çok hoşuma gitti.',
          UiLang.en: 'I liked the movie a lot.',
        },
      ),
      Phrase(
        id: 'sv_past_story_5',
        target: 'Det blev sent.',
        gloss: {UiLang.tr: 'Vakit geç oldu.', UiLang.en: 'It got late.'},
      ),
      Phrase(
        id: 'sv_past_story_6',
        target: 'Jag kom hem trött.',
        gloss: {
          UiLang.tr: 'Yorgun bir şekilde eve geldim.',
          UiLang.en: 'I came home tired.',
        },
      ),
      Phrase(
        id: 'sv_past_story_7',
        target: 'Det var en fin kväll.',
        gloss: {
          UiLang.tr: 'Güzel bir akşamdı.',
          UiLang.en: 'It was a nice evening.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Start telling what you did yesterday.',
        expected: 'I går gick jag på bio.',
      ),
      SpeakTurn(
        prompt: 'Say who you ran into.',
        expected: 'Jag träffade en gammal vän.',
      ),
      SpeakTurn(
        prompt: 'Say what you did together.',
        expected: 'Vi drack kaffe tillsammans.',
      ),
      SpeakTurn(
        prompt: 'Say what happened after.',
        expected: 'Sedan pratade vi länge.',
      ),
      SpeakTurn(
        prompt: 'Say you liked the movie.',
        expected: 'Jag tyckte mycket om filmen.',
      ),
      SpeakTurn(prompt: 'Say it got late.', expected: 'Det blev sent.'),
      SpeakTurn(
        prompt: 'Say how you got home.',
        expected: 'Jag kom hem trött.',
      ),
      SpeakTurn(
        prompt: 'Wrap up the story.',
        expected: 'Det var en fin kväll.',
      ),
    ],
  ),
];

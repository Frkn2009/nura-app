import '../../models/models.dart';

/// Batch D — A1 topic-gap fill for Russian, Ukrainian, Polish.
/// 9 new topics × 3 languages = 27 Scenario objects. See
/// docs/ICERIK_URETIM_BRIEFI.md for the schema/tone rules this follows.
/// Not wired into the main catalog yet — integration into
/// lib/data/content/catalog.dart happens centrally once all batches land.
final List<Scenario> catalogExtraBatchD = [
  // ===================== RUSSIAN (ru) =====================
  Scenario(
    id: 'ru_intro',
    lang: LearnLang.ru,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Tanışma', UiLang.en: 'Meeting someone new'},
    clipLine: 'Меня зовут Иван.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'İsmini söylerken önce "menya" (beni) gelir, isim ise '
            'nominatif halde kalır — fiil "ben" özneli çekilmez.',
        UiLang.en:
            '"Меня зовут" literally means "they call me" — the pronoun '
            'is accusative (меня) and the name stays nominative; don\'t '
            'conjugate a verb with "я".',
      },
      goodExample: 'Меня зовут Анна.',
      badExample: 'Я зовут Анна.',
    ),
    phrases: [
      Phrase(
        id: 'ru_intro_0',
        target: 'Привет! Как тебя зовут?',
        gloss: {
          UiLang.tr: 'Merhaba! Adın ne?',
          UiLang.en: 'Hi! What\'s your name?',
        },
      ),
      Phrase(
        id: 'ru_intro_1',
        target: 'Меня зовут Иван.',
        gloss: {
          UiLang.tr: 'Benim adım İvan.',
          UiLang.en: 'My name is Ivan.',
        },
      ),
      Phrase(
        id: 'ru_intro_2',
        target: 'Очень приятно познакомиться.',
        gloss: {
          UiLang.tr: 'Tanıştığıma çok memnun oldum.',
          UiLang.en: 'Very nice to meet you.',
        },
      ),
      Phrase(
        id: 'ru_intro_3',
        target: 'Откуда ты?',
        gloss: {UiLang.tr: 'Nerelisin?', UiLang.en: 'Where are you from?'},
      ),
      Phrase(
        id: 'ru_intro_4',
        target: 'Я из Турции.',
        gloss: {
          UiLang.tr: 'Ben Türkiye\'denim.',
          UiLang.en: 'I\'m from Turkey.',
        },
      ),
      Phrase(
        id: 'ru_intro_5',
        target: 'Как у тебя дела?',
        gloss: {UiLang.tr: 'Nasılsın?', UiLang.en: 'How are you?'},
      ),
      Phrase(
        id: 'ru_intro_6',
        target: 'Хорошо, спасибо, а у тебя?',
        gloss: {
          UiLang.tr: 'İyiyim, teşekkürler, ya sen?',
          UiLang.en: 'Good, thanks, and you?',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Someone greets you first.',
        expected: 'Привет! Как тебя зовут?',
      ),
      SpeakTurn(prompt: 'They ask your name.', expected: 'Меня зовут Иван.'),
      SpeakTurn(
        prompt: 'You want to be polite.',
        expected: 'Очень приятно познакомиться.',
      ),
      SpeakTurn(
        prompt: 'You want to know where they are from.',
        expected: 'Откуда ты?',
      ),
      SpeakTurn(
        prompt: 'They ask where you are from.',
        expected: 'Я из Турции.',
      ),
      SpeakTurn(
        prompt: 'You ask how they are doing.',
        expected: 'Как у тебя дела?',
      ),
      SpeakTurn(
        prompt: 'They ask you back.',
        expected: 'Хорошо, спасибо, а у тебя?',
      ),
    ],
  ),
  Scenario(
    id: 'ru_shopping',
    lang: LearnLang.ru,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Alışveriş', UiLang.en: 'Shopping'},
    clipLine: 'Сколько это стоит?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            '2, 3, 4 sayılarından sonra isim tekil genitif halde olur; '
            '5 ve üzeri sayılardan sonra çoğul genitif olur.',
        UiLang.en:
            'After the numbers 2-4 the noun takes singular genitive; '
            'after 5 and up it takes plural genitive — "два яблокА" but '
            '"пять яблОК".',
      },
      goodExample: 'Дайте, пожалуйста, два яблока.',
      badExample: 'Дайте, пожалуйста, два яблок.',
    ),
    phrases: [
      Phrase(
        id: 'ru_shopping_0',
        target: 'Здравствуйте, я просто смотрю.',
        gloss: {
          UiLang.tr: 'Merhaba, sadece bakıyorum.',
          UiLang.en: 'Hello, I\'m just looking.',
        },
      ),
      Phrase(
        id: 'ru_shopping_1',
        target: 'Сколько это стоит?',
        gloss: {UiLang.tr: 'Bu ne kadar?', UiLang.en: 'How much is this?'},
      ),
      Phrase(
        id: 'ru_shopping_2',
        target: 'У вас есть это в другом размере?',
        gloss: {
          UiLang.tr: 'Bunun başka bedeni var mı?',
          UiLang.en: 'Do you have this in another size?',
        },
      ),
      Phrase(
        id: 'ru_shopping_3',
        target: 'Можно примерить?',
        gloss: {
          UiLang.tr: 'Deneyebilir miyim?',
          UiLang.en: 'Can I try it on?',
        },
      ),
      Phrase(
        id: 'ru_shopping_4',
        target: 'Дайте, пожалуйста, два яблока.',
        gloss: {
          UiLang.tr: 'Lütfen iki elma verin.',
          UiLang.en: 'Please give me two apples.',
        },
      ),
      Phrase(
        id: 'ru_shopping_5',
        target: 'Это слишком дорого.',
        gloss: {
          UiLang.tr: 'Bu çok pahalı.',
          UiLang.en: 'This is too expensive.',
        },
      ),
      Phrase(
        id: 'ru_shopping_6',
        target: 'Я возьму это.',
        gloss: {UiLang.tr: 'Bunu alıyorum.', UiLang.en: 'I\'ll take this.'},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You walk into a shop.',
        expected: 'Здравствуйте, я просто смотрю.',
      ),
      SpeakTurn(
        prompt: 'You see a jacket you like.',
        expected: 'Сколько это стоит?',
      ),
      SpeakTurn(
        prompt: 'It doesn\'t fit.',
        expected: 'У вас есть это в другом размере?',
      ),
      SpeakTurn(
        prompt: 'They bring another size.',
        expected: 'Можно примерить?',
      ),
      SpeakTurn(
        prompt: 'You are at the fruit stand.',
        expected: 'Дайте, пожалуйста, два яблока.',
      ),
      SpeakTurn(
        prompt: 'The price surprises you.',
        expected: 'Это слишком дорого.',
      ),
      SpeakTurn(
        prompt: 'You decide to buy the cheaper one.',
        expected: 'Я возьму это.',
      ),
    ],
  ),
  Scenario(
    id: 'ru_numbers_time',
    lang: LearnLang.ru,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Sayılar ve saat', UiLang.en: 'Numbers and time'},
    clipLine: 'Который час?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            '"Saat X\'te" derken "в" edatından sonra saat sayısı gelir — '
            '"на" değil.',
        UiLang.en:
            '"At X o\'clock" uses the preposition "в" + the hour number, '
            'not "на" — "в семь часов", never "на семь часов".',
      },
      goodExample: 'Встреча в семь часов.',
      badExample: 'Встреча на семь часов.',
    ),
    phrases: [
      Phrase(
        id: 'ru_numbers_time_0',
        target: 'Который час?',
        gloss: {UiLang.tr: 'Saat kaç?', UiLang.en: 'What time is it?'},
      ),
      Phrase(
        id: 'ru_numbers_time_1',
        target: 'Сейчас три часа.',
        gloss: {
          UiLang.tr: 'Şimdi saat üç.',
          UiLang.en: 'It\'s three o\'clock now.',
        },
      ),
      Phrase(
        id: 'ru_numbers_time_2',
        target: 'Встреча в семь часов.',
        gloss: {
          UiLang.tr: 'Toplantı saat yedide.',
          UiLang.en: 'The meeting is at seven o\'clock.',
        },
      ),
      Phrase(
        id: 'ru_numbers_time_3',
        target: 'Сколько тебе лет?',
        gloss: {UiLang.tr: 'Kaç yaşındasın?', UiLang.en: 'How old are you?'},
      ),
      Phrase(
        id: 'ru_numbers_time_4',
        target: 'Мне двадцать пять лет.',
        gloss: {
          UiLang.tr: 'Ben yirmi beş yaşındayım.',
          UiLang.en: 'I am twenty-five years old.',
        },
      ),
      Phrase(
        id: 'ru_numbers_time_5',
        target: 'Мой номер телефона: девять, ноль, один.',
        gloss: {
          UiLang.tr: 'Telefon numaram: dokuz, sıfır, bir.',
          UiLang.en: 'My phone number is nine, zero, one.',
        },
      ),
      Phrase(
        id: 'ru_numbers_time_6',
        target: 'Магазин открыт до восьми.',
        gloss: {
          UiLang.tr: 'Mağaza sekize kadar açık.',
          UiLang.en: 'The store is open until eight.',
        },
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'You check your watch.', expected: 'Который час?'),
      SpeakTurn(prompt: 'Someone asks the time.', expected: 'Сейчас три часа.'),
      SpeakTurn(
        prompt: 'A colleague asks when the meeting is.',
        expected: 'Встреча в семь часов.',
      ),
      SpeakTurn(prompt: 'New friend asks your age.', expected: 'Сколько тебе лет?'),
      SpeakTurn(
        prompt: 'They wait for your answer.',
        expected: 'Мне двадцать пять лет.',
      ),
      SpeakTurn(
        prompt: 'They ask for your number.',
        expected: 'Мой номер телефона: девять, ноль, один.',
      ),
      SpeakTurn(
        prompt: 'They ask when the shop closes.',
        expected: 'Магазин открыт до восьми.',
      ),
    ],
  ),
  Scenario(
    id: 'ru_family',
    lang: LearnLang.ru,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Aile', UiLang.en: 'Family'},
    clipLine: 'Это моя сестра.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'İyelik zamiri "moy/moya/moyo" ismin cinsiyetine göre değişir '
            '— sahibinin cinsiyetine göre değil.',
        UiLang.en:
            'The possessive "мой/моя/моё" agrees with the gender of the '
            'noun it modifies, not the owner\'s gender — сестра is '
            'feminine so it\'s "моя сестра", never "мой сестра".',
      },
      goodExample: 'Это моя сестра.',
      badExample: 'Это мой сестра.',
    ),
    phrases: [
      Phrase(
        id: 'ru_family_0',
        target: 'Это моя семья.',
        gloss: {UiLang.tr: 'Bu benim ailem.', UiLang.en: 'This is my family.'},
      ),
      Phrase(
        id: 'ru_family_1',
        target: 'Это мой брат.',
        gloss: {
          UiLang.tr: 'Bu benim erkek kardeşim.',
          UiLang.en: 'This is my brother.',
        },
      ),
      Phrase(
        id: 'ru_family_2',
        target: 'Это моя сестра.',
        gloss: {
          UiLang.tr: 'Bu benim kız kardeşim.',
          UiLang.en: 'This is my sister.',
        },
      ),
      Phrase(
        id: 'ru_family_3',
        target: 'У меня двое детей.',
        gloss: {
          UiLang.tr: 'İki çocuğum var.',
          UiLang.en: 'I have two children.',
        },
      ),
      Phrase(
        id: 'ru_family_4',
        target: 'Мои родители живут в другом городе.',
        gloss: {
          UiLang.tr: 'Ailem başka bir şehirde yaşıyor.',
          UiLang.en: 'My parents live in another city.',
        },
      ),
      Phrase(
        id: 'ru_family_5',
        target: 'Сколько у тебя братьев и сестёр?',
        gloss: {
          UiLang.tr: 'Kaç kardeşin var?',
          UiLang.en: 'How many siblings do you have?',
        },
      ),
      Phrase(
        id: 'ru_family_6',
        target: 'Моя жена работает врачом.',
        gloss: {
          UiLang.tr: 'Eşim doktor olarak çalışıyor.',
          UiLang.en: 'My wife works as a doctor.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You show a family photo.',
        expected: 'Это моя семья.',
      ),
      SpeakTurn(prompt: 'You point at a man.', expected: 'Это мой брат.'),
      SpeakTurn(prompt: 'You point at a woman.', expected: 'Это моя сестра.'),
      SpeakTurn(
        prompt: 'They ask about kids.',
        expected: 'У меня двое детей.',
      ),
      SpeakTurn(
        prompt: 'They ask where your parents live.',
        expected: 'Мои родители живут в другом городе.',
      ),
      SpeakTurn(
        prompt: 'You ask them the same.',
        expected: 'Сколько у тебя братьев и сестёр?',
      ),
      SpeakTurn(
        prompt: 'They ask about your spouse\'s job.',
        expected: 'Моя жена работает врачом.',
      ),
    ],
  ),
  Scenario(
    id: 'ru_weather',
    lang: LearnLang.ru,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Hava durumu', UiLang.en: 'Weather'},
    clipLine: 'Сегодня холодно.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Hava durumu Rusçada kişisiz kurulur: fiil kullanılmaz, '
            'sadece zarf (холодно, тепло) kullanılır.',
        UiLang.en:
            'Weather is expressed impersonally in Russian — just the '
            'neuter adverb form, with no "to be" verb in the present '
            'tense.',
      },
      goodExample: 'Сегодня холодно.',
      badExample: 'Сегодня есть холодно.',
    ),
    phrases: [
      Phrase(
        id: 'ru_weather_0',
        target: 'Какая сегодня погода?',
        gloss: {
          UiLang.tr: 'Bugün hava nasıl?',
          UiLang.en: 'What\'s the weather like today?',
        },
      ),
      Phrase(
        id: 'ru_weather_1',
        target: 'Сегодня холодно.',
        gloss: {UiLang.tr: 'Bugün hava soğuk.', UiLang.en: 'It\'s cold today.'},
      ),
      Phrase(
        id: 'ru_weather_2',
        target: 'На улице идёт дождь.',
        gloss: {
          UiLang.tr: 'Dışarıda yağmur yağıyor.',
          UiLang.en: 'It\'s raining outside.',
        },
      ),
      Phrase(
        id: 'ru_weather_3',
        target: 'Завтра будет тепло.',
        gloss: {
          UiLang.tr: 'Yarın hava ılık olacak.',
          UiLang.en: 'Tomorrow it will be warm.',
        },
      ),
      Phrase(
        id: 'ru_weather_4',
        target: 'Возьми зонт.',
        gloss: {UiLang.tr: 'Şemsiye al.', UiLang.en: 'Take an umbrella.'},
      ),
      Phrase(
        id: 'ru_weather_5',
        target: 'Летом здесь очень жарко.',
        gloss: {
          UiLang.tr: 'Burada yazın çok sıcak oluyor.',
          UiLang.en: 'It\'s very hot here in summer.',
        },
      ),
      Phrase(
        id: 'ru_weather_6',
        target: 'Идёт снег.',
        gloss: {UiLang.tr: 'Kar yağıyor.', UiLang.en: 'It\'s snowing.'},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You look out the window.',
        expected: 'Какая сегодня погода?',
      ),
      SpeakTurn(prompt: 'You shiver.', expected: 'Сегодня холодно.'),
      SpeakTurn(
        prompt: 'You hear drops on the roof.',
        expected: 'На улице идёт дождь.',
      ),
      SpeakTurn(
        prompt: 'You check tomorrow\'s forecast.',
        expected: 'Завтра будет тепло.',
      ),
      SpeakTurn(
        prompt: 'You warn a friend before they leave.',
        expected: 'Возьми зонт.',
      ),
      SpeakTurn(
        prompt: 'A tourist asks about summer here.',
        expected: 'Летом здесь очень жарко.',
      ),
      SpeakTurn(prompt: 'You look outside in winter.', expected: 'Идёт снег.'),
    ],
  ),
  Scenario(
    id: 'ru_transport',
    lang: LearnLang.ru,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Ulaşım', UiLang.en: 'Transport'},
    clipLine: 'Я еду на автобусе.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Bir araçla gitmek için "ехать" fiili kullanılır; "идти" '
            'sadece yürüyerek gitmek içindir.',
        UiLang.en:
            'For traveling by vehicle use "ехать" — "идти" is only for '
            'going on foot.',
      },
      goodExample: 'Я еду на автобусе.',
      badExample: 'Я иду на автобусе.',
    ),
    phrases: [
      Phrase(
        id: 'ru_transport_0',
        target: 'Как доехать до центра?',
        gloss: {
          UiLang.tr: 'Şehir merkezine nasıl gidilir?',
          UiLang.en: 'How do I get to the city center?',
        },
      ),
      Phrase(
        id: 'ru_transport_1',
        target: 'Я еду на автобусе.',
        gloss: {
          UiLang.tr: 'Otobüsle gidiyorum.',
          UiLang.en: 'I\'m going by bus.',
        },
      ),
      Phrase(
        id: 'ru_transport_2',
        target: 'Где ближайшая станция метро?',
        gloss: {
          UiLang.tr: 'En yakın metro istasyonu nerede?',
          UiLang.en: 'Where is the nearest metro station?',
        },
      ),
      Phrase(
        id: 'ru_transport_3',
        target: 'Один билет до вокзала, пожалуйста.',
        gloss: {
          UiLang.tr: 'Gara bir bilet lütfen.',
          UiLang.en: 'One ticket to the station, please.',
        },
      ),
      Phrase(
        id: 'ru_transport_4',
        target: 'Этот автобус идёт в аэропорт?',
        gloss: {
          UiLang.tr: 'Bu otobüs havalimanına gidiyor mu?',
          UiLang.en: 'Does this bus go to the airport?',
        },
      ),
      Phrase(
        id: 'ru_transport_5',
        target: 'Мне выходить на следующей остановке?',
        gloss: {
          UiLang.tr: 'Bir sonraki durakta mı inmeliyim?',
          UiLang.en: 'Should I get off at the next stop?',
        },
      ),
      Phrase(
        id: 'ru_transport_6',
        target: 'Такси будет быстрее.',
        gloss: {
          UiLang.tr: 'Taksi daha hızlı olur.',
          UiLang.en: 'A taxi will be faster.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You stop a passerby.',
        expected: 'Как доехать до центра?',
      ),
      SpeakTurn(
        prompt: 'They ask how you\'re traveling.',
        expected: 'Я еду на автобусе.',
      ),
      SpeakTurn(
        prompt: 'You look for the subway.',
        expected: 'Где ближайшая станция метро?',
      ),
      SpeakTurn(
        prompt: 'You are at the ticket window.',
        expected: 'Один билет до вокзала, пожалуйста.',
      ),
      SpeakTurn(
        prompt: 'You\'re unsure which bus to take.',
        expected: 'Этот автобус идёт в аэропорт?',
      ),
      SpeakTurn(
        prompt: 'You\'re not sure where to get off.',
        expected: 'Мне выходить на следующей остановке?',
      ),
      SpeakTurn(
        prompt: 'You\'re running late.',
        expected: 'Такси будет быстрее.',
      ),
    ],
  ),
  Scenario(
    id: 'ru_emergency',
    lang: LearnLang.ru,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Acil durum', UiLang.en: 'Emergency'},
    clipLine: 'Мне нужна помощь!',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            '"İhtiyacım var" derken kişi datif halde olur (мне), ihtiyaç '
            'duyulan şey "нужен/нужна/нужно" ile cinsiyetine göre uyum '
            'sağlar.',
        UiLang.en:
            '"To need" uses the dative person (мне) + '
            '"нужен/нужна/нужно" agreeing with the gender of the thing '
            'needed — the person is never the nominative subject.',
      },
      goodExample: 'Мне нужна помощь!',
      badExample: 'Я нужна помощь!',
    ),
    phrases: [
      Phrase(
        id: 'ru_emergency_0',
        target: 'Помогите!',
        gloss: {UiLang.tr: 'İmdat!', UiLang.en: 'Help!'},
      ),
      Phrase(
        id: 'ru_emergency_1',
        target: 'Мне нужна помощь!',
        gloss: {
          UiLang.tr: 'Yardıma ihtiyacım var!',
          UiLang.en: 'I need help!',
        },
      ),
      Phrase(
        id: 'ru_emergency_2',
        target: 'Вызовите скорую!',
        gloss: {
          UiLang.tr: 'Ambulans çağırın!',
          UiLang.en: 'Call an ambulance!',
        },
      ),
      Phrase(
        id: 'ru_emergency_3',
        target: 'Где ближайшая больница?',
        gloss: {
          UiLang.tr: 'En yakın hastane nerede?',
          UiLang.en: 'Where is the nearest hospital?',
        },
      ),
      Phrase(
        id: 'ru_emergency_4',
        target: 'Я потерял паспорт.',
        gloss: {
          UiLang.tr: 'Pasaportumu kaybettim.',
          UiLang.en: 'I lost my passport.',
        },
      ),
      Phrase(
        id: 'ru_emergency_5',
        target: 'Позвоните в полицию, пожалуйста.',
        gloss: {
          UiLang.tr: 'Lütfen polisi arayın.',
          UiLang.en: 'Please call the police.',
        },
      ),
      Phrase(
        id: 'ru_emergency_6',
        target: 'Со мной всё в порядке.',
        gloss: {UiLang.tr: 'Ben iyiyim.', UiLang.en: 'I\'m okay.'},
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'Something just went wrong.', expected: 'Помогите!'),
      SpeakTurn(
        prompt: 'A stranger stops to check on you.',
        expected: 'Мне нужна помощь!',
      ),
      SpeakTurn(
        prompt: 'Someone is badly hurt.',
        expected: 'Вызовите скорую!',
      ),
      SpeakTurn(
        prompt: 'You need medical care.',
        expected: 'Где ближайшая больница?',
      ),
      SpeakTurn(
        prompt: 'You check your bag and panic.',
        expected: 'Я потерял паспорт.',
      ),
      SpeakTurn(
        prompt: 'You need to report a theft.',
        expected: 'Позвоните в полицию, пожалуйста.',
      ),
      SpeakTurn(
        prompt: 'They ask if you\'re hurt.',
        expected: 'Со мной всё в порядке.',
      ),
    ],
  ),
  Scenario(
    id: 'ru_routine',
    lang: LearnLang.ru,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Günlük rutin', UiLang.en: 'Daily routine'},
    clipLine: 'Я просыпаюсь в семь.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Günlük rutin fiillerinin çoğu Rusçada "-ся" ekiyle '
            'dönüşlüdür (просыпаться, ложиться) — Türkçedeki karşılığı '
            'dönüşlü olmasa bile.',
        UiLang.en:
            'Many daily-routine verbs are reflexive in Russian, ending '
            'in "-ся" (просыпаться "to wake up") even when the English '
            'equivalent isn\'t — dropping "-ся" breaks the meaning.',
      },
      goodExample: 'Я просыпаюсь в семь.',
      badExample: 'Я просыпаю в семь.',
    ),
    phrases: [
      Phrase(
        id: 'ru_routine_0',
        target: 'Я просыпаюсь в семь.',
        gloss: {
          UiLang.tr: 'Saat yedide uyanıyorum.',
          UiLang.en: 'I wake up at seven.',
        },
      ),
      Phrase(
        id: 'ru_routine_1',
        target: 'Я умываюсь и завтракаю.',
        gloss: {
          UiLang.tr: 'Yüzümü yıkıyorum ve kahvaltı ediyorum.',
          UiLang.en: 'I wash up and have breakfast.',
        },
      ),
      Phrase(
        id: 'ru_routine_2',
        target: 'Потом я иду на работу.',
        gloss: {
          UiLang.tr: 'Sonra işe gidiyorum.',
          UiLang.en: 'Then I go to work.',
        },
      ),
      Phrase(
        id: 'ru_routine_3',
        target: 'Я обедаю в час.',
        gloss: {
          UiLang.tr: 'Saat birde öğle yemeği yiyorum.',
          UiLang.en: 'I have lunch at one.',
        },
      ),
      Phrase(
        id: 'ru_routine_4',
        target: 'Вечером я занимаюсь спортом.',
        gloss: {
          UiLang.tr: 'Akşamları spor yapıyorum.',
          UiLang.en: 'In the evening I exercise.',
        },
      ),
      Phrase(
        id: 'ru_routine_5',
        target: 'Я ложусь спать в одиннадцать.',
        gloss: {
          UiLang.tr: 'Saat on birde yatıyorum.',
          UiLang.en: 'I go to bed at eleven.',
        },
      ),
      Phrase(
        id: 'ru_routine_6',
        target: 'По выходным я отдыхаю.',
        gloss: {
          UiLang.tr: 'Hafta sonları dinleniyorum.',
          UiLang.en: 'On weekends I rest.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'The alarm goes off.',
        expected: 'Я просыпаюсь в семь.',
      ),
      SpeakTurn(
        prompt: 'You describe your morning.',
        expected: 'Я умываюсь и завтракаю.',
      ),
      SpeakTurn(
        prompt: 'What happens after breakfast?',
        expected: 'Потом я иду на работу.',
      ),
      SpeakTurn(
        prompt: 'A colleague asks about lunch.',
        expected: 'Я обедаю в час.',
      ),
      SpeakTurn(
        prompt: 'They ask about your evenings.',
        expected: 'Вечером я занимаюсь спортом.',
      ),
      SpeakTurn(
        prompt: 'They ask when you sleep.',
        expected: 'Я ложусь спать в одиннадцать.',
      ),
      SpeakTurn(
        prompt: 'They ask about weekends.',
        expected: 'По выходным я отдыхаю.',
      ),
    ],
  ),
  Scenario(
    id: 'ru_past_story',
    lang: LearnLang.ru,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Geçmişte bir olay', UiLang.en: 'Telling a past event'},
    clipLine: 'Вчера я пошёл в парк.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Geçmiş zaman fiili, konuşan kişiye değil öznenin cinsiyetine '
            'göre çekimlenir: erkek özne "-л", kadın özne "-ла".',
        UiLang.en:
            'Russian past-tense verbs agree with the subject\'s '
            'grammatical gender, not with person — masculine subjects '
            'take "-л" (пошёл), feminine subjects take "-ла" (пошла).',
      },
      goodExample: 'Она пошла в кино.',
      badExample: 'Она пошёл в кино.',
    ),
    phrases: [
      Phrase(
        id: 'ru_past_story_0',
        target: 'Вчера я пошёл в парк.',
        gloss: {
          UiLang.tr: 'Dün parka gittim.',
          UiLang.en: 'Yesterday I went to the park.',
        },
      ),
      Phrase(
        id: 'ru_past_story_1',
        target: 'Погода была прекрасная.',
        gloss: {
          UiLang.tr: 'Hava harikaydı.',
          UiLang.en: 'The weather was beautiful.',
        },
      ),
      Phrase(
        id: 'ru_past_story_2',
        target: 'Я встретил старого друга.',
        gloss: {
          UiLang.tr: 'Eski bir arkadaşımla karşılaştım.',
          UiLang.en: 'I met an old friend.',
        },
      ),
      Phrase(
        id: 'ru_past_story_3',
        target: 'Мы долго разговаривали.',
        gloss: {
          UiLang.tr: 'Uzun süre konuştuk.',
          UiLang.en: 'We talked for a long time.',
        },
      ),
      Phrase(
        id: 'ru_past_story_4',
        target: 'Потом мы пошли в кафе.',
        gloss: {
          UiLang.tr: 'Sonra bir kafeye gittik.',
          UiLang.en: 'Then we went to a café.',
        },
      ),
      Phrase(
        id: 'ru_past_story_5',
        target: 'Она пошла в кино вчера вечером.',
        gloss: {
          UiLang.tr: 'O dün akşam sinemaya gitti.',
          UiLang.en: 'She went to the movies last night.',
        },
      ),
      Phrase(
        id: 'ru_past_story_6',
        target: 'Это был отличный день.',
        gloss: {
          UiLang.tr: 'Harika bir gündü.',
          UiLang.en: 'It was a great day.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You start telling a story.',
        expected: 'Вчера я пошёл в парк.',
      ),
      SpeakTurn(
        prompt: 'You describe the day.',
        expected: 'Погода была прекрасная.',
      ),
      SpeakTurn(
        prompt: 'Something unexpected happened.',
        expected: 'Я встретил старого друга.',
      ),
      SpeakTurn(
        prompt: 'What did you two do?',
        expected: 'Мы долго разговаривали.',
      ),
      SpeakTurn(
        prompt: 'Where did you go next?',
        expected: 'Потом мы пошли в кафе.',
      ),
      SpeakTurn(
        prompt: 'You mention a friend\'s evening.',
        expected: 'Она пошла в кино вчера вечером.',
      ),
      SpeakTurn(
        prompt: 'You wrap up the story.',
        expected: 'Это был отличный день.',
      ),
    ],
  ),

  // ===================== UKRAINIAN (uk) =====================
  Scenario(
    id: 'uk_intro',
    lang: LearnLang.uk,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Tanışma', UiLang.en: 'Meeting someone new'},
    clipLine: 'Мене звати Іван.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            '"Zvaty" fiilinden önce kişi accusative halde gelir (мене), '
            'isim ise nominatif kalır — "ben" öznesiyle çekim yapılmaz.',
        UiLang.en:
            '"Мене звати" literally means "[they] call me" — the '
            'pronoun is accusative (мене) and the name stays '
            'nominative; don\'t conjugate with "я".',
      },
      goodExample: 'Мене звати Оксана.',
      badExample: 'Я звати Оксана.',
    ),
    phrases: [
      Phrase(
        id: 'uk_intro_0',
        target: 'Привіт! Як тебе звати?',
        gloss: {
          UiLang.tr: 'Merhaba! Adın ne?',
          UiLang.en: 'Hi! What\'s your name?',
        },
      ),
      Phrase(
        id: 'uk_intro_1',
        target: 'Мене звати Іван.',
        gloss: {
          UiLang.tr: 'Benim adım İvan.',
          UiLang.en: 'My name is Ivan.',
        },
      ),
      Phrase(
        id: 'uk_intro_2',
        target: 'Дуже приємно познайомитися.',
        gloss: {
          UiLang.tr: 'Tanıştığıma çok memnun oldum.',
          UiLang.en: 'Very nice to meet you.',
        },
      ),
      Phrase(
        id: 'uk_intro_3',
        target: 'Звідки ти?',
        gloss: {UiLang.tr: 'Nerelisin?', UiLang.en: 'Where are you from?'},
      ),
      Phrase(
        id: 'uk_intro_4',
        target: 'Я з Туреччини.',
        gloss: {
          UiLang.tr: 'Ben Türkiye\'denim.',
          UiLang.en: 'I\'m from Turkey.',
        },
      ),
      Phrase(
        id: 'uk_intro_5',
        target: 'Як у тебе справи?',
        gloss: {UiLang.tr: 'Nasılsın?', UiLang.en: 'How are you?'},
      ),
      Phrase(
        id: 'uk_intro_6',
        target: 'Добре, дякую, а в тебе?',
        gloss: {
          UiLang.tr: 'İyiyim, teşekkürler, ya sen?',
          UiLang.en: 'Good, thanks, and you?',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Someone greets you first.',
        expected: 'Привіт! Як тебе звати?',
      ),
      SpeakTurn(prompt: 'They ask your name.', expected: 'Мене звати Іван.'),
      SpeakTurn(
        prompt: 'You want to be polite.',
        expected: 'Дуже приємно познайомитися.',
      ),
      SpeakTurn(
        prompt: 'You want to know where they are from.',
        expected: 'Звідки ти?',
      ),
      SpeakTurn(
        prompt: 'They ask where you are from.',
        expected: 'Я з Туреччини.',
      ),
      SpeakTurn(
        prompt: 'You ask how they are doing.',
        expected: 'Як у тебе справи?',
      ),
      SpeakTurn(
        prompt: 'They ask you back.',
        expected: 'Добре, дякую, а в тебе?',
      ),
    ],
  ),
  Scenario(
    id: 'uk_shopping',
    lang: LearnLang.uk,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Alışveriş', UiLang.en: 'Shopping'},
    clipLine: 'Скільки це коштує?',
    // TODO: native review — vocative "продавче" from "продавець" follows
    // the standard -ець → -че pattern, but confirm natural register here.
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Ukraynaca birine doğrudan seslenirken hâlâ kullanılan '
            'vocative (seslenme) hali gerekir — nominatif değil.',
        UiLang.en:
            'Ukrainian actively uses the vocative case when addressing '
            'someone directly — "продавець" (seller) becomes '
            '"продавче" in direct address, not the nominative form.',
      },
      goodExample: 'Продавче, скільки це коштує?',
      badExample: 'Продавець, скільки це коштує?',
    ),
    phrases: [
      Phrase(
        id: 'uk_shopping_0',
        target: 'Добрий день, я просто дивлюся.',
        gloss: {
          UiLang.tr: 'İyi günler, sadece bakıyorum.',
          UiLang.en: 'Good day, I\'m just looking.',
        },
      ),
      Phrase(
        id: 'uk_shopping_1',
        target: 'Скільки це коштує?',
        gloss: {UiLang.tr: 'Bu ne kadar?', UiLang.en: 'How much is this?'},
      ),
      Phrase(
        id: 'uk_shopping_2',
        target: 'Продавче, у вас є інший розмір?',
        gloss: {
          UiLang.tr: 'Satıcı bey, bunun başka bedeni var mı?',
          UiLang.en: 'Sir, do you have this in another size?',
        },
      ),
      Phrase(
        id: 'uk_shopping_3',
        target: 'Можна це приміряти?',
        gloss: {
          UiLang.tr: 'Bunu deneyebilir miyim?',
          UiLang.en: 'Can I try this on?',
        },
      ),
      Phrase(
        id: 'uk_shopping_4',
        target: 'Дайте, будь ласка, два яблука.',
        gloss: {
          UiLang.tr: 'Lütfen iki elma verin.',
          UiLang.en: 'Please give me two apples.',
        },
      ),
      Phrase(
        id: 'uk_shopping_5',
        target: 'Це занадто дорого.',
        gloss: {
          UiLang.tr: 'Bu çok pahalı.',
          UiLang.en: 'This is too expensive.',
        },
      ),
      Phrase(
        id: 'uk_shopping_6',
        target: 'Я візьму це.',
        gloss: {UiLang.tr: 'Bunu alıyorum.', UiLang.en: 'I\'ll take this.'},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You walk into a shop.',
        expected: 'Добрий день, я просто дивлюся.',
      ),
      SpeakTurn(
        prompt: 'You see a jacket you like.',
        expected: 'Скільки це коштує?',
      ),
      SpeakTurn(
        prompt: 'It doesn\'t fit.',
        expected: 'Продавче, у вас є інший розмір?',
      ),
      SpeakTurn(
        prompt: 'They bring another size.',
        expected: 'Можна це приміряти?',
      ),
      SpeakTurn(
        prompt: 'You are at the fruit stand.',
        expected: 'Дайте, будь ласка, два яблука.',
      ),
      SpeakTurn(
        prompt: 'The price surprises you.',
        expected: 'Це занадто дорого.',
      ),
      SpeakTurn(
        prompt: 'You decide to buy the cheaper one.',
        expected: 'Я візьму це.',
      ),
    ],
  ),
  Scenario(
    id: 'uk_numbers_time',
    lang: LearnLang.uk,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Sayılar ve saat', UiLang.en: 'Numbers and time'},
    clipLine: 'Котра година?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            '"Saat X\'te" derken "o" edatı + saat sayısının lokatif hali '
            'kullanılır: "о сьомій" ("yedide"), "в сім" değil.',
        UiLang.en:
            '"At X o\'clock" uses the preposition "о" + the ordinal '
            'hour number in the locative case ("о сьомій годині"), not '
            '"в" + the cardinal number.',
      },
      goodExample: 'Зустрінемось о сьомій годині.',
      badExample: 'Зустрінемось в сім годині.',
    ),
    phrases: [
      Phrase(
        id: 'uk_numbers_time_0',
        target: 'Котра зараз година?',
        gloss: {
          UiLang.tr: 'Şu an saat kaç?',
          UiLang.en: 'What time is it now?',
        },
      ),
      Phrase(
        id: 'uk_numbers_time_1',
        target: 'Зараз третя година.',
        gloss: {
          UiLang.tr: 'Şimdi saat üç.',
          UiLang.en: 'It\'s three o\'clock now.',
        },
      ),
      Phrase(
        id: 'uk_numbers_time_2',
        target: 'Зустрінемось о сьомій годині.',
        gloss: {
          UiLang.tr: 'Saat yedide buluşalım.',
          UiLang.en: 'Let\'s meet at seven o\'clock.',
        },
      ),
      Phrase(
        id: 'uk_numbers_time_3',
        target: 'Скільки тобі років?',
        gloss: {UiLang.tr: 'Kaç yaşındasın?', UiLang.en: 'How old are you?'},
      ),
      Phrase(
        id: 'uk_numbers_time_4',
        target: 'Мені двадцять п\'ять років.',
        gloss: {
          UiLang.tr: 'Ben yirmi beş yaşındayım.',
          UiLang.en: 'I am twenty-five years old.',
        },
      ),
      Phrase(
        id: 'uk_numbers_time_5',
        target: 'Мій номер телефону: дев\'ять, нуль, один.',
        gloss: {
          UiLang.tr: 'Telefon numaram: dokuz, sıfır, bir.',
          UiLang.en: 'My phone number is nine, zero, one.',
        },
      ),
      Phrase(
        id: 'uk_numbers_time_6',
        target: 'Магазин відкритий до восьмої.',
        gloss: {
          UiLang.tr: 'Mağaza sekize kadar açık.',
          UiLang.en: 'The store is open until eight.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You check your watch.',
        expected: 'Котра зараз година?',
      ),
      SpeakTurn(prompt: 'Someone asks the time.', expected: 'Зараз третя година.'),
      SpeakTurn(
        prompt: 'You suggest a meeting time.',
        expected: 'Зустрінемось о сьомій годині.',
      ),
      SpeakTurn(prompt: 'New friend asks your age.', expected: 'Скільки тобі років?'),
      SpeakTurn(
        prompt: 'They wait for your answer.',
        expected: 'Мені двадцять п\'ять років.',
      ),
      SpeakTurn(
        prompt: 'They ask for your number.',
        expected: 'Мій номер телефону: дев\'ять, нуль, один.',
      ),
      SpeakTurn(
        prompt: 'They ask when the shop closes.',
        expected: 'Магазин відкритий до восьмої.',
      ),
    ],
  ),
  Scenario(
    id: 'uk_family',
    lang: LearnLang.uk,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Aile', UiLang.en: 'Family'},
    clipLine: 'Це моя сестра.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'İyelik zamiri "mіy/moya/moye" ismin cinsiyetine göre '
            'değişir, sahibinin cinsiyetine göre değil.',
        UiLang.en:
            'The possessive "мій/моя/моє" agrees with the gender of the '
            'noun it modifies, not the owner\'s gender — сестра is '
            'feminine, so it\'s "моя сестра", never "мій сестра".',
      },
      goodExample: 'Це моя сестра.',
      badExample: 'Це мій сестра.',
    ),
    phrases: [
      Phrase(
        id: 'uk_family_0',
        target: 'Це моя родина.',
        gloss: {UiLang.tr: 'Bu benim ailem.', UiLang.en: 'This is my family.'},
      ),
      Phrase(
        id: 'uk_family_1',
        target: 'Це мій брат.',
        gloss: {
          UiLang.tr: 'Bu benim erkek kardeşim.',
          UiLang.en: 'This is my brother.',
        },
      ),
      Phrase(
        id: 'uk_family_2',
        target: 'Це моя сестра.',
        gloss: {
          UiLang.tr: 'Bu benim kız kardeşim.',
          UiLang.en: 'This is my sister.',
        },
      ),
      Phrase(
        id: 'uk_family_3',
        target: 'У мене двоє дітей.',
        gloss: {
          UiLang.tr: 'İki çocuğum var.',
          UiLang.en: 'I have two children.',
        },
      ),
      Phrase(
        id: 'uk_family_4',
        target: 'Мої батьки живуть в іншому місті.',
        gloss: {
          UiLang.tr: 'Ailem başka bir şehirde yaşıyor.',
          UiLang.en: 'My parents live in another city.',
        },
      ),
      Phrase(
        id: 'uk_family_5',
        target: 'Скільки у тебе братів і сестер?',
        gloss: {
          UiLang.tr: 'Kaç kardeşin var?',
          UiLang.en: 'How many siblings do you have?',
        },
      ),
      Phrase(
        id: 'uk_family_6',
        target: 'Моя дружина працює лікарем.',
        gloss: {
          UiLang.tr: 'Eşim doktor olarak çalışıyor.',
          UiLang.en: 'My wife works as a doctor.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You show a family photo.',
        expected: 'Це моя родина.',
      ),
      SpeakTurn(prompt: 'You point at a man.', expected: 'Це мій брат.'),
      SpeakTurn(prompt: 'You point at a woman.', expected: 'Це моя сестра.'),
      SpeakTurn(
        prompt: 'They ask about kids.',
        expected: 'У мене двоє дітей.',
      ),
      SpeakTurn(
        prompt: 'They ask where your parents live.',
        expected: 'Мої батьки живуть в іншому місті.',
      ),
      SpeakTurn(
        prompt: 'You ask them the same.',
        expected: 'Скільки у тебе братів і сестер?',
      ),
      SpeakTurn(
        prompt: 'They ask about your spouse\'s job.',
        expected: 'Моя дружина працює лікарем.',
      ),
    ],
  ),
  Scenario(
    id: 'uk_weather',
    lang: LearnLang.uk,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Hava durumu', UiLang.en: 'Weather'},
    clipLine: 'Сьогодні холодно.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Ukraynacada hava durumu kişisiz kurulur: fiil '
            'kullanılmadan sadece zarf (холодно, тепло) kullanılır.',
        UiLang.en:
            'Weather is expressed impersonally in Ukrainian — just the '
            'adverb form (холодно, тепло), with no "to be" verb in the '
            'present tense.',
      },
      goodExample: 'Сьогодні холодно.',
      badExample: 'Сьогодні є холодно.',
    ),
    phrases: [
      Phrase(
        id: 'uk_weather_0',
        target: 'Яка сьогодні погода?',
        gloss: {
          UiLang.tr: 'Bugün hava nasıl?',
          UiLang.en: 'What\'s the weather like today?',
        },
      ),
      Phrase(
        id: 'uk_weather_1',
        target: 'Сьогодні холодно.',
        gloss: {UiLang.tr: 'Bugün hava soğuk.', UiLang.en: 'It\'s cold today.'},
      ),
      Phrase(
        id: 'uk_weather_2',
        target: 'Надворі йде дощ.',
        gloss: {
          UiLang.tr: 'Dışarıda yağmur yağıyor.',
          UiLang.en: 'It\'s raining outside.',
        },
      ),
      Phrase(
        id: 'uk_weather_3',
        target: 'Завтра буде тепло.',
        gloss: {
          UiLang.tr: 'Yarın hava ılık olacak.',
          UiLang.en: 'Tomorrow it will be warm.',
        },
      ),
      Phrase(
        id: 'uk_weather_4',
        target: 'Візьми парасольку.',
        gloss: {UiLang.tr: 'Şemsiye al.', UiLang.en: 'Take an umbrella.'},
      ),
      Phrase(
        id: 'uk_weather_5',
        target: 'Влітку тут дуже спекотно.',
        gloss: {
          UiLang.tr: 'Burada yazın çok sıcak oluyor.',
          UiLang.en: 'It\'s very hot here in summer.',
        },
      ),
      Phrase(
        id: 'uk_weather_6',
        target: 'Іде сніг.',
        gloss: {UiLang.tr: 'Kar yağıyor.', UiLang.en: 'It\'s snowing.'},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You look out the window.',
        expected: 'Яка сьогодні погода?',
      ),
      SpeakTurn(prompt: 'You shiver.', expected: 'Сьогодні холодно.'),
      SpeakTurn(
        prompt: 'You hear drops on the roof.',
        expected: 'Надворі йде дощ.',
      ),
      SpeakTurn(
        prompt: 'You check tomorrow\'s forecast.',
        expected: 'Завтра буде тепло.',
      ),
      SpeakTurn(
        prompt: 'You warn a friend before they leave.',
        expected: 'Візьми парасольку.',
      ),
      SpeakTurn(
        prompt: 'A tourist asks about summer here.',
        expected: 'Влітку тут дуже спекотно.',
      ),
      SpeakTurn(prompt: 'You look outside in winter.', expected: 'Іде сніг.'),
    ],
  ),
  Scenario(
    id: 'uk_transport',
    lang: LearnLang.uk,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Ulaşım', UiLang.en: 'Transport'},
    clipLine: 'Я їду на автобусі.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Bir araçla gitmek için "їхати" fiili kullanılır; "іти" '
            'sadece yürüyerek gitmek içindir.',
        UiLang.en:
            'For traveling by vehicle use "їхати" — "іти" is only for '
            'going on foot.',
      },
      goodExample: 'Я їду на автобусі.',
      badExample: 'Я йду на автобусі.',
    ),
    phrases: [
      Phrase(
        id: 'uk_transport_0',
        target: 'Як дістатися до центру?',
        gloss: {
          UiLang.tr: 'Şehir merkezine nasıl gidilir?',
          UiLang.en: 'How do I get to the city center?',
        },
      ),
      Phrase(
        id: 'uk_transport_1',
        target: 'Я їду на автобусі.',
        gloss: {
          UiLang.tr: 'Otobüsle gidiyorum.',
          UiLang.en: 'I\'m going by bus.',
        },
      ),
      Phrase(
        id: 'uk_transport_2',
        target: 'Де найближча станція метро?',
        gloss: {
          UiLang.tr: 'En yakın metro istasyonu nerede?',
          UiLang.en: 'Where is the nearest metro station?',
        },
      ),
      Phrase(
        id: 'uk_transport_3',
        target: 'Один квиток до вокзалу, будь ласка.',
        gloss: {
          UiLang.tr: 'Gara bir bilet lütfen.',
          UiLang.en: 'One ticket to the station, please.',
        },
      ),
      Phrase(
        id: 'uk_transport_4',
        target: 'Цей автобус їде в аеропорт?',
        gloss: {
          UiLang.tr: 'Bu otobüs havalimanına gidiyor mu?',
          UiLang.en: 'Does this bus go to the airport?',
        },
      ),
      Phrase(
        id: 'uk_transport_5',
        target: 'Мені виходити на наступній зупинці?',
        gloss: {
          UiLang.tr: 'Bir sonraki durakta mı inmeliyim?',
          UiLang.en: 'Should I get off at the next stop?',
        },
      ),
      Phrase(
        id: 'uk_transport_6',
        target: 'Таксі буде швидше.',
        gloss: {
          UiLang.tr: 'Taksi daha hızlı olur.',
          UiLang.en: 'A taxi will be faster.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You stop a passerby.',
        expected: 'Як дістатися до центру?',
      ),
      SpeakTurn(
        prompt: 'They ask how you\'re traveling.',
        expected: 'Я їду на автобусі.',
      ),
      SpeakTurn(
        prompt: 'You look for the subway.',
        expected: 'Де найближча станція метро?',
      ),
      SpeakTurn(
        prompt: 'You are at the ticket window.',
        expected: 'Один квиток до вокзалу, будь ласка.',
      ),
      SpeakTurn(
        prompt: 'You\'re unsure which bus to take.',
        expected: 'Цей автобус їде в аеропорт?',
      ),
      SpeakTurn(
        prompt: 'You\'re not sure where to get off.',
        expected: 'Мені виходити на наступній зупинці?',
      ),
      SpeakTurn(
        prompt: 'You\'re running late.',
        expected: 'Таксі буде швидше.',
      ),
    ],
  ),
  Scenario(
    id: 'uk_emergency',
    lang: LearnLang.uk,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Acil durum', UiLang.en: 'Emergency'},
    clipLine: 'Мені потрібна допомога!',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            '"İhtiyacım var" derken kişi datif halde olur (мені), '
            'ihtiyaç duyulan şey "потрібен/потрібна/потрібне" ile '
            'cinsiyetine göre uyum sağlar.',
        UiLang.en:
            '"To need" uses the dative person (мені) + '
            '"потрібен/потрібна/потрібне" agreeing with the gender of '
            'the thing needed — the person is never the nominative '
            'subject.',
      },
      goodExample: 'Мені потрібна допомога!',
      badExample: 'Я потрібна допомога!',
    ),
    phrases: [
      Phrase(
        id: 'uk_emergency_0',
        target: 'Допоможіть!',
        gloss: {UiLang.tr: 'İmdat!', UiLang.en: 'Help!'},
      ),
      Phrase(
        id: 'uk_emergency_1',
        target: 'Мені потрібна допомога!',
        gloss: {
          UiLang.tr: 'Yardıma ihtiyacım var!',
          UiLang.en: 'I need help!',
        },
      ),
      Phrase(
        id: 'uk_emergency_2',
        target: 'Викличте швидку!',
        gloss: {
          UiLang.tr: 'Ambulans çağırın!',
          UiLang.en: 'Call an ambulance!',
        },
      ),
      Phrase(
        id: 'uk_emergency_3',
        target: 'Де найближча лікарня?',
        gloss: {
          UiLang.tr: 'En yakın hastane nerede?',
          UiLang.en: 'Where is the nearest hospital?',
        },
      ),
      Phrase(
        id: 'uk_emergency_4',
        target: 'Я загубив паспорт.',
        gloss: {
          UiLang.tr: 'Pasaportumu kaybettim.',
          UiLang.en: 'I lost my passport.',
        },
      ),
      Phrase(
        id: 'uk_emergency_5',
        target: 'Зателефонуйте в поліцію, будь ласка.',
        gloss: {
          UiLang.tr: 'Lütfen polisi arayın.',
          UiLang.en: 'Please call the police.',
        },
      ),
      Phrase(
        id: 'uk_emergency_6',
        target: 'Зі мною все гаразд.',
        gloss: {UiLang.tr: 'Ben iyiyim.', UiLang.en: 'I\'m okay.'},
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'Something just went wrong.', expected: 'Допоможіть!'),
      SpeakTurn(
        prompt: 'A stranger stops to check on you.',
        expected: 'Мені потрібна допомога!',
      ),
      SpeakTurn(
        prompt: 'Someone is badly hurt.',
        expected: 'Викличте швидку!',
      ),
      SpeakTurn(
        prompt: 'You need medical care.',
        expected: 'Де найближча лікарня?',
      ),
      SpeakTurn(
        prompt: 'You check your bag and panic.',
        expected: 'Я загубив паспорт.',
      ),
      SpeakTurn(
        prompt: 'You need to report a theft.',
        expected: 'Зателефонуйте в поліцію, будь ласка.',
      ),
      SpeakTurn(
        prompt: 'They ask if you\'re hurt.',
        expected: 'Зі мною все гаразд.',
      ),
    ],
  ),
  Scenario(
    id: 'uk_routine',
    lang: LearnLang.uk,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Günlük rutin', UiLang.en: 'Daily routine'},
    clipLine: 'Я прокидаюся о сьомій.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Günlük rutin fiillerinin çoğu Ukraynacada "-ся" ekiyle '
            'dönüşlüdür (прокидатися) — Türkçedeki karşılığı dönüşlü '
            'olmasa bile.',
        UiLang.en:
            'Many daily-routine verbs are reflexive in Ukrainian, '
            'ending in "-ся" (прокидатися "to wake up"), even when the '
            'English equivalent isn\'t reflexive.',
      },
      goodExample: 'Я прокидаюся о сьомій.',
      badExample: 'Я прокидаю о сьомій.',
    ),
    phrases: [
      Phrase(
        id: 'uk_routine_0',
        target: 'Я прокидаюся о сьомій.',
        gloss: {
          UiLang.tr: 'Saat yedide uyanıyorum.',
          UiLang.en: 'I wake up at seven.',
        },
      ),
      Phrase(
        id: 'uk_routine_1',
        target: 'Я вмиваюся і снідаю.',
        gloss: {
          UiLang.tr: 'Yüzümü yıkıyorum ve kahvaltı ediyorum.',
          UiLang.en: 'I wash up and have breakfast.',
        },
      ),
      Phrase(
        id: 'uk_routine_2',
        target: 'Потім я йду на роботу.',
        gloss: {
          UiLang.tr: 'Sonra işe gidiyorum.',
          UiLang.en: 'Then I go to work.',
        },
      ),
      Phrase(
        id: 'uk_routine_3',
        target: 'Я обідаю о першій.',
        gloss: {
          UiLang.tr: 'Saat birde öğle yemeği yiyorum.',
          UiLang.en: 'I have lunch at one.',
        },
      ),
      Phrase(
        id: 'uk_routine_4',
        target: 'Ввечері я займаюся спортом.',
        gloss: {
          UiLang.tr: 'Akşamları spor yapıyorum.',
          UiLang.en: 'In the evening I exercise.',
        },
      ),
      Phrase(
        id: 'uk_routine_5',
        target: 'Я лягаю спати об одинадцятій.',
        gloss: {
          UiLang.tr: 'Saat on birde yatıyorum.',
          UiLang.en: 'I go to bed at eleven.',
        },
      ),
      Phrase(
        id: 'uk_routine_6',
        target: 'У вихідні я відпочиваю.',
        gloss: {
          UiLang.tr: 'Hafta sonları dinleniyorum.',
          UiLang.en: 'On weekends I rest.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'The alarm goes off.',
        expected: 'Я прокидаюся о сьомій.',
      ),
      SpeakTurn(
        prompt: 'You describe your morning.',
        expected: 'Я вмиваюся і снідаю.',
      ),
      SpeakTurn(
        prompt: 'What happens after breakfast?',
        expected: 'Потім я йду на роботу.',
      ),
      SpeakTurn(
        prompt: 'A colleague asks about lunch.',
        expected: 'Я обідаю о першій.',
      ),
      SpeakTurn(
        prompt: 'They ask about your evenings.',
        expected: 'Ввечері я займаюся спортом.',
      ),
      SpeakTurn(
        prompt: 'They ask when you sleep.',
        expected: 'Я лягаю спати об одинадцятій.',
      ),
      SpeakTurn(
        prompt: 'They ask about weekends.',
        expected: 'У вихідні я відпочиваю.',
      ),
    ],
  ),
  Scenario(
    id: 'uk_past_story',
    lang: LearnLang.uk,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Geçmişte bir olay', UiLang.en: 'Telling a past event'},
    clipLine: 'Вчора я пішов у парк.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Geçmiş zaman fiili öznenin cinsiyetine göre çekimlenir: '
            'erkek özne "-в" (пішов), kadın özne "-ла" (пішла).',
        UiLang.en:
            'Ukrainian past-tense verbs agree with the subject\'s '
            'grammatical gender — masculine subjects take "-в" '
            '(пішов), feminine subjects take "-ла" (пішла).',
      },
      goodExample: 'Вчора вона пішла в кіно.',
      badExample: 'Вчора вона пішов в кіно.',
    ),
    phrases: [
      Phrase(
        id: 'uk_past_story_0',
        target: 'Вчора я пішов у парк.',
        gloss: {
          UiLang.tr: 'Dün parka gittim.',
          UiLang.en: 'Yesterday I went to the park.',
        },
      ),
      Phrase(
        id: 'uk_past_story_1',
        target: 'Погода була чудова.',
        gloss: {
          UiLang.tr: 'Hava harikaydı.',
          UiLang.en: 'The weather was beautiful.',
        },
      ),
      Phrase(
        id: 'uk_past_story_2',
        target: 'Я зустрів старого друга.',
        gloss: {
          UiLang.tr: 'Eski bir arkadaşımla karşılaştım.',
          UiLang.en: 'I met an old friend.',
        },
      ),
      Phrase(
        id: 'uk_past_story_3',
        target: 'Ми довго розмовляли.',
        gloss: {
          UiLang.tr: 'Uzun süre konuştuk.',
          UiLang.en: 'We talked for a long time.',
        },
      ),
      Phrase(
        id: 'uk_past_story_4',
        target: 'Потім ми пішли в кафе.',
        gloss: {
          UiLang.tr: 'Sonra bir kafeye gittik.',
          UiLang.en: 'Then we went to a café.',
        },
      ),
      Phrase(
        id: 'uk_past_story_5',
        target: 'Вчора вона пішла в кіно.',
        gloss: {
          UiLang.tr: 'O dün sinemaya gitti.',
          UiLang.en: 'She went to the movies yesterday.',
        },
      ),
      Phrase(
        id: 'uk_past_story_6',
        target: 'Це був чудовий день.',
        gloss: {
          UiLang.tr: 'Harika bir gündü.',
          UiLang.en: 'It was a great day.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You start telling a story.',
        expected: 'Вчора я пішов у парк.',
      ),
      SpeakTurn(
        prompt: 'You describe the day.',
        expected: 'Погода була чудова.',
      ),
      SpeakTurn(
        prompt: 'Something unexpected happened.',
        expected: 'Я зустрів старого друга.',
      ),
      SpeakTurn(
        prompt: 'What did you two do?',
        expected: 'Ми довго розмовляли.',
      ),
      SpeakTurn(
        prompt: 'Where did you go next?',
        expected: 'Потім ми пішли в кафе.',
      ),
      SpeakTurn(
        prompt: 'You mention a friend\'s evening.',
        expected: 'Вчора вона пішла в кіно.',
      ),
      SpeakTurn(
        prompt: 'You wrap up the story.',
        expected: 'Це був чудовий день.',
      ),
    ],
  ),

  // ===================== POLISH (pl) =====================
  Scenario(
    id: 'pl_intro',
    lang: LearnLang.pl,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Tanışma', UiLang.en: 'Meeting someone new'},
    clipLine: 'Nazywam się Anna.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            '"Nazywać się" (adı olmak) dönüşlü bir fiildir — "się" '
            'mutlaka söylenmelidir, atlanamaz.',
        UiLang.en:
            '"Nazywać się" (to be named) is a reflexive verb — the '
            'particle "się" is required and can\'t be dropped.',
      },
      goodExample: 'Nazywam się Anna Kowalska.',
      badExample: 'Nazywam Anna Kowalska.',
    ),
    phrases: [
      Phrase(
        id: 'pl_intro_0',
        target: 'Cześć! Jak masz na imię?',
        gloss: {
          UiLang.tr: 'Merhaba! Adın ne?',
          UiLang.en: 'Hi! What\'s your name?',
        },
      ),
      Phrase(
        id: 'pl_intro_1',
        target: 'Nazywam się Anna.',
        gloss: {
          UiLang.tr: 'Benim adım Anna.',
          UiLang.en: 'My name is Anna.',
        },
      ),
      Phrase(
        id: 'pl_intro_2',
        target: 'Bardzo mi miło cię poznać.',
        gloss: {
          UiLang.tr: 'Tanıştığıma çok memnun oldum.',
          UiLang.en: 'Very nice to meet you.',
        },
      ),
      Phrase(
        id: 'pl_intro_3',
        target: 'Skąd jesteś?',
        gloss: {UiLang.tr: 'Nerelisin?', UiLang.en: 'Where are you from?'},
      ),
      Phrase(
        id: 'pl_intro_4',
        target: 'Jestem z Turcji.',
        gloss: {
          UiLang.tr: 'Ben Türkiye\'denim.',
          UiLang.en: 'I\'m from Turkey.',
        },
      ),
      Phrase(
        id: 'pl_intro_5',
        target: 'Jak się masz?',
        gloss: {UiLang.tr: 'Nasılsın?', UiLang.en: 'How are you?'},
      ),
      Phrase(
        id: 'pl_intro_6',
        target: 'Dobrze, dziękuję, a ty?',
        gloss: {
          UiLang.tr: 'İyiyim, teşekkürler, ya sen?',
          UiLang.en: 'Good, thanks, and you?',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Someone greets you first.',
        expected: 'Cześć! Jak masz na imię?',
      ),
      SpeakTurn(prompt: 'They ask your name.', expected: 'Nazywam się Anna.'),
      SpeakTurn(
        prompt: 'You want to be polite.',
        expected: 'Bardzo mi miło cię poznać.',
      ),
      SpeakTurn(
        prompt: 'You want to know where they are from.',
        expected: 'Skąd jesteś?',
      ),
      SpeakTurn(
        prompt: 'They ask where you are from.',
        expected: 'Jestem z Turcji.',
      ),
      SpeakTurn(
        prompt: 'You ask how they are doing.',
        expected: 'Jak się masz?',
      ),
      SpeakTurn(
        prompt: 'They ask you back.',
        expected: 'Dobrze, dziękuję, a ty?',
      ),
    ],
  ),
  Scenario(
    id: 'pl_shopping',
    lang: LearnLang.pl,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Alışveriş', UiLang.en: 'Shopping'},
    clipLine: 'Ile to kosztuje?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            '5 ve üzeri sayılardan sonra isim çoğul genitif halde olur '
            '— "pięć jabłek", "pięć jabłka" değil.',
        UiLang.en:
            'After numbers 5 and above the noun takes the plural '
            'genitive form — "pięć jabłek" (five apples), not "pięć '
            'jabłka".',
      },
      goodExample: 'Poproszę pięć jabłek.',
      badExample: 'Poproszę pięć jabłka.',
    ),
    phrases: [
      Phrase(
        id: 'pl_shopping_0',
        target: 'Dzień dobry, tylko oglądam.',
        gloss: {
          UiLang.tr: 'İyi günler, sadece bakıyorum.',
          UiLang.en: 'Hello, I\'m just looking.',
        },
      ),
      Phrase(
        id: 'pl_shopping_1',
        target: 'Ile to kosztuje?',
        gloss: {UiLang.tr: 'Bu ne kadar?', UiLang.en: 'How much is this?'},
      ),
      Phrase(
        id: 'pl_shopping_2',
        target: 'Czy ma pan to w innym rozmiarze?',
        gloss: {
          UiLang.tr: 'Bunun başka bedeni var mı?',
          UiLang.en: 'Do you have this in another size?',
        },
      ),
      Phrase(
        id: 'pl_shopping_3',
        target: 'Czy mogę to przymierzyć?',
        gloss: {
          UiLang.tr: 'Bunu deneyebilir miyim?',
          UiLang.en: 'Can I try this on?',
        },
      ),
      Phrase(
        id: 'pl_shopping_4',
        target: 'Poproszę pięć jabłek.',
        gloss: {
          UiLang.tr: 'Lütfen beş elma.',
          UiLang.en: 'Five apples, please.',
        },
      ),
      Phrase(
        id: 'pl_shopping_5',
        target: 'To jest za drogie.',
        gloss: {
          UiLang.tr: 'Bu çok pahalı.',
          UiLang.en: 'This is too expensive.',
        },
      ),
      Phrase(
        id: 'pl_shopping_6',
        target: 'Wezmę to.',
        gloss: {UiLang.tr: 'Bunu alıyorum.', UiLang.en: 'I\'ll take this.'},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You walk into a shop.',
        expected: 'Dzień dobry, tylko oglądam.',
      ),
      SpeakTurn(
        prompt: 'You see a jacket you like.',
        expected: 'Ile to kosztuje?',
      ),
      SpeakTurn(
        prompt: 'It doesn\'t fit.',
        expected: 'Czy ma pan to w innym rozmiarze?',
      ),
      SpeakTurn(
        prompt: 'They bring another size.',
        expected: 'Czy mogę to przymierzyć?',
      ),
      SpeakTurn(
        prompt: 'You are at the fruit stand.',
        expected: 'Poproszę pięć jabłek.',
      ),
      SpeakTurn(
        prompt: 'The price surprises you.',
        expected: 'To jest za drogie.',
      ),
      SpeakTurn(
        prompt: 'You decide to buy the cheaper one.',
        expected: 'Wezmę to.',
      ),
    ],
  ),
  Scenario(
    id: 'pl_numbers_time',
    lang: LearnLang.pl,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Sayılar ve saat', UiLang.en: 'Numbers and time'},
    clipLine: 'Która jest godzina?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            '"Saat X\'te" derken "o" edatı + saatin dişil lokatif hali '
            'kullanılır: "o siódmej" ("yedide").',
        UiLang.en:
            '"At X o\'clock" uses "o" + the ordinal hour number in the '
            'locative feminine form — "o siódmej", not "na siódmą".',
      },
      goodExample: 'Spotkamy się o siódmej.',
      badExample: 'Spotkamy się na siódmą.',
    ),
    phrases: [
      Phrase(
        id: 'pl_numbers_time_0',
        target: 'Która jest godzina?',
        gloss: {UiLang.tr: 'Saat kaç?', UiLang.en: 'What time is it?'},
      ),
      Phrase(
        id: 'pl_numbers_time_1',
        target: 'Jest trzecia.',
        gloss: {
          UiLang.tr: 'Saat üç.',
          UiLang.en: 'It\'s three o\'clock.',
        },
      ),
      Phrase(
        id: 'pl_numbers_time_2',
        target: 'Spotkamy się o siódmej.',
        gloss: {
          UiLang.tr: 'Saat yedide buluşalım.',
          UiLang.en: 'Let\'s meet at seven.',
        },
      ),
      Phrase(
        id: 'pl_numbers_time_3',
        target: 'Ile masz lat?',
        gloss: {UiLang.tr: 'Kaç yaşındasın?', UiLang.en: 'How old are you?'},
      ),
      Phrase(
        id: 'pl_numbers_time_4',
        target: 'Mam dwadzieścia pięć lat.',
        gloss: {
          UiLang.tr: 'Ben yirmi beş yaşındayım.',
          UiLang.en: 'I am twenty-five years old.',
        },
      ),
      Phrase(
        id: 'pl_numbers_time_5',
        target: 'Mój numer telefonu to dziewięć, zero, jeden.',
        gloss: {
          UiLang.tr: 'Telefon numaram: dokuz, sıfır, bir.',
          UiLang.en: 'My phone number is nine, zero, one.',
        },
      ),
      Phrase(
        id: 'pl_numbers_time_6',
        target: 'Sklep jest otwarty do ósmej.',
        gloss: {
          UiLang.tr: 'Mağaza sekize kadar açık.',
          UiLang.en: 'The store is open until eight.',
        },
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'You check your watch.', expected: 'Która jest godzina?'),
      SpeakTurn(prompt: 'Someone asks the time.', expected: 'Jest trzecia.'),
      SpeakTurn(
        prompt: 'You suggest a meeting time.',
        expected: 'Spotkamy się o siódmej.',
      ),
      SpeakTurn(prompt: 'New friend asks your age.', expected: 'Ile masz lat?'),
      SpeakTurn(
        prompt: 'They wait for your answer.',
        expected: 'Mam dwadzieścia pięć lat.',
      ),
      SpeakTurn(
        prompt: 'They ask for your number.',
        expected: 'Mój numer telefonu to dziewięć, zero, jeden.',
      ),
      SpeakTurn(
        prompt: 'They ask when the shop closes.',
        expected: 'Sklep jest otwarty do ósmej.',
      ),
    ],
  ),
  Scenario(
    id: 'pl_family',
    lang: LearnLang.pl,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Aile', UiLang.en: 'Family'},
    clipLine: 'To jest moja siostra.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'İyelik zamiri "mój/moja/moje" ismin cinsiyetine göre '
            'değişir, sahibinin cinsiyetine göre değil.',
        UiLang.en:
            'The possessive "mój/moja/moje" agrees with the gender of '
            'the noun it modifies, not the owner\'s — siostra is '
            'feminine, so "moja siostra", never "mój siostra".',
      },
      goodExample: 'To jest moja siostra.',
      badExample: 'To jest mój siostra.',
    ),
    phrases: [
      Phrase(
        id: 'pl_family_0',
        target: 'To jest moja rodzina.',
        gloss: {UiLang.tr: 'Bu benim ailem.', UiLang.en: 'This is my family.'},
      ),
      Phrase(
        id: 'pl_family_1',
        target: 'To jest mój brat.',
        gloss: {
          UiLang.tr: 'Bu benim erkek kardeşim.',
          UiLang.en: 'This is my brother.',
        },
      ),
      Phrase(
        id: 'pl_family_2',
        target: 'To jest moja siostra.',
        gloss: {
          UiLang.tr: 'Bu benim kız kardeşim.',
          UiLang.en: 'This is my sister.',
        },
      ),
      Phrase(
        id: 'pl_family_3',
        target: 'Mam dwoje dzieci.',
        gloss: {
          UiLang.tr: 'İki çocuğum var.',
          UiLang.en: 'I have two children.',
        },
      ),
      Phrase(
        id: 'pl_family_4',
        target: 'Moi rodzice mieszkają w innym mieście.',
        gloss: {
          UiLang.tr: 'Ailem başka bir şehirde yaşıyor.',
          UiLang.en: 'My parents live in another city.',
        },
      ),
      Phrase(
        id: 'pl_family_5',
        target: 'Ile masz rodzeństwa?',
        gloss: {
          UiLang.tr: 'Kaç kardeşin var?',
          UiLang.en: 'How many siblings do you have?',
        },
      ),
      Phrase(
        id: 'pl_family_6',
        target: 'Moja żona pracuje jako lekarka.',
        gloss: {
          UiLang.tr: 'Eşim doktor olarak çalışıyor.',
          UiLang.en: 'My wife works as a doctor.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You show a family photo.',
        expected: 'To jest moja rodzina.',
      ),
      SpeakTurn(prompt: 'You point at a man.', expected: 'To jest mój brat.'),
      SpeakTurn(
        prompt: 'You point at a woman.',
        expected: 'To jest moja siostra.',
      ),
      SpeakTurn(
        prompt: 'They ask about kids.',
        expected: 'Mam dwoje dzieci.',
      ),
      SpeakTurn(
        prompt: 'They ask where your parents live.',
        expected: 'Moi rodzice mieszkają w innym mieście.',
      ),
      SpeakTurn(
        prompt: 'You ask them the same.',
        expected: 'Ile masz rodzeństwa?',
      ),
      SpeakTurn(
        prompt: 'They ask about your spouse\'s job.',
        expected: 'Moja żona pracuje jako lekarka.',
      ),
    ],
  ),
  Scenario(
    id: 'pl_weather',
    lang: LearnLang.pl,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Hava durumu', UiLang.en: 'Weather'},
    clipLine: 'Jutro będzie zimno.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Hava durumu sıfatları kişisiz kullanımda -o ile biten zarf '
            'halini alır (zimno, ciepło), standart sıfat hali (zimny) '
            'değil.',
        UiLang.en:
            'Weather adjectives take the neuter/adverbial -o ending in '
            'impersonal use (zimno, ciepło), not the regular adjective '
            'form (zimny).',
      },
      goodExample: 'Jutro będzie zimno.',
      badExample: 'Jutro będzie zimny.',
    ),
    phrases: [
      Phrase(
        id: 'pl_weather_0',
        target: 'Jaka jest dzisiaj pogoda?',
        gloss: {
          UiLang.tr: 'Bugün hava nasıl?',
          UiLang.en: 'What\'s the weather like today?',
        },
      ),
      Phrase(
        id: 'pl_weather_1',
        target: 'Dzisiaj jest zimno.',
        gloss: {UiLang.tr: 'Bugün hava soğuk.', UiLang.en: 'It\'s cold today.'},
      ),
      Phrase(
        id: 'pl_weather_2',
        target: 'Na dworze pada deszcz.',
        gloss: {
          UiLang.tr: 'Dışarıda yağmur yağıyor.',
          UiLang.en: 'It\'s raining outside.',
        },
      ),
      Phrase(
        id: 'pl_weather_3',
        target: 'Jutro będzie zimno.',
        gloss: {
          UiLang.tr: 'Yarın hava soğuk olacak.',
          UiLang.en: 'Tomorrow it will be cold.',
        },
      ),
      Phrase(
        id: 'pl_weather_4',
        target: 'Weź parasol.',
        gloss: {UiLang.tr: 'Şemsiye al.', UiLang.en: 'Take an umbrella.'},
      ),
      Phrase(
        id: 'pl_weather_5',
        target: 'Latem jest tu bardzo gorąco.',
        gloss: {
          UiLang.tr: 'Burada yazın çok sıcak oluyor.',
          UiLang.en: 'It\'s very hot here in summer.',
        },
      ),
      Phrase(
        id: 'pl_weather_6',
        target: 'Pada śnieg.',
        gloss: {UiLang.tr: 'Kar yağıyor.', UiLang.en: 'It\'s snowing.'},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You look out the window.',
        expected: 'Jaka jest dzisiaj pogoda?',
      ),
      SpeakTurn(prompt: 'You shiver.', expected: 'Dzisiaj jest zimno.'),
      SpeakTurn(
        prompt: 'You hear drops on the roof.',
        expected: 'Na dworze pada deszcz.',
      ),
      SpeakTurn(
        prompt: 'You check tomorrow\'s forecast.',
        expected: 'Jutro będzie zimno.',
      ),
      SpeakTurn(
        prompt: 'You warn a friend before they leave.',
        expected: 'Weź parasol.',
      ),
      SpeakTurn(
        prompt: 'A tourist asks about summer here.',
        expected: 'Latem jest tu bardzo gorąco.',
      ),
      SpeakTurn(prompt: 'You look outside in winter.', expected: 'Pada śnieg.'),
    ],
  ),
  Scenario(
    id: 'pl_transport',
    lang: LearnLang.pl,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Ulaşım', UiLang.en: 'Transport'},
    clipLine: 'Jadę autobusem.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Bir araçla gitmek için taşıt adı edatsız araçlı (instrumental) '
            'halde kullanılır: "autobusem" (otobüsle), "na autobus" '
            'değil.',
        UiLang.en:
            'The vehicle used goes in the instrumental case with no '
            'preposition — "autobusem" (by bus), not "na autobus".',
      },
      goodExample: 'Jadę autobusem.',
      badExample: 'Jadę na autobus.',
    ),
    phrases: [
      Phrase(
        id: 'pl_transport_0',
        target: 'Jak dojechać do centrum?',
        gloss: {
          UiLang.tr: 'Şehir merkezine nasıl gidilir?',
          UiLang.en: 'How do I get to the city center?',
        },
      ),
      Phrase(
        id: 'pl_transport_1',
        target: 'Jadę autobusem.',
        gloss: {
          UiLang.tr: 'Otobüsle gidiyorum.',
          UiLang.en: 'I\'m going by bus.',
        },
      ),
      Phrase(
        id: 'pl_transport_2',
        target: 'Gdzie jest najbliższa stacja metra?',
        gloss: {
          UiLang.tr: 'En yakın metro istasyonu nerede?',
          UiLang.en: 'Where is the nearest metro station?',
        },
      ),
      Phrase(
        id: 'pl_transport_3',
        target: 'Poproszę jeden bilet do dworca.',
        gloss: {
          UiLang.tr: 'Gara bir bilet lütfen.',
          UiLang.en: 'One ticket to the station, please.',
        },
      ),
      Phrase(
        id: 'pl_transport_4',
        target: 'Czy ten autobus jedzie na lotnisko?',
        gloss: {
          UiLang.tr: 'Bu otobüs havalimanına gidiyor mu?',
          UiLang.en: 'Does this bus go to the airport?',
        },
      ),
      Phrase(
        id: 'pl_transport_5',
        target: 'Czy wysiadam na następnym przystanku?',
        gloss: {
          UiLang.tr: 'Bir sonraki durakta mı inmeliyim?',
          UiLang.en: 'Should I get off at the next stop?',
        },
      ),
      Phrase(
        id: 'pl_transport_6',
        target: 'Taksówka będzie szybsza.',
        gloss: {
          UiLang.tr: 'Taksi daha hızlı olur.',
          UiLang.en: 'A taxi will be faster.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You stop a passerby.',
        expected: 'Jak dojechać do centrum?',
      ),
      SpeakTurn(
        prompt: 'They ask how you\'re traveling.',
        expected: 'Jadę autobusem.',
      ),
      SpeakTurn(
        prompt: 'You look for the subway.',
        expected: 'Gdzie jest najbliższa stacja metra?',
      ),
      SpeakTurn(
        prompt: 'You are at the ticket window.',
        expected: 'Poproszę jeden bilet do dworca.',
      ),
      SpeakTurn(
        prompt: 'You\'re unsure which bus to take.',
        expected: 'Czy ten autobus jedzie na lotnisko?',
      ),
      SpeakTurn(
        prompt: 'You\'re not sure where to get off.',
        expected: 'Czy wysiadam na następnym przystanku?',
      ),
      SpeakTurn(
        prompt: 'You\'re running late.',
        expected: 'Taksówka będzie szybsza.',
      ),
    ],
  ),
  Scenario(
    id: 'pl_emergency',
    lang: LearnLang.pl,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Acil durum', UiLang.en: 'Emergency'},
    clipLine: 'Potrzebuję pomocy!',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            '"Potrzebować" (ihtiyacı olmak) fiili nesnesini genitif '
            'halde alır, accusative değil.',
        UiLang.en:
            'The verb "potrzebować" (to need) governs the genitive '
            'case, not the accusative — "potrzebuję pomocy", never '
            '"potrzebuję pomoc".',
      },
      goodExample: 'Potrzebuję pomocy!',
      badExample: 'Potrzebuję pomoc!',
    ),
    phrases: [
      Phrase(
        id: 'pl_emergency_0',
        target: 'Pomocy!',
        gloss: {UiLang.tr: 'İmdat!', UiLang.en: 'Help!'},
      ),
      Phrase(
        id: 'pl_emergency_1',
        target: 'Potrzebuję pomocy!',
        gloss: {
          UiLang.tr: 'Yardıma ihtiyacım var!',
          UiLang.en: 'I need help!',
        },
      ),
      Phrase(
        id: 'pl_emergency_2',
        target: 'Proszę wezwać karetkę!',
        gloss: {
          UiLang.tr: 'Lütfen ambulans çağırın!',
          UiLang.en: 'Please call an ambulance!',
        },
      ),
      Phrase(
        id: 'pl_emergency_3',
        target: 'Gdzie jest najbliższy szpital?',
        gloss: {
          UiLang.tr: 'En yakın hastane nerede?',
          UiLang.en: 'Where is the nearest hospital?',
        },
      ),
      Phrase(
        id: 'pl_emergency_4',
        target: 'Zgubiłem paszport.',
        gloss: {
          UiLang.tr: 'Pasaportumu kaybettim.',
          UiLang.en: 'I lost my passport.',
        },
      ),
      Phrase(
        id: 'pl_emergency_5',
        target: 'Proszę zadzwonić na policję.',
        gloss: {
          UiLang.tr: 'Lütfen polisi arayın.',
          UiLang.en: 'Please call the police.',
        },
      ),
      Phrase(
        id: 'pl_emergency_6',
        target: 'Nic mi nie jest.',
        gloss: {UiLang.tr: 'Ben iyiyim.', UiLang.en: 'I\'m okay.'},
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'Something just went wrong.', expected: 'Pomocy!'),
      SpeakTurn(
        prompt: 'A stranger stops to check on you.',
        expected: 'Potrzebuję pomocy!',
      ),
      SpeakTurn(
        prompt: 'Someone is badly hurt.',
        expected: 'Proszę wezwać karetkę!',
      ),
      SpeakTurn(
        prompt: 'You need medical care.',
        expected: 'Gdzie jest najbliższy szpital?',
      ),
      SpeakTurn(
        prompt: 'You check your bag and panic.',
        expected: 'Zgubiłem paszport.',
      ),
      SpeakTurn(
        prompt: 'You need to report a theft.',
        expected: 'Proszę zadzwonić na policję.',
      ),
      SpeakTurn(
        prompt: 'They ask if you\'re hurt.',
        expected: 'Nic mi nie jest.',
      ),
    ],
  ),
  Scenario(
    id: 'pl_routine',
    lang: LearnLang.pl,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Günlük rutin', UiLang.en: 'Daily routine'},
    clipLine: 'Budzę się o siódmej.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Günlük rutin fiillerinin çoğu Lehçede "się" ile dönüşlüdür '
            '(budzić się) — Türkçedeki karşılığı dönüşlü olmasa bile '
            '"się" atlanmaz.',
        UiLang.en:
            'Many daily-routine verbs are reflexive in Polish with '
            '"się" (budzić się "to wake up"), even when the English '
            'equivalent isn\'t — "się" can\'t be dropped.',
      },
      goodExample: 'Budzę się o siódmej.',
      badExample: 'Budzę o siódmej.',
    ),
    phrases: [
      Phrase(
        id: 'pl_routine_0',
        target: 'Budzę się o siódmej.',
        gloss: {
          UiLang.tr: 'Saat yedide uyanıyorum.',
          UiLang.en: 'I wake up at seven.',
        },
      ),
      Phrase(
        id: 'pl_routine_1',
        target: 'Myję się i jem śniadanie.',
        gloss: {
          UiLang.tr: 'Yüzümü yıkıyorum ve kahvaltı ediyorum.',
          UiLang.en: 'I wash up and have breakfast.',
        },
      ),
      Phrase(
        id: 'pl_routine_2',
        target: 'Potem idę do pracy.',
        gloss: {
          UiLang.tr: 'Sonra işe gidiyorum.',
          UiLang.en: 'Then I go to work.',
        },
      ),
      Phrase(
        id: 'pl_routine_3',
        target: 'Jem obiad o pierwszej.',
        gloss: {
          UiLang.tr: 'Saat birde öğle yemeği yiyorum.',
          UiLang.en: 'I have lunch at one.',
        },
      ),
      Phrase(
        id: 'pl_routine_4',
        target: 'Wieczorem uprawiam sport.',
        gloss: {
          UiLang.tr: 'Akşamları spor yapıyorum.',
          UiLang.en: 'In the evening I exercise.',
        },
      ),
      Phrase(
        id: 'pl_routine_5',
        target: 'Kładę się spać o jedenastej.',
        gloss: {
          UiLang.tr: 'Saat on birde yatıyorum.',
          UiLang.en: 'I go to bed at eleven.',
        },
      ),
      Phrase(
        id: 'pl_routine_6',
        target: 'W weekendy odpoczywam.',
        gloss: {
          UiLang.tr: 'Hafta sonları dinleniyorum.',
          UiLang.en: 'On weekends I rest.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'The alarm goes off.',
        expected: 'Budzę się o siódmej.',
      ),
      SpeakTurn(
        prompt: 'You describe your morning.',
        expected: 'Myję się i jem śniadanie.',
      ),
      SpeakTurn(
        prompt: 'What happens after breakfast?',
        expected: 'Potem idę do pracy.',
      ),
      SpeakTurn(
        prompt: 'A colleague asks about lunch.',
        expected: 'Jem obiad o pierwszej.',
      ),
      SpeakTurn(
        prompt: 'They ask about your evenings.',
        expected: 'Wieczorem uprawiam sport.',
      ),
      SpeakTurn(
        prompt: 'They ask when you sleep.',
        expected: 'Kładę się spać o jedenastej.',
      ),
      SpeakTurn(
        prompt: 'They ask about weekends.',
        expected: 'W weekendy odpoczywam.',
      ),
    ],
  ),
  Scenario(
    id: 'pl_past_story',
    lang: LearnLang.pl,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Geçmişte bir olay', UiLang.en: 'Telling a past event'},
    clipLine: 'Wczoraj poszedłem do parku.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Lehçede geçmiş zaman fiili öznenin cinsiyetine göre '
            'çekimlenir: erkek özne "-łem/-ł" (poszedłem), kadın özne '
            '"-łam/-ła" (poszła).',
        UiLang.en:
            'Polish past-tense verbs agree with the subject\'s gender '
            '— masculine subjects take "-łem/-ł" (poszedłem), feminine '
            'subjects take "-łam/-ła" (poszła).',
      },
      goodExample: 'Ona wczoraj poszła do kina.',
      badExample: 'Ona wczoraj poszedł do kina.',
    ),
    phrases: [
      Phrase(
        id: 'pl_past_story_0',
        target: 'Wczoraj poszedłem do parku.',
        gloss: {
          UiLang.tr: 'Dün parka gittim.',
          UiLang.en: 'Yesterday I went to the park.',
        },
      ),
      Phrase(
        id: 'pl_past_story_1',
        target: 'Pogoda była piękna.',
        gloss: {
          UiLang.tr: 'Hava harikaydı.',
          UiLang.en: 'The weather was beautiful.',
        },
      ),
      Phrase(
        id: 'pl_past_story_2',
        target: 'Spotkałem starego przyjaciela.',
        gloss: {
          UiLang.tr: 'Eski bir arkadaşımla karşılaştım.',
          UiLang.en: 'I met an old friend.',
        },
      ),
      Phrase(
        id: 'pl_past_story_3',
        target: 'Długo rozmawialiśmy.',
        gloss: {
          UiLang.tr: 'Uzun süre konuştuk.',
          UiLang.en: 'We talked for a long time.',
        },
      ),
      Phrase(
        id: 'pl_past_story_4',
        target: 'Potem poszliśmy do kawiarni.',
        gloss: {
          UiLang.tr: 'Sonra bir kafeye gittik.',
          UiLang.en: 'Then we went to a café.',
        },
      ),
      Phrase(
        id: 'pl_past_story_5',
        target: 'Ona wczoraj poszła do kina.',
        gloss: {
          UiLang.tr: 'O dün sinemaya gitti.',
          UiLang.en: 'She went to the movies yesterday.',
        },
      ),
      Phrase(
        id: 'pl_past_story_6',
        target: 'To był świetny dzień.',
        gloss: {
          UiLang.tr: 'Harika bir gündü.',
          UiLang.en: 'It was a great day.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You start telling a story.',
        expected: 'Wczoraj poszedłem do parku.',
      ),
      SpeakTurn(
        prompt: 'You describe the day.',
        expected: 'Pogoda była piękna.',
      ),
      SpeakTurn(
        prompt: 'Something unexpected happened.',
        expected: 'Spotkałem starego przyjaciela.',
      ),
      SpeakTurn(
        prompt: 'What did you two do?',
        expected: 'Długo rozmawialiśmy.',
      ),
      SpeakTurn(
        prompt: 'Where did you go next?',
        expected: 'Potem poszliśmy do kawiarni.',
      ),
      SpeakTurn(
        prompt: 'You mention a friend\'s evening.',
        expected: 'Ona wczoraj poszła do kina.',
      ),
      SpeakTurn(
        prompt: 'You wrap up the story.',
        expected: 'To był świetny dzień.',
      ),
    ],
  ),
];

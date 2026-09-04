import '../../models/models.dart';

/// Batch G — A1 dalga 1: eksik 9 A1 konusu (Tanışma, Alışveriş, Sayılar &
/// saat, Aile, Hava durumu, Ulaşım, Acil durum, Günlük rutin, Basit geçmiş
/// zaman ile bir olay anlatma) için Türkçe (LearnLang.tr), Yunanca
/// (LearnLang.el) ve Çekçe (LearnLang.cs) içerikleri.
///
/// `lib/data/content/catalog.dart` dosyasına dokunulmadı — entegrasyon
/// merkezi olarak ayrıca yapılacak.
final List<Scenario> catalogExtraBatchG = [
  // ===========================================================================
  // TÜRKÇE (LearnLang.tr)
  // ===========================================================================
  Scenario(
    id: 'tr_intro',
    lang: LearnLang.tr,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Tanışma', UiLang.en: 'Meeting someone'},
    clipLine: 'Merhaba, ben Ayşe.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Türkçede -dan/-den eki, kelimenin son ünlüsüne göre değişir: '
            'kalın ünlülerden (a, ı, o, u) sonra -dan, ince ünlülerden '
            '(e, i, ö, ü) sonra -den gelir.',
        UiLang.en:
            'The Turkish suffix -dan/-den changes with the word\'s last '
            'vowel: back vowels (a, ı, o, u) take -dan, front vowels '
            '(e, i, ö, ü) take -den.',
      },
      goodExample: 'İzmir\'den geliyorum.',
      badExample: 'İzmir\'dan geliyorum.',
    ),
    phrases: [
      Phrase(
        id: 'tr_intro_0',
        target: 'Merhaba, ben Ayşe.',
        gloss: {UiLang.tr: 'Merhaba, ben Ayşe.', UiLang.en: 'Hi, I am Ayşe.'},
      ),
      Phrase(
        id: 'tr_intro_1',
        target: 'Memnun oldum.',
        gloss: {UiLang.tr: 'Memnun oldum.', UiLang.en: 'Nice to meet you.'},
      ),
      Phrase(
        id: 'tr_intro_2',
        target: 'Adın ne?',
        gloss: {UiLang.tr: 'Adın ne?', UiLang.en: 'What is your name?'},
      ),
      Phrase(
        id: 'tr_intro_3',
        target: 'Nerelisin?',
        gloss: {UiLang.tr: 'Nerelisin?', UiLang.en: 'Where are you from?'},
      ),
      Phrase(
        id: 'tr_intro_4',
        target: 'Ben İstanbul\'dan geliyorum.',
        gloss: {
          UiLang.tr: 'Ben İstanbul\'dan geliyorum.',
          UiLang.en: 'I am from Istanbul.',
        },
      ),
      Phrase(
        id: 'tr_intro_5',
        target: 'Kaç yaşındasın?',
        gloss: {UiLang.tr: 'Kaç yaşındasın?', UiLang.en: 'How old are you?'},
      ),
      Phrase(
        id: 'tr_intro_6',
        target: 'Yirmi beş yaşındayım.',
        gloss: {
          UiLang.tr: 'Yirmi beş yaşındayım.',
          UiLang.en: 'I am twenty-five years old.',
        },
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'You meet someone new.', expected: 'Merhaba, ben Ayşe.'),
      SpeakTurn(prompt: 'They shake your hand.', expected: 'Memnun oldum.'),
      SpeakTurn(prompt: 'You ask their name.', expected: 'Adın ne?'),
      SpeakTurn(
        prompt: 'You ask where they are from.',
        expected: 'Nerelisin?',
      ),
      SpeakTurn(
        prompt: 'They ask where you are from.',
        expected: 'Ben İstanbul\'dan geliyorum.',
      ),
      SpeakTurn(prompt: 'You ask their age.', expected: 'Kaç yaşındasın?'),
      SpeakTurn(
        prompt: 'They ask your age.',
        expected: 'Yirmi beş yaşındayım.',
      ),
    ],
  ),
  Scenario(
    id: 'tr_shopping',
    lang: LearnLang.tr,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Alışveriş', UiLang.en: 'Shopping'},
    clipLine: 'Bu ne kadar?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Soru eki mı/mi/mu/mü ayrı yazılır ve kendinden önceki '
            'kelimenin son ünlüsüne göre dört şekilde uyum sağlar.',
        UiLang.en:
            'The Turkish question particle mı/mi/mu/mü is written as a '
            'separate word and matches the preceding word\'s last vowel — '
            'four possible forms.',
      },
      goodExample: 'İndirim var mı?',
      badExample: 'İndirim var mi?',
    ),
    phrases: [
      Phrase(
        id: 'tr_shopping_0',
        target: 'Bu ne kadar?',
        gloss: {UiLang.tr: 'Bu ne kadar?', UiLang.en: 'How much is this?'},
      ),
      Phrase(
        id: 'tr_shopping_1',
        target: 'Çok pahalı.',
        gloss: {UiLang.tr: 'Çok pahalı.', UiLang.en: 'That is too expensive.'},
      ),
      Phrase(
        id: 'tr_shopping_2',
        target: 'İndirim var mı?',
        gloss: {UiLang.tr: 'İndirim var mı?', UiLang.en: 'Is there a discount?'},
      ),
      Phrase(
        id: 'tr_shopping_3',
        target: 'Bunu alıyorum.',
        gloss: {UiLang.tr: 'Bunu alıyorum.', UiLang.en: 'I will take this.'},
      ),
      Phrase(
        id: 'tr_shopping_4',
        target: 'Kart ile ödeyebilir miyim?',
        gloss: {
          UiLang.tr: 'Kart ile ödeyebilir miyim?',
          UiLang.en: 'Can I pay by card?',
        },
      ),
      Phrase(
        id: 'tr_shopping_5',
        target: 'Başka bir renk var mı?',
        gloss: {
          UiLang.tr: 'Başka bir renk var mı?',
          UiLang.en: 'Do you have another color?',
        },
      ),
      Phrase(
        id: 'tr_shopping_6',
        target: 'Fişimi alabilir miyim?',
        gloss: {
          UiLang.tr: 'Fişimi alabilir miyim?',
          UiLang.en: 'Can I get my receipt?',
        },
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'You point at an item.', expected: 'Bu ne kadar?'),
      SpeakTurn(prompt: 'The price is high.', expected: 'Çok pahalı.'),
      SpeakTurn(
        prompt: 'You want a lower price.',
        expected: 'İndirim var mı?',
      ),
      SpeakTurn(prompt: 'You decide to buy it.', expected: 'Bunu alıyorum.'),
      SpeakTurn(
        prompt: 'You reach for your wallet.',
        expected: 'Kart ile ödeyebilir miyim?',
      ),
      SpeakTurn(
        prompt: 'You do not like the color.',
        expected: 'Başka bir renk var mı?',
      ),
      SpeakTurn(
        prompt: 'The purchase is done.',
        expected: 'Fişimi alabilir miyim?',
      ),
    ],
  ),
  Scenario(
    id: 'tr_numbers_time',
    lang: LearnLang.tr,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Sayılar ve saat', UiLang.en: 'Numbers & time'},
    clipLine: 'Saat kaç?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Sert (tonsuz) ünsüzle biten kelimelerden sonra -de/-da eki '
            '-te/-ta olur (ünsüz benzeşmesi): beş sert ş ile biter, o '
            'yüzden beşte, beşde değil.',
        UiLang.en:
            'After a word ending in a voiceless consonant, the suffix '
            '-de/-da becomes -te/-ta (consonant assimilation): beş ends '
            'in the voiceless ş, so beşte, not beşde.',
      },
      goodExample: 'Saat beşte buluşalım.',
      badExample: 'Saat beşde buluşalım.',
    ),
    phrases: [
      Phrase(
        id: 'tr_numbers_time_0',
        target: 'Saat kaç?',
        gloss: {UiLang.tr: 'Saat kaç?', UiLang.en: 'What time is it?'},
      ),
      Phrase(
        id: 'tr_numbers_time_1',
        target: 'Saat üç.',
        gloss: {UiLang.tr: 'Saat üç.', UiLang.en: 'It is three o\'clock.'},
      ),
      Phrase(
        id: 'tr_numbers_time_2',
        target: 'Saat dokuzu on geçiyor.',
        gloss: {
          UiLang.tr: 'Saat dokuzu on geçiyor.',
          UiLang.en: 'It is ten past nine.',
        },
      ),
      Phrase(
        id: 'tr_numbers_time_3',
        target: 'Buluşmamız saat beşte.',
        gloss: {
          UiLang.tr: 'Buluşmamız saat beşte.',
          UiLang.en: 'Our meeting is at five.',
        },
      ),
      Phrase(
        id: 'tr_numbers_time_4',
        target: 'Bir, iki, üç, dört, beş.',
        gloss: {
          UiLang.tr: 'Bir, iki, üç, dört, beş.',
          UiLang.en: 'One, two, three, four, five.',
        },
      ),
      Phrase(
        id: 'tr_numbers_time_5',
        target: 'Yarım saat sonra geliyorum.',
        gloss: {
          UiLang.tr: 'Yarım saat sonra geliyorum.',
          UiLang.en: 'I am coming in half an hour.',
        },
      ),
      Phrase(
        id: 'tr_numbers_time_6',
        target: 'Bugün ayın kaçı?',
        gloss: {
          UiLang.tr: 'Bugün ayın kaçı?',
          UiLang.en: 'What is today\'s date?',
        },
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'You ask the time.', expected: 'Saat kaç?'),
      SpeakTurn(prompt: 'A clock shows 3:00.', expected: 'Saat üç.'),
      SpeakTurn(
        prompt: 'A clock shows 9:10.',
        expected: 'Saat dokuzu on geçiyor.',
      ),
      SpeakTurn(
        prompt: 'You confirm a meeting time.',
        expected: 'Buluşmamız saat beşte.',
      ),
      SpeakTurn(
        prompt: 'You count along with a child.',
        expected: 'Bir, iki, üç, dört, beş.',
      ),
      SpeakTurn(
        prompt: 'You are running late.',
        expected: 'Yarım saat sonra geliyorum.',
      ),
      SpeakTurn(prompt: 'You ask today\'s date.', expected: 'Bugün ayın kaçı?'),
    ],
  ),
  Scenario(
    id: 'tr_family',
    lang: LearnLang.tr,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Aile', UiLang.en: 'Family'},
    clipLine: 'Bu benim annem.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'İyelik eki -im, ünlüyle biten kelimelerde sadece -m olur '
            '(anne+m = annem); ünsüzle bitenlerde ise büyük ünlü uyumuna '
            'göre -im/-ım/-um/-üm seçilir (kardeş+im = kardeşim).',
        UiLang.en:
            'The possessive suffix -im becomes just -m after a word '
            'ending in a vowel (anne+m = annem); after a consonant it '
            'follows vowel harmony as -im/-ım/-um/-üm (kardeş+im = '
            'kardeşim).',
      },
      goodExample: 'Bir kız kardeşim var.',
      badExample: 'Bir kız kardeşüm var.',
    ),
    phrases: [
      Phrase(
        id: 'tr_family_0',
        target: 'Bu benim annem.',
        gloss: {UiLang.tr: 'Bu benim annem.', UiLang.en: 'This is my mother.'},
      ),
      Phrase(
        id: 'tr_family_1',
        target: 'Babam öğretmen.',
        gloss: {UiLang.tr: 'Babam öğretmen.', UiLang.en: 'My father is a teacher.'},
      ),
      Phrase(
        id: 'tr_family_2',
        target: 'Bir kız kardeşim var.',
        gloss: {
          UiLang.tr: 'Bir kız kardeşim var.',
          UiLang.en: 'I have a sister.',
        },
      ),
      Phrase(
        id: 'tr_family_3',
        target: 'Erkek kardeşim yok.',
        gloss: {
          UiLang.tr: 'Erkek kardeşim yok.',
          UiLang.en: 'I do not have a brother.',
        },
      ),
      Phrase(
        id: 'tr_family_4',
        target: 'Büyükannem bizimle yaşıyor.',
        gloss: {
          UiLang.tr: 'Büyükannem bizimle yaşıyor.',
          UiLang.en: 'My grandmother lives with us.',
        },
      ),
      Phrase(
        id: 'tr_family_5',
        target: 'Ailem kalabalık.',
        gloss: {UiLang.tr: 'Ailem kalabalık.', UiLang.en: 'My family is big.'},
      ),
      Phrase(
        id: 'tr_family_6',
        target: 'Kaç kardeşin var?',
        gloss: {
          UiLang.tr: 'Kaç kardeşin var?',
          UiLang.en: 'How many siblings do you have?',
        },
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'You show a photo.', expected: 'Bu benim annem.'),
      SpeakTurn(
        prompt: 'They ask about your father.',
        expected: 'Babam öğretmen.',
      ),
      SpeakTurn(
        prompt: 'They ask about siblings.',
        expected: 'Bir kız kardeşim var.',
      ),
      SpeakTurn(
        prompt: 'They ask about a brother.',
        expected: 'Erkek kardeşim yok.',
      ),
      SpeakTurn(
        prompt: 'They ask who lives with you.',
        expected: 'Büyükannem bizimle yaşıyor.',
      ),
      SpeakTurn(
        prompt: 'They ask about your family size.',
        expected: 'Ailem kalabalık.',
      ),
      SpeakTurn(
        prompt: 'You ask about their family.',
        expected: 'Kaç kardeşin var?',
      ),
    ],
  ),
  Scenario(
    id: 'tr_weather',
    lang: LearnLang.tr,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Hava durumu', UiLang.en: 'Weather'},
    clipLine: 'Bugün hava çok güzel.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Gelecek zaman eki -ecek/-acak, kalın ünlülü kelimelerde '
            '-acak, ince ünlülü kelimelerde -ecek olur.',
        UiLang.en:
            'The future-tense suffix -ecek/-acak becomes -acak after '
            'back vowels and -ecek after front vowels.',
      },
      goodExample: 'Yarın kar yağacak.',
      badExample: 'Yarın kar yağecek.',
    ),
    phrases: [
      Phrase(
        id: 'tr_weather_0',
        target: 'Bugün hava çok güzel.',
        gloss: {
          UiLang.tr: 'Bugün hava çok güzel.',
          UiLang.en: 'The weather is very nice today.',
        },
      ),
      Phrase(
        id: 'tr_weather_1',
        target: 'Dışarısı soğuk.',
        gloss: {UiLang.tr: 'Dışarısı soğuk.', UiLang.en: 'It is cold outside.'},
      ),
      Phrase(
        id: 'tr_weather_2',
        target: 'Yağmur yağıyor.',
        gloss: {UiLang.tr: 'Yağmur yağıyor.', UiLang.en: 'It is raining.'},
      ),
      Phrase(
        id: 'tr_weather_3',
        target: 'Yarın kar yağacak.',
        gloss: {
          UiLang.tr: 'Yarın kar yağacak.',
          UiLang.en: 'It will snow tomorrow.',
        },
      ),
      Phrase(
        id: 'tr_weather_4',
        target: 'Hava çok sıcak.',
        gloss: {UiLang.tr: 'Hava çok sıcak.', UiLang.en: 'It is very hot.'},
      ),
      Phrase(
        id: 'tr_weather_5',
        target: 'Şemsiyeni al.',
        gloss: {UiLang.tr: 'Şemsiyeni al.', UiLang.en: 'Take your umbrella.'},
      ),
      Phrase(
        id: 'tr_weather_6',
        target: 'Gökyüzü bulutlu.',
        gloss: {UiLang.tr: 'Gökyüzü bulutlu.', UiLang.en: 'The sky is cloudy.'},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You look outside.',
        expected: 'Bugün hava çok güzel.',
      ),
      SpeakTurn(prompt: 'You feel a chill.', expected: 'Dışarısı soğuk.'),
      SpeakTurn(prompt: 'Drops start falling.', expected: 'Yağmur yağıyor.'),
      SpeakTurn(
        prompt: 'You check tomorrow\'s forecast.',
        expected: 'Yarın kar yağacak.',
      ),
      SpeakTurn(prompt: 'You wipe your forehead.', expected: 'Hava çok sıcak.'),
      SpeakTurn(
        prompt: 'You warn a friend before they leave.',
        expected: 'Şemsiyeni al.',
      ),
      SpeakTurn(prompt: 'You look up at the sky.', expected: 'Gökyüzü bulutlu.'),
    ],
  ),
  Scenario(
    id: 'tr_transport',
    lang: LearnLang.tr,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Ulaşım', UiLang.en: 'Transport'},
    clipLine: 'Otobüs durağı nerede?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Yönelme (-e/-a) eki kalın ünlülü kelimelerde -a, ince ünlülü '
            'kelimelerde -e olur.',
        UiLang.en:
            'The dative suffix -e/-a becomes -a after back vowels and -e '
            'after front vowels.',
      },
      goodExample: 'Bu otobüs merkeze gidiyor mu?',
      badExample: 'Bu otobüs merkeza gidiyor mu?',
    ),
    phrases: [
      Phrase(
        id: 'tr_transport_0',
        target: 'Otobüs durağı nerede?',
        gloss: {
          UiLang.tr: 'Otobüs durağı nerede?',
          UiLang.en: 'Where is the bus stop?',
        },
      ),
      Phrase(
        id: 'tr_transport_1',
        target: 'Bir bilet lütfen.',
        gloss: {UiLang.tr: 'Bir bilet lütfen.', UiLang.en: 'One ticket, please.'},
      ),
      Phrase(
        id: 'tr_transport_2',
        target: 'Bu otobüs merkeze gidiyor mu?',
        gloss: {
          UiLang.tr: 'Bu otobüs merkeze gidiyor mu?',
          UiLang.en: 'Does this bus go downtown?',
        },
      ),
      Phrase(
        id: 'tr_transport_3',
        target: 'Bir sonraki durakta iniyorum.',
        gloss: {
          UiLang.tr: 'Bir sonraki durakta iniyorum.',
          UiLang.en: 'I am getting off at the next stop.',
        },
      ),
      Phrase(
        id: 'tr_transport_4',
        target: 'Taksi çağırabilir misiniz?',
        gloss: {
          UiLang.tr: 'Taksi çağırabilir misiniz?',
          UiLang.en: 'Could you call a taxi?',
        },
      ),
      Phrase(
        id: 'tr_transport_5',
        target: 'Havalimanına ne kadar sürer?',
        gloss: {
          UiLang.tr: 'Havalimanına ne kadar sürer?',
          UiLang.en: 'How long does it take to the airport?',
        },
      ),
      Phrase(
        id: 'tr_transport_6',
        target: 'Metro istasyonu çok yakın.',
        gloss: {
          UiLang.tr: 'Metro istasyonu çok yakın.',
          UiLang.en: 'The metro station is very close.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You need directions.',
        expected: 'Otobüs durağı nerede?',
      ),
      SpeakTurn(prompt: 'At the ticket counter.', expected: 'Bir bilet lütfen.'),
      SpeakTurn(
        prompt: 'You are not sure of the route.',
        expected: 'Bu otobüs merkeze gidiyor mu?',
      ),
      SpeakTurn(
        prompt: 'You want to signal the driver.',
        expected: 'Bir sonraki durakta iniyorum.',
      ),
      SpeakTurn(
        prompt: 'You need a ride.',
        expected: 'Taksi çağırabilir misiniz?',
      ),
      SpeakTurn(
        prompt: 'You ask about travel time.',
        expected: 'Havalimanına ne kadar sürer?',
      ),
      SpeakTurn(
        prompt: 'Someone asks about the metro.',
        expected: 'Metro istasyonu çok yakın.',
      ),
    ],
  ),
  Scenario(
    id: 'tr_emergency',
    lang: LearnLang.tr,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Acil durum', UiLang.en: 'Emergency'},
    clipLine: 'Yardım edin!',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Kibar/siz emir kipinde fiile -in/-ın/-un/-ün eklenir; seçim '
            'fiilin son ünlüsüne göre büyük ünlü uyumuyla yapılır.',
        UiLang.en:
            'The polite/plural imperative adds -in/-ın/-un/-ün to the '
            'verb, chosen by vowel harmony with the verb\'s last vowel.',
      },
      goodExample: 'Ambulans çağırın!',
      badExample: 'Ambulans çağırun!',
    ),
    phrases: [
      Phrase(
        id: 'tr_emergency_0',
        target: 'Yardım edin!',
        gloss: {UiLang.tr: 'Yardım edin!', UiLang.en: 'Help!'},
      ),
      Phrase(
        id: 'tr_emergency_1',
        target: 'Ambulans çağırın!',
        gloss: {
          UiLang.tr: 'Ambulans çağırın!',
          UiLang.en: 'Call an ambulance!',
        },
      ),
      Phrase(
        id: 'tr_emergency_2',
        target: 'Kayboldum.',
        gloss: {UiLang.tr: 'Kayboldum.', UiLang.en: 'I am lost.'},
      ),
      Phrase(
        id: 'tr_emergency_3',
        target: 'Cüzdanım çalındı.',
        gloss: {
          UiLang.tr: 'Cüzdanım çalındı.',
          UiLang.en: 'My wallet was stolen.',
        },
      ),
      Phrase(
        id: 'tr_emergency_4',
        target: 'En yakın hastane nerede?',
        gloss: {
          UiLang.tr: 'En yakın hastane nerede?',
          UiLang.en: 'Where is the nearest hospital?',
        },
      ),
      Phrase(
        id: 'tr_emergency_5',
        target: 'Polis çağırır mısınız?',
        gloss: {
          UiLang.tr: 'Polis çağırır mısınız?',
          UiLang.en: 'Could you call the police?',
        },
      ),
      Phrase(
        id: 'tr_emergency_6',
        target: 'İyi değilim.',
        gloss: {UiLang.tr: 'İyi değilim.', UiLang.en: 'I do not feel well.'},
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'Something goes wrong.', expected: 'Yardım edin!'),
      SpeakTurn(prompt: 'Someone is hurt.', expected: 'Ambulans çağırın!'),
      SpeakTurn(prompt: 'You cannot find your way.', expected: 'Kayboldum.'),
      SpeakTurn(
        prompt: 'You notice your wallet is gone.',
        expected: 'Cüzdanım çalındı.',
      ),
      SpeakTurn(
        prompt: 'You need medical care.',
        expected: 'En yakın hastane nerede?',
      ),
      SpeakTurn(
        prompt: 'You need the authorities.',
        expected: 'Polis çağırır mısınız?',
      ),
      SpeakTurn(prompt: 'You feel sick.', expected: 'İyi değilim.'),
    ],
  ),
  Scenario(
    id: 'tr_routine',
    lang: LearnLang.tr,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Günlük rutin', UiLang.en: 'Daily routine'},
    clipLine: 'Her sabah yedide kalkarım.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Geniş zaman eki ünsüzle biten fiillerde -ar/-er, ünlüyle '
            'biten fiillerde sadece -r olur, sonuna şahıs eki gelir.',
        UiLang.en:
            'The simple-present suffix is -ar/-er after a consonant-final '
            'verb stem, and just -r after a vowel-final stem, followed by '
            'the person ending.',
      },
      goodExample: 'Her sabah yedide kalkarım.',
      badExample: 'Her sabah yedide kalkerim.',
    ),
    phrases: [
      Phrase(
        id: 'tr_routine_0',
        target: 'Her sabah yedide kalkarım.',
        gloss: {
          UiLang.tr: 'Her sabah yedide kalkarım.',
          UiLang.en: 'I get up at seven every morning.',
        },
      ),
      Phrase(
        id: 'tr_routine_1',
        target: 'Dişlerimi fırçalarım.',
        gloss: {
          UiLang.tr: 'Dişlerimi fırçalarım.',
          UiLang.en: 'I brush my teeth.',
        },
      ),
      Phrase(
        id: 'tr_routine_2',
        target: 'Kahvaltı yaparım.',
        gloss: {UiLang.tr: 'Kahvaltı yaparım.', UiLang.en: 'I have breakfast.'},
      ),
      Phrase(
        id: 'tr_routine_3',
        target: 'İşe otobüsle giderim.',
        gloss: {
          UiLang.tr: 'İşe otobüsle giderim.',
          UiLang.en: 'I go to work by bus.',
        },
      ),
      Phrase(
        id: 'tr_routine_4',
        target: 'Öğlen yemek yerim.',
        gloss: {UiLang.tr: 'Öğlen yemek yerim.', UiLang.en: 'I eat lunch at noon.'},
      ),
      Phrase(
        id: 'tr_routine_5',
        target: 'Akşam spor yaparım.',
        gloss: {
          UiLang.tr: 'Akşam spor yaparım.',
          UiLang.en: 'I exercise in the evening.',
        },
      ),
      Phrase(
        id: 'tr_routine_6',
        target: 'Gece erken yatarım.',
        gloss: {
          UiLang.tr: 'Gece erken yatarım.',
          UiLang.en: 'I go to bed early at night.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'They ask about your morning.',
        expected: 'Her sabah yedide kalkarım.',
      ),
      SpeakTurn(
        prompt: 'Next step after waking up.',
        expected: 'Dişlerimi fırçalarım.',
      ),
      SpeakTurn(prompt: 'Before leaving home.', expected: 'Kahvaltı yaparım.'),
      SpeakTurn(
        prompt: 'They ask how you commute.',
        expected: 'İşe otobüsle giderim.',
      ),
      SpeakTurn(prompt: 'At midday.', expected: 'Öğlen yemek yerim.'),
      SpeakTurn(
        prompt: 'They ask about your evening.',
        expected: 'Akşam spor yaparım.',
      ),
      SpeakTurn(prompt: 'Before sleeping.', expected: 'Gece erken yatarım.'),
    ],
  ),
  Scenario(
    id: 'tr_past_story',
    lang: LearnLang.tr,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Bir günü anlatmak', UiLang.en: 'Telling a story about your day'},
    clipLine: 'Dün sinemaya gittim.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Görülen geçmiş zaman eki -dı/-di/-du/-dü, sert (tonsuz) '
            'ünsüzden sonra -tı/-ti/-tu/-tü olur; hem büyük hem küçük '
            'ünlü uyumuna uyar.',
        UiLang.en:
            'The simple-past suffix -dı/-di/-du/-dü becomes -tı/-ti/-tu/-tü '
            'after a voiceless consonant, and follows both vowel-harmony '
            'rules.',
      },
      goodExample: 'Dün sinemaya gittim.',
      badExample: 'Dün sinemaya gitdim.',
    ),
    phrases: [
      Phrase(
        id: 'tr_past_story_0',
        target: 'Dün sinemaya gittim.',
        gloss: {
          UiLang.tr: 'Dün sinemaya gittim.',
          UiLang.en: 'Yesterday I went to the cinema.',
        },
      ),
      Phrase(
        id: 'tr_past_story_1',
        target: 'Güzel bir film izledim.',
        gloss: {
          UiLang.tr: 'Güzel bir film izledim.',
          UiLang.en: 'I watched a nice film.',
        },
      ),
      Phrase(
        id: 'tr_past_story_2',
        target: 'Sonra arkadaşımla buluştum.',
        gloss: {
          UiLang.tr: 'Sonra arkadaşımla buluştum.',
          UiLang.en: 'Then I met up with my friend.',
        },
      ),
      Phrase(
        id: 'tr_past_story_3',
        target: 'Bir kahve içtik.',
        gloss: {UiLang.tr: 'Bir kahve içtik.', UiLang.en: 'We had a coffee.'},
      ),
      Phrase(
        id: 'tr_past_story_4',
        target: 'Çok geç eve döndüm.',
        gloss: {
          UiLang.tr: 'Çok geç eve döndüm.',
          UiLang.en: 'I got home very late.',
        },
      ),
      Phrase(
        id: 'tr_past_story_5',
        target: 'Yorgun ama mutluydum.',
        gloss: {
          UiLang.tr: 'Yorgun ama mutluydum.',
          UiLang.en: 'I was tired but happy.',
        },
      ),
      Phrase(
        id: 'tr_past_story_6',
        target: 'Harika bir gündü.',
        gloss: {UiLang.tr: 'Harika bir gündü.', UiLang.en: 'It was a great day.'},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'They ask about yesterday.',
        expected: 'Dün sinemaya gittim.',
      ),
      SpeakTurn(
        prompt: 'They ask what you did there.',
        expected: 'Güzel bir film izledim.',
      ),
      SpeakTurn(
        prompt: 'They ask what happened next.',
        expected: 'Sonra arkadaşımla buluştum.',
      ),
      SpeakTurn(
        prompt: 'They ask what you two did.',
        expected: 'Bir kahve içtik.',
      ),
      SpeakTurn(
        prompt: 'They ask when you got home.',
        expected: 'Çok geç eve döndüm.',
      ),
      SpeakTurn(
        prompt: 'They ask how you felt.',
        expected: 'Yorgun ama mutluydum.',
      ),
      SpeakTurn(prompt: 'You sum up the day.', expected: 'Harika bir gündü.'),
    ],
  ),

  // ===========================================================================
  // ΕΛΛΗΝΙΚΑ / YUNANCA (LearnLang.el)
  // ===========================================================================
  Scenario(
    id: 'el_intro',
    lang: LearnLang.el,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Tanışma', UiLang.en: 'Meeting someone'},
    clipLine: 'Γεια σου, με λένε Μαρία.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Adını söylerken "με λένε X" (beni X diye çağırıyorlar) '
            'kullanılır; buradaki "με" (beni) nesne halindeki zamirdir, '
            '"εγώ" (ben) özne zamiri değil.',
        UiLang.en:
            'To give your name, Greek says "με λένε X" (literally "they '
            'call me X"); "με" (me) is the object pronoun here, not the '
            'subject pronoun "εγώ" (I).',
      },
      goodExample: 'Με λένε Μαρία.',
      badExample: 'Εγώ λένε Μαρία.',
    ),
    phrases: [
      Phrase(
        id: 'el_intro_0',
        target: 'Γεια σου, με λένε Μαρία.',
        gloss: {
          UiLang.tr: 'Merhaba, adım Maria.',
          UiLang.en: 'Hi, my name is Maria.',
        },
      ),
      Phrase(
        id: 'el_intro_1',
        target: 'Χάρηκα πολύ.',
        gloss: {UiLang.tr: 'Memnun oldum.', UiLang.en: 'Nice to meet you.'},
      ),
      Phrase(
        id: 'el_intro_2',
        target: 'Πώς σε λένε;',
        gloss: {UiLang.tr: 'Adın ne?', UiLang.en: 'What is your name?'},
      ),
      Phrase(
        id: 'el_intro_3',
        target: 'Από πού είσαι;',
        gloss: {UiLang.tr: 'Nerelisin?', UiLang.en: 'Where are you from?'},
      ),
      Phrase(
        id: 'el_intro_4',
        target: 'Είμαι από την Αθήνα.',
        gloss: {
          UiLang.tr: 'Atina\'danım.',
          UiLang.en: 'I am from Athens.',
        },
      ),
      Phrase(
        id: 'el_intro_5',
        target: 'Πόσων χρονών είσαι;',
        gloss: {UiLang.tr: 'Kaç yaşındasın?', UiLang.en: 'How old are you?'},
      ),
      Phrase(
        id: 'el_intro_6',
        target: 'Είμαι είκοσι πέντε χρονών.',
        gloss: {
          UiLang.tr: 'Yirmi beş yaşındayım.',
          UiLang.en: 'I am twenty-five years old.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You meet someone new.',
        expected: 'Γεια σου, με λένε Μαρία.',
      ),
      SpeakTurn(prompt: 'They shake your hand.', expected: 'Χάρηκα πολύ.'),
      SpeakTurn(prompt: 'You ask their name.', expected: 'Πώς σε λένε;'),
      SpeakTurn(
        prompt: 'You ask where they are from.',
        expected: 'Από πού είσαι;',
      ),
      SpeakTurn(
        prompt: 'They ask where you are from.',
        expected: 'Είμαι από την Αθήνα.',
      ),
      SpeakTurn(prompt: 'You ask their age.', expected: 'Πόσων χρονών είσαι;'),
      SpeakTurn(
        prompt: 'They ask your age.',
        expected: 'Είμαι είκοσι πέντε χρονών.',
      ),
    ],
  ),
  Scenario(
    id: 'el_shopping',
    lang: LearnLang.el,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Alışveriş', UiLang.en: 'Shopping'},
    clipLine: 'Πόσο κάνει αυτό;',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Yunancada isimden önceki artikel ve isimle uyuşan sıfat, '
            'ismin cinsiyetine (eril ο, dişil η, nötr το) göre değişir.',
        UiLang.en:
            'In Greek, the article before a noun and any agreeing '
            'adjective change with the noun\'s grammatical gender '
            '(masculine ο, feminine η, neuter το).',
      },
      goodExample: 'Έχετε άλλο χρώμα;',
      badExample: 'Έχετε άλλος χρώμα;',
    ),
    phrases: [
      Phrase(
        id: 'el_shopping_0',
        target: 'Πόσο κάνει αυτό;',
        gloss: {UiLang.tr: 'Bu ne kadar?', UiLang.en: 'How much is this?'},
      ),
      Phrase(
        id: 'el_shopping_1',
        target: 'Είναι πολύ ακριβό.',
        gloss: {UiLang.tr: 'Çok pahalı.', UiLang.en: 'That is too expensive.'},
      ),
      Phrase(
        id: 'el_shopping_2',
        target: 'Υπάρχει έκπτωση;',
        gloss: {UiLang.tr: 'İndirim var mı?', UiLang.en: 'Is there a discount?'},
      ),
      Phrase(
        id: 'el_shopping_3',
        target: 'Θα το πάρω αυτό.',
        gloss: {UiLang.tr: 'Bunu alıyorum.', UiLang.en: 'I will take this.'},
      ),
      Phrase(
        id: 'el_shopping_4',
        target: 'Μπορώ να πληρώσω με κάρτα;',
        gloss: {
          UiLang.tr: 'Kart ile ödeyebilir miyim?',
          UiLang.en: 'Can I pay by card?',
        },
      ),
      Phrase(
        id: 'el_shopping_5',
        target: 'Έχετε άλλο χρώμα;',
        gloss: {
          UiLang.tr: 'Başka bir renk var mı?',
          UiLang.en: 'Do you have another color?',
        },
      ),
      Phrase(
        id: 'el_shopping_6',
        target: 'Μου δίνετε την απόδειξη;',
        gloss: {
          UiLang.tr: 'Fişimi alabilir miyim?',
          UiLang.en: 'Can I get the receipt?',
        },
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'You point at an item.', expected: 'Πόσο κάνει αυτό;'),
      SpeakTurn(prompt: 'The price is high.', expected: 'Είναι πολύ ακριβό.'),
      SpeakTurn(
        prompt: 'You want a lower price.',
        expected: 'Υπάρχει έκπτωση;',
      ),
      SpeakTurn(prompt: 'You decide to buy it.', expected: 'Θα το πάρω αυτό.'),
      SpeakTurn(
        prompt: 'You reach for your wallet.',
        expected: 'Μπορώ να πληρώσω με κάρτα;',
      ),
      SpeakTurn(
        prompt: 'You do not like the color.',
        expected: 'Έχετε άλλο χρώμα;',
      ),
      SpeakTurn(
        prompt: 'The purchase is done.',
        expected: 'Μου δίνετε την απόδειξη;',
      ),
    ],
  ),
  Scenario(
    id: 'el_numbers_time',
    lang: LearnLang.el,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Sayılar ve saat', UiLang.en: 'Numbers & time'},
    clipLine: 'Τι ώρα είναι;',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Yunancada 1, 3 ve 4 sayıları, önündeki ismin cinsiyetine '
            'göre değişir: "τρεις ώρες" (dişil ισim) ama "τρία λεπτά" '
            '(nötr isim).',
        UiLang.en:
            'The Greek numbers 1, 3 and 4 change form to match the '
            'gender of the noun they count: "τρεις ώρες" (feminine noun) '
            'but "τρία λεπτά" (neuter noun).',
      },
      goodExample: 'Είναι τρεις η ώρα.',
      badExample: 'Είναι τρία η ώρα.',
    ),
    phrases: [
      Phrase(
        id: 'el_numbers_time_0',
        target: 'Τι ώρα είναι;',
        gloss: {UiLang.tr: 'Saat kaç?', UiLang.en: 'What time is it?'},
      ),
      Phrase(
        id: 'el_numbers_time_1',
        target: 'Είναι τρεις η ώρα.',
        gloss: {UiLang.tr: 'Saat üç.', UiLang.en: 'It is three o\'clock.'},
      ),
      Phrase(
        id: 'el_numbers_time_2',
        target: 'Είναι εννιά και δέκα.',
        gloss: {
          UiLang.tr: 'Saat dokuzu on geçiyor.',
          UiLang.en: 'It is ten past nine.',
        },
      ),
      Phrase(
        id: 'el_numbers_time_3',
        target: 'Η συνάντησή μας είναι στις πέντε.',
        gloss: {
          UiLang.tr: 'Buluşmamız saat beşte.',
          UiLang.en: 'Our meeting is at five.',
        },
      ),
      Phrase(
        id: 'el_numbers_time_4',
        target: 'Ένα, δύο, τρία, τέσσερα, πέντε.',
        gloss: {
          UiLang.tr: 'Bir, iki, üç, dört, beş.',
          UiLang.en: 'One, two, three, four, five.',
        },
      ),
      Phrase(
        id: 'el_numbers_time_5',
        target: 'Έρχομαι σε μισή ώρα.',
        gloss: {
          UiLang.tr: 'Yarım saat sonra geliyorum.',
          UiLang.en: 'I am coming in half an hour.',
        },
      ),
      Phrase(
        id: 'el_numbers_time_6',
        target: 'Τι ημερομηνία είναι σήμερα;',
        gloss: {
          UiLang.tr: 'Bugün ayın kaçı?',
          UiLang.en: 'What is today\'s date?',
        },
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'You ask the time.', expected: 'Τι ώρα είναι;'),
      SpeakTurn(prompt: 'A clock shows 3:00.', expected: 'Είναι τρεις η ώρα.'),
      SpeakTurn(
        prompt: 'A clock shows 9:10.',
        expected: 'Είναι εννιά και δέκα.',
      ),
      SpeakTurn(
        prompt: 'You confirm a meeting time.',
        expected: 'Η συνάντησή μας είναι στις πέντε.',
      ),
      SpeakTurn(
        prompt: 'You count along with a child.',
        expected: 'Ένα, δύο, τρία, τέσσερα, πέντε.',
      ),
      SpeakTurn(
        prompt: 'You are running late.',
        expected: 'Έρχομαι σε μισή ώρα.',
      ),
      SpeakTurn(
        prompt: 'You ask today\'s date.',
        expected: 'Τι ημερομηνία είναι σήμερα;',
      ),
    ],
  ),
  Scenario(
    id: 'el_family',
    lang: LearnLang.el,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Aile', UiLang.en: 'Family'},
    clipLine: 'Αυτή είναι η μητέρα μου.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'İyelik zamiri μου (benim) isimden SONRA gelir; isimden önceki '
            'artikel (ο/η/το) yine ismin cinsiyetine göre değişmeden '
            'kalır.',
        UiLang.en:
            'The possessive pronoun μου (my) is placed AFTER the noun; '
            'the article before the noun (ο/η/το) still agrees with the '
            'noun\'s gender as usual.',
      },
      goodExample: 'Ο πατέρας μου είναι δάσκαλος.',
      badExample: 'Μου πατέρας είναι δάσκαλος.',
    ),
    phrases: [
      Phrase(
        id: 'el_family_0',
        target: 'Αυτή είναι η μητέρα μου.',
        gloss: {UiLang.tr: 'Bu benim annem.', UiLang.en: 'This is my mother.'},
      ),
      Phrase(
        id: 'el_family_1',
        target: 'Ο πατέρας μου είναι δάσκαλος.',
        gloss: {
          UiLang.tr: 'Babam öğretmen.',
          UiLang.en: 'My father is a teacher.',
        },
      ),
      Phrase(
        id: 'el_family_2',
        target: 'Έχω μια αδερφή.',
        gloss: {UiLang.tr: 'Bir kız kardeşim var.', UiLang.en: 'I have a sister.'},
      ),
      Phrase(
        id: 'el_family_3',
        target: 'Δεν έχω αδερφό.',
        gloss: {
          UiLang.tr: 'Erkek kardeşim yok.',
          UiLang.en: 'I do not have a brother.',
        },
      ),
      Phrase(
        id: 'el_family_4',
        target: 'Η γιαγιά μου ζει μαζί μας.',
        gloss: {
          UiLang.tr: 'Büyükannem bizimle yaşıyor.',
          UiLang.en: 'My grandmother lives with us.',
        },
      ),
      Phrase(
        id: 'el_family_5',
        target: 'Η οικογένειά μου είναι μεγάλη.',
        gloss: {UiLang.tr: 'Ailem kalabalık.', UiLang.en: 'My family is big.'},
      ),
      Phrase(
        id: 'el_family_6',
        target: 'Πόσα αδέρφια έχεις;',
        gloss: {
          UiLang.tr: 'Kaç kardeşin var?',
          UiLang.en: 'How many siblings do you have?',
        },
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'You show a photo.', expected: 'Αυτή είναι η μητέρα μου.'),
      SpeakTurn(
        prompt: 'They ask about your father.',
        expected: 'Ο πατέρας μου είναι δάσκαλος.',
      ),
      SpeakTurn(
        prompt: 'They ask about siblings.',
        expected: 'Έχω μια αδερφή.',
      ),
      SpeakTurn(
        prompt: 'They ask about a brother.',
        expected: 'Δεν έχω αδερφό.',
      ),
      SpeakTurn(
        prompt: 'They ask who lives with you.',
        expected: 'Η γιαγιά μου ζει μαζί μας.',
      ),
      SpeakTurn(
        prompt: 'They ask about your family size.',
        expected: 'Η οικογένειά μου είναι μεγάλη.',
      ),
      SpeakTurn(
        prompt: 'You ask about their family.',
        expected: 'Πόσα αδέρφια έχεις;',
      ),
    ],
  ),
  Scenario(
    id: 'el_weather',
    lang: LearnLang.el,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Hava durumu', UiLang.en: 'Weather'},
    clipLine: 'Σήμερα ο καιρός είναι πολύ ωραίος.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Yunancada gelecek zaman, fiilden önce gelen ve hiç '
            'çekimlenmeyen θα parçacığı ile kurulur; fiil kişiye göre '
            'çekimlenir, θα değişmez.',
        UiLang.en:
            'Greek forms the future tense with the invariant particle θα '
            'placed before the verb; the verb itself is conjugated, but '
            'θα never changes.',
      },
      goodExample: 'Αύριο θα χιονίσει.',
      badExample: 'Αύριο χιονίσει θα.',
    ),
    phrases: [
      Phrase(
        id: 'el_weather_0',
        target: 'Σήμερα ο καιρός είναι πολύ ωραίος.',
        gloss: {
          UiLang.tr: 'Bugün hava çok güzel.',
          UiLang.en: 'The weather is very nice today.',
        },
      ),
      Phrase(
        id: 'el_weather_1',
        target: 'Έξω κάνει κρύο.',
        gloss: {UiLang.tr: 'Dışarısı soğuk.', UiLang.en: 'It is cold outside.'},
      ),
      Phrase(
        id: 'el_weather_2',
        target: 'Βρέχει.',
        gloss: {UiLang.tr: 'Yağmur yağıyor.', UiLang.en: 'It is raining.'},
      ),
      Phrase(
        id: 'el_weather_3',
        target: 'Αύριο θα χιονίσει.',
        gloss: {
          UiLang.tr: 'Yarın kar yağacak.',
          UiLang.en: 'It will snow tomorrow.',
        },
      ),
      Phrase(
        id: 'el_weather_4',
        target: 'Κάνει πολλή ζέστη.',
        gloss: {UiLang.tr: 'Hava çok sıcak.', UiLang.en: 'It is very hot.'},
      ),
      Phrase(
        id: 'el_weather_5',
        target: 'Πάρε την ομπρέλα σου.',
        gloss: {UiLang.tr: 'Şemsiyeni al.', UiLang.en: 'Take your umbrella.'},
      ),
      Phrase(
        id: 'el_weather_6',
        target: 'Ο ουρανός είναι συννεφιασμένος.',
        gloss: {UiLang.tr: 'Gökyüzü bulutlu.', UiLang.en: 'The sky is cloudy.'},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You look outside.',
        expected: 'Σήμερα ο καιρός είναι πολύ ωραίος.',
      ),
      SpeakTurn(prompt: 'You feel a chill.', expected: 'Έξω κάνει κρύο.'),
      SpeakTurn(prompt: 'Drops start falling.', expected: 'Βρέχει.'),
      SpeakTurn(
        prompt: 'You check tomorrow\'s forecast.',
        expected: 'Αύριο θα χιονίσει.',
      ),
      SpeakTurn(prompt: 'You wipe your forehead.', expected: 'Κάνει πολλή ζέστη.'),
      SpeakTurn(
        prompt: 'You warn a friend before they leave.',
        expected: 'Πάρε την ομπρέλα σου.',
      ),
      SpeakTurn(
        prompt: 'You look up at the sky.',
        expected: 'Ο ουρανός είναι συννεφιασμένος.',
      ),
    ],
  ),
  Scenario(
    id: 'el_transport',
    lang: LearnLang.el,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Ulaşım', UiLang.en: 'Transport'},
    clipLine: 'Πού είναι η στάση του λεωφορείου;',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Edat σε (-e/-de), önündeki artikelle kaynaşır: στο (nötr), '
            'στη(ν) (dişil), στο(ν) (eril) — seçim ismin cinsiyetine '
            'göre yapılır.',
        UiLang.en:
            'The preposition σε (to/at) fuses with the article that '
            'follows it: στο (neuter), στη(ν) (feminine), στο(ν) '
            '(masculine) — chosen by the noun\'s gender.',
      },
      goodExample: 'Αυτό το λεωφορείο πάει στο κέντρο;',
      badExample: 'Αυτό το λεωφορείο πάει στη κέντρο;',
    ),
    phrases: [
      Phrase(
        id: 'el_transport_0',
        target: 'Πού είναι η στάση του λεωφορείου;',
        gloss: {
          UiLang.tr: 'Otobüs durağı nerede?',
          UiLang.en: 'Where is the bus stop?',
        },
      ),
      Phrase(
        id: 'el_transport_1',
        target: 'Ένα εισιτήριο, παρακαλώ.',
        gloss: {UiLang.tr: 'Bir bilet lütfen.', UiLang.en: 'One ticket, please.'},
      ),
      Phrase(
        id: 'el_transport_2',
        target: 'Αυτό το λεωφορείο πάει στο κέντρο;',
        gloss: {
          UiLang.tr: 'Bu otobüs merkeze gidiyor mu?',
          UiLang.en: 'Does this bus go to the center?',
        },
      ),
      Phrase(
        id: 'el_transport_3',
        target: 'Κατεβαίνω στην επόμενη στάση.',
        gloss: {
          UiLang.tr: 'Bir sonraki durakta iniyorum.',
          UiLang.en: 'I am getting off at the next stop.',
        },
      ),
      Phrase(
        id: 'el_transport_4',
        target: 'Μπορείτε να καλέσετε ταξί;',
        gloss: {
          UiLang.tr: 'Taksi çağırabilir misiniz?',
          UiLang.en: 'Could you call a taxi?',
        },
      ),
      Phrase(
        id: 'el_transport_5',
        target: 'Πόση ώρα χρειάζεται για το αεροδρόμιο;',
        gloss: {
          UiLang.tr: 'Havalimanına ne kadar sürer?',
          UiLang.en: 'How long does it take to the airport?',
        },
      ),
      Phrase(
        id: 'el_transport_6',
        target: 'Ο σταθμός του μετρό είναι πολύ κοντά.',
        gloss: {
          UiLang.tr: 'Metro istasyonu çok yakın.',
          UiLang.en: 'The metro station is very close.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You need directions.',
        expected: 'Πού είναι η στάση του λεωφορείου;',
      ),
      SpeakTurn(
        prompt: 'At the ticket counter.',
        expected: 'Ένα εισιτήριο, παρακαλώ.',
      ),
      SpeakTurn(
        prompt: 'You are not sure of the route.',
        expected: 'Αυτό το λεωφορείο πάει στο κέντρο;',
      ),
      SpeakTurn(
        prompt: 'You want to signal the driver.',
        expected: 'Κατεβαίνω στην επόμενη στάση.',
      ),
      SpeakTurn(
        prompt: 'You need a ride.',
        expected: 'Μπορείτε να καλέσετε ταξί;',
      ),
      SpeakTurn(
        prompt: 'You ask about travel time.',
        expected: 'Πόση ώρα χρειάζεται για το αεροδρόμιο;',
      ),
      SpeakTurn(
        prompt: 'Someone asks about the metro.',
        expected: 'Ο σταθμός του μετρό είναι πολύ κοντά.',
      ),
    ],
  ),
  Scenario(
    id: 'el_emergency',
    lang: LearnLang.el,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Acil durum', UiLang.en: 'Emergency'},
    clipLine: 'Βοήθεια!',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            // TODO: native review
            'Bir yabancıya resmi/çoğul seslenirken emir kipi fiili -στε '
            'ile biter (καλέστε = arayın!); tanıdık birine söylenen '
            'tekil emir farklı bir ekle biter.',
        UiLang.en:
            // TODO: native review
            'When addressing a stranger formally, the imperative verb '
            'ends in -στε (καλέστε = call!); the informal singular '
            'imperative used with someone you know ends differently.',
      },
      goodExample: 'Καλέστε ασθενοφόρο!',
      badExample: 'Κάλεσε ασθενοφόρο!',
    ),
    phrases: [
      Phrase(
        id: 'el_emergency_0',
        target: 'Βοήθεια!',
        gloss: {UiLang.tr: 'Yardım edin!', UiLang.en: 'Help!'},
      ),
      Phrase(
        id: 'el_emergency_1',
        target: 'Καλέστε ασθενοφόρο!',
        gloss: {
          UiLang.tr: 'Ambulans çağırın!',
          UiLang.en: 'Call an ambulance!',
        },
      ),
      Phrase(
        id: 'el_emergency_2',
        target: 'Χάθηκα.',
        gloss: {UiLang.tr: 'Kayboldum.', UiLang.en: 'I am lost.'},
      ),
      Phrase(
        id: 'el_emergency_3',
        target: 'Μου έκλεψαν το πορτοφόλι.',
        gloss: {
          UiLang.tr: 'Cüzdanım çalındı.',
          UiLang.en: 'My wallet was stolen.',
        },
      ),
      Phrase(
        id: 'el_emergency_4',
        target: 'Πού είναι το πλησιέστερο νοσοκομείο;',
        gloss: {
          UiLang.tr: 'En yakın hastane nerede?',
          UiLang.en: 'Where is the nearest hospital?',
        },
      ),
      Phrase(
        id: 'el_emergency_5',
        target: 'Μπορείτε να καλέσετε την αστυνομία;',
        gloss: {
          UiLang.tr: 'Polis çağırır mısınız?',
          UiLang.en: 'Could you call the police?',
        },
      ),
      Phrase(
        id: 'el_emergency_6',
        target: 'Δεν αισθάνομαι καλά.',
        gloss: {UiLang.tr: 'İyi değilim.', UiLang.en: 'I do not feel well.'},
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'Something goes wrong.', expected: 'Βοήθεια!'),
      SpeakTurn(prompt: 'Someone is hurt.', expected: 'Καλέστε ασθενοφόρο!'),
      SpeakTurn(prompt: 'You cannot find your way.', expected: 'Χάθηκα.'),
      SpeakTurn(
        prompt: 'You notice your wallet is gone.',
        expected: 'Μου έκλεψαν το πορτοφόλι.',
      ),
      SpeakTurn(
        prompt: 'You need medical care.',
        expected: 'Πού είναι το πλησιέστερο νοσοκομείο;',
      ),
      SpeakTurn(
        prompt: 'You need the authorities.',
        expected: 'Μπορείτε να καλέσετε την αστυνομία;',
      ),
      SpeakTurn(prompt: 'You feel sick.', expected: 'Δεν αισθάνομαι καλά.'),
    ],
  ),
  Scenario(
    id: 'el_routine',
    lang: LearnLang.el,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Günlük rutin', UiLang.en: 'Daily routine'},
    clipLine: 'Κάθε πρωί ξυπνάω στις εφτά.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Yunancada "ben" özneli düzenli fiiller şimdiki zamanda -ω '
            'ile biter (τρώω = yerim, πηγαίνω = giderim).',
        UiLang.en:
            'Regular Greek verbs in the present tense end in -ω for the '
            '"I" form (τρώω = I eat, πηγαίνω = I go).',
      },
      goodExample: 'Τρώω πρωινό.',
      badExample: 'Τρώει πρωινό.',
    ),
    phrases: [
      Phrase(
        id: 'el_routine_0',
        target: 'Κάθε πρωί ξυπνάω στις εφτά.',
        gloss: {
          UiLang.tr: 'Her sabah yedide kalkarım.',
          UiLang.en: 'I wake up at seven every morning.',
        },
      ),
      Phrase(
        id: 'el_routine_1',
        target: 'Βουρτσίζω τα δόντια μου.',
        gloss: {
          UiLang.tr: 'Dişlerimi fırçalarım.',
          UiLang.en: 'I brush my teeth.',
        },
      ),
      Phrase(
        id: 'el_routine_2',
        target: 'Τρώω πρωινό.',
        gloss: {UiLang.tr: 'Kahvaltı yaparım.', UiLang.en: 'I eat breakfast.'},
      ),
      Phrase(
        id: 'el_routine_3',
        target: 'Πηγαίνω στη δουλειά με το λεωφορείο.',
        gloss: {
          UiLang.tr: 'İşe otobüsle giderim.',
          UiLang.en: 'I go to work by bus.',
        },
      ),
      Phrase(
        id: 'el_routine_4',
        target: 'Τρώω μεσημεριανό στις δώδεκα.',
        gloss: {
          UiLang.tr: 'Öğlen yemek yerim.',
          UiLang.en: 'I eat lunch at noon.',
        },
      ),
      Phrase(
        id: 'el_routine_5',
        target: 'Κάνω γυμναστική το βράδυ.',
        gloss: {
          UiLang.tr: 'Akşam spor yaparım.',
          UiLang.en: 'I exercise in the evening.',
        },
      ),
      Phrase(
        id: 'el_routine_6',
        target: 'Κοιμάμαι νωρίς το βράδυ.',
        gloss: {
          UiLang.tr: 'Gece erken yatarım.',
          UiLang.en: 'I go to bed early at night.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'They ask about your morning.',
        expected: 'Κάθε πρωί ξυπνάω στις εφτά.',
      ),
      SpeakTurn(
        prompt: 'Next step after waking up.',
        expected: 'Βουρτσίζω τα δόντια μου.',
      ),
      SpeakTurn(prompt: 'Before leaving home.', expected: 'Τρώω πρωινό.'),
      SpeakTurn(
        prompt: 'They ask how you commute.',
        expected: 'Πηγαίνω στη δουλειά με το λεωφορείο.',
      ),
      SpeakTurn(
        prompt: 'At midday.',
        expected: 'Τρώω μεσημεριανό στις δώδεκα.',
      ),
      SpeakTurn(
        prompt: 'They ask about your evening.',
        expected: 'Κάνω γυμναστική το βράδυ.',
      ),
      SpeakTurn(prompt: 'Before sleeping.', expected: 'Κοιμάμαι νωρίς το βράδυ.'),
    ],
  ),
  Scenario(
    id: 'el_past_story',
    lang: LearnLang.el,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Bir günü anlatmak', UiLang.en: 'Telling a story about your day'},
    clipLine: 'Χθες πήγα σινεμά.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Yunancada geçmiş zaman (aoristos) genellikle fiil kökünün '
            'değişmesiyle kurulur: πηγαίνω (giderim) → πήγα (gittim), '
            'βλέπω (görürüm) → είδα (gördüm).',
        UiLang.en:
            'Greek past tense (aorist) is usually formed with a changed '
            'verb stem: πηγαίνω (I go) → πήγα (I went), βλέπω (I see) → '
            'είδα (I saw).',
      },
      goodExample: 'Χθες πήγα σινεμά.',
      badExample: 'Χθες πηγαίνω σινεμά.',
    ),
    phrases: [
      Phrase(
        id: 'el_past_story_0',
        target: 'Χθες πήγα σινεμά.',
        gloss: {
          UiLang.tr: 'Dün sinemaya gittim.',
          UiLang.en: 'Yesterday I went to the cinema.',
        },
      ),
      Phrase(
        id: 'el_past_story_1',
        target: 'Είδα μια ωραία ταινία.',
        gloss: {
          UiLang.tr: 'Güzel bir film izledim.',
          UiLang.en: 'I watched a nice film.',
        },
      ),
      Phrase(
        id: 'el_past_story_2',
        target: 'Μετά συνάντησα τον φίλο μου.',
        gloss: {
          UiLang.tr: 'Sonra arkadaşımla buluştum.',
          UiLang.en: 'Then I met up with my friend.',
        },
      ),
      Phrase(
        id: 'el_past_story_3',
        target: 'Ήπιαμε έναν καφέ.',
        gloss: {UiLang.tr: 'Bir kahve içtik.', UiLang.en: 'We had a coffee.'},
      ),
      Phrase(
        id: 'el_past_story_4',
        target: 'Γύρισα σπίτι πολύ αργά.',
        gloss: {
          UiLang.tr: 'Çok geç eve döndüm.',
          UiLang.en: 'I got home very late.',
        },
      ),
      Phrase(
        id: 'el_past_story_5',
        target: 'Ήμουν κουρασμένος αλλά χαρούμενος.',
        gloss: {
          UiLang.tr: 'Yorgun ama mutluydum.',
          UiLang.en: 'I was tired but happy.',
        },
      ),
      Phrase(
        id: 'el_past_story_6',
        target: 'Ήταν μια υπέροχη μέρα.',
        gloss: {UiLang.tr: 'Harika bir gündü.', UiLang.en: 'It was a great day.'},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'They ask about yesterday.',
        expected: 'Χθες πήγα σινεμά.',
      ),
      SpeakTurn(
        prompt: 'They ask what you did there.',
        expected: 'Είδα μια ωραία ταινία.',
      ),
      SpeakTurn(
        prompt: 'They ask what happened next.',
        expected: 'Μετά συνάντησα τον φίλο μου.',
      ),
      SpeakTurn(
        prompt: 'They ask what you two did.',
        expected: 'Ήπιαμε έναν καφέ.',
      ),
      SpeakTurn(
        prompt: 'They ask when you got home.',
        expected: 'Γύρισα σπίτι πολύ αργά.',
      ),
      SpeakTurn(
        prompt: 'They ask how you felt.',
        expected: 'Ήμουν κουρασμένος αλλά χαρούμενος.',
      ),
      SpeakTurn(prompt: 'You sum up the day.', expected: 'Ήταν μια υπέροχη μέρα.'),
    ],
  ),

  // ===========================================================================
  // ČEŠTINA / ÇEKÇE (LearnLang.cs)
  // ===========================================================================
  Scenario(
    id: 'cs_intro',
    lang: LearnLang.cs,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Tanışma', UiLang.en: 'Meeting someone'},
    clipLine: 'Ahoj, jmenuji se Petr.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Edat z (-den/-dan) her zaman ismin GENİTİF (2. hal) '
            'çekimini gerektirir: Praha (yalın hal) → z Prahy (genitif).',
        UiLang.en:
            'The Czech preposition z (from) always requires the genitive '
            'case: Praha (basic form) → z Prahy (genitive).',
      },
      goodExample: 'Jsem z Prahy.',
      badExample: 'Jsem z Praha.',
    ),
    phrases: [
      Phrase(
        id: 'cs_intro_0',
        target: 'Ahoj, jmenuji se Petr.',
        gloss: {
          UiLang.tr: 'Merhaba, adım Petr.',
          UiLang.en: 'Hi, my name is Petr.',
        },
      ),
      Phrase(
        id: 'cs_intro_1',
        target: 'Těší mě.',
        gloss: {UiLang.tr: 'Memnun oldum.', UiLang.en: 'Nice to meet you.'},
      ),
      Phrase(
        id: 'cs_intro_2',
        target: 'Jak se jmenuješ?',
        gloss: {UiLang.tr: 'Adın ne?', UiLang.en: 'What is your name?'},
      ),
      Phrase(
        id: 'cs_intro_3',
        target: 'Odkud jsi?',
        gloss: {UiLang.tr: 'Nerelisin?', UiLang.en: 'Where are you from?'},
      ),
      Phrase(
        id: 'cs_intro_4',
        target: 'Jsem z Prahy.',
        gloss: {
          UiLang.tr: 'Prag\'danım.',
          UiLang.en: 'I am from Prague.',
        },
      ),
      Phrase(
        id: 'cs_intro_5',
        target: 'Kolik je ti let?',
        gloss: {UiLang.tr: 'Kaç yaşındasın?', UiLang.en: 'How old are you?'},
      ),
      Phrase(
        id: 'cs_intro_6',
        target: 'Je mi dvacet pět let.',
        gloss: {
          UiLang.tr: 'Yirmi beş yaşındayım.',
          UiLang.en: 'I am twenty-five years old.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You meet someone new.',
        expected: 'Ahoj, jmenuji se Petr.',
      ),
      SpeakTurn(prompt: 'They shake your hand.', expected: 'Těší mě.'),
      SpeakTurn(prompt: 'You ask their name.', expected: 'Jak se jmenuješ?'),
      SpeakTurn(
        prompt: 'You ask where they are from.',
        expected: 'Odkud jsi?',
      ),
      SpeakTurn(
        prompt: 'They ask where you are from.',
        expected: 'Jsem z Prahy.',
      ),
      SpeakTurn(prompt: 'You ask their age.', expected: 'Kolik je ti let?'),
      SpeakTurn(
        prompt: 'They ask your age.',
        expected: 'Je mi dvacet pět let.',
      ),
    ],
  ),
  Scenario(
    id: 'cs_shopping',
    lang: LearnLang.cs,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Alışveriş', UiLang.en: 'Shopping'},
    clipLine: 'Kolik to stojí?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Bir şeyi hangi araçla/aletle yaptığını belirtirken isim '
            'İNSTRUMENTAL (7. hal) halinde çekimlenir: karta (yalın hal) '
            '→ kartou (instrumental, "kart ile").',
        UiLang.en:
            'To say what you use to do something, the noun takes the '
            'instrumental case: karta (basic form) → kartou '
            '(instrumental, "by card").',
      },
      goodExample: 'Můžu platit kartou?',
      badExample: 'Můžu platit karta?',
    ),
    phrases: [
      Phrase(
        id: 'cs_shopping_0',
        target: 'Kolik to stojí?',
        gloss: {UiLang.tr: 'Bu ne kadar?', UiLang.en: 'How much does this cost?'},
      ),
      Phrase(
        id: 'cs_shopping_1',
        target: 'Je to moc drahé.',
        gloss: {UiLang.tr: 'Çok pahalı.', UiLang.en: 'It is too expensive.'},
      ),
      Phrase(
        id: 'cs_shopping_2',
        target: 'Máte slevu?',
        gloss: {UiLang.tr: 'İndirim var mı?', UiLang.en: 'Do you have a discount?'},
      ),
      Phrase(
        id: 'cs_shopping_3',
        target: 'Vezmu si tohle.',
        gloss: {UiLang.tr: 'Bunu alıyorum.', UiLang.en: 'I will take this.'},
      ),
      Phrase(
        id: 'cs_shopping_4',
        target: 'Můžu platit kartou?',
        gloss: {
          UiLang.tr: 'Kart ile ödeyebilir miyim?',
          UiLang.en: 'Can I pay by card?',
        },
      ),
      Phrase(
        id: 'cs_shopping_5',
        target: 'Máte jinou barvu?',
        gloss: {
          UiLang.tr: 'Başka bir renk var mı?',
          UiLang.en: 'Do you have another color?',
        },
      ),
      Phrase(
        id: 'cs_shopping_6',
        target: 'Můžu dostat účtenku?',
        gloss: {
          UiLang.tr: 'Fişimi alabilir miyim?',
          UiLang.en: 'Can I get a receipt?',
        },
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'You point at an item.', expected: 'Kolik to stojí?'),
      SpeakTurn(prompt: 'The price is high.', expected: 'Je to moc drahé.'),
      SpeakTurn(prompt: 'You want a lower price.', expected: 'Máte slevu?'),
      SpeakTurn(prompt: 'You decide to buy it.', expected: 'Vezmu si tohle.'),
      SpeakTurn(
        prompt: 'You reach for your wallet.',
        expected: 'Můžu platit kartou?',
      ),
      SpeakTurn(
        prompt: 'You do not like the color.',
        expected: 'Máte jinou barvu?',
      ),
      SpeakTurn(
        prompt: 'The purchase is done.',
        expected: 'Můžu dostat účtenku?',
      ),
    ],
  ),
  Scenario(
    id: 'cs_numbers_time',
    lang: LearnLang.cs,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Sayılar ve saat', UiLang.en: 'Numbers & time'},
    clipLine: 'Kolik je hodin?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Sayı 5 ve üzeri kullanıldığında isim çoğul GENİTİF halinde '
            'olur (pět hodin); ama 2, 3, 4 sayılarından sonra normal '
            'çoğul (nominatif) kullanılır (tři hodiny).',
        UiLang.en:
            'With numbers 5 and above, the noun takes the genitive '
            'plural (pět hodin = five o\'clock); with 2, 3 or 4 it takes '
            'the ordinary nominative plural (tři hodiny = three o\'clock).',
      },
      goodExample: 'Kolik je hodin?',
      badExample: 'Kolik je hodiny?',
    ),
    phrases: [
      Phrase(
        id: 'cs_numbers_time_0',
        target: 'Kolik je hodin?',
        gloss: {UiLang.tr: 'Saat kaç?', UiLang.en: 'What time is it?'},
      ),
      Phrase(
        id: 'cs_numbers_time_1',
        target: 'Jsou tři hodiny.',
        gloss: {UiLang.tr: 'Saat üç.', UiLang.en: 'It is three o\'clock.'},
      ),
      Phrase(
        id: 'cs_numbers_time_2',
        target: 'Je devět deset.',
        gloss: {
          UiLang.tr: 'Saat dokuzu on geçiyor.',
          UiLang.en: 'It is nine ten.',
        },
      ),
      Phrase(
        id: 'cs_numbers_time_3',
        target: 'Naše schůzka je v pět hodin.',
        gloss: {
          UiLang.tr: 'Buluşmamız saat beşte.',
          UiLang.en: 'Our meeting is at five.',
        },
      ),
      Phrase(
        id: 'cs_numbers_time_4',
        target: 'Jedna, dva, tři, čtyři, pět.',
        gloss: {
          UiLang.tr: 'Bir, iki, üç, dört, beş.',
          UiLang.en: 'One, two, three, four, five.',
        },
      ),
      Phrase(
        id: 'cs_numbers_time_5',
        target: 'Přijdu za půl hodiny.',
        gloss: {
          UiLang.tr: 'Yarım saat sonra geliyorum.',
          UiLang.en: 'I am coming in half an hour.',
        },
      ),
      Phrase(
        id: 'cs_numbers_time_6',
        target: 'Kolikátého je dnes?',
        gloss: {
          UiLang.tr: 'Bugün ayın kaçı?',
          UiLang.en: 'What is today\'s date?',
        },
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'You ask the time.', expected: 'Kolik je hodin?'),
      SpeakTurn(prompt: 'A clock shows 3:00.', expected: 'Jsou tři hodiny.'),
      SpeakTurn(prompt: 'A clock shows 9:10.', expected: 'Je devět deset.'),
      SpeakTurn(
        prompt: 'You confirm a meeting time.',
        expected: 'Naše schůzka je v pět hodin.',
      ),
      SpeakTurn(
        prompt: 'You count along with a child.',
        expected: 'Jedna, dva, tři, čtyři, pět.',
      ),
      SpeakTurn(
        prompt: 'You are running late.',
        expected: 'Přijdu za půl hodiny.',
      ),
      SpeakTurn(
        prompt: 'You ask today\'s date.',
        expected: 'Kolikátého je dnes?',
      ),
    ],
  ),
  Scenario(
    id: 'cs_family',
    lang: LearnLang.cs,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Aile', UiLang.en: 'Family'},
    clipLine: 'To je moje maminka.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Eril canlı (animate) isimlerde tekil accusative hali '
            'genitif ile aynı ekle biter: bratr (yalın hal) → bratra '
            '(accusative/genitif); cansız eril isimlerde ise accusative '
            'nominatifle aynı kalır.',
        UiLang.en:
            'For masculine animate nouns, the singular accusative takes '
            'the same ending as the genitive: bratr (basic form) → '
            'bratra (accusative); masculine inanimate nouns keep the '
            'accusative the same as the nominative.',
      },
      goodExample: 'Nemám bratra.',
      badExample: 'Nemám bratr.',
    ),
    phrases: [
      Phrase(
        id: 'cs_family_0',
        target: 'To je moje maminka.',
        gloss: {UiLang.tr: 'Bu benim annem.', UiLang.en: 'This is my mom.'},
      ),
      Phrase(
        id: 'cs_family_1',
        target: 'Můj táta je učitel.',
        gloss: {
          UiLang.tr: 'Babam öğretmen.',
          UiLang.en: 'My dad is a teacher.',
        },
      ),
      Phrase(
        id: 'cs_family_2',
        target: 'Mám sestru.',
        gloss: {UiLang.tr: 'Bir kız kardeşim var.', UiLang.en: 'I have a sister.'},
      ),
      Phrase(
        id: 'cs_family_3',
        target: 'Nemám bratra.',
        gloss: {
          UiLang.tr: 'Erkek kardeşim yok.',
          UiLang.en: 'I do not have a brother.',
        },
      ),
      Phrase(
        id: 'cs_family_4',
        target: 'Moje babička bydlí s námi.',
        gloss: {
          UiLang.tr: 'Büyükannem bizimle yaşıyor.',
          UiLang.en: 'My grandmother lives with us.',
        },
      ),
      Phrase(
        id: 'cs_family_5',
        target: 'Moje rodina je velká.',
        gloss: {UiLang.tr: 'Ailem kalabalık.', UiLang.en: 'My family is big.'},
      ),
      Phrase(
        id: 'cs_family_6',
        target: 'Kolik máš sourozenců?',
        gloss: {
          UiLang.tr: 'Kaç kardeşin var?',
          UiLang.en: 'How many siblings do you have?',
        },
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'You show a photo.', expected: 'To je moje maminka.'),
      SpeakTurn(
        prompt: 'They ask about your father.',
        expected: 'Můj táta je učitel.',
      ),
      SpeakTurn(prompt: 'They ask about siblings.', expected: 'Mám sestru.'),
      SpeakTurn(
        prompt: 'They ask about a brother.',
        expected: 'Nemám bratra.',
      ),
      SpeakTurn(
        prompt: 'They ask who lives with you.',
        expected: 'Moje babička bydlí s námi.',
      ),
      SpeakTurn(
        prompt: 'They ask about your family size.',
        expected: 'Moje rodina je velká.',
      ),
      SpeakTurn(
        prompt: 'You ask about their family.',
        expected: 'Kolik máš sourozenců?',
      ),
    ],
  ),
  Scenario(
    id: 'cs_weather',
    lang: LearnLang.cs,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Hava durumu', UiLang.en: 'Weather'},
    clipLine: 'Dnes je venku hezky.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Hava durumu fiilleri (pršet, sněžit) öznesiz, sadece 3. '
            'tekil şahıs formunda kullanılır — İngilizcedeki gibi bir '
            '"it" özne zamiri eklenmez.',
        UiLang.en:
            'Czech weather verbs (pršet, sněžit) are used without a '
            'subject, only in the 3rd person singular form — no dummy '
            '"it" pronoun is added, unlike in English.',
      },
      goodExample: 'Prší.',
      badExample: 'Ono prší.',
    ),
    phrases: [
      Phrase(
        id: 'cs_weather_0',
        target: 'Dnes je venku hezky.',
        gloss: {
          UiLang.tr: 'Bugün dışarısı çok güzel.',
          UiLang.en: 'It is nice outside today.',
        },
      ),
      Phrase(
        id: 'cs_weather_1',
        target: 'Venku je zima.',
        gloss: {UiLang.tr: 'Dışarısı soğuk.', UiLang.en: 'It is cold outside.'},
      ),
      Phrase(
        id: 'cs_weather_2',
        target: 'Prší.',
        gloss: {UiLang.tr: 'Yağmur yağıyor.', UiLang.en: 'It is raining.'},
      ),
      Phrase(
        id: 'cs_weather_3',
        target: 'Zítra bude sněžit.',
        gloss: {
          UiLang.tr: 'Yarın kar yağacak.',
          UiLang.en: 'It will snow tomorrow.',
        },
      ),
      Phrase(
        id: 'cs_weather_4',
        target: 'Je hrozné horko.',
        gloss: {UiLang.tr: 'Hava çok sıcak.', UiLang.en: 'It is terribly hot.'},
      ),
      Phrase(
        id: 'cs_weather_5',
        target: 'Vezmi si deštník.',
        gloss: {UiLang.tr: 'Şemsiyeni al.', UiLang.en: 'Take your umbrella.'},
      ),
      Phrase(
        id: 'cs_weather_6',
        target: 'Obloha je zatažená.',
        gloss: {UiLang.tr: 'Gökyüzü bulutlu.', UiLang.en: 'The sky is cloudy.'},
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'You look outside.', expected: 'Dnes je venku hezky.'),
      SpeakTurn(prompt: 'You feel a chill.', expected: 'Venku je zima.'),
      SpeakTurn(prompt: 'Drops start falling.', expected: 'Prší.'),
      SpeakTurn(
        prompt: 'You check tomorrow\'s forecast.',
        expected: 'Zítra bude sněžit.',
      ),
      SpeakTurn(prompt: 'You wipe your forehead.', expected: 'Je hrozné horko.'),
      SpeakTurn(
        prompt: 'You warn a friend before they leave.',
        expected: 'Vezmi si deštník.',
      ),
      SpeakTurn(prompt: 'You look up at the sky.', expected: 'Obloha je zatažená.'),
    ],
  ),
  Scenario(
    id: 'cs_transport',
    lang: LearnLang.cs,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Ulaşım', UiLang.en: 'Transport'},
    clipLine: 'Kde je autobusová zastávka?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Edat do (-e doğru/içine) her zaman GENİTİF hali gerektirir: '
            'centrum (yalın hal) → do centra (genitif).',
        UiLang.en:
            'The Czech preposition do (to/into) always requires the '
            'genitive case: centrum (basic form) → do centra (genitive).',
      },
      goodExample: 'Jede tenhle autobus do centra?',
      badExample: 'Jede tenhle autobus do centrum?',
    ),
    phrases: [
      Phrase(
        id: 'cs_transport_0',
        target: 'Kde je autobusová zastávka?',
        gloss: {
          UiLang.tr: 'Otobüs durağı nerede?',
          UiLang.en: 'Where is the bus stop?',
        },
      ),
      Phrase(
        id: 'cs_transport_1',
        target: 'Jednu jízdenku, prosím.',
        gloss: {UiLang.tr: 'Bir bilet lütfen.', UiLang.en: 'One ticket, please.'},
      ),
      Phrase(
        id: 'cs_transport_2',
        target: 'Jede tenhle autobus do centra?',
        gloss: {
          UiLang.tr: 'Bu otobüs merkeze gidiyor mu?',
          UiLang.en: 'Does this bus go to the center?',
        },
      ),
      Phrase(
        id: 'cs_transport_3',
        target: 'Vystupuji na příští zastávce.',
        gloss: {
          UiLang.tr: 'Bir sonraki durakta iniyorum.',
          UiLang.en: 'I am getting off at the next stop.',
        },
      ),
      Phrase(
        id: 'cs_transport_4',
        target: 'Můžete zavolat taxi?',
        gloss: {
          UiLang.tr: 'Taksi çağırabilir misiniz?',
          UiLang.en: 'Could you call a taxi?',
        },
      ),
      Phrase(
        id: 'cs_transport_5',
        target: 'Jak dlouho to trvá na letiště?',
        gloss: {
          UiLang.tr: 'Havalimanına ne kadar sürer?',
          UiLang.en: 'How long does it take to the airport?',
        },
      ),
      Phrase(
        id: 'cs_transport_6',
        target: 'Stanice metra je velmi blízko.',
        gloss: {
          UiLang.tr: 'Metro istasyonu çok yakın.',
          UiLang.en: 'The metro station is very close.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You need directions.',
        expected: 'Kde je autobusová zastávka?',
      ),
      SpeakTurn(
        prompt: 'At the ticket counter.',
        expected: 'Jednu jízdenku, prosím.',
      ),
      SpeakTurn(
        prompt: 'You are not sure of the route.',
        expected: 'Jede tenhle autobus do centra?',
      ),
      SpeakTurn(
        prompt: 'You want to signal the driver.',
        expected: 'Vystupuji na příští zastávce.',
      ),
      SpeakTurn(prompt: 'You need a ride.', expected: 'Můžete zavolat taxi?'),
      SpeakTurn(
        prompt: 'You ask about travel time.',
        expected: 'Jak dlouho to trvá na letiště?',
      ),
      SpeakTurn(
        prompt: 'Someone asks about the metro.',
        expected: 'Stanice metra je velmi blízko.',
      ),
    ],
  ),
  Scenario(
    id: 'cs_emergency',
    lang: LearnLang.cs,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Acil durum', UiLang.en: 'Emergency'},
    clipLine: 'Pomoc!',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            // TODO: native review
            'Geçmiş zaman (l-participle) fiili, öznenin cinsiyetine göre '
            'değişir: erkek konuşan "ztratil jsem se" der, kadın '
            'konuşan "ztratila jsem se" der.',
        UiLang.en:
            // TODO: native review
            'The Czech past-tense (l-participle) verb agrees with the '
            'speaker\'s gender: a male speaker says "ztratil jsem se", a '
            'female speaker says "ztratila jsem se".',
      },
      goodExample: 'Ztratila jsem se.',
      badExample: 'Ztratil jsem se.',
    ),
    phrases: [
      Phrase(
        id: 'cs_emergency_0',
        target: 'Pomoc!',
        gloss: {UiLang.tr: 'Yardım edin!', UiLang.en: 'Help!'},
      ),
      Phrase(
        id: 'cs_emergency_1',
        target: 'Zavolejte sanitku!',
        gloss: {
          UiLang.tr: 'Ambulans çağırın!',
          UiLang.en: 'Call an ambulance!',
        },
      ),
      Phrase(
        id: 'cs_emergency_2',
        target: 'Ztratil jsem se.',
        gloss: {UiLang.tr: 'Kayboldum.', UiLang.en: 'I am lost.'},
      ),
      Phrase(
        id: 'cs_emergency_3',
        target: 'Ukradli mi peněženku.',
        gloss: {
          UiLang.tr: 'Cüzdanım çalındı.',
          UiLang.en: 'My wallet was stolen.',
        },
      ),
      Phrase(
        id: 'cs_emergency_4',
        target: 'Kde je nejbližší nemocnice?',
        gloss: {
          UiLang.tr: 'En yakın hastane nerede?',
          UiLang.en: 'Where is the nearest hospital?',
        },
      ),
      Phrase(
        id: 'cs_emergency_5',
        target: 'Můžete zavolat policii?',
        gloss: {
          UiLang.tr: 'Polis çağırır mısınız?',
          UiLang.en: 'Could you call the police?',
        },
      ),
      Phrase(
        id: 'cs_emergency_6',
        target: 'Necítím se dobře.',
        gloss: {UiLang.tr: 'İyi değilim.', UiLang.en: 'I do not feel well.'},
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'Something goes wrong.', expected: 'Pomoc!'),
      SpeakTurn(prompt: 'Someone is hurt.', expected: 'Zavolejte sanitku!'),
      SpeakTurn(
        prompt: 'You cannot find your way.',
        expected: 'Ztratil jsem se.',
      ),
      SpeakTurn(
        prompt: 'You notice your wallet is gone.',
        expected: 'Ukradli mi peněženku.',
      ),
      SpeakTurn(
        prompt: 'You need medical care.',
        expected: 'Kde je nejbližší nemocnice?',
      ),
      SpeakTurn(
        prompt: 'You need the authorities.',
        expected: 'Můžete zavolat policii?',
      ),
      SpeakTurn(prompt: 'You feel sick.', expected: 'Necítím se dobře.'),
    ],
  ),
  Scenario(
    id: 'cs_routine',
    lang: LearnLang.cs,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Günlük rutin', UiLang.en: 'Daily routine'},
    clipLine: 'Každé ráno vstávám v sedm.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Düzenli -at fiilleri şimdiki zamanda "ben" formunda -ám ile '
            'biter (vstávat → vstávám); -it fiilleri ise -ím ile biter '
            '(cvičit → cvičím).',
        UiLang.en:
            'Regular -at verbs end in -ám for the "I" form in the '
            'present tense (vstávat → vstávám); -it verbs end in -ím '
            '(cvičit → cvičím).',
      },
      goodExample: 'Každé ráno vstávám v sedm.',
      badExample: 'Každé ráno vstávat v sedm.',
    ),
    phrases: [
      Phrase(
        id: 'cs_routine_0',
        target: 'Každé ráno vstávám v sedm.',
        gloss: {
          UiLang.tr: 'Her sabah yedide kalkarım.',
          UiLang.en: 'I get up at seven every morning.',
        },
      ),
      Phrase(
        id: 'cs_routine_1',
        target: 'Čistím si zuby.',
        gloss: {
          UiLang.tr: 'Dişlerimi fırçalarım.',
          UiLang.en: 'I brush my teeth.',
        },
      ),
      Phrase(
        id: 'cs_routine_2',
        target: 'Snídám.',
        gloss: {UiLang.tr: 'Kahvaltı yaparım.', UiLang.en: 'I have breakfast.'},
      ),
      Phrase(
        id: 'cs_routine_3',
        target: 'Jezdím do práce autobusem.',
        gloss: {
          UiLang.tr: 'İşe otobüsle giderim.',
          UiLang.en: 'I go to work by bus.',
        },
      ),
      Phrase(
        id: 'cs_routine_4',
        target: 'V poledne obědvám.',
        gloss: {
          UiLang.tr: 'Öğlen yemek yerim.',
          UiLang.en: 'I have lunch at noon.',
        },
      ),
      Phrase(
        id: 'cs_routine_5',
        target: 'Večer cvičím.',
        gloss: {
          UiLang.tr: 'Akşam spor yaparım.',
          UiLang.en: 'I exercise in the evening.',
        },
      ),
      Phrase(
        id: 'cs_routine_6',
        target: 'V noci chodím brzy spát.',
        gloss: {
          UiLang.tr: 'Gece erken yatarım.',
          UiLang.en: 'I go to bed early at night.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'They ask about your morning.',
        expected: 'Každé ráno vstávám v sedm.',
      ),
      SpeakTurn(
        prompt: 'Next step after waking up.',
        expected: 'Čistím si zuby.',
      ),
      SpeakTurn(prompt: 'Before leaving home.', expected: 'Snídám.'),
      SpeakTurn(
        prompt: 'They ask how you commute.',
        expected: 'Jezdím do práce autobusem.',
      ),
      SpeakTurn(prompt: 'At midday.', expected: 'V poledne obědvám.'),
      SpeakTurn(
        prompt: 'They ask about your evening.',
        expected: 'Večer cvičím.',
      ),
      SpeakTurn(prompt: 'Before sleeping.', expected: 'V noci chodím brzy spát.'),
    ],
  ),
  Scenario(
    id: 'cs_past_story',
    lang: LearnLang.cs,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Bir günü anlatmak', UiLang.en: 'Telling a story about your day'},
    clipLine: 'Včera jsem šel do kina.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            // TODO: native review — l-participle cinsiyet uyumu (erkek
            // konuşan "šel", kadın konuşan "šla" der) doğal konuşmada
            // önemli, ama ünitedeki cümleler eril form üzerinden yazıldı.
            'Geçmiş zaman, değişmeyen jsem/jsi gibi yardımcı fiil ile '
            'kurulur ve bu yardımcı fiil cümlede genelde İKİNCİ konumda '
            '(klitik) yer alır, başta değil.',
        UiLang.en:
            // TODO: native review — the l-participle also agrees with
            // the speaker's gender ("šel" for a man, "šla" for a woman);
            // the sentences here use the masculine form throughout.
            'The past tense is formed with the clitic auxiliary '
            'jsem/jsi/etc., which normally sits in the SECOND position '
            'of the sentence, not the first.',
      },
      goodExample: 'Včera jsem šel do kina.',
      badExample: 'Jsem včera šel do kina.',
    ),
    phrases: [
      Phrase(
        id: 'cs_past_story_0',
        target: 'Včera jsem šel do kina.',
        gloss: {
          UiLang.tr: 'Dün sinemaya gittim.',
          UiLang.en: 'Yesterday I went to the cinema.',
        },
      ),
      Phrase(
        id: 'cs_past_story_1',
        target: 'Viděl jsem hezký film.',
        gloss: {
          UiLang.tr: 'Güzel bir film izledim.',
          UiLang.en: 'I watched a nice film.',
        },
      ),
      Phrase(
        id: 'cs_past_story_2',
        target: 'Pak jsem se setkal s kamarádem.',
        gloss: {
          UiLang.tr: 'Sonra arkadaşımla buluştum.',
          UiLang.en: 'Then I met up with my friend.',
        },
      ),
      Phrase(
        id: 'cs_past_story_3',
        target: 'Dali jsme si kávu.',
        gloss: {UiLang.tr: 'Bir kahve içtik.', UiLang.en: 'We had a coffee.'},
      ),
      Phrase(
        id: 'cs_past_story_4',
        target: 'Vrátil jsem se domů velmi pozdě.',
        gloss: {
          UiLang.tr: 'Çok geç eve döndüm.',
          UiLang.en: 'I got home very late.',
        },
      ),
      Phrase(
        id: 'cs_past_story_5',
        target: 'Byl jsem unavený, ale šťastný.',
        gloss: {
          UiLang.tr: 'Yorgun ama mutluydum.',
          UiLang.en: 'I was tired but happy.',
        },
      ),
      Phrase(
        id: 'cs_past_story_6',
        target: 'Byl to skvělý den.',
        gloss: {UiLang.tr: 'Harika bir gündü.', UiLang.en: 'It was a great day.'},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'They ask about yesterday.',
        expected: 'Včera jsem šel do kina.',
      ),
      SpeakTurn(
        prompt: 'They ask what you did there.',
        expected: 'Viděl jsem hezký film.',
      ),
      SpeakTurn(
        prompt: 'They ask what happened next.',
        expected: 'Pak jsem se setkal s kamarádem.',
      ),
      SpeakTurn(
        prompt: 'They ask what you two did.',
        expected: 'Dali jsme si kávu.',
      ),
      SpeakTurn(
        prompt: 'They ask when you got home.',
        expected: 'Vrátil jsem se domů velmi pozdě.',
      ),
      SpeakTurn(
        prompt: 'They ask how you felt.',
        expected: 'Byl jsem unavený, ale šťastný.',
      ),
      SpeakTurn(prompt: 'You sum up the day.', expected: 'Byl to skvělý den.'),
    ],
  ),
];

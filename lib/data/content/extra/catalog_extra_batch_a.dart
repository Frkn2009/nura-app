// GENERATED — content batch A: EN / ES / PT, 9 missing A1 topics each.
// See docs/ICERIK_URETIM_BRIEFI.md for schema/tone rules. Not wired into
// Catalog yet — integration (import + _all list) happens centrally once all
// batches are delivered.
// ignore_for_file: lines_longer_than_80_chars

import '../../models/models.dart';

final List<Scenario> catalogExtraBatchA = [
  // ===================== ENGLISH =====================
  Scenario(
    id: 'en_intro',
    lang: LearnLang.en,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Tanışma', UiLang.en: 'Meeting someone'},
    clipLine: 'Nice to meet you.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            '"to be" fiili özneye göre değişir: I am, you/we/they are, he/she/it is.',
        UiLang.en:
            'The verb "to be" agrees with its subject: I am, you/we/they are, he/she/it is.',
      },
      goodExample: 'She is a teacher.',
      badExample: 'She are a teacher.',
    ),
    phrases: [
      Phrase(
        id: 'en_intro_0',
        target: 'Nice to meet you.',
        gloss: {
          UiLang.tr: 'Tanıştığımıza memnun oldum.',
          UiLang.en: 'Nice to meet you.',
        },
      ),
      Phrase(
        id: 'en_intro_1',
        target: "What's your name?",
        gloss: {UiLang.tr: 'Adın ne?', UiLang.en: "What's your name?"},
      ),
      Phrase(
        id: 'en_intro_2',
        target: "I'm Alex, and you?",
        gloss: {UiLang.tr: 'Ben Alex, ya sen?', UiLang.en: "I'm Alex, and you?"},
      ),
      Phrase(
        id: 'en_intro_3',
        target: 'What do you do?',
        gloss: {UiLang.tr: 'Ne iş yapıyorsun?', UiLang.en: 'What do you do?'},
      ),
      Phrase(
        id: 'en_intro_4',
        target: "I'm a teacher.",
        gloss: {UiLang.tr: 'Öğretmenim.', UiLang.en: "I'm a teacher."},
      ),
      Phrase(
        id: 'en_intro_5',
        target: 'Can I have your number?',
        gloss: {
          UiLang.tr: 'Numaranı alabilir miyim?',
          UiLang.en: 'Can I have your number?',
        },
      ),
      Phrase(
        id: 'en_intro_6',
        target: 'See you soon!',
        gloss: {UiLang.tr: 'Yakında görüşürüz!', UiLang.en: 'See you soon!'},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You just met someone new.',
        expected: 'Nice to meet you.',
      ),
      SpeakTurn(
        prompt: 'You want to know their name.',
        expected: "What's your name?",
      ),
      SpeakTurn(
        prompt: 'They ask for your name.',
        expected: "I'm Alex, and you?",
      ),
      SpeakTurn(
        prompt: "You're curious about their job.",
        expected: 'What do you do?',
      ),
      SpeakTurn(prompt: 'They ask what you do.', expected: "I'm a teacher."),
      SpeakTurn(
        prompt: 'You want to stay in touch.',
        expected: 'Can I have your number?',
      ),
      SpeakTurn(prompt: "You're saying goodbye.", expected: 'See you soon!'),
    ],
  ),
  Scenario(
    id: 'en_shopping',
    lang: LearnLang.en,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Alışveriş', UiLang.en: 'Shopping'},
    clipLine: "I'm just looking, thanks.",
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Gösterme sıfatı çoğul isimle uyumlu olur: this/these, that/those.',
        UiLang.en:
            'Demonstratives agree with the noun\'s number: this/these, that/those.',
      },
      goodExample: 'How much are these shoes?',
      badExample: 'How much is these shoes?',
    ),
    phrases: [
      Phrase(
        id: 'en_shopping_0',
        target: "I'm just looking, thanks.",
        gloss: {
          UiLang.tr: 'Sadece bakıyorum, teşekkürler.',
          UiLang.en: "I'm just looking, thanks.",
        },
      ),
      Phrase(
        id: 'en_shopping_1',
        target: 'Do you have this in a size 40?',
        gloss: {
          UiLang.tr: 'Bunun 40 numarası var mı?',
          UiLang.en: 'Do you have this in a size 40?',
        },
      ),
      Phrase(
        id: 'en_shopping_2',
        target: 'Can I try it on?',
        gloss: {UiLang.tr: 'Deneyebilir miyim?', UiLang.en: 'Can I try it on?'},
      ),
      Phrase(
        id: 'en_shopping_3',
        target: 'How much are these shoes?',
        gloss: {
          UiLang.tr: 'Bu ayakkabılar ne kadar?',
          UiLang.en: 'How much are these shoes?',
        },
      ),
      Phrase(
        id: 'en_shopping_4',
        target: 'Do you take cards?',
        gloss: {UiLang.tr: 'Kart geçiyor mu?', UiLang.en: 'Do you take cards?'},
      ),
      Phrase(
        id: 'en_shopping_5',
        target: "It's too expensive.",
        gloss: {UiLang.tr: 'Çok pahalı.', UiLang.en: "It's too expensive."},
      ),
      Phrase(
        id: 'en_shopping_6',
        target: 'Do you have a smaller size?',
        gloss: {
          UiLang.tr: 'Daha küçük bedeniniz var mı?',
          UiLang.en: 'Do you have a smaller size?',
        },
      ),
      Phrase(
        id: 'en_shopping_7',
        target: "I'll take it.",
        gloss: {UiLang.tr: 'Bunu alıyorum.', UiLang.en: "I'll take it."},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'A clerk asks if you need help.',
        expected: "I'm just looking, thanks.",
      ),
      SpeakTurn(
        prompt: 'You found something you like.',
        expected: 'Do you have this in a size 40?',
      ),
      SpeakTurn(
        prompt: 'You want to test the fit.',
        expected: 'Can I try it on?',
      ),
      SpeakTurn(
        prompt: "You're checking the price.",
        expected: 'How much are these shoes?',
      ),
      SpeakTurn(
        prompt: "You're ready to pay.",
        expected: 'Do you take cards?',
      ),
      SpeakTurn(
        prompt: 'You think the price is high.',
        expected: "It's too expensive.",
      ),
      SpeakTurn(
        prompt: "It doesn't fit.",
        expected: 'Do you have a smaller size?',
      ),
      SpeakTurn(
        prompt: "You've decided to buy it.",
        expected: "I'll take it.",
      ),
    ],
  ),
  Scenario(
    id: 'en_numbers_time',
    lang: LearnLang.en,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Sayılar ve saat', UiLang.en: 'Numbers and time'},
    clipLine: 'What time is it?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: 'Belirli bir saat için "at" kullanılır, "in" değil.',
        UiLang.en: 'Use "at" for a specific clock time, not "in".',
      },
      goodExample: 'The train leaves at nine.',
      badExample: 'The train leaves in nine.',
    ),
    phrases: [
      Phrase(
        id: 'en_numbers_time_0',
        target: 'What time is it?',
        gloss: {UiLang.tr: 'Saat kaç?', UiLang.en: 'What time is it?'},
      ),
      Phrase(
        id: 'en_numbers_time_1',
        target: "It's half past three.",
        gloss: {UiLang.tr: 'Saat üç buçuk.', UiLang.en: "It's half past three."},
      ),
      Phrase(
        id: 'en_numbers_time_2',
        target: 'The train leaves at nine.',
        gloss: {
          UiLang.tr: 'Tren dokuzda kalkıyor.',
          UiLang.en: 'The train leaves at nine.',
        },
      ),
      Phrase(
        id: 'en_numbers_time_3',
        target: 'I have two tickets.',
        gloss: {UiLang.tr: 'İki biletim var.', UiLang.en: 'I have two tickets.'},
      ),
      Phrase(
        id: 'en_numbers_time_4',
        target: 'That will be twelve euros.',
        gloss: {
          UiLang.tr: 'On iki euro tutuyor.',
          UiLang.en: 'That will be twelve euros.',
        },
      ),
      Phrase(
        id: 'en_numbers_time_5',
        target: 'Can we meet at five?',
        gloss: {
          UiLang.tr: 'Beşte buluşabilir miyiz?',
          UiLang.en: 'Can we meet at five?',
        },
      ),
      Phrase(
        id: 'en_numbers_time_6',
        target: "I'll be there in ten minutes.",
        gloss: {
          UiLang.tr: 'On dakikaya orada olurum.',
          UiLang.en: "I'll be there in ten minutes.",
        },
      ),
    ],
    turns: [
      SpeakTurn(prompt: "You don't know the time.", expected: 'What time is it?'),
      SpeakTurn(
        prompt: 'Someone asks you the time.',
        expected: "It's half past three.",
      ),
      SpeakTurn(
        prompt: "You're checking the schedule.",
        expected: 'The train leaves at nine.',
      ),
      SpeakTurn(prompt: 'At the counter.', expected: 'I have two tickets.'),
      SpeakTurn(
        prompt: 'The clerk tells you the price.',
        expected: 'That will be twelve euros.',
      ),
      SpeakTurn(
        prompt: "You're planning to meet a friend.",
        expected: 'Can we meet at five?',
      ),
      SpeakTurn(
        prompt: "You're running a bit late.",
        expected: "I'll be there in ten minutes.",
      ),
    ],
  ),
  Scenario(
    id: 'en_family',
    lang: LearnLang.en,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Aile', UiLang.en: 'Family'},
    clipLine: 'This is my family.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            '"her" (kadın sahip) ve "his" (erkek sahip) sahip olunan şeyin değil, sahibinin cinsiyetine göre seçilir.',
        UiLang.en:
            '"her" (female owner) and "his" (male owner) match the owner\'s gender, not the thing owned.',
      },
      goodExample: 'She loves her brother.',
      badExample: 'She loves his brother.',
    ),
    phrases: [
      Phrase(
        id: 'en_family_0',
        target: 'This is my family.',
        gloss: {UiLang.tr: 'Bu benim ailem.', UiLang.en: 'This is my family.'},
      ),
      Phrase(
        id: 'en_family_1',
        target: 'I have two brothers and a sister.',
        gloss: {
          UiLang.tr: 'İki erkek kardeşim ve bir kız kardeşim var.',
          UiLang.en: 'I have two brothers and a sister.',
        },
      ),
      Phrase(
        id: 'en_family_2',
        target: 'My mother is a doctor.',
        gloss: {UiLang.tr: 'Annem doktor.', UiLang.en: 'My mother is a doctor.'},
      ),
      Phrase(
        id: 'en_family_3',
        target: 'She loves her brother a lot.',
        gloss: {
          UiLang.tr: 'Kardeşini çok seviyor.',
          UiLang.en: 'She loves her brother a lot.',
        },
      ),
      Phrase(
        id: 'en_family_4',
        target: 'How old is your daughter?',
        gloss: {
          UiLang.tr: 'Kızın kaç yaşında?',
          UiLang.en: 'How old is your daughter?',
        },
      ),
      Phrase(
        id: 'en_family_5',
        target: 'My parents live in Izmir.',
        gloss: {
          UiLang.tr: "Ailem İzmir'de yaşıyor.",
          UiLang.en: 'My parents live in Izmir.',
        },
      ),
      Phrase(
        id: 'en_family_6',
        target: 'Do you have children?',
        gloss: {UiLang.tr: 'Çocuğun var mı?', UiLang.en: 'Do you have children?'},
      ),
    ],
    turns: [
      SpeakTurn(prompt: "You're showing a photo.", expected: 'This is my family.'),
      SpeakTurn(
        prompt: 'Someone asks about your siblings.',
        expected: 'I have two brothers and a sister.',
      ),
      SpeakTurn(
        prompt: 'They ask what your mother does.',
        expected: 'My mother is a doctor.',
      ),
      SpeakTurn(
        prompt: "You're talking about your sister.",
        expected: 'She loves her brother a lot.',
      ),
      SpeakTurn(
        prompt: "You want to know a friend's daughter's age.",
        expected: 'How old is your daughter?',
      ),
      SpeakTurn(
        prompt: 'They ask where your parents live.',
        expected: 'My parents live in Izmir.',
      ),
      SpeakTurn(
        prompt: "You're asking a new friend.",
        expected: 'Do you have children?',
      ),
    ],
  ),
  Scenario(
    id: 'en_weather',
    lang: LearnLang.en,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Hava durumu', UiLang.en: 'Weather'},
    clipLine: "What's the weather like today?",
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Hava durumu cümleleri "it" öznesini gerektirir, atlanamaz.',
        UiLang.en:
            'Weather sentences need the dummy subject "it" — it can\'t be dropped.',
      },
      goodExample: "It's raining today.",
      badExample: 'Is raining today.',
    ),
    phrases: [
      Phrase(
        id: 'en_weather_0',
        target: "What's the weather like today?",
        gloss: {
          UiLang.tr: 'Bugün hava nasıl?',
          UiLang.en: "What's the weather like today?",
        },
      ),
      Phrase(
        id: 'en_weather_1',
        target: "It's raining today.",
        gloss: {
          UiLang.tr: 'Bugün yağmur yağıyor.',
          UiLang.en: "It's raining today.",
        },
      ),
      Phrase(
        id: 'en_weather_2',
        target: "It's really hot outside.",
        gloss: {
          UiLang.tr: 'Dışarısı çok sıcak.',
          UiLang.en: "It's really hot outside.",
        },
      ),
      Phrase(
        id: 'en_weather_3',
        target: 'Take an umbrella, it might rain.',
        gloss: {
          UiLang.tr: 'Şemsiye al, yağmur yağabilir.',
          UiLang.en: 'Take an umbrella, it might rain.',
        },
      ),
      Phrase(
        id: 'en_weather_4',
        target: "It's freezing this morning.",
        gloss: {
          UiLang.tr: 'Bu sabah dondurucu soğuk.',
          UiLang.en: "It's freezing this morning.",
        },
      ),
      Phrase(
        id: 'en_weather_5',
        target: 'I love sunny days.',
        gloss: {
          UiLang.tr: 'Güneşli günleri severim.',
          UiLang.en: 'I love sunny days.',
        },
      ),
      Phrase(
        id: 'en_weather_6',
        target: 'Is it windy today?',
        gloss: {UiLang.tr: 'Bugün rüzgarlı mı?', UiLang.en: 'Is it windy today?'},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You're about to go outside.",
        expected: "What's the weather like today?",
      ),
      SpeakTurn(
        prompt: 'Someone asks about the weather.',
        expected: "It's raining today.",
      ),
      SpeakTurn(
        prompt: 'You step outside.',
        expected: "It's really hot outside.",
      ),
      SpeakTurn(
        prompt: 'Your friend is leaving the house.',
        expected: 'Take an umbrella, it might rain.',
      ),
      SpeakTurn(
        prompt: 'You wake up and check the window.',
        expected: "It's freezing this morning.",
      ),
      SpeakTurn(
        prompt: "You're talking about your favorite weather.",
        expected: 'I love sunny days.',
      ),
      SpeakTurn(
        prompt: "You're deciding what to wear.",
        expected: 'Is it windy today?',
      ),
    ],
  ),
  Scenario(
    id: 'en_transport',
    lang: LearnLang.en,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Ulaşım', UiLang.en: 'Getting around'},
    clipLine: "Where's the nearest bus stop?",
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Ulaşım aracından önce "by" gelir (by bus, by train), ama "on foot" içinde "by" yoktur.',
        UiLang.en:
            'Use "by" + vehicle (by bus, by train), but "on foot" (no "by").',
      },
      goodExample: 'I go to work by bus.',
      badExample: 'I go to work with bus.',
    ),
    phrases: [
      Phrase(
        id: 'en_transport_0',
        target: "Where's the nearest bus stop?",
        gloss: {
          UiLang.tr: 'En yakın otobüs durağı nerede?',
          UiLang.en: "Where's the nearest bus stop?",
        },
      ),
      Phrase(
        id: 'en_transport_1',
        target: 'I go to work by bus.',
        gloss: {
          UiLang.tr: 'İşe otobüsle gidiyorum.',
          UiLang.en: 'I go to work by bus.',
        },
      ),
      Phrase(
        id: 'en_transport_2',
        target: 'Which platform is it?',
        gloss: {UiLang.tr: 'Hangi peron?', UiLang.en: 'Which platform is it?'},
      ),
      Phrase(
        id: 'en_transport_3',
        target: 'One ticket to the city center, please.',
        gloss: {
          UiLang.tr: 'Şehir merkezine bir bilet, lütfen.',
          UiLang.en: 'One ticket to the city center, please.',
        },
      ),
      Phrase(
        id: 'en_transport_4',
        target: 'Does this train stop at the airport?',
        gloss: {
          UiLang.tr: 'Bu tren havalimanında duruyor mu?',
          UiLang.en: 'Does this train stop at the airport?',
        },
      ),
      Phrase(
        id: 'en_transport_5',
        target: 'I need a taxi.',
        gloss: {UiLang.tr: 'Taksiye ihtiyacım var.', UiLang.en: 'I need a taxi.'},
      ),
      Phrase(
        id: 'en_transport_6',
        target: 'How long does it take?',
        gloss: {UiLang.tr: 'Ne kadar sürüyor?', UiLang.en: 'How long does it take?'},
      ),
      Phrase(
        id: 'en_transport_7',
        target: 'I prefer to go on foot.',
        gloss: {
          UiLang.tr: 'Yürüyerek gitmeyi tercih ederim.',
          UiLang.en: 'I prefer to go on foot.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You need to find a bus.',
        expected: "Where's the nearest bus stop?",
      ),
      SpeakTurn(
        prompt: 'Someone asks how you commute.',
        expected: 'I go to work by bus.',
      ),
      SpeakTurn(
        prompt: "You're at the train station.",
        expected: 'Which platform is it?',
      ),
      SpeakTurn(
        prompt: 'At the ticket counter.',
        expected: 'One ticket to the city center, please.',
      ),
      SpeakTurn(
        prompt: "You're not sure of the route.",
        expected: 'Does this train stop at the airport?',
      ),
      SpeakTurn(prompt: 'You missed the last bus.', expected: 'I need a taxi.'),
      SpeakTurn(
        prompt: "You're asking about travel time.",
        expected: 'How long does it take?',
      ),
      SpeakTurn(
        prompt: "It's a short distance.",
        expected: 'I prefer to go on foot.',
      ),
    ],
  ),
  Scenario(
    id: 'en_emergency',
    lang: LearnLang.en,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Acil durum', UiLang.en: 'Emergency'},
    clipLine: 'Help! Call an ambulance!',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Bir olayı bildirirken "there is/are/has been" kullanılır, "it has" değil.',
        UiLang.en: 'Report an occurrence with "there is/are/has been", not "it has".',
      },
      goodExample: "There's been an accident.",
      badExample: 'It has an accident.',
    ),
    phrases: [
      Phrase(
        id: 'en_emergency_0',
        target: 'Help! Call an ambulance!',
        gloss: {
          UiLang.tr: 'İmdat! Ambulans çağırın!',
          UiLang.en: 'Help! Call an ambulance!',
        },
      ),
      Phrase(
        id: 'en_emergency_1',
        target: "There's been an accident.",
        gloss: {
          UiLang.tr: 'Bir kaza oldu.',
          UiLang.en: "There's been an accident.",
        },
      ),
      Phrase(
        id: 'en_emergency_2',
        target: 'I need a doctor now.',
        gloss: {
          UiLang.tr: 'Şimdi bir doktora ihtiyacım var.',
          UiLang.en: 'I need a doctor now.',
        },
      ),
      Phrase(
        id: 'en_emergency_3',
        target: 'Where is the nearest hospital?',
        gloss: {
          UiLang.tr: 'En yakın hastane nerede?',
          UiLang.en: 'Where is the nearest hospital?',
        },
      ),
      Phrase(
        id: 'en_emergency_4',
        target: 'Someone stole my bag.',
        gloss: {
          UiLang.tr: 'Biri çantamı çaldı.',
          UiLang.en: 'Someone stole my bag.',
        },
      ),
      Phrase(
        id: 'en_emergency_5',
        target: "I'm allergic to penicillin.",
        gloss: {
          UiLang.tr: 'Penisiline alerjim var.',
          UiLang.en: "I'm allergic to penicillin.",
        },
      ),
      Phrase(
        id: 'en_emergency_6',
        target: 'Please call the police.',
        gloss: {
          UiLang.tr: 'Lütfen polisi arayın.',
          UiLang.en: 'Please call the police.',
        },
      ),
      Phrase(
        id: 'en_emergency_7',
        target: "I'm lost, can you help me?",
        gloss: {
          UiLang.tr: 'Kayboldum, bana yardım edebilir misiniz?',
          UiLang.en: "I'm lost, can you help me?",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You see someone collapse.',
        expected: 'Help! Call an ambulance!',
      ),
      SpeakTurn(
        prompt: 'You call emergency services.',
        expected: "There's been an accident.",
      ),
      SpeakTurn(
        prompt: 'You describe the urgency.',
        expected: 'I need a doctor now.',
      ),
      SpeakTurn(
        prompt: 'You need directions fast.',
        expected: 'Where is the nearest hospital?',
      ),
      SpeakTurn(
        prompt: "You're reporting a theft.",
        expected: 'Someone stole my bag.',
      ),
      SpeakTurn(
        prompt: 'A doctor asks about allergies.',
        expected: "I'm allergic to penicillin.",
      ),
      SpeakTurn(
        prompt: 'You need official help.',
        expected: 'Please call the police.',
      ),
      SpeakTurn(
        prompt: "You don't know where you are.",
        expected: "I'm lost, can you help me?",
      ),
    ],
  ),
  Scenario(
    id: 'en_routine',
    lang: LearnLang.en,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Günlük rutin', UiLang.en: 'Daily routine'},
    clipLine: 'I usually wake up at seven.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: 'Geniş zamanda üçüncü tekil şahısta fiile -s eklenir.',
        UiLang.en: 'Third-person singular present tense adds -s to the verb.',
      },
      goodExample: 'She wakes up at seven.',
      badExample: 'She wake up at seven.',
    ),
    phrases: [
      Phrase(
        id: 'en_routine_0',
        target: 'I usually wake up at seven.',
        gloss: {
          UiLang.tr: 'Genelde saat yedide uyanırım.',
          UiLang.en: 'I usually wake up at seven.',
        },
      ),
      Phrase(
        id: 'en_routine_1',
        target: 'She takes a shower every morning.',
        gloss: {
          UiLang.tr: 'Her sabah duş alır.',
          UiLang.en: 'She takes a shower every morning.',
        },
      ),
      Phrase(
        id: 'en_routine_2',
        target: 'We have breakfast together.',
        gloss: {
          UiLang.tr: 'Birlikte kahvaltı yaparız.',
          UiLang.en: 'We have breakfast together.',
        },
      ),
      Phrase(
        id: 'en_routine_3',
        target: 'He goes to work by bike.',
        gloss: {
          UiLang.tr: 'İşe bisikletle gider.',
          UiLang.en: 'He goes to work by bike.',
        },
      ),
      Phrase(
        id: 'en_routine_4',
        target: 'I always brush my teeth twice a day.',
        gloss: {
          UiLang.tr: 'Her zaman günde iki kez dişlerimi fırçalarım.',
          UiLang.en: 'I always brush my teeth twice a day.',
        },
      ),
      Phrase(
        id: 'en_routine_5',
        target: 'They usually go to bed late.',
        gloss: {
          UiLang.tr: 'Genelde geç yatarlar.',
          UiLang.en: 'They usually go to bed late.',
        },
      ),
      Phrase(
        id: 'en_routine_6',
        target: 'On Sundays, I sleep in.',
        gloss: {
          UiLang.tr: 'Pazar günleri geç kalkarım.',
          UiLang.en: 'On Sundays, I sleep in.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Someone asks about your morning.',
        expected: 'I usually wake up at seven.',
      ),
      SpeakTurn(
        prompt: "You describe your sister's routine.",
        expected: 'She takes a shower every morning.',
      ),
      SpeakTurn(
        prompt: "You talk about your family's mornings.",
        expected: 'We have breakfast together.',
      ),
      SpeakTurn(
        prompt: "You describe your brother's commute.",
        expected: 'He goes to work by bike.',
      ),
      SpeakTurn(
        prompt: "You're talking about hygiene habits.",
        expected: 'I always brush my teeth twice a day.',
      ),
      SpeakTurn(
        prompt: 'You describe your roommates.',
        expected: 'They usually go to bed late.',
      ),
      SpeakTurn(
        prompt: 'Someone asks about your weekend.',
        expected: 'On Sundays, I sleep in.',
      ),
    ],
  ),
  Scenario(
    id: 'en_past_story',
    lang: LearnLang.en,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Bir olayı anlatmak', UiLang.en: 'Telling a story'},
    clipLine: 'Yesterday I went to the market.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Düzensiz geçmiş zaman fiilleri -ed almaz, biçim değiştirir (go→went, buy→bought).',
        UiLang.en:
            'Irregular past-tense verbs don\'t add -ed — they change form (go→went, buy→bought).',
      },
      goodExample: 'I went to the market.',
      badExample: 'I goed to the market.',
    ),
    phrases: [
      Phrase(
        id: 'en_past_story_0',
        target: 'Yesterday I went to the market.',
        gloss: {
          UiLang.tr: 'Dün pazara gittim.',
          UiLang.en: 'Yesterday I went to the market.',
        },
      ),
      Phrase(
        id: 'en_past_story_1',
        target: 'I bought some fresh vegetables.',
        gloss: {
          UiLang.tr: 'Biraz taze sebze aldım.',
          UiLang.en: 'I bought some fresh vegetables.',
        },
      ),
      Phrase(
        id: 'en_past_story_2',
        target: 'Then I met an old friend.',
        gloss: {
          UiLang.tr: 'Sonra eski bir arkadaşımla karşılaştım.',
          UiLang.en: 'Then I met an old friend.',
        },
      ),
      Phrase(
        id: 'en_past_story_3',
        target: 'We talked for an hour.',
        gloss: {UiLang.tr: 'Bir saat konuştuk.', UiLang.en: 'We talked for an hour.'},
      ),
      Phrase(
        id: 'en_past_story_4',
        target: 'I lost my wallet on the way home.',
        gloss: {
          UiLang.tr: 'Eve dönerken cüzdanımı kaybettim.',
          UiLang.en: 'I lost my wallet on the way home.',
        },
      ),
      Phrase(
        id: 'en_past_story_5',
        target: 'Luckily, someone found it.',
        gloss: {
          UiLang.tr: 'Neyse ki biri buldu.',
          UiLang.en: 'Luckily, someone found it.',
        },
      ),
      Phrase(
        id: 'en_past_story_6',
        target: 'It was a crazy day!',
        gloss: {UiLang.tr: 'Çılgın bir gündü!', UiLang.en: 'It was a crazy day!'},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You're telling a friend about your day.",
        expected: 'Yesterday I went to the market.',
      ),
      SpeakTurn(
        prompt: 'You continue the story.',
        expected: 'I bought some fresh vegetables.',
      ),
      SpeakTurn(
        prompt: 'Something unexpected happened.',
        expected: 'Then I met an old friend.',
      ),
      SpeakTurn(
        prompt: 'You describe the encounter.',
        expected: 'We talked for an hour.',
      ),
      SpeakTurn(
        prompt: 'Something went wrong.',
        expected: 'I lost my wallet on the way home.',
      ),
      SpeakTurn(
        prompt: 'It has a happy ending.',
        expected: 'Luckily, someone found it.',
      ),
      SpeakTurn(
        prompt: "You're wrapping up the story.",
        expected: 'It was a crazy day!',
      ),
    ],
  ),

  // ===================== SPANISH =====================
  Scenario(
    id: 'es_intro',
    lang: LearnLang.es,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Tanışma', UiLang.en: 'Meeting someone'},
    clipLine: 'Mucho gusto.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            '"Ser" ile meslek söylerken İngilizce\'nin aksine belirsiz artikel ("un/una") kullanılmaz.',
        UiLang.en:
            'With "ser" + profession, Spanish drops the indefinite article (un/una) — unlike English.',
      },
      goodExample: 'Soy profesora.',
      badExample: 'Soy una profesora.',
    ),
    phrases: [
      Phrase(
        id: 'es_intro_0',
        target: 'Mucho gusto.',
        gloss: {
          UiLang.tr: 'Tanıştığımıza memnun oldum.',
          UiLang.en: 'Nice to meet you.',
        },
      ),
      Phrase(
        id: 'es_intro_1',
        target: '¿Cómo te llamas?',
        gloss: {UiLang.tr: 'Adın ne?', UiLang.en: "What's your name?"},
      ),
      Phrase(
        id: 'es_intro_2',
        target: 'Me llamo Alex, ¿y tú?',
        gloss: {UiLang.tr: 'Ben Alex, ya sen?', UiLang.en: "I'm Alex, and you?"},
      ),
      Phrase(
        id: 'es_intro_3',
        target: '¿A qué te dedicas?',
        gloss: {UiLang.tr: 'Ne iş yapıyorsun?', UiLang.en: 'What do you do?'},
      ),
      Phrase(
        id: 'es_intro_4',
        target: 'Soy profesora.',
        gloss: {UiLang.tr: 'Öğretmenim.', UiLang.en: "I'm a teacher."},
      ),
      Phrase(
        id: 'es_intro_5',
        target: '¿Me das tu número?',
        gloss: {
          UiLang.tr: 'Numaranı verir misin?',
          UiLang.en: 'Can I have your number?',
        },
      ),
      Phrase(
        id: 'es_intro_6',
        target: '¡Hasta pronto!',
        gloss: {UiLang.tr: 'Yakında görüşürüz!', UiLang.en: 'See you soon!'},
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'You just met someone new.', expected: 'Mucho gusto.'),
      SpeakTurn(
        prompt: 'You want to know their name.',
        expected: '¿Cómo te llamas?',
      ),
      SpeakTurn(
        prompt: 'They ask for your name.',
        expected: 'Me llamo Alex, ¿y tú?',
      ),
      SpeakTurn(
        prompt: "You're curious about their job.",
        expected: '¿A qué te dedicas?',
      ),
      SpeakTurn(prompt: 'They ask what you do.', expected: 'Soy profesora.'),
      SpeakTurn(
        prompt: 'You want to stay in touch.',
        expected: '¿Me das tu número?',
      ),
      SpeakTurn(prompt: "You're saying goodbye.", expected: '¡Hasta pronto!'),
    ],
  ),
  Scenario(
    id: 'es_shopping',
    lang: LearnLang.es,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Alışveriş', UiLang.en: 'Shopping'},
    clipLine: 'Solo estoy mirando, gracias.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Gösterme sıfatları ("este/esta/estos/estas") ismin cinsiyet ve sayısına uyar.',
        UiLang.en:
            'Demonstratives (este/esta/estos/estas) agree with the noun\'s gender and number.',
      },
      goodExample: '¿Cuánto cuestan estos zapatos?',
      badExample: '¿Cuánto cuestan estas zapatos?',
    ),
    phrases: [
      Phrase(
        id: 'es_shopping_0',
        target: 'Solo estoy mirando, gracias.',
        gloss: {
          UiLang.tr: 'Sadece bakıyorum, teşekkürler.',
          UiLang.en: "I'm just looking, thanks.",
        },
      ),
      Phrase(
        id: 'es_shopping_1',
        target: '¿Tiene esto en talla 40?',
        gloss: {
          UiLang.tr: 'Bunun 40 numarası var mı?',
          UiLang.en: 'Do you have this in a size 40?',
        },
      ),
      Phrase(
        id: 'es_shopping_2',
        target: '¿Me lo puedo probar?',
        gloss: {UiLang.tr: 'Deneyebilir miyim?', UiLang.en: 'Can I try it on?'},
      ),
      Phrase(
        id: 'es_shopping_3',
        target: '¿Cuánto cuestan estos zapatos?',
        gloss: {
          UiLang.tr: 'Bu ayakkabılar ne kadar?',
          UiLang.en: 'How much are these shoes?',
        },
      ),
      Phrase(
        id: 'es_shopping_4',
        target: '¿Aceptan tarjeta?',
        gloss: {UiLang.tr: 'Kart geçiyor mu?', UiLang.en: 'Do you take cards?'},
      ),
      Phrase(
        id: 'es_shopping_5',
        target: 'Es demasiado caro.',
        gloss: {UiLang.tr: 'Çok pahalı.', UiLang.en: "It's too expensive."},
      ),
      Phrase(
        id: 'es_shopping_6',
        target: '¿Tiene una talla más pequeña?',
        gloss: {
          UiLang.tr: 'Daha küçük bedeniniz var mı?',
          UiLang.en: 'Do you have a smaller size?',
        },
      ),
      Phrase(
        id: 'es_shopping_7',
        target: 'Me lo llevo.',
        gloss: {UiLang.tr: 'Bunu alıyorum.', UiLang.en: "I'll take it."},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'A clerk asks if you need help.',
        expected: 'Solo estoy mirando, gracias.',
      ),
      SpeakTurn(
        prompt: 'You found something you like.',
        expected: '¿Tiene esto en talla 40?',
      ),
      SpeakTurn(
        prompt: 'You want to test the fit.',
        expected: '¿Me lo puedo probar?',
      ),
      SpeakTurn(
        prompt: "You're checking the price.",
        expected: '¿Cuánto cuestan estos zapatos?',
      ),
      SpeakTurn(prompt: "You're ready to pay.", expected: '¿Aceptan tarjeta?'),
      SpeakTurn(
        prompt: 'You think the price is high.',
        expected: 'Es demasiado caro.',
      ),
      SpeakTurn(
        prompt: "It doesn't fit.",
        expected: '¿Tiene una talla más pequeña?',
      ),
      SpeakTurn(prompt: "You've decided to buy it.", expected: 'Me lo llevo.'),
    ],
  ),
  Scenario(
    id: 'es_numbers_time',
    lang: LearnLang.es,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Sayılar ve saat', UiLang.en: 'Numbers and time'},
    clipLine: '¿Qué hora es?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Saat "bir" için "es la una" (tekil), diğer saatler için "son las..." (çoğul) kullanılır.',
        UiLang.en:
            'Use "es la una" (singular) only for one o\'clock; every other hour takes "son las..." (plural).',
      },
      goodExample: 'Son las tres y media.',
      badExample: 'Es las tres y media.',
    ),
    phrases: [
      Phrase(
        id: 'es_numbers_time_0',
        target: '¿Qué hora es?',
        gloss: {UiLang.tr: 'Saat kaç?', UiLang.en: 'What time is it?'},
      ),
      Phrase(
        id: 'es_numbers_time_1',
        target: 'Son las tres y media.',
        gloss: {UiLang.tr: 'Saat üç buçuk.', UiLang.en: "It's half past three."},
      ),
      Phrase(
        id: 'es_numbers_time_2',
        target: 'El tren sale a las nueve.',
        gloss: {
          UiLang.tr: 'Tren dokuzda kalkıyor.',
          UiLang.en: 'The train leaves at nine.',
        },
      ),
      Phrase(
        id: 'es_numbers_time_3',
        target: 'Tengo dos entradas.',
        gloss: {UiLang.tr: 'İki biletim var.', UiLang.en: 'I have two tickets.'},
      ),
      Phrase(
        id: 'es_numbers_time_4',
        target: 'Son doce euros.',
        gloss: {
          UiLang.tr: 'On iki euro tutuyor.',
          UiLang.en: 'That will be twelve euros.',
        },
      ),
      Phrase(
        id: 'es_numbers_time_5',
        target: '¿Quedamos a las cinco?',
        gloss: {
          UiLang.tr: 'Beşte buluşabilir miyiz?',
          UiLang.en: 'Can we meet at five?',
        },
      ),
      Phrase(
        id: 'es_numbers_time_6',
        target: 'Llego en diez minutos.',
        gloss: {
          UiLang.tr: 'On dakikaya orada olurum.',
          UiLang.en: "I'll be there in ten minutes.",
        },
      ),
    ],
    turns: [
      SpeakTurn(prompt: "You don't know the time.", expected: '¿Qué hora es?'),
      SpeakTurn(
        prompt: 'Someone asks you the time.',
        expected: 'Son las tres y media.',
      ),
      SpeakTurn(
        prompt: "You're checking the schedule.",
        expected: 'El tren sale a las nueve.',
      ),
      SpeakTurn(prompt: 'At the counter.', expected: 'Tengo dos entradas.'),
      SpeakTurn(
        prompt: 'The clerk tells you the price.',
        expected: 'Son doce euros.',
      ),
      SpeakTurn(
        prompt: "You're planning to meet a friend.",
        expected: '¿Quedamos a las cinco?',
      ),
      SpeakTurn(
        prompt: "You're running a bit late.",
        expected: 'Llego en diez minutos.',
      ),
    ],
  ),
  Scenario(
    id: 'es_family',
    lang: LearnLang.es,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Aile', UiLang.en: 'Family'},
    clipLine: 'Esta es mi familia.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'İyelik sıfatı ("mi/mis") sahibine değil, sahip olunan ismin sayısına uyar.',
        UiLang.en:
            'Possessives (mi/mis) agree in number with the thing possessed, not the possessor.',
      },
      goodExample: 'Mis padres viven en Esmirna.',
      badExample: 'Mi padres viven en Esmirna.',
    ),
    phrases: [
      Phrase(
        id: 'es_family_0',
        target: 'Esta es mi familia.',
        gloss: {UiLang.tr: 'Bu benim ailem.', UiLang.en: 'This is my family.'},
      ),
      Phrase(
        id: 'es_family_1',
        target: 'Tengo dos hermanos y una hermana.',
        gloss: {
          UiLang.tr: 'İki erkek kardeşim ve bir kız kardeşim var.',
          UiLang.en: 'I have two brothers and a sister.',
        },
      ),
      Phrase(
        id: 'es_family_2',
        target: 'Mi madre es médica.',
        gloss: {UiLang.tr: 'Annem doktor.', UiLang.en: 'My mother is a doctor.'},
      ),
      Phrase(
        id: 'es_family_3',
        target: 'Ella quiere mucho a su hermano.',
        gloss: {
          UiLang.tr: 'Kardeşini çok seviyor.',
          UiLang.en: 'She loves her brother a lot.',
        },
      ),
      Phrase(
        id: 'es_family_4',
        target: '¿Cuántos años tiene tu hija?',
        gloss: {
          UiLang.tr: 'Kızın kaç yaşında?',
          UiLang.en: 'How old is your daughter?',
        },
      ),
      Phrase(
        id: 'es_family_5',
        target: 'Mis padres viven en Esmirna.',
        gloss: {
          UiLang.tr: "Ailem İzmir'de yaşıyor.",
          UiLang.en: 'My parents live in Izmir.',
        },
      ),
      Phrase(
        id: 'es_family_6',
        target: '¿Tienes hijos?',
        gloss: {UiLang.tr: 'Çocuğun var mı?', UiLang.en: 'Do you have children?'},
      ),
    ],
    turns: [
      SpeakTurn(prompt: "You're showing a photo.", expected: 'Esta es mi familia.'),
      SpeakTurn(
        prompt: 'Someone asks about your siblings.',
        expected: 'Tengo dos hermanos y una hermana.',
      ),
      SpeakTurn(
        prompt: 'They ask what your mother does.',
        expected: 'Mi madre es médica.',
      ),
      SpeakTurn(
        prompt: "You're talking about your sister.",
        expected: 'Ella quiere mucho a su hermano.',
      ),
      SpeakTurn(
        prompt: "You want to know a friend's daughter's age.",
        expected: '¿Cuántos años tiene tu hija?',
      ),
      SpeakTurn(
        prompt: 'They ask where your parents live.',
        expected: 'Mis padres viven en Esmirna.',
      ),
      SpeakTurn(prompt: "You're asking a new friend.", expected: '¿Tienes hijos?'),
    ],
  ),
  Scenario(
    id: 'es_weather',
    lang: LearnLang.es,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Hava durumu', UiLang.en: 'Weather'},
    clipLine: '¿Qué tiempo hace hoy?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'İspanyolca hava durumu ifadeleri özne almaz — İngilizce\'deki "it" gibi bir zamir eklenmez.',
        UiLang.en:
            'Spanish weather expressions never take a subject pronoun — no "ello" like English "it".',
      },
      goodExample: 'Hace mucho calor.',
      badExample: 'Ello hace mucho calor.',
    ),
    phrases: [
      Phrase(
        id: 'es_weather_0',
        target: '¿Qué tiempo hace hoy?',
        gloss: {
          UiLang.tr: 'Bugün hava nasıl?',
          UiLang.en: "What's the weather like today?",
        },
      ),
      Phrase(
        id: 'es_weather_1',
        target: 'Está lloviendo hoy.',
        gloss: {
          UiLang.tr: 'Bugün yağmur yağıyor.',
          UiLang.en: "It's raining today.",
        },
      ),
      Phrase(
        id: 'es_weather_2',
        target: 'Hace mucho calor afuera.',
        gloss: {
          UiLang.tr: 'Dışarısı çok sıcak.',
          UiLang.en: "It's really hot outside.",
        },
      ),
      Phrase(
        id: 'es_weather_3',
        target: 'Lleva paraguas, puede llover.',
        gloss: {
          UiLang.tr: 'Şemsiye al, yağmur yağabilir.',
          UiLang.en: 'Take an umbrella, it might rain.',
        },
      ),
      Phrase(
        id: 'es_weather_4',
        target: 'Hace muchísimo frío esta mañana.',
        gloss: {
          UiLang.tr: 'Bu sabah dondurucu soğuk.',
          UiLang.en: "It's freezing this morning.",
        },
      ),
      Phrase(
        id: 'es_weather_5',
        target: 'Me encantan los días soleados.',
        gloss: {
          UiLang.tr: 'Güneşli günleri severim.',
          UiLang.en: 'I love sunny days.',
        },
      ),
      Phrase(
        id: 'es_weather_6',
        target: '¿Hace viento hoy?',
        gloss: {UiLang.tr: 'Bugün rüzgarlı mı?', UiLang.en: 'Is it windy today?'},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You're about to go outside.",
        expected: '¿Qué tiempo hace hoy?',
      ),
      SpeakTurn(
        prompt: 'Someone asks about the weather.',
        expected: 'Está lloviendo hoy.',
      ),
      SpeakTurn(prompt: 'You step outside.', expected: 'Hace mucho calor afuera.'),
      SpeakTurn(
        prompt: 'Your friend is leaving the house.',
        expected: 'Lleva paraguas, puede llover.',
      ),
      SpeakTurn(
        prompt: 'You wake up and check the window.',
        expected: 'Hace muchísimo frío esta mañana.',
      ),
      SpeakTurn(
        prompt: "You're talking about your favorite weather.",
        expected: 'Me encantan los días soleados.',
      ),
      SpeakTurn(
        prompt: "You're deciding what to wear.",
        expected: '¿Hace viento hoy?',
      ),
    ],
  ),
  Scenario(
    id: 'es_transport',
    lang: LearnLang.es,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Ulaşım', UiLang.en: 'Getting around'},
    clipLine: '¿Dónde está la parada de autobús más cercana?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: 'Ulaşım aracı "en" ile söylenir (en autobús), "por" ile değil.',
        UiLang.en: 'Mode of transport uses "en" (en autobús), not "por".',
      },
      goodExample: 'Voy al trabajo en autobús.',
      badExample: 'Voy al trabajo por autobús.',
    ),
    phrases: [
      Phrase(
        id: 'es_transport_0',
        target: '¿Dónde está la parada de autobús más cercana?',
        gloss: {
          UiLang.tr: 'En yakın otobüs durağı nerede?',
          UiLang.en: "Where's the nearest bus stop?",
        },
      ),
      Phrase(
        id: 'es_transport_1',
        target: 'Voy al trabajo en autobús.',
        gloss: {
          UiLang.tr: 'İşe otobüsle gidiyorum.',
          UiLang.en: 'I go to work by bus.',
        },
      ),
      Phrase(
        id: 'es_transport_2',
        target: '¿Qué andén es?',
        gloss: {UiLang.tr: 'Hangi peron?', UiLang.en: 'Which platform is it?'},
      ),
      Phrase(
        id: 'es_transport_3',
        target: 'Un billete al centro, por favor.',
        gloss: {
          UiLang.tr: 'Şehir merkezine bir bilet, lütfen.',
          UiLang.en: 'One ticket to the city center, please.',
        },
      ),
      Phrase(
        id: 'es_transport_4',
        target: '¿Este tren para en el aeropuerto?',
        gloss: {
          UiLang.tr: 'Bu tren havalimanında duruyor mu?',
          UiLang.en: 'Does this train stop at the airport?',
        },
      ),
      Phrase(
        id: 'es_transport_5',
        target: 'Necesito un taxi.',
        gloss: {UiLang.tr: 'Taksiye ihtiyacım var.', UiLang.en: 'I need a taxi.'},
      ),
      Phrase(
        id: 'es_transport_6',
        target: '¿Cuánto se tarda?',
        gloss: {UiLang.tr: 'Ne kadar sürüyor?', UiLang.en: 'How long does it take?'},
      ),
      Phrase(
        id: 'es_transport_7',
        target: 'Prefiero ir a pie.',
        gloss: {
          UiLang.tr: 'Yürüyerek gitmeyi tercih ederim.',
          UiLang.en: 'I prefer to go on foot.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You need to find a bus.',
        expected: '¿Dónde está la parada de autobús más cercana?',
      ),
      SpeakTurn(
        prompt: 'Someone asks how you commute.',
        expected: 'Voy al trabajo en autobús.',
      ),
      SpeakTurn(prompt: "You're at the train station.", expected: '¿Qué andén es?'),
      SpeakTurn(
        prompt: 'At the ticket counter.',
        expected: 'Un billete al centro, por favor.',
      ),
      SpeakTurn(
        prompt: "You're not sure of the route.",
        expected: '¿Este tren para en el aeropuerto?',
      ),
      SpeakTurn(prompt: 'You missed the last bus.', expected: 'Necesito un taxi.'),
      SpeakTurn(
        prompt: "You're asking about travel time.",
        expected: '¿Cuánto se tarda?',
      ),
      SpeakTurn(
        prompt: "It's a short distance.",
        expected: 'Prefiero ir a pie.',
      ),
    ],
  ),
  Scenario(
    id: 'es_emergency',
    lang: LearnLang.es,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Acil durum', UiLang.en: 'Emergency'},
    clipLine: '¡Ayuda! ¡Llamen a una ambulancia!',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Bir şeyin var olduğunu/olduğunu bildirmek için "hay" kullanılır, "está" ya da "es" değil.',
        UiLang.en:
            'Use "hay" (there is/are) to report that something exists or happened, not "está" or "es".',
      },
      goodExample: 'Hay un accidente.',
      badExample: 'Está un accidente.',
    ),
    phrases: [
      Phrase(
        id: 'es_emergency_0',
        target: '¡Ayuda! ¡Llamen a una ambulancia!',
        gloss: {
          UiLang.tr: 'İmdat! Ambulans çağırın!',
          UiLang.en: 'Help! Call an ambulance!',
        },
      ),
      Phrase(
        id: 'es_emergency_1',
        target: 'Hay un accidente.',
        gloss: {
          UiLang.tr: 'Bir kaza oldu.',
          UiLang.en: "There's been an accident.",
        },
      ),
      Phrase(
        id: 'es_emergency_2',
        target: 'Necesito un médico ahora.',
        gloss: {
          UiLang.tr: 'Şimdi bir doktora ihtiyacım var.',
          UiLang.en: 'I need a doctor now.',
        },
      ),
      Phrase(
        id: 'es_emergency_3',
        target: '¿Dónde está el hospital más cercano?',
        gloss: {
          UiLang.tr: 'En yakın hastane nerede?',
          UiLang.en: 'Where is the nearest hospital?',
        },
      ),
      Phrase(
        id: 'es_emergency_4',
        target: 'Alguien me robó el bolso.',
        gloss: {
          UiLang.tr: 'Biri çantamı çaldı.',
          UiLang.en: 'Someone stole my bag.',
        },
      ),
      Phrase(
        id: 'es_emergency_5',
        target: 'Soy alérgico a la penicilina.',
        gloss: {
          UiLang.tr: 'Penisiline alerjim var.',
          UiLang.en: "I'm allergic to penicillin.",
        },
      ),
      Phrase(
        id: 'es_emergency_6',
        target: 'Llamen a la policía, por favor.',
        gloss: {
          UiLang.tr: 'Lütfen polisi arayın.',
          UiLang.en: 'Please call the police.',
        },
      ),
      Phrase(
        id: 'es_emergency_7',
        target: 'Estoy perdido, ¿me puede ayudar?',
        gloss: {
          UiLang.tr: 'Kayboldum, bana yardım edebilir misiniz?',
          UiLang.en: "I'm lost, can you help me?",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You see someone collapse.',
        expected: '¡Ayuda! ¡Llamen a una ambulancia!',
      ),
      SpeakTurn(
        prompt: 'You call emergency services.',
        expected: 'Hay un accidente.',
      ),
      SpeakTurn(
        prompt: 'You describe the urgency.',
        expected: 'Necesito un médico ahora.',
      ),
      SpeakTurn(
        prompt: 'You need directions fast.',
        expected: '¿Dónde está el hospital más cercano?',
      ),
      SpeakTurn(
        prompt: "You're reporting a theft.",
        expected: 'Alguien me robó el bolso.',
      ),
      SpeakTurn(
        prompt: 'A doctor asks about allergies.',
        expected: 'Soy alérgico a la penicilina.',
      ),
      SpeakTurn(
        prompt: 'You need official help.',
        expected: 'Llamen a la policía, por favor.',
      ),
      SpeakTurn(
        prompt: "You don't know where you are.",
        expected: 'Estoy perdido, ¿me puede ayudar?',
      ),
    ],
  ),
  Scenario(
    id: 'es_routine',
    lang: LearnLang.es,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Günlük rutin', UiLang.en: 'Daily routine'},
    clipLine: 'Normalmente me levanto a las siete.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Günlük rutin fiilleri dönüşlü olduğunda dönüşlü zamir ("me/se") atlanamaz.',
        UiLang.en:
            'Reflexive daily-routine verbs need the reflexive pronoun (me/se) — it can\'t be dropped.',
      },
      goodExample: 'Me levanto a las siete.',
      badExample: 'Levanto a las siete.',
    ),
    phrases: [
      Phrase(
        id: 'es_routine_0',
        target: 'Normalmente me levanto a las siete.',
        gloss: {
          UiLang.tr: 'Genelde saat yedide kalkarım.',
          UiLang.en: 'I usually wake up at seven.',
        },
      ),
      Phrase(
        id: 'es_routine_1',
        target: 'Ella se ducha todas las mañanas.',
        gloss: {
          UiLang.tr: 'Her sabah duş alır.',
          UiLang.en: 'She takes a shower every morning.',
        },
      ),
      Phrase(
        id: 'es_routine_2',
        target: 'Desayunamos juntos.',
        gloss: {
          UiLang.tr: 'Birlikte kahvaltı yaparız.',
          UiLang.en: 'We have breakfast together.',
        },
      ),
      Phrase(
        id: 'es_routine_3',
        target: 'Él va al trabajo en bicicleta.',
        gloss: {
          UiLang.tr: 'İşe bisikletle gider.',
          UiLang.en: 'He goes to work by bike.',
        },
      ),
      Phrase(
        id: 'es_routine_4',
        target: 'Siempre me cepillo los dientes dos veces al día.',
        gloss: {
          UiLang.tr: 'Her zaman günde iki kez dişlerimi fırçalarım.',
          UiLang.en: 'I always brush my teeth twice a day.',
        },
      ),
      Phrase(
        id: 'es_routine_5',
        target: 'Normalmente se acuestan tarde.',
        gloss: {
          UiLang.tr: 'Genelde geç yatarlar.',
          UiLang.en: 'They usually go to bed late.',
        },
      ),
      Phrase(
        id: 'es_routine_6',
        target: 'Los domingos duermo hasta tarde.',
        gloss: {
          UiLang.tr: 'Pazar günleri geç kalkarım.',
          UiLang.en: 'On Sundays, I sleep in.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Someone asks about your morning.',
        expected: 'Normalmente me levanto a las siete.',
      ),
      SpeakTurn(
        prompt: "You describe your sister's routine.",
        expected: 'Ella se ducha todas las mañanas.',
      ),
      SpeakTurn(
        prompt: "You talk about your family's mornings.",
        expected: 'Desayunamos juntos.',
      ),
      SpeakTurn(
        prompt: "You describe your brother's commute.",
        expected: 'Él va al trabajo en bicicleta.',
      ),
      SpeakTurn(
        prompt: "You're talking about hygiene habits.",
        expected: 'Siempre me cepillo los dientes dos veces al día.',
      ),
      SpeakTurn(
        prompt: 'You describe your roommates.',
        expected: 'Normalmente se acuestan tarde.',
      ),
      SpeakTurn(
        prompt: 'Someone asks about your weekend.',
        expected: 'Los domingos duermo hasta tarde.',
      ),
    ],
  ),
  Scenario(
    id: 'es_past_story',
    lang: LearnLang.es,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Bir olayı anlatmak', UiLang.en: 'Telling a story'},
    clipLine: 'Ayer fui al mercado.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Düzenli -ar fiillerinin geçmiş zaman ("pretérito") "yo" hali -é ile biter, -o ile değil.',
        UiLang.en:
            'Regular -ar verbs in the preterite end in -é for "yo" (compré), not the present -o.',
      },
      goodExample: 'Compré verduras frescas.',
      badExample: 'Compro verduras frescas.',
    ),
    phrases: [
      Phrase(
        id: 'es_past_story_0',
        target: 'Ayer fui al mercado.',
        gloss: {
          UiLang.tr: 'Dün pazara gittim.',
          UiLang.en: 'Yesterday I went to the market.',
        },
      ),
      Phrase(
        id: 'es_past_story_1',
        target: 'Compré verduras frescas.',
        gloss: {
          UiLang.tr: 'Biraz taze sebze aldım.',
          UiLang.en: 'I bought some fresh vegetables.',
        },
      ),
      Phrase(
        id: 'es_past_story_2',
        target: 'Luego me encontré con un viejo amigo.',
        gloss: {
          UiLang.tr: 'Sonra eski bir arkadaşımla karşılaştım.',
          UiLang.en: 'Then I met an old friend.',
        },
      ),
      Phrase(
        id: 'es_past_story_3',
        target: 'Hablamos durante una hora.',
        gloss: {UiLang.tr: 'Bir saat konuştuk.', UiLang.en: 'We talked for an hour.'},
      ),
      Phrase(
        id: 'es_past_story_4',
        target: 'Perdí mi cartera de camino a casa.',
        gloss: {
          UiLang.tr: 'Eve dönerken cüzdanımı kaybettim.',
          UiLang.en: 'I lost my wallet on the way home.',
        },
      ),
      Phrase(
        id: 'es_past_story_5',
        target: 'Por suerte, alguien la encontró.',
        gloss: {
          UiLang.tr: 'Neyse ki biri buldu.',
          UiLang.en: 'Luckily, someone found it.',
        },
      ),
      Phrase(
        id: 'es_past_story_6',
        target: '¡Fue un día loco!',
        gloss: {UiLang.tr: 'Çılgın bir gündü!', UiLang.en: 'It was a crazy day!'},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You're telling a friend about your day.",
        expected: 'Ayer fui al mercado.',
      ),
      SpeakTurn(
        prompt: 'You continue the story.',
        expected: 'Compré verduras frescas.',
      ),
      SpeakTurn(
        prompt: 'Something unexpected happened.',
        expected: 'Luego me encontré con un viejo amigo.',
      ),
      SpeakTurn(
        prompt: 'You describe the encounter.',
        expected: 'Hablamos durante una hora.',
      ),
      SpeakTurn(
        prompt: 'Something went wrong.',
        expected: 'Perdí mi cartera de camino a casa.',
      ),
      SpeakTurn(
        prompt: 'It has a happy ending.',
        expected: 'Por suerte, alguien la encontró.',
      ),
      SpeakTurn(
        prompt: "You're wrapping up the story.",
        expected: '¡Fue un día loco!',
      ),
    ],
  ),

  // ===================== PORTUGUESE =====================
  Scenario(
    id: 'pt_intro',
    lang: LearnLang.pt,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Tanışma', UiLang.en: 'Meeting someone'},
    clipLine: 'Prazer em conhecer você.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            '"você" her zaman üçüncü tekil şahıs fiil çekimiyle kullanılır (chama, faz), "tu" çekimiyle değil.',
        UiLang.en:
            '"você" always pairs with third-person verb forms (chama, faz), not "tu" forms (chamas, fazes).',
      },
      goodExample: 'Como você se chama?',
      badExample: 'Como você te chamas?',
    ),
    phrases: [
      Phrase(
        id: 'pt_intro_0',
        target: 'Prazer em conhecer você.',
        gloss: {
          UiLang.tr: 'Tanıştığımıza memnun oldum.',
          UiLang.en: 'Nice to meet you.',
        },
      ),
      Phrase(
        id: 'pt_intro_1',
        target: 'Como você se chama?',
        gloss: {UiLang.tr: 'Adın ne?', UiLang.en: "What's your name?"},
      ),
      Phrase(
        id: 'pt_intro_2',
        target: 'Eu me chamo Alex, e você?',
        gloss: {UiLang.tr: 'Ben Alex, ya sen?', UiLang.en: "I'm Alex, and you?"},
      ),
      Phrase(
        id: 'pt_intro_3',
        target: 'O que você faz?',
        gloss: {UiLang.tr: 'Ne iş yapıyorsun?', UiLang.en: 'What do you do?'},
      ),
      Phrase(
        id: 'pt_intro_4',
        target: 'Sou professor.',
        gloss: {UiLang.tr: 'Öğretmenim.', UiLang.en: "I'm a teacher."},
      ),
      Phrase(
        id: 'pt_intro_5',
        target: 'Posso pegar seu número?',
        gloss: {
          UiLang.tr: 'Numaranı alabilir miyim?',
          UiLang.en: 'Can I have your number?',
        },
      ),
      Phrase(
        id: 'pt_intro_6',
        target: 'Até logo!',
        gloss: {UiLang.tr: 'Yakında görüşürüz!', UiLang.en: 'See you soon!'},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You just met someone new.',
        expected: 'Prazer em conhecer você.',
      ),
      SpeakTurn(
        prompt: 'You want to know their name.',
        expected: 'Como você se chama?',
      ),
      SpeakTurn(
        prompt: 'They ask for your name.',
        expected: 'Eu me chamo Alex, e você?',
      ),
      SpeakTurn(
        prompt: "You're curious about their job.",
        expected: 'O que você faz?',
      ),
      SpeakTurn(prompt: 'They ask what you do.', expected: 'Sou professor.'),
      SpeakTurn(
        prompt: 'You want to stay in touch.',
        expected: 'Posso pegar seu número?',
      ),
      SpeakTurn(prompt: "You're saying goodbye.", expected: 'Até logo!'),
    ],
  ),
  Scenario(
    id: 'pt_shopping',
    lang: LearnLang.pt,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Alışveriş', UiLang.en: 'Shopping'},
    clipLine: 'Estou só olhando, obrigado.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Gösterme sıfatları ("este/esta/estes/estas") ismin cinsiyet ve sayısına uyar.',
        UiLang.en:
            'Demonstratives (este/esta/estes/estas) agree with the noun\'s gender and number.',
      },
      goodExample: 'Quanto custam estes sapatos?',
      badExample: 'Quanto custam estas sapatos?',
    ),
    phrases: [
      Phrase(
        id: 'pt_shopping_0',
        target: 'Estou só olhando, obrigado.',
        gloss: {
          UiLang.tr: 'Sadece bakıyorum, teşekkürler.',
          UiLang.en: "I'm just looking, thanks.",
        },
      ),
      Phrase(
        id: 'pt_shopping_1',
        target: 'Tem isso no tamanho 40?',
        gloss: {
          UiLang.tr: 'Bunun 40 numarası var mı?',
          UiLang.en: 'Do you have this in a size 40?',
        },
      ),
      Phrase(
        id: 'pt_shopping_2',
        target: 'Posso experimentar?',
        gloss: {UiLang.tr: 'Deneyebilir miyim?', UiLang.en: 'Can I try it on?'},
      ),
      Phrase(
        id: 'pt_shopping_3',
        target: 'Quanto custam estes sapatos?',
        gloss: {
          UiLang.tr: 'Bu ayakkabılar ne kadar?',
          UiLang.en: 'How much are these shoes?',
        },
      ),
      Phrase(
        id: 'pt_shopping_4',
        target: 'Vocês aceitam cartão?',
        gloss: {UiLang.tr: 'Kart geçiyor mu?', UiLang.en: 'Do you take cards?'},
      ),
      Phrase(
        id: 'pt_shopping_5',
        target: 'Está muito caro.',
        gloss: {UiLang.tr: 'Çok pahalı.', UiLang.en: "It's too expensive."},
      ),
      Phrase(
        id: 'pt_shopping_6',
        target: 'Tem um tamanho menor?',
        gloss: {
          UiLang.tr: 'Daha küçük bedeniniz var mı?',
          UiLang.en: 'Do you have a smaller size?',
        },
      ),
      Phrase(
        id: 'pt_shopping_7',
        target: 'Vou levar este.',
        gloss: {UiLang.tr: 'Bunu alıyorum.', UiLang.en: "I'll take it."},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'A clerk asks if you need help.',
        expected: 'Estou só olhando, obrigado.',
      ),
      SpeakTurn(
        prompt: 'You found something you like.',
        expected: 'Tem isso no tamanho 40?',
      ),
      SpeakTurn(
        prompt: 'You want to test the fit.',
        expected: 'Posso experimentar?',
      ),
      SpeakTurn(
        prompt: "You're checking the price.",
        expected: 'Quanto custam estes sapatos?',
      ),
      SpeakTurn(
        prompt: "You're ready to pay.",
        expected: 'Vocês aceitam cartão?',
      ),
      SpeakTurn(
        prompt: 'You think the price is high.',
        expected: 'Está muito caro.',
      ),
      SpeakTurn(
        prompt: "It doesn't fit.",
        expected: 'Tem um tamanho menor?',
      ),
      SpeakTurn(prompt: "You've decided to buy it.", expected: 'Vou levar este.'),
    ],
  ),
  Scenario(
    id: 'pt_numbers_time',
    lang: LearnLang.pt,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Sayılar ve saat', UiLang.en: 'Numbers and time'},
    clipLine: 'Que horas são?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            '"a" (yönelme edatı) ile "as" (çoğul artikel) birleşince "às" olur; saat söylerken "às" kullanılır.',
        UiLang.en:
            '"a" + "as" contracts to "às" before a clock time — don\'t leave them separate.',
      },
      goodExample: 'O trem sai às nove.',
      badExample: 'O trem sai a nove.',
    ),
    phrases: [
      Phrase(
        id: 'pt_numbers_time_0',
        target: 'Que horas são?',
        gloss: {UiLang.tr: 'Saat kaç?', UiLang.en: 'What time is it?'},
      ),
      Phrase(
        id: 'pt_numbers_time_1',
        target: 'São três e meia.',
        gloss: {UiLang.tr: 'Saat üç buçuk.', UiLang.en: "It's half past three."},
      ),
      Phrase(
        id: 'pt_numbers_time_2',
        target: 'O trem sai às nove.',
        gloss: {
          UiLang.tr: 'Tren dokuzda kalkıyor.',
          UiLang.en: 'The train leaves at nine.',
        },
      ),
      Phrase(
        id: 'pt_numbers_time_3',
        target: 'Tenho dois ingressos.',
        gloss: {UiLang.tr: 'İki biletim var.', UiLang.en: 'I have two tickets.'},
      ),
      Phrase(
        id: 'pt_numbers_time_4',
        target: 'São doze euros.',
        gloss: {
          UiLang.tr: 'On iki euro tutuyor.',
          UiLang.en: 'That will be twelve euros.',
        },
      ),
      Phrase(
        id: 'pt_numbers_time_5',
        target: 'A gente se encontra às cinco?',
        gloss: {
          UiLang.tr: 'Beşte buluşabilir miyiz?',
          UiLang.en: 'Can we meet at five?',
        },
      ),
      Phrase(
        id: 'pt_numbers_time_6',
        target: 'Chego em dez minutos.',
        gloss: {
          UiLang.tr: 'On dakikaya orada olurum.',
          UiLang.en: "I'll be there in ten minutes.",
        },
      ),
    ],
    turns: [
      SpeakTurn(prompt: "You don't know the time.", expected: 'Que horas são?'),
      SpeakTurn(
        prompt: 'Someone asks you the time.',
        expected: 'São três e meia.',
      ),
      SpeakTurn(
        prompt: "You're checking the schedule.",
        expected: 'O trem sai às nove.',
      ),
      SpeakTurn(prompt: 'At the counter.', expected: 'Tenho dois ingressos.'),
      SpeakTurn(
        prompt: 'The clerk tells you the price.',
        expected: 'São doze euros.',
      ),
      SpeakTurn(
        prompt: "You're planning to meet a friend.",
        expected: 'A gente se encontra às cinco?',
      ),
      SpeakTurn(
        prompt: "You're running a bit late.",
        expected: 'Chego em dez minutos.',
      ),
    ],
  ),
  Scenario(
    id: 'pt_family',
    lang: LearnLang.pt,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Aile', UiLang.en: 'Family'},
    clipLine: 'Esta é a minha família.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'İyelik zamirleri sahip olunan ismin cinsiyetine göre değişir: minha mãe, meus pais.',
        UiLang.en:
            'Possessives agree in gender with the noun possessed: minha mãe (fem.), meus pais (masc.).',
      },
      goodExample: 'Minha mãe é médica.',
      badExample: 'Meu mãe é médica.',
    ),
    phrases: [
      Phrase(
        id: 'pt_family_0',
        target: 'Esta é a minha família.',
        gloss: {UiLang.tr: 'Bu benim ailem.', UiLang.en: 'This is my family.'},
      ),
      Phrase(
        id: 'pt_family_1',
        target: 'Tenho dois irmãos e uma irmã.',
        gloss: {
          UiLang.tr: 'İki erkek kardeşim ve bir kız kardeşim var.',
          UiLang.en: 'I have two brothers and a sister.',
        },
      ),
      Phrase(
        id: 'pt_family_2',
        target: 'Minha mãe é médica.',
        gloss: {UiLang.tr: 'Annem doktor.', UiLang.en: 'My mother is a doctor.'},
      ),
      Phrase(
        id: 'pt_family_3',
        target: 'Ela adora o irmão dela.',
        gloss: {
          UiLang.tr: 'Kardeşini çok seviyor.',
          UiLang.en: 'She loves her brother a lot.',
        },
      ),
      Phrase(
        id: 'pt_family_4',
        target: 'Quantos anos tem sua filha?',
        gloss: {
          UiLang.tr: 'Kızın kaç yaşında?',
          UiLang.en: 'How old is your daughter?',
        },
      ),
      Phrase(
        id: 'pt_family_5',
        target: 'Meus pais moram em Izmir.',
        gloss: {
          UiLang.tr: "Ailem İzmir'de yaşıyor.",
          UiLang.en: 'My parents live in Izmir.',
        },
      ),
      Phrase(
        id: 'pt_family_6',
        target: 'Você tem filhos?',
        gloss: {UiLang.tr: 'Çocuğun var mı?', UiLang.en: 'Do you have children?'},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You're showing a photo.",
        expected: 'Esta é a minha família.',
      ),
      SpeakTurn(
        prompt: 'Someone asks about your siblings.',
        expected: 'Tenho dois irmãos e uma irmã.',
      ),
      SpeakTurn(
        prompt: 'They ask what your mother does.',
        expected: 'Minha mãe é médica.',
      ),
      SpeakTurn(
        prompt: "You're talking about your sister.",
        expected: 'Ela adora o irmão dela.',
      ),
      SpeakTurn(
        prompt: "You want to know a friend's daughter's age.",
        expected: 'Quantos anos tem sua filha?',
      ),
      SpeakTurn(
        prompt: 'They ask where your parents live.',
        expected: 'Meus pais moram em Izmir.',
      ),
      SpeakTurn(prompt: "You're asking a new friend.", expected: 'Você tem filhos?'),
    ],
  ),
  Scenario(
    id: 'pt_weather',
    lang: LearnLang.pt,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Hava durumu', UiLang.en: 'Weather'},
    clipLine: 'Como está o tempo hoje?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Şu an olan hava olayları için "-ndo" (gerundio) formundan önce "está" yardımcı fiili gerekir.',
        UiLang.en:
            'An ongoing weather event needs the auxiliary "está" before the gerund (-ndo) form.',
      },
      goodExample: 'Está chovendo hoje.',
      badExample: 'Chovendo hoje.',
    ),
    phrases: [
      Phrase(
        id: 'pt_weather_0',
        target: 'Como está o tempo hoje?',
        gloss: {
          UiLang.tr: 'Bugün hava nasıl?',
          UiLang.en: "What's the weather like today?",
        },
      ),
      Phrase(
        id: 'pt_weather_1',
        target: 'Está chovendo hoje.',
        gloss: {
          UiLang.tr: 'Bugün yağmur yağıyor.',
          UiLang.en: "It's raining today.",
        },
      ),
      Phrase(
        id: 'pt_weather_2',
        target: 'Está fazendo muito calor lá fora.',
        gloss: {
          UiLang.tr: 'Dışarısı çok sıcak.',
          UiLang.en: "It's really hot outside.",
        },
      ),
      Phrase(
        id: 'pt_weather_3',
        target: 'Leve um guarda-chuva, pode chover.',
        gloss: {
          UiLang.tr: 'Şemsiye al, yağmur yağabilir.',
          UiLang.en: 'Take an umbrella, it might rain.',
        },
      ),
      Phrase(
        id: 'pt_weather_4',
        target: 'Está fazendo muito frio esta manhã.',
        gloss: {
          UiLang.tr: 'Bu sabah dondurucu soğuk.',
          UiLang.en: "It's freezing this morning.",
        },
      ),
      Phrase(
        id: 'pt_weather_5',
        target: 'Eu adoro dias ensolarados.',
        gloss: {
          UiLang.tr: 'Güneşli günleri severim.',
          UiLang.en: 'I love sunny days.',
        },
      ),
      Phrase(
        id: 'pt_weather_6',
        target: 'Está ventando hoje?',
        gloss: {UiLang.tr: 'Bugün rüzgarlı mı?', UiLang.en: 'Is it windy today?'},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You're about to go outside.",
        expected: 'Como está o tempo hoje?',
      ),
      SpeakTurn(
        prompt: 'Someone asks about the weather.',
        expected: 'Está chovendo hoje.',
      ),
      SpeakTurn(
        prompt: 'You step outside.',
        expected: 'Está fazendo muito calor lá fora.',
      ),
      SpeakTurn(
        prompt: 'Your friend is leaving the house.',
        expected: 'Leve um guarda-chuva, pode chover.',
      ),
      SpeakTurn(
        prompt: 'You wake up and check the window.',
        expected: 'Está fazendo muito frio esta manhã.',
      ),
      SpeakTurn(
        prompt: "You're talking about your favorite weather.",
        expected: 'Eu adoro dias ensolarados.',
      ),
      SpeakTurn(
        prompt: "You're deciding what to wear.",
        expected: 'Está ventando hoje?',
      ),
    ],
  ),
  Scenario(
    id: 'pt_transport',
    lang: LearnLang.pt,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Ulaşım', UiLang.en: 'Getting around'},
    clipLine: 'Onde fica o ponto de ônibus mais próximo?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: 'Ulaşım aracı "de" ile söylenir (de ônibus), "em" ile değil.',
        UiLang.en: 'Mode of transport uses "de" (de ônibus), not "em".',
      },
      goodExample: 'Vou ao trabalho de ônibus.',
      badExample: 'Vou ao trabalho em ônibus.',
    ),
    phrases: [
      Phrase(
        id: 'pt_transport_0',
        target: 'Onde fica o ponto de ônibus mais próximo?',
        gloss: {
          UiLang.tr: 'En yakın otobüs durağı nerede?',
          UiLang.en: "Where's the nearest bus stop?",
        },
      ),
      Phrase(
        id: 'pt_transport_1',
        target: 'Vou ao trabalho de ônibus.',
        gloss: {
          UiLang.tr: 'İşe otobüsle gidiyorum.',
          UiLang.en: 'I go to work by bus.',
        },
      ),
      Phrase(
        id: 'pt_transport_2',
        target: 'Qual é a plataforma?',
        gloss: {UiLang.tr: 'Hangi peron?', UiLang.en: 'Which platform is it?'},
      ),
      Phrase(
        id: 'pt_transport_3',
        target: 'Uma passagem para o centro, por favor.',
        gloss: {
          UiLang.tr: 'Şehir merkezine bir bilet, lütfen.',
          UiLang.en: 'One ticket to the city center, please.',
        },
      ),
      Phrase(
        id: 'pt_transport_4',
        target: 'Este trem para no aeroporto?',
        gloss: {
          UiLang.tr: 'Bu tren havalimanında duruyor mu?',
          UiLang.en: 'Does this train stop at the airport?',
        },
      ),
      Phrase(
        id: 'pt_transport_5',
        target: 'Preciso de um táxi.',
        gloss: {UiLang.tr: 'Taksiye ihtiyacım var.', UiLang.en: 'I need a taxi.'},
      ),
      Phrase(
        id: 'pt_transport_6',
        target: 'Quanto tempo demora?',
        gloss: {UiLang.tr: 'Ne kadar sürüyor?', UiLang.en: 'How long does it take?'},
      ),
      Phrase(
        id: 'pt_transport_7',
        target: 'Prefiro ir a pé.',
        gloss: {
          UiLang.tr: 'Yürüyerek gitmeyi tercih ederim.',
          UiLang.en: 'I prefer to go on foot.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You need to find a bus.',
        expected: 'Onde fica o ponto de ônibus mais próximo?',
      ),
      SpeakTurn(
        prompt: 'Someone asks how you commute.',
        expected: 'Vou ao trabalho de ônibus.',
      ),
      SpeakTurn(prompt: "You're at the train station.", expected: 'Qual é a plataforma?'),
      SpeakTurn(
        prompt: 'At the ticket counter.',
        expected: 'Uma passagem para o centro, por favor.',
      ),
      SpeakTurn(
        prompt: "You're not sure of the route.",
        expected: 'Este trem para no aeroporto?',
      ),
      SpeakTurn(prompt: 'You missed the last bus.', expected: 'Preciso de um táxi.'),
      SpeakTurn(
        prompt: "You're asking about travel time.",
        expected: 'Quanto tempo demora?',
      ),
      SpeakTurn(
        prompt: "It's a short distance.",
        expected: 'Prefiro ir a pé.',
      ),
    ],
  ),
  Scenario(
    id: 'pt_emergency',
    lang: LearnLang.pt,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Acil durum', UiLang.en: 'Emergency'},
    clipLine: 'Socorro! Chamem uma ambulância!',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Fiziksel durumlar ("estar com" + isim) ile anlatılır, "ser" ile değil.',
        UiLang.en:
            'Describe a physical state with "estar com" + noun (estou com dor), not "ser".',
      },
      goodExample: 'Estou com muita dor.',
      badExample: 'Sou com muita dor.',
    ),
    phrases: [
      Phrase(
        id: 'pt_emergency_0',
        target: 'Socorro! Chamem uma ambulância!',
        gloss: {
          UiLang.tr: 'İmdat! Ambulans çağırın!',
          UiLang.en: 'Help! Call an ambulance!',
        },
      ),
      Phrase(
        id: 'pt_emergency_1',
        target: 'Houve um acidente.',
        gloss: {
          UiLang.tr: 'Bir kaza oldu.',
          UiLang.en: "There's been an accident.",
        },
      ),
      Phrase(
        id: 'pt_emergency_2',
        target: 'Preciso de um médico agora.',
        gloss: {
          UiLang.tr: 'Şimdi bir doktora ihtiyacım var.',
          UiLang.en: 'I need a doctor now.',
        },
      ),
      Phrase(
        id: 'pt_emergency_3',
        target: 'Onde fica o hospital mais próximo?',
        gloss: {
          UiLang.tr: 'En yakın hastane nerede?',
          UiLang.en: 'Where is the nearest hospital?',
        },
      ),
      Phrase(
        id: 'pt_emergency_4',
        target: 'Alguém roubou minha bolsa.',
        gloss: {
          UiLang.tr: 'Biri çantamı çaldı.',
          UiLang.en: 'Someone stole my bag.',
        },
      ),
      Phrase(
        id: 'pt_emergency_5',
        target: 'Sou alérgico a penicilina.',
        gloss: {
          UiLang.tr: 'Penisiline alerjim var.',
          UiLang.en: "I'm allergic to penicillin.",
        },
      ),
      Phrase(
        id: 'pt_emergency_6',
        target: 'Chamem a polícia, por favor.',
        gloss: {
          UiLang.tr: 'Lütfen polisi arayın.',
          UiLang.en: 'Please call the police.',
        },
      ),
      Phrase(
        id: 'pt_emergency_7',
        target: 'Estou com muita dor.',
        gloss: {
          UiLang.tr: 'Çok ağrım var.',
          UiLang.en: "I'm in a lot of pain.",
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You see someone collapse.',
        expected: 'Socorro! Chamem uma ambulância!',
      ),
      SpeakTurn(
        prompt: 'You call emergency services.',
        expected: 'Houve um acidente.',
      ),
      SpeakTurn(
        prompt: 'You describe the urgency.',
        expected: 'Preciso de um médico agora.',
      ),
      SpeakTurn(
        prompt: 'You need directions fast.',
        expected: 'Onde fica o hospital mais próximo?',
      ),
      SpeakTurn(
        prompt: "You're reporting a theft.",
        expected: 'Alguém roubou minha bolsa.',
      ),
      SpeakTurn(
        prompt: 'A doctor asks about allergies.',
        expected: 'Sou alérgico a penicilina.',
      ),
      SpeakTurn(
        prompt: 'You need official help.',
        expected: 'Chamem a polícia, por favor.',
      ),
      SpeakTurn(
        prompt: "You're describing how you feel.",
        expected: 'Estou com muita dor.',
      ),
    ],
  ),
  Scenario(
    id: 'pt_routine',
    lang: LearnLang.pt,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Günlük rutin', UiLang.en: 'Daily routine'},
    clipLine: 'Normalmente eu me levanto às sete.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Dönüşlü zamir özneyle uyumlu olmalı (eu me, nós nos), her zaman "se" değil.',
        UiLang.en: 'The reflexive pronoun must match the subject (eu me, nós nos), not always "se".',
      },
      goodExample: 'Nós nos deitamos tarde.',
      badExample: 'Nós se deitamos tarde.',
    ),
    phrases: [
      Phrase(
        id: 'pt_routine_0',
        target: 'Normalmente eu me levanto às sete.',
        gloss: {
          UiLang.tr: 'Genelde saat yedide kalkarım.',
          UiLang.en: 'I usually wake up at seven.',
        },
      ),
      Phrase(
        id: 'pt_routine_1',
        target: 'Ela toma banho todas as manhãs.',
        gloss: {
          UiLang.tr: 'Her sabah duş alır.',
          UiLang.en: 'She takes a shower every morning.',
        },
      ),
      Phrase(
        id: 'pt_routine_2',
        target: 'Nós tomamos café da manhã juntos.',
        gloss: {
          UiLang.tr: 'Birlikte kahvaltı yaparız.',
          UiLang.en: 'We have breakfast together.',
        },
      ),
      Phrase(
        id: 'pt_routine_3',
        target: 'Ele vai ao trabalho de bicicleta.',
        gloss: {
          UiLang.tr: 'İşe bisikletle gider.',
          UiLang.en: 'He goes to work by bike.',
        },
      ),
      Phrase(
        id: 'pt_routine_4',
        target: 'Eu sempre escovo os dentes duas vezes ao dia.',
        gloss: {
          UiLang.tr: 'Her zaman günde iki kez dişlerimi fırçalarım.',
          UiLang.en: 'I always brush my teeth twice a day.',
        },
      ),
      Phrase(
        id: 'pt_routine_5',
        target: 'Nós nos deitamos tarde nos fins de semana.',
        gloss: {
          UiLang.tr: 'Hafta sonları geç yatarız.',
          UiLang.en: 'We go to bed late on weekends.',
        },
      ),
      Phrase(
        id: 'pt_routine_6',
        target: 'Aos domingos, eu durmo até tarde.',
        gloss: {
          UiLang.tr: 'Pazar günleri geç kalkarım.',
          UiLang.en: 'On Sundays, I sleep in.',
        },
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Someone asks about your morning.',
        expected: 'Normalmente eu me levanto às sete.',
      ),
      SpeakTurn(
        prompt: "You describe your sister's routine.",
        expected: 'Ela toma banho todas as manhãs.',
      ),
      SpeakTurn(
        prompt: "You talk about your family's mornings.",
        expected: 'Nós tomamos café da manhã juntos.',
      ),
      SpeakTurn(
        prompt: "You describe your brother's commute.",
        expected: 'Ele vai ao trabalho de bicicleta.',
      ),
      SpeakTurn(
        prompt: "You're talking about hygiene habits.",
        expected: 'Eu sempre escovo os dentes duas vezes ao dia.',
      ),
      SpeakTurn(
        prompt: 'You describe your household on weekends.',
        expected: 'Nós nos deitamos tarde nos fins de semana.',
      ),
      SpeakTurn(
        prompt: 'Someone asks about your weekend.',
        expected: 'Aos domingos, eu durmo até tarde.',
      ),
    ],
  ),
  Scenario(
    id: 'pt_past_story',
    lang: LearnLang.pt,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Bir olayı anlatmak', UiLang.en: 'Telling a story'},
    clipLine: 'Ontem fui ao mercado.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Düzenli -ar fiillerinin geçmiş zamanı ("pretérito perfeito") "eu" hali -ei ile biter, -o ile değil.',
        UiLang.en:
            'Regular -ar verbs in the simple past end in -ei for "eu" (comprei), not the present -o.',
      },
      goodExample: 'Comprei legumes frescos.',
      badExample: 'Compro legumes frescos.',
    ),
    phrases: [
      Phrase(
        id: 'pt_past_story_0',
        target: 'Ontem fui ao mercado.',
        gloss: {
          UiLang.tr: 'Dün pazara gittim.',
          UiLang.en: 'Yesterday I went to the market.',
        },
      ),
      Phrase(
        id: 'pt_past_story_1',
        target: 'Comprei legumes frescos.',
        gloss: {
          UiLang.tr: 'Biraz taze sebze aldım.',
          UiLang.en: 'I bought some fresh vegetables.',
        },
      ),
      Phrase(
        id: 'pt_past_story_2',
        target: 'Depois encontrei um velho amigo.',
        gloss: {
          UiLang.tr: 'Sonra eski bir arkadaşımla karşılaştım.',
          UiLang.en: 'Then I met an old friend.',
        },
      ),
      Phrase(
        id: 'pt_past_story_3',
        target: 'Conversamos por uma hora.',
        gloss: {UiLang.tr: 'Bir saat konuştuk.', UiLang.en: 'We talked for an hour.'},
      ),
      Phrase(
        id: 'pt_past_story_4',
        target: 'Perdi minha carteira no caminho para casa.',
        gloss: {
          UiLang.tr: 'Eve dönerken cüzdanımı kaybettim.',
          UiLang.en: 'I lost my wallet on the way home.',
        },
      ),
      Phrase(
        id: 'pt_past_story_5',
        target: 'Por sorte, alguém a encontrou.',
        gloss: {
          UiLang.tr: 'Neyse ki biri buldu.',
          UiLang.en: 'Luckily, someone found it.',
        },
      ),
      Phrase(
        id: 'pt_past_story_6',
        target: 'Foi um dia maluco!',
        gloss: {UiLang.tr: 'Çılgın bir gündü!', UiLang.en: 'It was a crazy day!'},
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: "You're telling a friend about your day.",
        expected: 'Ontem fui ao mercado.',
      ),
      SpeakTurn(
        prompt: 'You continue the story.',
        expected: 'Comprei legumes frescos.',
      ),
      SpeakTurn(
        prompt: 'Something unexpected happened.',
        expected: 'Depois encontrei um velho amigo.',
      ),
      SpeakTurn(
        prompt: 'You describe the encounter.',
        expected: 'Conversamos por uma hora.',
      ),
      SpeakTurn(
        prompt: 'Something went wrong.',
        expected: 'Perdi minha carteira no caminho para casa.',
      ),
      SpeakTurn(
        prompt: 'It has a happy ending.',
        expected: 'Por sorte, alguém a encontrou.',
      ),
      SpeakTurn(
        prompt: "You're wrapping up the story.",
        expected: 'Foi um dia maluco!',
      ),
    ],
  ),
];

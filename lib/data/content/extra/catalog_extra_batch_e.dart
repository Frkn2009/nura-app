// Batch E — A1 dalga 1 eksik 9 konu: zh (Mandarin), ja (Japanese), ko (Korean)
// Konular: intro, shopping, numbers_time, family, weather, transport,
// emergency, routine, past_story. Bkz. docs/ICERIK_URETIM_BRIEFI.md.
// ignore_for_file: lines_longer_than_80_chars

import '../../models/models.dart';

final List<Scenario> catalogExtraBatchE = [
  // ===================== MANDARIN CHINESE (zh) =====================
  Scenario(
    id: 'zh_intro',
    lang: LearnLang.zh,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Tanışma', UiLang.en: 'Meeting someone'},
    clipLine: '你好，很高兴认识你。',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            '呢 kelimesini bir isim veya zamirden sonra eklersen, tüm soruyu tekrar etmeden "Ya sen?" demiş olursun.',
        UiLang.en:
            'Add 呢 (ne) right after a noun or pronoun to ask "What about ___?" without repeating the whole question.',
      },
      goodExample: '我是学生，你呢？',
      badExample: '我是学生，你是呢？',
    ),
    phrases: [
      Phrase(
        id: 'zh_intro_0',
        target: '你好，很高兴认识你。',
        gloss: {
          UiLang.tr: 'Merhaba, tanıştığımıza memnun oldum.',
          UiLang.en: 'Hi, nice to meet you.',
        },
        ipa: 'Nǐ hǎo, hěn gāoxìng rènshi nǐ.',
      ),
      Phrase(
        id: 'zh_intro_1',
        target: '我叫德尼兹。',
        gloss: {UiLang.tr: 'Adım Deniz.', UiLang.en: 'My name is Deniz.'},
        ipa: 'Wǒ jiào Dénízī.',
        hint: '德尼兹 is a phonetic rendering of the name "Deniz".',
      ),
      Phrase(
        id: 'zh_intro_2',
        target: '你叫什么名字？',
        gloss: {UiLang.tr: 'Senin adın ne?', UiLang.en: "What's your name?"},
        ipa: 'Nǐ jiào shénme míngzi?',
      ),
      Phrase(
        id: 'zh_intro_3',
        target: '你是哪里人？',
        gloss: {
          UiLang.tr: 'Nerelisin?',
          UiLang.en: 'Where are you from?',
        },
        ipa: 'Nǐ shì nǎlǐ rén?',
      ),
      Phrase(
        id: 'zh_intro_4',
        target: '我是土耳其人。',
        gloss: {
          UiLang.tr: 'Ben Türküm.',
          UiLang.en: "I'm from Turkey.",
        },
        ipa: "Wǒ shì Tǔ'ěrqí rén.",
      ),
      Phrase(
        id: 'zh_intro_5',
        target: '你做什么工作？',
        gloss: {
          UiLang.tr: 'Ne iş yapıyorsun?',
          UiLang.en: 'What do you do for work?',
        },
        ipa: 'Nǐ zuò shénme gōngzuò?',
      ),
      Phrase(
        id: 'zh_intro_6',
        target: '我是学生，你呢？',
        gloss: {
          UiLang.tr: 'Ben öğrenciyim, ya sen?',
          UiLang.en: "I'm a student, and you?",
        },
        ipa: 'Wǒ shì xuésheng, nǐ ne?',
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'A stranger smiles and greets you.',
        expected: '你好，很高兴认识你。',
      ),
      SpeakTurn(prompt: 'They wait for your name.', expected: '我叫德尼兹。'),
      SpeakTurn(
        prompt: 'You want to know their name too.',
        expected: '你叫什么名字？',
      ),
      SpeakTurn(
        prompt: 'You are curious where they are from.',
        expected: '你是哪里人？',
      ),
      SpeakTurn(
        prompt: 'They ask where you are from.',
        expected: '我是土耳其人。',
      ),
      SpeakTurn(
        prompt: 'You want to know their job.',
        expected: '你做什么工作？',
      ),
      SpeakTurn(
        prompt: 'They ask what you do.',
        expected: '我是学生，你呢？',
      ),
    ],
  ),
  Scenario(
    id: 'zh_shopping',
    lang: LearnLang.zh,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Kıyafet alışverişi', UiLang.en: 'Clothes shopping'},
    clipLine: '请问，这个有别的颜色吗？',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'Sayı ile isim arasına mutlaka bir ölçü kelimesi (量词) gelir; kıyafetler için bu "件"dir.',
        UiLang.en:
            'A number and a noun always need a measure word between them; for clothing items, that word is 件 (jiàn).',
      },
      goodExample: '我要一件衬衫。',
      badExample: '我要一衬衫。',
    ),
    phrases: [
      Phrase(
        id: 'zh_shopping_0',
        target: '请问，这个有别的颜色吗？',
        gloss: {
          UiLang.tr: 'Afedersiniz, bunun başka rengi var mı?',
          UiLang.en: 'Excuse me, does this come in another color?',
        },
        ipa: 'Qǐngwèn, zhège yǒu biéde yánsè ma?',
      ),
      Phrase(
        id: 'zh_shopping_1',
        target: '我可以试穿吗？',
        gloss: {
          UiLang.tr: 'Deneyebilir miyim?',
          UiLang.en: 'Can I try it on?',
        },
        ipa: 'Wǒ kěyǐ shìchuān ma?',
      ),
      Phrase(
        id: 'zh_shopping_2',
        target: '试衣间在哪里？',
        gloss: {
          UiLang.tr: 'Deneme kabini nerede?',
          UiLang.en: 'Where is the fitting room?',
        },
        ipa: 'Shìyījiān zài nǎlǐ?',
      ),
      Phrase(
        id: 'zh_shopping_3',
        target: '有小一点的号码吗？',
        gloss: {
          UiLang.tr: 'Biraz daha küçük beden var mı?',
          UiLang.en: 'Do you have a smaller size?',
        },
        ipa: 'Yǒu xiǎo yìdiǎn de hàomǎ ma?',
      ),
      Phrase(
        id: 'zh_shopping_4',
        target: '我要这件。',
        gloss: {
          UiLang.tr: 'Bunu alayım.',
          UiLang.en: "I'll take this one.",
        },
        ipa: 'Wǒ yào zhè jiàn.',
      ),
      Phrase(
        id: 'zh_shopping_5',
        target: '可以刷卡吗？',
        gloss: {
          UiLang.tr: 'Kartla ödeyebilir miyim?',
          UiLang.en: 'Can I pay by card?',
        },
        ipa: 'Kěyǐ shuākǎ ma?',
      ),
      Phrase(
        id: 'zh_shopping_6',
        target: '可以给我发票吗？',
        gloss: {
          UiLang.tr: 'Fiş alabilir miyim?',
          UiLang.en: 'Can I get a receipt?',
        },
        ipa: 'Kěyǐ gěi wǒ fāpiào ma?',
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You are looking at a shirt.',
        expected: '请问，这个有别的颜色吗？',
      ),
      SpeakTurn(prompt: 'You like the shirt.', expected: '我可以试穿吗？'),
      SpeakTurn(prompt: 'You want to try it on.', expected: '试衣间在哪里？'),
      SpeakTurn(prompt: 'It does not fit.', expected: '有小一点的号码吗？'),
      SpeakTurn(prompt: 'You decide to buy it.', expected: '我要这件。'),
      SpeakTurn(prompt: 'You are ready to pay.', expected: '可以刷卡吗？'),
      SpeakTurn(prompt: 'You need proof of purchase.', expected: '可以给我发票吗？'),
    ],
  ),
  Scenario(
    id: 'zh_numbers_time',
    lang: LearnLang.zh,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Sayılar ve saat', UiLang.en: 'Numbers & time'},
    clipLine: '现在几点？',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: 'Saat söylerken önce saat (点), sonra dakika ya da "buçuk" (半) gelir.',
        UiLang.en:
            "When telling time, say the hour (点) first, then the minutes or 'half' (半).",
      },
      goodExample: '九点半',
      badExample: '半九点',
    ),
    phrases: [
      Phrase(
        id: 'zh_numbers_time_0',
        target: '现在几点？',
        gloss: {UiLang.tr: 'Saat kaç?', UiLang.en: 'What time is it now?'},
        ipa: 'Xiànzài jǐ diǎn?',
      ),
      Phrase(
        id: 'zh_numbers_time_1',
        target: '三点。',
        gloss: {UiLang.tr: 'Saat üç.', UiLang.en: "It's three o'clock."},
        ipa: 'Sān diǎn.',
      ),
      Phrase(
        id: 'zh_numbers_time_2',
        target: '火车几点开？',
        gloss: {
          UiLang.tr: 'Tren saat kaçta kalkıyor?',
          UiLang.en: 'What time does the train leave?',
        },
        ipa: 'Huǒchē jǐ diǎn kāi?',
      ),
      Phrase(
        id: 'zh_numbers_time_3',
        target: '九点半开。',
        gloss: {
          UiLang.tr: 'Dokuz buçukta kalkıyor.',
          UiLang.en: 'It leaves at nine thirty.',
        },
        ipa: 'Jiǔ diǎn bàn kāi.',
      ),
      Phrase(
        id: 'zh_numbers_time_4',
        target: '我们晚上七点见面吧。',
        gloss: {
          UiLang.tr: 'Akşam yedide buluşalım.',
          UiLang.en: "Let's meet at seven in the evening.",
        },
        ipa: 'Wǒmen wǎnshang qī diǎn jiànmiàn ba.',
      ),
      Phrase(
        id: 'zh_numbers_time_5',
        target: '一共二十块。',
        gloss: {
          UiLang.tr: 'Toplam yirmi yuan.',
          UiLang.en: "That's twenty yuan in total.",
        },
        ipa: 'Yígòng èrshí kuài.',
      ),
      Phrase(
        id: 'zh_numbers_time_6',
        target: '我十分钟后到。',
        gloss: {
          UiLang.tr: 'On dakikaya varırım.',
          UiLang.en: "I'll arrive in ten minutes.",
        },
        ipa: 'Wǒ shí fēnzhōng hòu dào.',
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'You check your watch.', expected: '现在几点？'),
      SpeakTurn(prompt: 'Someone asks the time.', expected: '三点。'),
      SpeakTurn(prompt: 'You are at the station.', expected: '火车几点开？'),
      SpeakTurn(prompt: 'The clerk checks the schedule.', expected: '九点半开。'),
      SpeakTurn(
        prompt: 'You are planning to meet a friend.',
        expected: '我们晚上七点见面吧。',
      ),
      SpeakTurn(
        prompt: 'The cashier tells you the total.',
        expected: '一共二十块。',
      ),
      SpeakTurn(prompt: 'You are running late.', expected: '我十分钟后到。'),
    ],
  ),
  Scenario(
    id: 'zh_family',
    lang: LearnLang.zh,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Aile', UiLang.en: 'Family'},
    clipLine: '这是我的家人。',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: 'Bir şeye/birine sahip olduğunu söylemek için 有 kullanılır, 是 değil.',
        UiLang.en:
            "Use 有 (yǒu, 'to have') to say you possess or have something, not 是 (shì, 'to be').",
      },
      goodExample: '我有两个哥哥。',
      badExample: '我是两个哥哥。',
    ),
    phrases: [
      Phrase(
        id: 'zh_family_0',
        target: '这是我的家人。',
        gloss: {UiLang.tr: 'Bu benim ailem.', UiLang.en: 'This is my family.'},
        ipa: 'Zhè shì wǒ de jiārén.',
      ),
      Phrase(
        id: 'zh_family_1',
        target: '我有两个哥哥。',
        gloss: {
          UiLang.tr: 'İki abim var.',
          UiLang.en: 'I have two older brothers.',
        },
        ipa: 'Wǒ yǒu liǎng ge gēge.',
      ),
      Phrase(
        id: 'zh_family_2',
        target: '我妈妈是老师。',
        gloss: {UiLang.tr: 'Annem öğretmen.', UiLang.en: 'My mom is a teacher.'},
        ipa: 'Wǒ māma shì lǎoshī.',
      ),
      Phrase(
        id: 'zh_family_3',
        target: '我爸爸在医院工作。',
        gloss: {
          UiLang.tr: 'Babam hastanede çalışıyor.',
          UiLang.en: 'My dad works at a hospital.',
        },
        ipa: 'Wǒ bàba zài yīyuàn gōngzuò.',
      ),
      Phrase(
        id: 'zh_family_4',
        target: '你有兄弟姐妹吗？',
        gloss: {
          UiLang.tr: 'Kardeşin var mı?',
          UiLang.en: 'Do you have any siblings?',
        },
        ipa: 'Nǐ yǒu xiōngdì jiěmèi ma?',
      ),
      Phrase(
        id: 'zh_family_5',
        target: '我是家里最小的。',
        gloss: {
          UiLang.tr: 'Ailede en küçüğüyüm.',
          UiLang.en: "I'm the youngest in the family.",
        },
        ipa: 'Wǒ shì jiāli zuì xiǎo de.',
      ),
      Phrase(
        id: 'zh_family_6',
        target: '我奶奶跟我们一起住。',
        gloss: {
          UiLang.tr: 'Anneannem bizimle yaşıyor.',
          UiLang.en: 'My grandma lives with us.',
        },
        ipa: 'Wǒ nǎinai gēn wǒmen yìqǐ zhù.',
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'You show a photo.', expected: '这是我的家人。'),
      SpeakTurn(prompt: 'They ask about your siblings.', expected: '我有两个哥哥。'),
      SpeakTurn(prompt: 'They ask about your mother.', expected: '我妈妈是老师。'),
      SpeakTurn(prompt: 'They ask about your father.', expected: '我爸爸在医院工作。'),
      SpeakTurn(
        prompt: 'You ask them the same question.',
        expected: '你有兄弟姐妹吗？',
      ),
      SpeakTurn(
        prompt: 'They ask your place in the family.',
        expected: '我是家里最小的。',
      ),
      SpeakTurn(
        prompt: 'They ask who else lives with you.',
        expected: '我奶奶跟我们一起住。',
      ),
    ],
  ),
  Scenario(
    id: 'zh_weather',
    lang: LearnLang.zh,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Hava durumu', UiLang.en: 'Weather'},
    clipLine: '今天天气怎么样？',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: 'Sıfatlar Çincede doğrudan yüklem olur, önüne 很 gelir; 是 kullanılmaz.',
        UiLang.en:
            "Adjectives act as the predicate directly in Chinese, usually preceded by 很 (hěn); don't add 是 (shì).",
      },
      goodExample: '今天很冷。',
      badExample: '今天是冷。',
    ),
    phrases: [
      Phrase(
        id: 'zh_weather_0',
        target: '今天天气怎么样？',
        gloss: {
          UiLang.tr: 'Bugün hava nasıl?',
          UiLang.en: "What's the weather like today?",
        },
        ipa: 'Jīntiān tiānqì zěnmeyàng?',
      ),
      Phrase(
        id: 'zh_weather_1',
        target: '今天很晴朗。',
        gloss: {UiLang.tr: 'Bugün güneşli.', UiLang.en: "It's sunny today."},
        ipa: 'Jīntiān hěn qínglǎng.',
      ),
      Phrase(
        id: 'zh_weather_2',
        target: '外面在下雨。',
        gloss: {
          UiLang.tr: 'Dışarıda yağmur yağıyor.',
          UiLang.en: "It's raining outside.",
        },
        ipa: 'Wàimiàn zài xiàyǔ.',
      ),
      Phrase(
        id: 'zh_weather_3',
        target: '今天早上很冷。',
        gloss: {
          UiLang.tr: 'Bu sabah çok soğuk.',
          UiLang.en: "It's very cold this morning.",
        },
        ipa: 'Jīntiān zǎoshang hěn lěng.',
      ),
      Phrase(
        id: 'zh_weather_4',
        target: '明天会热吗？',
        gloss: {
          UiLang.tr: 'Yarın sıcak olacak mı?',
          UiLang.en: 'Will it be hot tomorrow?',
        },
        ipa: 'Míngtiān huì rè ma?',
      ),
      Phrase(
        id: 'zh_weather_5',
        target: '带把伞吧，可能会下雨。',
        gloss: {
          UiLang.tr: 'Şemsiye al, yağmur yağabilir.',
          UiLang.en: 'Bring an umbrella, it might rain.',
        },
        ipa: 'Dài bǎ sǎn ba, kěnéng huì xiàyǔ.',
      ),
      Phrase(
        id: 'zh_weather_6',
        target: '我喜欢晴天。',
        gloss: {
          UiLang.tr: 'Güneşli günleri severim.',
          UiLang.en: 'I like sunny days.',
        },
        ipa: 'Wǒ xǐhuan qíngtiān.',
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'You look outside.', expected: '今天天气怎么样？'),
      SpeakTurn(prompt: 'You check the sky.', expected: '今天很晴朗。'),
      SpeakTurn(prompt: 'You hear rain outside.', expected: '外面在下雨。'),
      SpeakTurn(prompt: 'You feel a chill.', expected: '今天早上很冷。'),
      SpeakTurn(prompt: "You check tomorrow's forecast.", expected: '明天会热吗？'),
      SpeakTurn(
        prompt: 'A friend is leaving without a coat.',
        expected: '带把伞吧，可能会下雨。',
      ),
      SpeakTurn(
        prompt: 'They ask about your favorite weather.',
        expected: '我喜欢晴天。',
      ),
    ],
  ),
  Scenario(
    id: 'zh_transport',
    lang: LearnLang.zh,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Ulaşım', UiLang.en: 'Getting around'},
    clipLine: '请问，市中心怎么走？',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'İçine oturarak binilen araçlar için 坐, üzerine binilenler (bisiklet gibi) için 骑 kullanılır.',
        UiLang.en:
            'Use 坐 (zuò) for vehicles you sit inside (bus, car, train) and 骑 (qí) for ones you straddle (bike, motorbike).',
      },
      goodExample: '我坐公交车上班。',
      badExample: '我骑公交车上班。',
    ),
    phrases: [
      Phrase(
        id: 'zh_transport_0',
        target: '请问，市中心怎么走？',
        gloss: {
          UiLang.tr: 'Affedersiniz, şehir merkezine nasıl gidilir?',
          UiLang.en: 'Excuse me, how do I get downtown?',
        },
        ipa: 'Qǐngwèn, shìzhōngxīn zěnme zǒu?',
      ),
      Phrase(
        id: 'zh_transport_1',
        target: '我坐公交车上班。',
        gloss: {
          UiLang.tr: 'İşe otobüsle giderim.',
          UiLang.en: 'I take the bus to work.',
        },
        ipa: 'Wǒ zuò gōngjiāochē shàngbān.',
      ),
      Phrase(
        id: 'zh_transport_2',
        target: '最近的地铁站在哪里？',
        gloss: {
          UiLang.tr: 'En yakın metro istasyonu nerede?',
          UiLang.en: "Where's the nearest subway station?",
        },
        ipa: 'Zuìjìn de dìtiězhàn zài nǎlǐ?',
      ),
      Phrase(
        id: 'zh_transport_3',
        target: '这辆车去机场吗？',
        gloss: {
          UiLang.tr: 'Bu otobüs havaalanına gidiyor mu?',
          UiLang.en: 'Does this bus go to the airport?',
        },
        ipa: 'Zhè liàng chē qù jīchǎng ma?',
      ),
      Phrase(
        id: 'zh_transport_4',
        target: '请给我一张去中央车站的票。',
        gloss: {
          UiLang.tr: 'Merkez istasyona bir bilet, lütfen.',
          UiLang.en: 'One ticket to the central station, please.',
        },
        ipa: 'Qǐng gěi wǒ yì zhāng qù zhōngyāng chēzhàn de piào.',
      ),
      Phrase(
        id: 'zh_transport_5',
        target: '最后一班火车几点开？',
        gloss: {
          UiLang.tr: 'Son tren saat kaçta kalkıyor?',
          UiLang.en: 'What time does the last train leave?',
        },
        ipa: 'Zuìhòu yì bān huǒchē jǐ diǎn kāi?',
      ),
      Phrase(
        id: 'zh_transport_6',
        target: '我想走路去，很近。',
        gloss: {
          UiLang.tr: 'Yürüyerek gitmek istiyorum, çok yakın.',
          UiLang.en: "I'd rather walk, it's close.",
        },
        ipa: 'Wǒ xiǎng zǒulù qù, hěn jìn.',
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'You are lost downtown.', expected: '请问，市中心怎么走？'),
      SpeakTurn(
        prompt: 'They ask how you get to work.',
        expected: '我坐公交车上班。',
      ),
      SpeakTurn(prompt: 'You need the subway.', expected: '最近的地铁站在哪里？'),
      SpeakTurn(prompt: 'A bus pulls up.', expected: '这辆车去机场吗？'),
      SpeakTurn(
        prompt: 'You are at the ticket counter.',
        expected: '请给我一张去中央车站的票。',
      ),
      SpeakTurn(
        prompt: 'You want to catch the last train.',
        expected: '最后一班火车几点开？',
      ),
      SpeakTurn(prompt: 'A friend offers you a ride.', expected: '我想走路去，很近。'),
    ],
  ),
  Scenario(
    id: 'zh_emergency',
    lang: LearnLang.zh,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Acil durum', UiLang.en: 'Emergency'},
    clipLine: '救命！',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            '"Birine yardım ederek bir şey yaptırmak" için 帮 + kişi + fiil kalıbı kullanılır, araya 的 girmez.',
        UiLang.en:
            "To say 'help someone do something', use 帮 + person + verb — no 的 goes in between.",
      },
      goodExample: '请帮我叫警察。',
      badExample: '请帮我叫的警察。',
    ),
    phrases: [
      Phrase(
        id: 'zh_emergency_0',
        target: '救命！',
        gloss: {UiLang.tr: 'İmdat!', UiLang.en: 'Help!'},
        ipa: 'Jiùmìng!',
      ),
      Phrase(
        id: 'zh_emergency_1',
        target: '请帮我叫救护车。',
        gloss: {
          UiLang.tr: 'Lütfen ambulans çağırın.',
          UiLang.en: 'Please help me call an ambulance.',
        },
        ipa: 'Qǐng bāng wǒ jiào jiùhùchē.',
      ),
      Phrase(
        id: 'zh_emergency_2',
        target: '我需要看医生。',
        gloss: {UiLang.tr: 'Doktora ihtiyacım var.', UiLang.en: 'I need a doctor.'},
        ipa: 'Wǒ xūyào kàn yīshēng.',
      ),
      Phrase(
        id: 'zh_emergency_3',
        target: '请帮我叫警察。',
        gloss: {
          UiLang.tr: 'Lütfen polis çağırın.',
          UiLang.en: 'Please call the police.',
        },
        ipa: 'Qǐng bāng wǒ jiào jǐngchá.',
      ),
      Phrase(
        id: 'zh_emergency_4',
        target: '我的护照丢了。',
        gloss: {
          UiLang.tr: 'Pasaportumu kaybettim.',
          UiLang.en: 'I lost my passport.',
        },
        ipa: 'Wǒ de hùzhào diū le.',
      ),
      Phrase(
        id: 'zh_emergency_5',
        target: '着火了！',
        gloss: {UiLang.tr: 'Yangın var!', UiLang.en: "There's a fire!"},
        ipa: 'Zháohuǒ le!',
      ),
      Phrase(
        id: 'zh_emergency_6',
        target: '最近的医院在哪里？',
        gloss: {
          UiLang.tr: 'En yakın hastane nerede?',
          UiLang.en: "Where is the nearest hospital?",
        },
        ipa: 'Zuìjìn de yīyuàn zài nǎlǐ?',
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'Something dangerous just happened.', expected: '救命！'),
      SpeakTurn(
        prompt: 'Someone is badly hurt.',
        expected: '请帮我叫救护车。',
      ),
      SpeakTurn(prompt: 'You feel very sick.', expected: '我需要看医生。'),
      SpeakTurn(prompt: 'You just saw a robbery.', expected: '请帮我叫警察。'),
      SpeakTurn(prompt: 'You check your bag.', expected: '我的护照丢了。'),
      SpeakTurn(prompt: 'You smell smoke.', expected: '着火了！'),
      SpeakTurn(
        prompt: 'You need medical help nearby.',
        expected: '最近的医院在哪里？',
      ),
    ],
  ),
  Scenario(
    id: 'zh_routine',
    lang: LearnLang.zh,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Günlük rutin', UiLang.en: 'Daily routine'},
    clipLine: '我每天七点起床。',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: 'Zaman ifadesi (saat gibi) her zaman fiilden önce gelir, sonra değil.',
        UiLang.en:
            'A time expression (like a clock time) always comes before the verb, never after it.',
      },
      goodExample: '我每天七点起床。',
      badExample: '我每天起床七点。',
    ),
    phrases: [
      Phrase(
        id: 'zh_routine_0',
        target: '我每天七点起床。',
        gloss: {
          UiLang.tr: 'Her gün saat yedide kalkarım.',
          UiLang.en: 'I get up at seven every day.',
        },
        ipa: 'Wǒ měitiān qī diǎn qǐchuáng.',
      ),
      Phrase(
        id: 'zh_routine_1',
        target: '我刷牙，然后洗澡。',
        gloss: {
          UiLang.tr: 'Dişlerimi fırçalarım, sonra duş alırım.',
          UiLang.en: 'I brush my teeth, then take a shower.',
        },
        ipa: 'Wǒ shuāyá, ránhòu xǐzǎo.',
      ),
      Phrase(
        id: 'zh_routine_2',
        target: '我八点吃早饭。',
        gloss: {
          UiLang.tr: 'Saat sekizde kahvaltı ederim.',
          UiLang.en: 'I have breakfast at eight.',
        },
        ipa: 'Wǒ bā diǎn chī zǎofàn.',
      ),
      Phrase(
        id: 'zh_routine_3',
        target: '我骑自行车上班。',
        gloss: {
          UiLang.tr: 'İşe bisikletle giderim.',
          UiLang.en: 'I ride a bike to work.',
        },
        ipa: 'Wǒ qí zìxíngchē shàngbān.',
      ),
      Phrase(
        id: 'zh_routine_4',
        target: '我晚上六点下班。',
        gloss: {
          UiLang.tr: 'Akşam altıda işten çıkarım.',
          UiLang.en: 'I finish work at six in the evening.',
        },
        ipa: 'Wǒ wǎnshang liù diǎn xiàbān.',
      ),
      Phrase(
        id: 'zh_routine_5',
        target: '晚饭后，我看电视。',
        gloss: {
          UiLang.tr: 'Akşam yemeğinden sonra televizyon izlerim.',
          UiLang.en: 'After dinner, I watch TV.',
        },
        ipa: 'Wǎnfàn hòu, wǒ kàn diànshì.',
      ),
      Phrase(
        id: 'zh_routine_6',
        target: '我十一点睡觉。',
        gloss: {
          UiLang.tr: 'Saat on birde yatarım.',
          UiLang.en: 'I go to bed at eleven.',
        },
        ipa: 'Wǒ shíyī diǎn shuìjiào.',
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Someone asks about your mornings.',
        expected: '我每天七点起床。',
      ),
      SpeakTurn(
        prompt: 'You describe getting ready.',
        expected: '我刷牙，然后洗澡。',
      ),
      SpeakTurn(prompt: 'They ask about breakfast.', expected: '我八点吃早饭。'),
      SpeakTurn(
        prompt: 'They ask how you get to work.',
        expected: '我骑自行车上班。',
      ),
      SpeakTurn(
        prompt: 'They ask when your day ends.',
        expected: '我晚上六点下班。',
      ),
      SpeakTurn(
        prompt: 'They ask about your evenings.',
        expected: '晚饭后，我看电视。',
      ),
      SpeakTurn(prompt: 'They ask when you sleep.', expected: '我十一点睡觉。'),
    ],
  ),
  Scenario(
    id: 'zh_past_story',
    lang: LearnLang.zh,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {
      UiLang.tr: 'Geçmişte bir gün',
      UiLang.en: 'Telling a past event',
    },
    clipLine: '昨天我去了机场。',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: 'Tamamlanmış bir eylemi anlatırken fiilden hemen sonra 了 eklenir.',
        UiLang.en:
            'Add 了 (le) right after the verb to show the action is completed — no verb conjugation needed.',
      },
      goodExample: '昨天我去了机场。',
      badExample: '昨天我去机场。',
    ),
    phrases: [
      Phrase(
        id: 'zh_past_story_0',
        target: '昨天我去了机场。',
        gloss: {
          UiLang.tr: 'Dün havaalanına gittim.',
          UiLang.en: 'Yesterday I went to the airport.',
        },
        ipa: 'Zuótiān wǒ qùle jīchǎng.',
      ),
      Phrase(
        id: 'zh_past_story_1',
        target: '我在那里遇到了一个老朋友。',
        gloss: {
          UiLang.tr: 'Orada eski bir arkadaşımla karşılaştım.',
          UiLang.en: 'I met an old friend there.',
        },
        ipa: 'Wǒ zài nàlǐ yùdàole yí ge lǎo péngyou.',
      ),
      Phrase(
        id: 'zh_past_story_2',
        target: '我们一起喝了咖啡。',
        gloss: {
          UiLang.tr: 'Birlikte kahve içtik.',
          UiLang.en: 'We drank coffee together.',
        },
        ipa: 'Wǒmen yìqǐ hēle kāfēi.',
      ),
      Phrase(
        id: 'zh_past_story_3',
        target: '然后我错过了航班。',
        gloss: {
          UiLang.tr: 'Sonra uçağımı kaçırdım.',
          UiLang.en: 'Then I missed my flight.',
        },
        ipa: 'Ránhòu wǒ cuòguòle hángbān.',
      ),
      Phrase(
        id: 'zh_past_story_4',
        target: '我非常累。',
        gloss: {UiLang.tr: 'Çok yorgundum.', UiLang.en: 'I was very tired.'},
        ipa: 'Wǒ fēicháng lèi.',
      ),
      Phrase(
        id: 'zh_past_story_5',
        target: '我半夜才到家。',
        gloss: {
          UiLang.tr: 'Eve ancak gece yarısı vardım.',
          UiLang.en: 'I finally arrived home at midnight.',
        },
        ipa: 'Wǒ bànyè cái dào jiā.',
      ),
      Phrase(
        id: 'zh_past_story_6',
        target: '那真是漫长的一天。',
        gloss: {
          UiLang.tr: 'Gerçekten uzun bir gündü.',
          UiLang.en: 'It was a long day.',
        },
        ipa: 'Nà zhēnshi màncháng de yìtiān.',
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'They ask about your day yesterday.',
        expected: '昨天我去了机场。',
      ),
      SpeakTurn(
        prompt: 'They ask what happened there.',
        expected: '我在那里遇到了一个老朋友。',
      ),
      SpeakTurn(
        prompt: 'They ask what you did together.',
        expected: '我们一起喝了咖啡。',
      ),
      SpeakTurn(
        prompt: 'They ask what happened next.',
        expected: '然后我错过了航班。',
      ),
      SpeakTurn(prompt: 'They ask how you felt.', expected: '我非常累。'),
      SpeakTurn(
        prompt: 'They ask when you got home.',
        expected: '我半夜才到家。',
      ),
      SpeakTurn(
        prompt: 'They ask how your day was.',
        expected: '那真是漫长的一天。',
      ),
    ],
  ),

  // ===================== JAPANESE (ja) =====================
  Scenario(
    id: 'ja_intro',
    lang: LearnLang.ja,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Tanışma', UiLang.en: 'Meeting someone'},
    clipLine: 'こんにちは、はじめまして。',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'は konuyu işaretler (kim/ne hakkında konuştuğunu belirtir); nesne işareti を ile karıştırma.',
        UiLang.en:
            "は (wa) marks the topic — what you're talking about; don't confuse it with the object particle を (o).",
      },
      goodExample: 'わたしはデニズです。',
      badExample: 'わたしをデニズです。',
    ),
    phrases: [
      Phrase(
        id: 'ja_intro_0',
        target: 'こんにちは、はじめまして。',
        gloss: {
          UiLang.tr: 'Merhaba, tanıştığımıza memnun oldum.',
          UiLang.en: 'Hi, nice to meet you.',
        },
        ipa: 'Konnichiwa, hajimemashite.',
      ),
      Phrase(
        id: 'ja_intro_1',
        target: 'わたしはデニズです。',
        gloss: {UiLang.tr: 'Adım Deniz.', UiLang.en: 'My name is Deniz.'},
        ipa: 'Watashi wa Denizu desu.',
      ),
      Phrase(
        id: 'ja_intro_2',
        target: 'お名前は何ですか？',
        gloss: {UiLang.tr: 'Adınız ne?', UiLang.en: "What's your name?"},
        ipa: 'Onamae wa nan desu ka?',
      ),
      Phrase(
        id: 'ja_intro_3',
        target: 'どちらの出身ですか？',
        gloss: {
          UiLang.tr: 'Nerelisiniz?',
          UiLang.en: 'Where are you from?',
        },
        ipa: 'Dochira no shusshin desu ka?',
      ),
      Phrase(
        id: 'ja_intro_4',
        target: 'トルコから来ました。',
        gloss: {UiLang.tr: 'Türkiye\'den geldim.', UiLang.en: "I'm from Turkey."},
        ipa: 'Toruko kara kimashita.',
      ),
      Phrase(
        id: 'ja_intro_5',
        target: 'お仕事は何ですか？',
        gloss: {
          UiLang.tr: 'Ne iş yapıyorsunuz?',
          UiLang.en: 'What do you do for work?',
        },
        ipa: 'Oshigoto wa nan desu ka?',
      ),
      Phrase(
        id: 'ja_intro_6',
        target: '学生です。',
        gloss: {UiLang.tr: 'Öğrenciyim.', UiLang.en: "I'm a student."},
        ipa: 'Gakusei desu.',
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'A stranger smiles and greets you.',
        expected: 'こんにちは、はじめまして。',
      ),
      SpeakTurn(prompt: 'They wait for your name.', expected: 'わたしはデニズです。'),
      SpeakTurn(
        prompt: 'You want to know their name too.',
        expected: 'お名前は何ですか？',
      ),
      SpeakTurn(
        prompt: 'You are curious where they are from.',
        expected: 'どちらの出身ですか？',
      ),
      SpeakTurn(
        prompt: 'They ask where you are from.',
        expected: 'トルコから来ました。',
      ),
      SpeakTurn(
        prompt: 'You want to know their job.',
        expected: 'お仕事は何ですか？',
      ),
      SpeakTurn(prompt: 'They ask what you do.', expected: '学生です。'),
    ],
  ),
  Scenario(
    id: 'ja_shopping',
    lang: LearnLang.ja,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Kıyafet alışverişi', UiLang.en: 'Clothes shopping'},
    clipLine: 'すみません、これは他の色がありますか？',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: 'を, ください\'den (lütfen verin) önceki istenen şeyi işaretler.',
        UiLang.en:
            "を (o) marks the thing you're asking for right before ください ('please give me').",
      },
      goodExample: 'これをください。',
      badExample: 'これはください。',
    ),
    phrases: [
      Phrase(
        id: 'ja_shopping_0',
        target: 'すみません、これは他の色がありますか？',
        gloss: {
          UiLang.tr: 'Affedersiniz, bunun başka rengi var mı?',
          UiLang.en: 'Excuse me, does this come in another color?',
        },
        ipa: 'Sumimasen, kore wa hoka no iro ga arimasu ka?',
      ),
      Phrase(
        id: 'ja_shopping_1',
        target: '試着してもいいですか？',
        gloss: {
          UiLang.tr: 'Deneyebilir miyim?',
          UiLang.en: 'May I try it on?',
        },
        ipa: 'Shichaku shite mo ii desu ka?',
      ),
      Phrase(
        id: 'ja_shopping_2',
        target: '試着室はどこですか？',
        gloss: {
          UiLang.tr: 'Deneme kabini nerede?',
          UiLang.en: 'Where is the fitting room?',
        },
        ipa: 'Shichakushitsu wa doko desu ka?',
      ),
      Phrase(
        id: 'ja_shopping_3',
        target: 'もっと小さいサイズはありますか？',
        gloss: {
          UiLang.tr: 'Daha küçük beden var mı?',
          UiLang.en: 'Do you have a smaller size?',
        },
        ipa: 'Motto chiisai saizu wa arimasu ka?',
      ),
      Phrase(
        id: 'ja_shopping_4',
        target: 'これをください。',
        gloss: {
          UiLang.tr: 'Bunu alayım.',
          UiLang.en: "I'll take this, please.",
        },
        ipa: 'Kore o kudasai.',
      ),
      Phrase(
        id: 'ja_shopping_5',
        target: 'カードは使えますか？',
        gloss: {
          UiLang.tr: 'Kartla ödeyebilir miyim?',
          UiLang.en: 'Can I use a card?',
        },
        ipa: 'Kaado wa tsukaemasu ka?',
      ),
      Phrase(
        id: 'ja_shopping_6',
        target: 'レシートをください。',
        gloss: {
          UiLang.tr: 'Fiş alabilir miyim?',
          UiLang.en: 'Receipt, please.',
        },
        ipa: 'Reshiito o kudasai.',
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You are looking at a shirt.',
        expected: 'すみません、これは他の色がありますか？',
      ),
      SpeakTurn(prompt: 'You like the shirt.', expected: '試着してもいいですか？'),
      SpeakTurn(prompt: 'You want to try it on.', expected: '試着室はどこですか？'),
      SpeakTurn(
        prompt: 'It does not fit.',
        expected: 'もっと小さいサイズはありますか？',
      ),
      SpeakTurn(prompt: 'You decide to buy it.', expected: 'これをください。'),
      SpeakTurn(prompt: 'You are ready to pay.', expected: 'カードは使えますか？'),
      SpeakTurn(prompt: 'You need proof of purchase.', expected: 'レシートをください。'),
    ],
  ),
  Scenario(
    id: 'ja_numbers_time',
    lang: LearnLang.ja,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Sayılar ve saat', UiLang.en: 'Numbers & time'},
    clipLine: '今何時ですか？',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr:
            'に, saat gibi belirli bir zaman noktasına eklenir ("bugün" gibi göreceli zaman kelimelerine değil).',
        UiLang.en:
            "に (ni) attaches to a specific clock time ('at 9 o'clock'), but not to relative time words like 'today'.",
      },
      goodExample: '九時半に出ます。',
      badExample: '九時半で出ます。',
    ),
    phrases: [
      Phrase(
        id: 'ja_numbers_time_0',
        target: '今何時ですか？',
        gloss: {UiLang.tr: 'Saat kaç?', UiLang.en: 'What time is it now?'},
        ipa: 'Ima nanji desu ka?',
      ),
      Phrase(
        id: 'ja_numbers_time_1',
        target: '三時です。',
        gloss: {UiLang.tr: 'Saat üç.', UiLang.en: "It's three o'clock."},
        ipa: 'Sanji desu.',
      ),
      Phrase(
        id: 'ja_numbers_time_2',
        target: '電車は何時に出ますか？',
        gloss: {
          UiLang.tr: 'Tren saat kaçta kalkıyor?',
          UiLang.en: 'What time does the train leave?',
        },
        ipa: 'Densha wa nanji ni demasu ka?',
      ),
      Phrase(
        id: 'ja_numbers_time_3',
        target: '九時半に出ます。',
        gloss: {
          UiLang.tr: 'Dokuz buçukta kalkıyor.',
          UiLang.en: 'It leaves at nine thirty.',
        },
        ipa: 'Kuji han ni demasu.',
      ),
      Phrase(
        id: 'ja_numbers_time_4',
        target: '夜七時に会いましょう。',
        gloss: {
          UiLang.tr: 'Akşam yedide buluşalım.',
          UiLang.en: "Let's meet at seven in the evening.",
        },
        ipa: 'Yoru shichiji ni aimashou.',
      ),
      Phrase(
        id: 'ja_numbers_time_5',
        target: '全部で二十ドルです。',
        gloss: {
          UiLang.tr: 'Toplam yirmi dolar.',
          UiLang.en: "That's twenty dollars in total.",
        },
        ipa: 'Zenbu de nijuu doru desu.',
      ),
      Phrase(
        id: 'ja_numbers_time_6',
        target: '十分で着きます。',
        gloss: {
          UiLang.tr: 'On dakikaya varırım.',
          UiLang.en: "I'll arrive in ten minutes.",
        },
        ipa: 'Juppun de tsukimasu.',
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'You check your watch.', expected: '今何時ですか？'),
      SpeakTurn(prompt: 'Someone asks the time.', expected: '三時です。'),
      SpeakTurn(prompt: 'You are at the station.', expected: '電車は何時に出ますか？'),
      SpeakTurn(prompt: 'The clerk checks the schedule.', expected: '九時半に出ます。'),
      SpeakTurn(
        prompt: 'You are planning to meet a friend.',
        expected: '夜七時に会いましょう。',
      ),
      SpeakTurn(
        prompt: 'The cashier tells you the total.',
        expected: '全部で二十ドルです。',
      ),
      SpeakTurn(prompt: 'You are running late.', expected: '十分で着きます。'),
    ],
  ),
  Scenario(
    id: 'ja_family',
    lang: LearnLang.ja,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Aile', UiLang.en: 'Family'},
    clipLine: 'これは私の家族です。',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: 'Aile üyeleri/insanlar için います kullanılır, cansız nesneler için あります değil.',
        UiLang.en:
            'Use います (imasu) for people/animate beings, not あります (arimasu), which is for inanimate things.',
      },
      goodExample: '兄が二人います。',
      badExample: '兄が二人あります。',
    ),
    phrases: [
      Phrase(
        id: 'ja_family_0',
        target: 'これは私の家族です。',
        gloss: {UiLang.tr: 'Bu benim ailem.', UiLang.en: 'This is my family.'},
        ipa: 'Kore wa watashi no kazoku desu.',
      ),
      Phrase(
        id: 'ja_family_1',
        target: '兄が二人います。',
        gloss: {
          UiLang.tr: 'İki abim var.',
          UiLang.en: 'I have two older brothers.',
        },
        ipa: 'Ani ga futari imasu.',
      ),
      Phrase(
        id: 'ja_family_2',
        target: '母は先生です。',
        gloss: {UiLang.tr: 'Annem öğretmen.', UiLang.en: 'My mother is a teacher.'},
        ipa: 'Haha wa sensei desu.',
      ),
      Phrase(
        id: 'ja_family_3',
        target: '父は病院で働いています。',
        gloss: {
          UiLang.tr: 'Babam hastanede çalışıyor.',
          UiLang.en: 'My father works at a hospital.',
        },
        ipa: 'Chichi wa byouin de hataraite imasu.',
      ),
      Phrase(
        id: 'ja_family_4',
        target: '兄弟はいますか？',
        gloss: {
          UiLang.tr: 'Kardeşin var mı?',
          UiLang.en: 'Do you have any siblings?',
        },
        ipa: 'Kyoudai wa imasu ka?',
      ),
      Phrase(
        id: 'ja_family_5',
        target: '家族の中で一番下です。',
        gloss: {
          UiLang.tr: 'Ailede en küçüğüyüm.',
          UiLang.en: "I'm the youngest in the family.",
        },
        ipa: 'Kazoku no naka de ichiban shita desu.',
      ),
      Phrase(
        id: 'ja_family_6',
        target: '祖母は私たちと一緒に住んでいます。',
        gloss: {
          UiLang.tr: 'Büyükannem bizimle yaşıyor.',
          UiLang.en: 'My grandmother lives with us.',
        },
        ipa: 'Sobo wa watashitachi to issho ni sunde imasu.',
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'You show a photo.', expected: 'これは私の家族です。'),
      SpeakTurn(prompt: 'They ask about your siblings.', expected: '兄が二人います。'),
      SpeakTurn(prompt: 'They ask about your mother.', expected: '母は先生です。'),
      SpeakTurn(
        prompt: 'They ask about your father.',
        expected: '父は病院で働いています。',
      ),
      SpeakTurn(
        prompt: 'You ask them the same question.',
        expected: '兄弟はいますか？',
      ),
      SpeakTurn(
        prompt: 'They ask your place in the family.',
        expected: '家族の中で一番下です。',
      ),
      SpeakTurn(
        prompt: 'They ask who else lives with you.',
        expected: '祖母は私たちと一緒に住んでいます。',
      ),
    ],
  ),
  Scenario(
    id: 'ja_weather',
    lang: LearnLang.ja,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Hava durumu', UiLang.en: 'Weather'},
    clipLine: '今日の天気はどうですか？',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: 'い ile biten bir sıfatı "oluyor" anlamına getirmek için い\'yi düşürüp くなります eklenir.',
        UiLang.en:
            "To say an i-adjective 'is becoming ___', drop the final い and add くなります.",
      },
      goodExample: '暑くなります。',
      badExample: '暑いになります。',
    ),
    phrases: [
      Phrase(
        id: 'ja_weather_0',
        target: '今日の天気はどうですか？',
        gloss: {
          UiLang.tr: 'Bugün hava nasıl?',
          UiLang.en: "What's the weather like today?",
        },
        ipa: 'Kyou no tenki wa dou desu ka?',
      ),
      Phrase(
        id: 'ja_weather_1',
        target: '今日は晴れです。',
        gloss: {UiLang.tr: 'Bugün güneşli.', UiLang.en: "It's sunny today."},
        ipa: 'Kyou wa hare desu.',
      ),
      Phrase(
        id: 'ja_weather_2',
        target: '外は雨が降っています。',
        gloss: {
          UiLang.tr: 'Dışarıda yağmur yağıyor.',
          UiLang.en: "It's raining outside.",
        },
        ipa: 'Soto wa ame ga futte imasu.',
      ),
      Phrase(
        id: 'ja_weather_3',
        target: '今朝はとても寒いです。',
        gloss: {
          UiLang.tr: 'Bu sabah çok soğuk.',
          UiLang.en: "It's very cold this morning.",
        },
        ipa: 'Kesa wa totemo samui desu.',
      ),
      Phrase(
        id: 'ja_weather_4',
        target: '明日は暑くなりますか？',
        gloss: {
          UiLang.tr: 'Yarın sıcak olacak mı?',
          UiLang.en: 'Will it get hot tomorrow?',
        },
        ipa: 'Ashita wa atsuku narimasu ka?',
      ),
      Phrase(
        id: 'ja_weather_5',
        target: '傘を持って行ってください、雨が降るかもしれません。',
        gloss: {
          UiLang.tr: 'Şemsiye götürün, yağmur yağabilir.',
          UiLang.en: 'Take an umbrella, it might rain.',
        },
        ipa: 'Kasa o motte itte kudasai, ame ga furu kamoshiremasen.',
      ),
      Phrase(
        id: 'ja_weather_6',
        target: '晴れの日が好きです。',
        gloss: {
          UiLang.tr: 'Güneşli günleri severim.',
          UiLang.en: 'I like sunny days.',
        },
        ipa: 'Hare no hi ga suki desu.',
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'You look outside.', expected: '今日の天気はどうですか？'),
      SpeakTurn(prompt: 'You check the sky.', expected: '今日は晴れです。'),
      SpeakTurn(prompt: 'You hear rain outside.', expected: '外は雨が降っています。'),
      SpeakTurn(prompt: 'You feel a chill.', expected: '今朝はとても寒いです。'),
      SpeakTurn(
        prompt: "You check tomorrow's forecast.",
        expected: '明日は暑くなりますか？',
      ),
      SpeakTurn(
        prompt: 'A friend is leaving without a coat.',
        expected: '傘を持って行ってください、雨が降るかもしれません。',
      ),
      SpeakTurn(
        prompt: 'They ask about your favorite weather.',
        expected: '晴れの日が好きです。',
      ),
    ],
  ),
  Scenario(
    id: 'ja_transport',
    lang: LearnLang.ja,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Ulaşım', UiLang.en: 'Getting around'},
    clipLine: 'すみません、中心部までどう行きますか？',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: '乗ります (binmek) fiiliyle bindiğin aracı işaretlemek için に kullanılır, を değil.',
        UiLang.en:
            "With 乗ります (noru, 'to ride'), mark the vehicle you board with に, not を.",
      },
      goodExample: 'バスに乗ります。',
      badExample: 'バスを乗ります。',
    ),
    phrases: [
      Phrase(
        id: 'ja_transport_0',
        target: 'すみません、中心部までどう行きますか？',
        gloss: {
          UiLang.tr: 'Affedersiniz, şehir merkezine nasıl gidilir?',
          UiLang.en: 'Excuse me, how do I get downtown?',
        },
        ipa: 'Sumimasen, chuushinbu made dou ikimasu ka?',
      ),
      Phrase(
        id: 'ja_transport_1',
        target: 'バスに乗って会社に行きます。',
        gloss: {
          UiLang.tr: 'İşe otobüsle giderim.',
          UiLang.en: 'I take the bus to work.',
        },
        ipa: 'Basu ni notte kaisha ni ikimasu.',
      ),
      Phrase(
        id: 'ja_transport_2',
        target: '一番近い地下鉄の駅はどこですか？',
        gloss: {
          UiLang.tr: 'En yakın metro istasyonu nerede?',
          UiLang.en: "Where's the nearest subway station?",
        },
        ipa: 'Ichiban chikai chikatetsu no eki wa doko desu ka?',
      ),
      Phrase(
        id: 'ja_transport_3',
        target: 'このバスは空港に行きますか？',
        gloss: {
          UiLang.tr: 'Bu otobüs havaalanına gidiyor mu?',
          UiLang.en: 'Does this bus go to the airport?',
        },
        ipa: 'Kono basu wa kuukou ni ikimasu ka?',
      ),
      Phrase(
        id: 'ja_transport_4',
        target: '中央駅までの切符を一枚ください。',
        gloss: {
          UiLang.tr: 'Merkez istasyona bir bilet, lütfen.',
          UiLang.en: 'One ticket to the central station, please.',
        },
        ipa: 'Chuuou-eki made no kippu o ichimai kudasai.',
      ),
      Phrase(
        id: 'ja_transport_5',
        target: '最終電車は何時に出ますか？',
        gloss: {
          UiLang.tr: 'Son tren saat kaçta kalkıyor?',
          UiLang.en: 'What time does the last train leave?',
        },
        ipa: 'Saishuu densha wa nanji ni demasu ka?',
      ),
      Phrase(
        id: 'ja_transport_6',
        target: '近いので歩いて行きます。',
        gloss: {
          UiLang.tr: 'Yakın olduğu için yürüyerek gidiyorum.',
          UiLang.en: "It's close, so I'll walk.",
        },
        ipa: 'Chikai node aruite ikimasu.',
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You are lost downtown.',
        expected: 'すみません、中心部までどう行きますか？',
      ),
      SpeakTurn(
        prompt: 'They ask how you get to work.',
        expected: 'バスに乗って会社に行きます。',
      ),
      SpeakTurn(
        prompt: 'You need the subway.',
        expected: '一番近い地下鉄の駅はどこですか？',
      ),
      SpeakTurn(prompt: 'A bus pulls up.', expected: 'このバスは空港に行きますか？'),
      SpeakTurn(
        prompt: 'You are at the ticket counter.',
        expected: '中央駅までの切符を一枚ください。',
      ),
      SpeakTurn(
        prompt: 'You want to catch the last train.',
        expected: '最終電車は何時に出ますか？',
      ),
      SpeakTurn(prompt: 'A friend offers you a ride.', expected: '近いので歩いて行きます。'),
    ],
  ),
  Scenario(
    id: 'ja_emergency',
    lang: LearnLang.ja,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Acil durum', UiLang.en: 'Emergency'},
    clipLine: '助けて！',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: 'Rica etmek için fiilin て-hali + ください kullanılır, ます-hali değil.',
        UiLang.en:
            "To make a polite request, use the verb's て-form + ください, not the ます-form.",
      },
      goodExample: '呼んでください。',
      badExample: '呼びますください。',
    ),
    phrases: [
      Phrase(
        id: 'ja_emergency_0',
        target: '助けて！',
        gloss: {UiLang.tr: 'İmdat!', UiLang.en: 'Help!'},
        ipa: 'Tasukete!',
      ),
      Phrase(
        id: 'ja_emergency_1',
        target: '救急車を呼んでください。',
        gloss: {
          UiLang.tr: 'Lütfen ambulans çağırın.',
          UiLang.en: 'Please call an ambulance.',
        },
        ipa: 'Kyuukyuusha o yonde kudasai.',
      ),
      Phrase(
        id: 'ja_emergency_2',
        target: '医者が必要です。',
        gloss: {UiLang.tr: 'Doktora ihtiyacım var.', UiLang.en: 'I need a doctor.'},
        ipa: 'Isha ga hitsuyou desu.',
      ),
      Phrase(
        id: 'ja_emergency_3',
        target: '警察を呼んでください。',
        gloss: {
          UiLang.tr: 'Lütfen polis çağırın.',
          UiLang.en: 'Please call the police.',
        },
        ipa: 'Keisatsu o yonde kudasai.',
      ),
      Phrase(
        id: 'ja_emergency_4',
        target: 'パスポートをなくしました。',
        gloss: {
          UiLang.tr: 'Pasaportumu kaybettim.',
          UiLang.en: 'I lost my passport.',
        },
        ipa: 'Pasupooto o nakushimashita.',
      ),
      Phrase(
        id: 'ja_emergency_5',
        target: '火事です！',
        gloss: {UiLang.tr: 'Yangın var!', UiLang.en: "There's a fire!"},
        ipa: 'Kaji desu!',
      ),
      Phrase(
        id: 'ja_emergency_6',
        target: '一番近い病院はどこですか？',
        gloss: {
          UiLang.tr: 'En yakın hastane nerede?',
          UiLang.en: 'Where is the nearest hospital?',
        },
        ipa: 'Ichiban chikai byouin wa doko desu ka?',
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'Something dangerous just happened.', expected: '助けて！'),
      SpeakTurn(
        prompt: 'Someone is badly hurt.',
        expected: '救急車を呼んでください。',
      ),
      SpeakTurn(prompt: 'You feel very sick.', expected: '医者が必要です。'),
      SpeakTurn(prompt: 'You just saw a robbery.', expected: '警察を呼んでください。'),
      SpeakTurn(prompt: 'You check your bag.', expected: 'パスポートをなくしました。'),
      SpeakTurn(prompt: 'You smell smoke.', expected: '火事です！'),
      SpeakTurn(
        prompt: 'You need medical help nearby.',
        expected: '一番近い病院はどこですか？',
      ),
    ],
  ),
  Scenario(
    id: 'ja_routine',
    lang: LearnLang.ja,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Günlük rutin', UiLang.en: 'Daily routine'},
    clipLine: '毎日七時に起きます。',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: 'Fiilin て-hali + から, "yaptıktan sonra" anlamına gelir.',
        UiLang.en: "Verb て-form + から means 'after doing ___'.",
      },
      goodExample: '食べてからテレビを見ます。',
      badExample: '食べるからテレビを見ます。',
    ),
    phrases: [
      Phrase(
        id: 'ja_routine_0',
        target: '毎日七時に起きます。',
        gloss: {
          UiLang.tr: 'Her gün saat yedide kalkarım.',
          UiLang.en: 'I get up at seven every day.',
        },
        ipa: 'Mainichi shichiji ni okimasu.',
      ),
      Phrase(
        id: 'ja_routine_1',
        target: '歯を磨いてからシャワーを浴びます。',
        gloss: {
          UiLang.tr: 'Dişlerimi fırçaladıktan sonra duş alırım.',
          UiLang.en: 'I brush my teeth, then take a shower.',
        },
        ipa: 'Ha o migaite kara shawaa o abimasu.',
      ),
      Phrase(
        id: 'ja_routine_2',
        target: '八時に朝ごはんを食べます。',
        gloss: {
          UiLang.tr: 'Saat sekizde kahvaltı ederim.',
          UiLang.en: 'I have breakfast at eight.',
        },
        ipa: 'Hachiji ni asagohan o tabemasu.',
      ),
      Phrase(
        id: 'ja_routine_3',
        target: '自転車で会社に行きます。',
        gloss: {
          UiLang.tr: 'İşe bisikletle giderim.',
          UiLang.en: 'I go to work by bike.',
        },
        ipa: 'Jitensha de kaisha ni ikimasu.',
      ),
      Phrase(
        id: 'ja_routine_4',
        target: '夜六時に仕事が終わります。',
        gloss: {
          UiLang.tr: 'Akşam altıda işten çıkarım.',
          UiLang.en: 'I finish work at six in the evening.',
        },
        ipa: 'Yoru rokuji ni shigoto ga owarimasu.',
      ),
      Phrase(
        id: 'ja_routine_5',
        target: '晩ごはんを食べてからテレビを見ます。',
        gloss: {
          UiLang.tr: 'Akşam yemeğinden sonra televizyon izlerim.',
          UiLang.en: 'After eating dinner, I watch TV.',
        },
        ipa: 'Bangohan o tabete kara terebi o mimasu.',
      ),
      Phrase(
        id: 'ja_routine_6',
        target: '十一時に寝ます。',
        gloss: {
          UiLang.tr: 'Saat on birde yatarım.',
          UiLang.en: 'I go to bed at eleven.',
        },
        ipa: 'Juuichiji ni nemasu.',
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Someone asks about your mornings.',
        expected: '毎日七時に起きます。',
      ),
      SpeakTurn(
        prompt: 'You describe getting ready.',
        expected: '歯を磨いてからシャワーを浴びます。',
      ),
      SpeakTurn(prompt: 'They ask about breakfast.', expected: '八時に朝ごはんを食べます。'),
      SpeakTurn(
        prompt: 'They ask how you get to work.',
        expected: '自転車で会社に行きます。',
      ),
      SpeakTurn(
        prompt: 'They ask when your day ends.',
        expected: '夜六時に仕事が終わります。',
      ),
      SpeakTurn(
        prompt: 'They ask about your evenings.',
        expected: '晩ごはんを食べてからテレビを見ます。',
      ),
      SpeakTurn(prompt: 'They ask when you sleep.', expected: '十一時に寝ます。'),
    ],
  ),
  Scenario(
    id: 'ja_past_story',
    lang: LearnLang.ja,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {
      UiLang.tr: 'Geçmişte bir gün',
      UiLang.en: 'Telling a past event',
    },
    clipLine: '昨日、空港に行きました。',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: 'Geçmişte olan bir şeyi anlatmak için fiil ました (geçmiş, kibar) haline getirilir.',
        UiLang.en:
            'To talk about a completed past event, put the verb in its ました (polite past) form.',
      },
      goodExample: '空港に行きました。',
      badExample: '空港に行きます。',
    ),
    phrases: [
      Phrase(
        id: 'ja_past_story_0',
        target: '昨日、空港に行きました。',
        gloss: {
          UiLang.tr: 'Dün havaalanına gittim.',
          UiLang.en: 'Yesterday I went to the airport.',
        },
        ipa: 'Kinou, kuukou ni ikimashita.',
      ),
      Phrase(
        id: 'ja_past_story_1',
        target: 'そこで昔の友達に会いました。',
        gloss: {
          UiLang.tr: 'Orada eski bir arkadaşımla karşılaştım.',
          UiLang.en: 'I met an old friend there.',
        },
        ipa: 'Soko de mukashi no tomodachi ni aimashita.',
      ),
      Phrase(
        id: 'ja_past_story_2',
        target: '一緒にコーヒーを飲みました。',
        gloss: {
          UiLang.tr: 'Birlikte kahve içtik.',
          UiLang.en: 'We drank coffee together.',
        },
        ipa: 'Issho ni koohii o nomimashita.',
      ),
      Phrase(
        id: 'ja_past_story_3',
        target: 'それから、飛行機に乗り遅れました。',
        gloss: {
          UiLang.tr: 'Sonra uçağımı kaçırdım.',
          UiLang.en: 'Then I missed my flight.',
        },
        ipa: 'Sorekara, hikouki ni noriokuremashita.',
      ),
      Phrase(
        id: 'ja_past_story_4',
        target: 'とても疲れていました。',
        gloss: {UiLang.tr: 'Çok yorgundum.', UiLang.en: 'I was very tired.'},
        ipa: 'Totemo tsukarete imashita.',
      ),
      Phrase(
        id: 'ja_past_story_5',
        target: '真夜中にやっと家に着きました。',
        gloss: {
          UiLang.tr: 'Eve ancak gece yarısı vardım.',
          UiLang.en: 'I finally arrived home at midnight.',
        },
        ipa: 'Mayonaka ni yatto ie ni tsukimashita.',
      ),
      Phrase(
        id: 'ja_past_story_6',
        target: '本当に長い一日でした。',
        gloss: {
          UiLang.tr: 'Gerçekten uzun bir gündü.',
          UiLang.en: 'It was a long day.',
        },
        ipa: 'Hontou ni nagai ichinichi deshita.',
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'They ask about your day yesterday.',
        expected: '昨日、空港に行きました。',
      ),
      SpeakTurn(
        prompt: 'They ask what happened there.',
        expected: 'そこで昔の友達に会いました。',
      ),
      SpeakTurn(
        prompt: 'They ask what you did together.',
        expected: '一緒にコーヒーを飲みました。',
      ),
      SpeakTurn(
        prompt: 'They ask what happened next.',
        expected: 'それから、飛行機に乗り遅れました。',
      ),
      SpeakTurn(prompt: 'They ask how you felt.', expected: 'とても疲れていました。'),
      SpeakTurn(
        prompt: 'They ask when you got home.',
        expected: '真夜中にやっと家に着きました。',
      ),
      SpeakTurn(
        prompt: 'They ask how your day was.',
        expected: '本当に長い一日でした。',
      ),
    ],
  ),

  // ===================== KOREAN (ko) =====================
  Scenario(
    id: 'ko_intro',
    lang: LearnLang.ko,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Tanışma', UiLang.en: 'Meeting someone'},
    clipLine: '안녕하세요, 만나서 반갑습니다.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: '저 gibi ünlü ile biten kelimelerden sonra 는 gelir, ünsüzle bitenlerden sonra 은 gelir.',
        UiLang.en:
            '는 follows a word ending in a vowel (like 저), and 은 follows a word ending in a consonant.',
      },
      goodExample: '저는 데니즈예요.',
      badExample: '저은 데니즈예요.',
    ),
    phrases: [
      Phrase(
        id: 'ko_intro_0',
        target: '안녕하세요, 만나서 반갑습니다.',
        gloss: {
          UiLang.tr: 'Merhaba, tanıştığımıza memnun oldum.',
          UiLang.en: 'Hi, nice to meet you.',
        },
        ipa: 'Annyeonghaseyo, mannaseo bangapseumnida.',
      ),
      Phrase(
        id: 'ko_intro_1',
        target: '저는 데니즈예요.',
        gloss: {UiLang.tr: 'Adım Deniz.', UiLang.en: 'My name is Deniz.'},
        ipa: 'Jeoneun Denijeu-yeyo.',
      ),
      Phrase(
        id: 'ko_intro_2',
        target: '이름이 뭐예요?',
        gloss: {UiLang.tr: 'Senin adın ne?', UiLang.en: "What's your name?"},
        ipa: 'Ireumi mwoyeyo?',
      ),
      Phrase(
        id: 'ko_intro_3',
        target: '어느 나라에서 왔어요?',
        gloss: {
          UiLang.tr: 'Hangi ülkedensin?',
          UiLang.en: 'Where are you from?',
        },
        ipa: 'Eoneu nara-eseo wasseoyo?',
      ),
      Phrase(
        id: 'ko_intro_4',
        target: '저는 터키에서 왔어요.',
        gloss: {UiLang.tr: 'Türkiye\'denim.', UiLang.en: "I'm from Turkey."},
        ipa: 'Jeoneun Teoki-eseo wasseoyo.',
      ),
      Phrase(
        id: 'ko_intro_5',
        target: '무슨 일을 하세요?',
        gloss: {
          UiLang.tr: 'Ne iş yapıyorsun?',
          UiLang.en: 'What do you do for work?',
        },
        ipa: 'Museun ireul haseyo?',
      ),
      Phrase(
        id: 'ko_intro_6',
        target: '저는 학생이에요.',
        gloss: {UiLang.tr: 'Ben öğrenciyim.', UiLang.en: "I'm a student."},
        ipa: 'Jeoneun haksaeng-ieyo.',
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'A stranger smiles and greets you.',
        expected: '안녕하세요, 만나서 반갑습니다.',
      ),
      SpeakTurn(prompt: 'They wait for your name.', expected: '저는 데니즈예요.'),
      SpeakTurn(
        prompt: 'You want to know their name too.',
        expected: '이름이 뭐예요?',
      ),
      SpeakTurn(
        prompt: 'You are curious where they are from.',
        expected: '어느 나라에서 왔어요?',
      ),
      SpeakTurn(
        prompt: 'They ask where you are from.',
        expected: '저는 터키에서 왔어요.',
      ),
      SpeakTurn(
        prompt: 'You want to know their job.',
        expected: '무슨 일을 하세요?',
      ),
      SpeakTurn(prompt: 'They ask what you do.', expected: '저는 학생이에요.'),
    ],
  ),
  Scenario(
    id: 'ko_shopping',
    lang: LearnLang.ko,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Kıyafet alışverişi', UiLang.en: 'Clothes shopping'},
    clipLine: '실례합니다, 다른 색깔 있어요?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: '을/를 fiilin nesnesini işaretler; ünsüzle biten kelimeden sonra 을, ünlüyle bitenden sonra 를 gelir.',
        UiLang.en:
            '을/를 marks the object of the verb: 을 after a consonant-ending word, 를 after a vowel-ending one.',
      },
      goodExample: '이것을 주세요.',
      badExample: '이것이 주세요.',
    ),
    phrases: [
      Phrase(
        id: 'ko_shopping_0',
        target: '실례합니다, 다른 색깔 있어요?',
        gloss: {
          UiLang.tr: 'Affedersiniz, başka renk var mı?',
          UiLang.en: 'Excuse me, do you have another color?',
        },
        ipa: 'Sillyehamnida, dareun saekkal isseoyo?',
      ),
      Phrase(
        id: 'ko_shopping_1',
        target: '입어봐도 돼요?',
        gloss: {
          UiLang.tr: 'Deneyebilir miyim?',
          UiLang.en: 'Can I try it on?',
        },
        ipa: 'Ibeobwado dwaeyo?',
      ),
      Phrase(
        id: 'ko_shopping_2',
        target: '피팅룸이 어디예요?',
        gloss: {
          UiLang.tr: 'Deneme kabini nerede?',
          UiLang.en: 'Where is the fitting room?',
        },
        ipa: 'Pitingrumi eodiyeyo?',
      ),
      Phrase(
        id: 'ko_shopping_3',
        target: '더 작은 사이즈 있어요?',
        gloss: {
          UiLang.tr: 'Daha küçük beden var mı?',
          UiLang.en: 'Do you have a smaller size?',
        },
        ipa: 'Deo jageun saijeu isseoyo?',
      ),
      Phrase(
        id: 'ko_shopping_4',
        target: '이거 주세요.',
        gloss: {
          UiLang.tr: 'Bunu alayım.',
          UiLang.en: "I'll take this, please.",
        },
        ipa: 'Igeo juseyo.',
      ),
      Phrase(
        id: 'ko_shopping_5',
        target: '카드 돼요?',
        gloss: {
          UiLang.tr: 'Kartla ödeyebilir miyim?',
          UiLang.en: 'Can I pay by card?',
        },
        ipa: 'Kadeu dwaeyo?',
      ),
      Phrase(
        id: 'ko_shopping_6',
        target: '영수증 주세요.',
        gloss: {
          UiLang.tr: 'Fiş alabilir miyim?',
          UiLang.en: 'Receipt, please.',
        },
        ipa: 'Yeongsujeung juseyo.',
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You are looking at a shirt.',
        expected: '실례합니다, 다른 색깔 있어요?',
      ),
      SpeakTurn(prompt: 'You like the shirt.', expected: '입어봐도 돼요?'),
      SpeakTurn(prompt: 'You want to try it on.', expected: '피팅룸이 어디예요?'),
      SpeakTurn(prompt: 'It does not fit.', expected: '더 작은 사이즈 있어요?'),
      SpeakTurn(prompt: 'You decide to buy it.', expected: '이거 주세요.'),
      SpeakTurn(prompt: 'You are ready to pay.', expected: '카드 돼요?'),
      SpeakTurn(prompt: 'You need proof of purchase.', expected: '영수증 주세요.'),
    ],
  ),
  Scenario(
    id: 'ko_numbers_time',
    lang: LearnLang.ko,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Sayılar ve saat', UiLang.en: 'Numbers & time'},
    clipLine: '지금 몇 시예요?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: 'Belirli bir saati söylerken 에 eklenir ("...de/da" anlamında).',
        UiLang.en: "에 attaches to a specific clock time to mean 'at ___'.",
      },
      goodExample: '일곱 시에 만나요.',
      badExample: '일곱 시가 만나요.',
    ),
    phrases: [
      Phrase(
        id: 'ko_numbers_time_0',
        target: '지금 몇 시예요?',
        gloss: {UiLang.tr: 'Saat kaç?', UiLang.en: 'What time is it now?'},
        ipa: 'Jigeum myeot siyeyo?',
      ),
      Phrase(
        id: 'ko_numbers_time_1',
        target: '세 시예요.',
        gloss: {UiLang.tr: 'Saat üç.', UiLang.en: "It's three o'clock."},
        ipa: 'Se siyeyo.',
      ),
      Phrase(
        id: 'ko_numbers_time_2',
        target: '기차가 몇 시에 출발해요?',
        gloss: {
          UiLang.tr: 'Tren saat kaçta kalkıyor?',
          UiLang.en: 'What time does the train leave?',
        },
        ipa: 'Gichaga myeot sie chulbalhaeyo?',
      ),
      Phrase(
        id: 'ko_numbers_time_3',
        target: '아홉 시 반에 출발해요.',
        gloss: {
          UiLang.tr: 'Dokuz buçukta kalkıyor.',
          UiLang.en: 'It leaves at nine thirty.',
        },
        ipa: 'Ahop si banae chulbalhaeyo.',
      ),
      Phrase(
        id: 'ko_numbers_time_4',
        target: '저녁 일곱 시에 만나요.',
        gloss: {
          UiLang.tr: 'Akşam yedide buluşalım.',
          UiLang.en: "Let's meet at seven in the evening.",
        },
        ipa: 'Jeonyeok ilgop sie mannayo.',
      ),
      Phrase(
        id: 'ko_numbers_time_5',
        target: '전부 이십 달러예요.',
        gloss: {
          UiLang.tr: 'Toplam yirmi dolar.',
          UiLang.en: "That's twenty dollars in total.",
        },
        ipa: 'Jeonbu isip dalleoyeyo.',
      ),
      Phrase(
        id: 'ko_numbers_time_6',
        target: '십 분 후에 도착해요.',
        gloss: {
          UiLang.tr: 'On dakikaya varırım.',
          UiLang.en: "I'll arrive in ten minutes.",
        },
        ipa: 'Sip bun hu-e dochakhaeyo.',
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'You check your watch.', expected: '지금 몇 시예요?'),
      SpeakTurn(prompt: 'Someone asks the time.', expected: '세 시예요.'),
      SpeakTurn(
        prompt: 'You are at the station.',
        expected: '기차가 몇 시에 출발해요?',
      ),
      SpeakTurn(
        prompt: 'The clerk checks the schedule.',
        expected: '아홉 시 반에 출발해요.',
      ),
      SpeakTurn(
        prompt: 'You are planning to meet a friend.',
        expected: '저녁 일곱 시에 만나요.',
      ),
      SpeakTurn(
        prompt: 'The cashier tells you the total.',
        expected: '전부 이십 달러예요.',
      ),
      SpeakTurn(prompt: 'You are running late.', expected: '십 분 후에 도착해요.'),
    ],
  ),
  Scenario(
    id: 'ko_family',
    lang: LearnLang.ko,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Aile', UiLang.en: 'Family'},
    clipLine: '이 사람들은 제 가족이에요.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: 'Aile üyelerini sayarken sayı ile isim arasına "명" (kişi sayaç kelimesi) gelir.',
        UiLang.en:
            'When counting family members, put the counter word 명 between the number and the noun.',
      },
      goodExample: '오빠가 한 명 있어요.',
      badExample: '오빠가 한 있어요.',
    ),
    phrases: [
      Phrase(
        id: 'ko_family_0',
        target: '이 사람들은 제 가족이에요.',
        gloss: {UiLang.tr: 'Bunlar benim ailem.', UiLang.en: 'This is my family.'},
        ipa: 'I saramdeureun je gajogieyo.',
      ),
      Phrase(
        id: 'ko_family_1',
        target: '저는 오빠가 한 명 있어요.',
        gloss: {
          UiLang.tr: 'Bir abim var.',
          UiLang.en: 'I have one older brother.',
        },
        ipa: 'Jeoneun oppaga han myeong isseoyo.',
        hint:
            'A female speaker says 오빠 for "older brother"; a male speaker would say 형.',
      ),
      Phrase(
        id: 'ko_family_2',
        target: '우리 엄마는 선생님이에요.',
        gloss: {UiLang.tr: 'Annem öğretmen.', UiLang.en: 'My mom is a teacher.'},
        ipa: 'Uri eommaneun seonsaengnimieyo.',
      ),
      Phrase(
        id: 'ko_family_3',
        target: '우리 아빠는 병원에서 일해요.',
        gloss: {
          UiLang.tr: 'Babam hastanede çalışıyor.',
          UiLang.en: 'My dad works at a hospital.',
        },
        ipa: 'Uri appaneun byeongwoneseo ilhaeyo.',
      ),
      Phrase(
        id: 'ko_family_4',
        target: '형제자매가 있어요?',
        gloss: {
          UiLang.tr: 'Kardeşin var mı?',
          UiLang.en: 'Do you have any siblings?',
        },
        ipa: 'Hyeongjejamaega isseoyo?',
      ),
      Phrase(
        id: 'ko_family_5',
        target: '저는 집에서 막내예요.',
        gloss: {
          UiLang.tr: 'Ailede en küçüğüyüm.',
          UiLang.en: "I'm the youngest in the family.",
        },
        ipa: 'Jeoneun jibeseo maknaeyeyo.',
      ),
      Phrase(
        id: 'ko_family_6',
        target: '할머니가 우리랑 같이 살아요.',
        gloss: {
          UiLang.tr: 'Büyükannem bizimle yaşıyor.',
          UiLang.en: 'My grandmother lives with us.',
        },
        ipa: 'Halmeoniga urirang gachi sarayo.',
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'You show a photo.', expected: '이 사람들은 제 가족이에요.'),
      SpeakTurn(
        prompt: 'They ask about your siblings.',
        expected: '저는 오빠가 한 명 있어요.',
      ),
      SpeakTurn(
        prompt: 'They ask about your mother.',
        expected: '우리 엄마는 선생님이에요.',
      ),
      SpeakTurn(
        prompt: 'They ask about your father.',
        expected: '우리 아빠는 병원에서 일해요.',
      ),
      SpeakTurn(
        prompt: 'You ask them the same question.',
        expected: '형제자매가 있어요?',
      ),
      SpeakTurn(
        prompt: 'They ask your place in the family.',
        expected: '저는 집에서 막내예요.',
      ),
      SpeakTurn(
        prompt: 'They ask who else lives with you.',
        expected: '할머니가 우리랑 같이 살아요.',
      ),
    ],
  ),
  Scenario(
    id: 'ko_weather',
    lang: LearnLang.ko,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Hava durumu', UiLang.en: 'Weather'},
    clipLine: '오늘 날씨가 어때요?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: 'ㅂ ile biten bazı sıfatlar (춥다 gibi) çekimlenirken ㅂ düşer ve 워 eklenir.',
        UiLang.en:
            "Some adjectives ending in ㅂ (like 춥다, 'cold') drop the ㅂ and add 워 when conjugated.",
      },
      goodExample: '오늘 추워요.',
      badExample: '오늘 춥어요.',
    ),
    phrases: [
      Phrase(
        id: 'ko_weather_0',
        target: '오늘 날씨가 어때요?',
        gloss: {
          UiLang.tr: 'Bugün hava nasıl?',
          UiLang.en: "What's the weather like today?",
        },
        ipa: 'Oneul nalssiga eottaeyo?',
      ),
      Phrase(
        id: 'ko_weather_1',
        target: '오늘은 맑아요.',
        gloss: {UiLang.tr: 'Bugün güneşli.', UiLang.en: "It's sunny today."},
        ipa: 'Oneureun malgayo.',
      ),
      Phrase(
        id: 'ko_weather_2',
        target: '밖에 비가 와요.',
        gloss: {
          UiLang.tr: 'Dışarıda yağmur yağıyor.',
          UiLang.en: "It's raining outside.",
        },
        ipa: 'Bakke biga wayo.',
      ),
      Phrase(
        id: 'ko_weather_3',
        target: '오늘 아침에 정말 추워요.',
        gloss: {
          UiLang.tr: 'Bu sabah gerçekten soğuk.',
          UiLang.en: "It's really cold this morning.",
        },
        ipa: 'Oneul achime jeongmal chuwoyo.',
      ),
      Phrase(
        id: 'ko_weather_4',
        target: '내일은 더울까요?',
        gloss: {
          UiLang.tr: 'Yarın sıcak olur mu?',
          UiLang.en: 'Will it be hot tomorrow?',
        },
        ipa: 'Naeireun deoulkkayo?',
      ),
      Phrase(
        id: 'ko_weather_5',
        target: '우산을 가져가세요, 비가 올지도 몰라요.',
        gloss: {
          UiLang.tr: 'Şemsiye götür, yağmur yağabilir.',
          UiLang.en: 'Take an umbrella, it might rain.',
        },
        ipa: 'Usaneul gajyeogaseyo, biga oljido mollayo.',
      ),
      Phrase(
        id: 'ko_weather_6',
        target: '저는 맑은 날을 좋아해요.',
        gloss: {
          UiLang.tr: 'Güneşli günleri severim.',
          UiLang.en: 'I like sunny days.',
        },
        ipa: 'Jeoneun malgeun nareul johahaeyo.',
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'You look outside.', expected: '오늘 날씨가 어때요?'),
      SpeakTurn(prompt: 'You check the sky.', expected: '오늘은 맑아요.'),
      SpeakTurn(prompt: 'You hear rain outside.', expected: '밖에 비가 와요.'),
      SpeakTurn(prompt: 'You feel a chill.', expected: '오늘 아침에 정말 추워요.'),
      SpeakTurn(
        prompt: "You check tomorrow's forecast.",
        expected: '내일은 더울까요?',
      ),
      SpeakTurn(
        prompt: 'A friend is leaving without a coat.',
        expected: '우산을 가져가세요, 비가 올지도 몰라요.',
      ),
      SpeakTurn(
        prompt: 'They ask about your favorite weather.',
        expected: '저는 맑은 날을 좋아해요.',
      ),
    ],
  ),
  Scenario(
    id: 'ko_transport',
    lang: LearnLang.ko,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Ulaşım', UiLang.en: 'Getting around'},
    clipLine: '실례합니다, 시내 중심가는 어떻게 가요?',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: 'Bir ulaşım aracına binmeyi anlatmak için araç adından sonra 을/를 gelir, sonra 타다 fiili kullanılır.',
        UiLang.en:
            'To say you take a vehicle, mark it with 을/를 and use the verb 타다 (to ride).',
      },
      goodExample: '버스를 타요.',
      badExample: '버스가 타요.',
    ),
    phrases: [
      Phrase(
        id: 'ko_transport_0',
        target: '실례합니다, 시내 중심가는 어떻게 가요?',
        gloss: {
          UiLang.tr: 'Affedersiniz, şehir merkezine nasıl gidilir?',
          UiLang.en: 'Excuse me, how do I get downtown?',
        },
        ipa: 'Sillyehamnida, sinae jungsimganeun eotteoke gayo?',
      ),
      Phrase(
        id: 'ko_transport_1',
        target: '저는 버스를 타고 출근해요.',
        gloss: {
          UiLang.tr: 'İşe otobüsle giderim.',
          UiLang.en: 'I take the bus to work.',
        },
        ipa: 'Jeoneun beoseureul tago chulgeunhaeyo.',
      ),
      Phrase(
        id: 'ko_transport_2',
        target: '가장 가까운 지하철역이 어디예요?',
        gloss: {
          UiLang.tr: 'En yakın metro istasyonu nerede?',
          UiLang.en: "Where's the nearest subway station?",
        },
        ipa: 'Gajang gakkaun jihacheollyeogi eodiyeyo?',
      ),
      Phrase(
        id: 'ko_transport_3',
        target: '이 버스가 공항에 가요?',
        gloss: {
          UiLang.tr: 'Bu otobüs havaalanına gidiyor mu?',
          UiLang.en: 'Does this bus go to the airport?',
        },
        ipa: 'I beoseuga gonghange gayo?',
      ),
      Phrase(
        id: 'ko_transport_4',
        target: '중앙역까지 표 한 장 주세요.',
        gloss: {
          UiLang.tr: 'Merkez istasyona bir bilet, lütfen.',
          UiLang.en: 'One ticket to the central station, please.',
        },
        ipa: 'Jungang-yeok-kkaji pyo han jang juseyo.',
      ),
      Phrase(
        id: 'ko_transport_5',
        target: '마지막 기차가 몇 시에 출발해요?',
        gloss: {
          UiLang.tr: 'Son tren saat kaçta kalkıyor?',
          UiLang.en: 'What time does the last train leave?',
        },
        ipa: 'Majimak gichaga myeot sie chulbalhaeyo?',
      ),
      Phrase(
        id: 'ko_transport_6',
        target: '가까우니까 걸어갈게요.',
        gloss: {
          UiLang.tr: 'Yakın olduğu için yürüyerek gideceğim.',
          UiLang.en: "It's close, so I'll walk.",
        },
        ipa: 'Gakkaunikka georeogalgeyo.',
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'You are lost downtown.',
        expected: '실례합니다, 시내 중심가는 어떻게 가요?',
      ),
      SpeakTurn(
        prompt: 'They ask how you get to work.',
        expected: '저는 버스를 타고 출근해요.',
      ),
      SpeakTurn(
        prompt: 'You need the subway.',
        expected: '가장 가까운 지하철역이 어디예요?',
      ),
      SpeakTurn(prompt: 'A bus pulls up.', expected: '이 버스가 공항에 가요?'),
      SpeakTurn(
        prompt: 'You are at the ticket counter.',
        expected: '중앙역까지 표 한 장 주세요.',
      ),
      SpeakTurn(
        prompt: 'You want to catch the last train.',
        expected: '마지막 기차가 몇 시에 출발해요?',
      ),
      SpeakTurn(prompt: 'A friend offers you a ride.', expected: '가까우니까 걸어갈게요.'),
    ],
  ),
  Scenario(
    id: 'ko_emergency',
    lang: LearnLang.ko,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Acil durum', UiLang.en: 'Emergency'},
    clipLine: '도와주세요!',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: 'Bir şeyi rica etmek için fiil gövdesine 아/어 주세요 eklenir, çekimli hale değil.',
        UiLang.en:
            'To make a polite request, add 아/어 주세요 to the verb stem, not to its already-conjugated form.',
      },
      goodExample: '불러 주세요.',
      badExample: '불러요 주세요.',
    ),
    phrases: [
      Phrase(
        id: 'ko_emergency_0',
        target: '도와주세요!',
        gloss: {UiLang.tr: 'İmdat!', UiLang.en: 'Help me!'},
        ipa: 'Dowajuseyo!',
      ),
      Phrase(
        id: 'ko_emergency_1',
        target: '구급차를 불러 주세요.',
        gloss: {
          UiLang.tr: 'Lütfen ambulans çağırın.',
          UiLang.en: 'Please call an ambulance.',
        },
        ipa: 'Gugeupchareul bulleo juseyo.',
      ),
      Phrase(
        id: 'ko_emergency_2',
        target: '의사가 필요해요.',
        gloss: {UiLang.tr: 'Doktora ihtiyacım var.', UiLang.en: 'I need a doctor.'},
        ipa: 'Uisaga piryohaeyo.',
      ),
      Phrase(
        id: 'ko_emergency_3',
        target: '경찰을 불러 주세요.',
        gloss: {
          UiLang.tr: 'Lütfen polis çağırın.',
          UiLang.en: 'Please call the police.',
        },
        ipa: 'Gyeongchareul bulleo juseyo.',
      ),
      Phrase(
        id: 'ko_emergency_4',
        target: '여권을 잃어버렸어요.',
        gloss: {
          UiLang.tr: 'Pasaportumu kaybettim.',
          UiLang.en: 'I lost my passport.',
        },
        ipa: 'Yeogwoneul ireobeoryeosseoyo.',
      ),
      Phrase(
        id: 'ko_emergency_5',
        target: '불이 났어요!',
        gloss: {UiLang.tr: 'Yangın var!', UiLang.en: "There's a fire!"},
        ipa: 'Buri nasseoyo!',
      ),
      Phrase(
        id: 'ko_emergency_6',
        target: '가장 가까운 병원이 어디예요?',
        gloss: {
          UiLang.tr: 'En yakın hastane nerede?',
          UiLang.en: 'Where is the nearest hospital?',
        },
        ipa: 'Gajang gakkaun byeongwoni eodiyeyo?',
      ),
    ],
    turns: [
      SpeakTurn(prompt: 'Something dangerous just happened.', expected: '도와주세요!'),
      SpeakTurn(
        prompt: 'Someone is badly hurt.',
        expected: '구급차를 불러 주세요.',
      ),
      SpeakTurn(prompt: 'You feel very sick.', expected: '의사가 필요해요.'),
      SpeakTurn(prompt: 'You just saw a robbery.', expected: '경찰을 불러 주세요.'),
      SpeakTurn(prompt: 'You check your bag.', expected: '여권을 잃어버렸어요.'),
      SpeakTurn(prompt: 'You smell smoke.', expected: '불이 났어요!'),
      SpeakTurn(
        prompt: 'You need medical help nearby.',
        expected: '가장 가까운 병원이 어디예요?',
      ),
    ],
  ),
  Scenario(
    id: 'ko_routine',
    lang: LearnLang.ko,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {UiLang.tr: 'Günlük rutin', UiLang.en: 'Daily routine'},
    clipLine: '저는 매일 일곱 시에 일어나요.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: '동사 어간 + 고 나서, "yaptıktan sonra" sırasını anlatır.',
        UiLang.en:
            "Verb stem + 고 나서 shows the order of actions: 'after doing ___'.",
      },
      goodExample: '먹고 나서 봐요.',
      badExample: '먹어서 나서 봐요.',
    ),
    phrases: [
      Phrase(
        id: 'ko_routine_0',
        target: '저는 매일 일곱 시에 일어나요.',
        gloss: {
          UiLang.tr: 'Her gün saat yedide kalkarım.',
          UiLang.en: 'I get up at seven every day.',
        },
        ipa: 'Jeoneun maeil ilgop sie ireonayo.',
      ),
      Phrase(
        id: 'ko_routine_1',
        target: '이를 닦고 나서 샤워해요.',
        gloss: {
          UiLang.tr: 'Dişlerimi fırçaladıktan sonra duş alırım.',
          UiLang.en: 'I brush my teeth, then take a shower.',
        },
        ipa: 'Ireul dakkgo naseo syawohaeyo.',
      ),
      Phrase(
        id: 'ko_routine_2',
        target: '여덟 시에 아침을 먹어요.',
        gloss: {
          UiLang.tr: 'Saat sekizde kahvaltı ederim.',
          UiLang.en: 'I have breakfast at eight.',
        },
        ipa: 'Yeodeol sie achimeul meogeoyo.',
      ),
      Phrase(
        id: 'ko_routine_3',
        target: '자전거를 타고 출근해요.',
        gloss: {
          UiLang.tr: 'İşe bisikletle giderim.',
          UiLang.en: 'I go to work by bike.',
        },
        ipa: 'Jajeongeoreul tago chulgeunhaeyo.',
      ),
      Phrase(
        id: 'ko_routine_4',
        target: '저녁 여섯 시에 퇴근해요.',
        gloss: {
          UiLang.tr: 'Akşam altıda işten çıkarım.',
          UiLang.en: 'I finish work at six in the evening.',
        },
        ipa: 'Jeonyeok yeoseot sie toegeunhaeyo.',
      ),
      Phrase(
        id: 'ko_routine_5',
        target: '저녁을 먹고 나서 텔레비전을 봐요.',
        gloss: {
          UiLang.tr: 'Akşam yemeğinden sonra televizyon izlerim.',
          UiLang.en: 'After eating dinner, I watch TV.',
        },
        ipa: 'Jeonyeogeul meokgo naseo tellebijeoneul bwayo.',
      ),
      Phrase(
        id: 'ko_routine_6',
        target: '밤 열한 시에 자요.',
        gloss: {
          UiLang.tr: 'Gece saat on birde yatarım.',
          UiLang.en: 'I go to bed at eleven.',
        },
        ipa: 'Bam yeolhan sie jayo.',
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'Someone asks about your mornings.',
        expected: '저는 매일 일곱 시에 일어나요.',
      ),
      SpeakTurn(
        prompt: 'You describe getting ready.',
        expected: '이를 닦고 나서 샤워해요.',
      ),
      SpeakTurn(prompt: 'They ask about breakfast.', expected: '여덟 시에 아침을 먹어요.'),
      SpeakTurn(
        prompt: 'They ask how you get to work.',
        expected: '자전거를 타고 출근해요.',
      ),
      SpeakTurn(
        prompt: 'They ask when your day ends.',
        expected: '저녁 여섯 시에 퇴근해요.',
      ),
      SpeakTurn(
        prompt: 'They ask about your evenings.',
        expected: '저녁을 먹고 나서 텔레비전을 봐요.',
      ),
      SpeakTurn(prompt: 'They ask when you sleep.', expected: '밤 열한 시에 자요.'),
    ],
  ),
  Scenario(
    id: 'ko_past_story',
    lang: LearnLang.ko,
    cefr: Cefr.a1,
    minutes: 7,
    titles: {
      UiLang.tr: 'Geçmişte bir gün',
      UiLang.en: 'Telling a past event',
    },
    clipLine: '어제 공항에 갔어요.',
    grammarNote: GrammarNote(
      rule: {
        UiLang.tr: 'Geçmiş zaman için fiil/sıfat gövdesine (ünlü uyumuna göre) 았/었어요 eklenir.',
        UiLang.en:
            'For the past tense, add 았/었어요 to the verb/adjective stem, following vowel harmony.',
      },
      goodExample: '어제 공항에 갔어요.',
      badExample: '어제 공항에 가요.',
    ),
    phrases: [
      Phrase(
        id: 'ko_past_story_0',
        target: '어제 공항에 갔어요.',
        gloss: {
          UiLang.tr: 'Dün havaalanına gittim.',
          UiLang.en: 'Yesterday I went to the airport.',
        },
        ipa: 'Eoje gonghange gasseoyo.',
      ),
      Phrase(
        id: 'ko_past_story_1',
        target: '거기서 옛 친구를 만났어요.',
        gloss: {
          UiLang.tr: 'Orada eski bir arkadaşımla karşılaştım.',
          UiLang.en: 'I met an old friend there.',
        },
        ipa: 'Geogiseo yet chingureul mannasseoyo.',
      ),
      Phrase(
        id: 'ko_past_story_2',
        target: '우리는 같이 커피를 마셨어요.',
        gloss: {
          UiLang.tr: 'Birlikte kahve içtik.',
          UiLang.en: 'We drank coffee together.',
        },
        ipa: 'Urineun gachi keopireul masyeosseoyo.',
      ),
      Phrase(
        id: 'ko_past_story_3',
        target: '그 다음에 비행기를 놓쳤어요.',
        gloss: {
          UiLang.tr: 'Sonra uçağımı kaçırdım.',
          UiLang.en: 'Then I missed my flight.',
        },
        ipa: 'Geu daeume bihaenggireul nochyeosseoyo.',
      ),
      Phrase(
        id: 'ko_past_story_4',
        target: '저는 정말 피곤했어요.',
        gloss: {UiLang.tr: 'Çok yorgundum.', UiLang.en: 'I was very tired.'},
        ipa: 'Jeoneun jeongmal pigonhaesseoyo.',
      ),
      Phrase(
        id: 'ko_past_story_5',
        target: '자정에야 겨우 집에 도착했어요.',
        gloss: {
          UiLang.tr: 'Eve ancak gece yarısı vardım.',
          UiLang.en: 'I finally arrived home at midnight.',
        },
        ipa: 'Jajeongeya gyeou jibe dochakhaesseoyo.',
      ),
      Phrase(
        id: 'ko_past_story_6',
        target: '정말 긴 하루였어요.',
        gloss: {
          UiLang.tr: 'Gerçekten uzun bir gündü.',
          UiLang.en: 'It was a long day.',
        },
        ipa: 'Jeongmal gin haruyeosseoyo.',
      ),
    ],
    turns: [
      SpeakTurn(
        prompt: 'They ask about your day yesterday.',
        expected: '어제 공항에 갔어요.',
      ),
      SpeakTurn(
        prompt: 'They ask what happened there.',
        expected: '거기서 옛 친구를 만났어요.',
      ),
      SpeakTurn(
        prompt: 'They ask what you did together.',
        expected: '우리는 같이 커피를 마셨어요.',
      ),
      SpeakTurn(
        prompt: 'They ask what happened next.',
        expected: '그 다음에 비행기를 놓쳤어요.',
      ),
      SpeakTurn(prompt: 'They ask how you felt.', expected: '저는 정말 피곤했어요.'),
      SpeakTurn(
        prompt: 'They ask when you got home.',
        expected: '자정에야 겨우 집에 도착했어요.',
      ),
      SpeakTurn(
        prompt: 'They ask how your day was.',
        expected: '정말 긴 하루였어요.',
      ),
    ],
  ),
];

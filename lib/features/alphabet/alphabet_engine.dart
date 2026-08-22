import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';

enum AlphabetDirection { ltr, rtl }

@immutable
class NuraLetter {
  const NuraLetter({
    required this.character,
    required this.nameTr,
    required this.nameEn,
    required this.sound,
    required this.exampleWord,
    required this.exampleMeaning,
    this.isVowel = false,
  });
  final String character;
  final String nameTr;
  final String nameEn;
  final String sound;
  final String exampleWord;
  final String exampleMeaning;
  final bool isVowel;
}

@immutable
class NuraAlphabet {
  const NuraAlphabet({required this.languageCode, required this.name, required this.direction, required this.letters});
  final String languageCode;
  final String name;
  final AlphabetDirection direction;
  final List<NuraLetter> letters;
}

class AlphabetEngine {
  static final FlutterTts _tts = FlutterTts();

  static Future<void> initTts() async {
    await _tts.setPitch(1.2);
    await _tts.setSpeechRate(0.35);
  }

  static Future<void> speak(String text, String langCode) async {
    final locale = switch (langCode) {
      'ar' => 'ar-SA', 'ru' => 'ru-RU', 'ja' => 'ja-JP', 'ko' => 'ko-KR',
      'el' => 'el-GR', 'he' => 'he-IL', 'hi' => 'hi-IN', 'th' => 'th-TH',
      'zh' => 'zh-CN', 'tr' => 'tr-TR', 'es' => 'es-ES', 'de' => 'de-DE',
      'fr' => 'fr-FR', 'it' => 'it-IT', 'pt' => 'pt-PT', _ => 'en-US',
    };
    await _tts.setLanguage(locale);
    await _tts.speak(text);
  }

  static NuraAlphabet getAlphabet(String langCode) => _alphabets[langCode] ?? _latin(langCode);

  static final Map<String, NuraAlphabet> _alphabets = {
    'ar': _arabic, 'ru': _russian, 'ja': _japanese, 'ko': _korean,
    'el': _greek, 'he': _hebrew, 'hi': _hindi, 'th': _thai,
  };

  static NuraAlphabet _latin(String lang) => NuraAlphabet(
    languageCode: lang, name: 'Latin Alfabesi', direction: AlphabetDirection.ltr,
    letters: const [
      NuraLetter(character: 'A', nameTr: 'A', nameEn: 'A', sound: 'a', exampleWord: 'Apple', exampleMeaning: 'Elma', isVowel: true),
      NuraLetter(character: 'B', nameTr: 'Be', nameEn: 'Bee', sound: 'b', exampleWord: 'Book', exampleMeaning: 'Kitap'),
      NuraLetter(character: 'C', nameTr: 'Ce', nameEn: 'See', sound: 'c/s', exampleWord: 'Cat', exampleMeaning: 'Kedi'),
      NuraLetter(character: 'D', nameTr: 'De', nameEn: 'Dee', sound: 'd', exampleWord: 'Dog', exampleMeaning: 'Köpek'),
      NuraLetter(character: 'E', nameTr: 'E', nameEn: 'Ee', sound: 'e', exampleWord: 'Egg', exampleMeaning: 'Yumurta', isVowel: true),
      NuraLetter(character: 'F', nameTr: 'Fe', nameEn: 'Ef', sound: 'f', exampleWord: 'Fish', exampleMeaning: 'Balık'),
      NuraLetter(character: 'G', nameTr: 'Ge', nameEn: 'Jee', sound: 'g', exampleWord: 'Good', exampleMeaning: 'İyi'),
      NuraLetter(character: 'H', nameTr: 'He', nameEn: 'Aych', sound: 'h', exampleWord: 'Hello', exampleMeaning: 'Merhaba'),
      NuraLetter(character: 'I', nameTr: 'I', nameEn: 'Ay', sound: 'i/ay', exampleWord: 'Ice', exampleMeaning: 'Buz', isVowel: true),
      NuraLetter(character: 'J', nameTr: 'Je', nameEn: 'Jay', sound: 'j', exampleWord: 'Juice', exampleMeaning: 'Meyve suyu'),
      NuraLetter(character: 'K', nameTr: 'Ke', nameEn: 'Kay', sound: 'k', exampleWord: 'Key', exampleMeaning: 'Anahtar'),
      NuraLetter(character: 'L', nameTr: 'Le', nameEn: 'El', sound: 'l', exampleWord: 'Love', exampleMeaning: 'Aşk'),
      NuraLetter(character: 'M', nameTr: 'Me', nameEn: 'Em', sound: 'm', exampleWord: 'Moon', exampleMeaning: 'Ay'),
      NuraLetter(character: 'N', nameTr: 'Ne', nameEn: 'En', sound: 'n', exampleWord: 'Name', exampleMeaning: 'İsim'),
      NuraLetter(character: 'O', nameTr: 'O', nameEn: 'Oh', sound: 'o', exampleWord: 'Open', exampleMeaning: 'Açmak', isVowel: true),
      NuraLetter(character: 'P', nameTr: 'Pe', nameEn: 'Pee', sound: 'p', exampleWord: 'Pen', exampleMeaning: 'Kalem'),
      NuraLetter(character: 'Q', nameTr: 'Qu', nameEn: 'Kyu', sound: 'kv', exampleWord: 'Queen', exampleMeaning: 'Kraliçe'),
      NuraLetter(character: 'R', nameTr: 'Re', nameEn: 'Ar', sound: 'r', exampleWord: 'Rain', exampleMeaning: 'Yağmur'),
      NuraLetter(character: 'S', nameTr: 'Se', nameEn: 'Es', sound: 's', exampleWord: 'Sun', exampleMeaning: 'Güneş'),
      NuraLetter(character: 'T', nameTr: 'Te', nameEn: 'Tee', sound: 't', exampleWord: 'Tree', exampleMeaning: 'Ağaç'),
      NuraLetter(character: 'U', nameTr: 'U', nameEn: 'Yu', sound: 'u/yu', exampleWord: 'Up', exampleMeaning: 'Yukarı', isVowel: true),
      NuraLetter(character: 'V', nameTr: 'Ve', nameEn: 'Vee', sound: 'v', exampleWord: 'Very', exampleMeaning: 'Çok'),
      NuraLetter(character: 'W', nameTr: 'W', nameEn: 'Double-yu', sound: 'w', exampleWord: 'Water', exampleMeaning: 'Su'),
      NuraLetter(character: 'X', nameTr: 'X', nameEn: 'Eks', sound: 'ks', exampleWord: 'Box', exampleMeaning: 'Kutu'),
      NuraLetter(character: 'Y', nameTr: 'Ye', nameEn: 'Way', sound: 'y', exampleWord: 'Yes', exampleMeaning: 'Evet'),
      NuraLetter(character: 'Z', nameTr: 'Ze', nameEn: 'Zee', sound: 'z', exampleWord: 'Zoo', exampleMeaning: 'Hayvanat bahçesi'),
    ],
  );

  static const _arabic = NuraAlphabet(languageCode: 'ar', name: 'Arap Alfabesi', direction: AlphabetDirection.rtl, letters: [
    NuraLetter(character: 'ا', nameTr: 'Elif', nameEn: 'Alif', sound: 'a', exampleWord: 'أرنب', exampleMeaning: 'Tavşan', isVowel: true),
    NuraLetter(character: 'ب', nameTr: 'Be', nameEn: 'Ba', sound: 'b', exampleWord: 'باب', exampleMeaning: 'Kapı'),
    NuraLetter(character: 'ت', nameTr: 'Te', nameEn: 'Ta', sound: 't', exampleWord: 'تمر', exampleMeaning: 'Hurma'),
    NuraLetter(character: 'ث', nameTr: 'Se', nameEn: 'Tha', sound: 'th', exampleWord: 'ثعلب', exampleMeaning: 'Tilki'),
    NuraLetter(character: 'ج', nameTr: 'Cim', nameEn: 'Jim', sound: 'c', exampleWord: 'جمل', exampleMeaning: 'Deve'),
    NuraLetter(character: 'ح', nameTr: 'Ha', nameEn: 'Ha', sound: 'h (derin)', exampleWord: 'حب', exampleMeaning: 'Sevgi'),
    NuraLetter(character: 'خ', nameTr: 'Hı', nameEn: 'Kha', sound: 'kh', exampleWord: 'خبز', exampleMeaning: 'Ekmek'),
    NuraLetter(character: 'د', nameTr: 'Dal', nameEn: 'Dal', sound: 'd', exampleWord: 'دب', exampleMeaning: 'Ayı'),
    NuraLetter(character: 'ذ', nameTr: 'Zel', nameEn: 'Dhal', sound: 'z (peltek)', exampleWord: 'ذهب', exampleMeaning: 'Altın'),
    NuraLetter(character: 'ر', nameTr: 'Ra', nameEn: 'Ra', sound: 'r', exampleWord: 'رمان', exampleMeaning: 'Nar'),
    NuraLetter(character: 'ز', nameTr: 'Ze', nameEn: 'Zay', sound: 'z', exampleWord: 'زهرة', exampleMeaning: 'Çiçek'),
    NuraLetter(character: 'س', nameTr: 'Sin', nameEn: 'Sin', sound: 's', exampleWord: 'سمك', exampleMeaning: 'Balık'),
    NuraLetter(character: 'ش', nameTr: 'Şın', nameEn: 'Shin', sound: 'ş', exampleWord: 'شمس', exampleMeaning: 'Güneş'),
    NuraLetter(character: 'ص', nameTr: 'Sad', nameEn: 'Sad', sound: 's (kalın)', exampleWord: 'صباح', exampleMeaning: 'Sabah'),
    NuraLetter(character: 'ض', nameTr: 'Dad', nameEn: 'Dad', sound: 'd (kalın)', exampleWord: 'ضوء', exampleMeaning: 'Işık'),
    NuraLetter(character: 'ط', nameTr: 'Tı', nameEn: 'Ta', sound: 't (kalın)', exampleWord: 'طبيب', exampleMeaning: 'Doktor'),
    NuraLetter(character: 'ظ', nameTr: 'Zı', nameEn: 'Dha', sound: 'z (kalın)', exampleWord: 'ظهر', exampleMeaning: 'Öğle'),
    NuraLetter(character: 'ع', nameTr: 'Ayn', nameEn: 'Ayn', sound: 'boğaz sıkışması', exampleWord: 'عين', exampleMeaning: 'Göz'),
    NuraLetter(character: 'غ', nameTr: 'Gayn', nameEn: 'Ghayn', sound: 'g (boğaz)', exampleWord: 'غابة', exampleMeaning: 'Orman'),
    NuraLetter(character: 'ف', nameTr: 'Fe', nameEn: 'Fa', sound: 'f', exampleWord: 'فيل', exampleMeaning: 'Fil'),
    NuraLetter(character: 'ق', nameTr: 'Kaf', nameEn: 'Qaf', sound: 'k (derin)', exampleWord: 'قمر', exampleMeaning: 'Ay'),
    NuraLetter(character: 'ك', nameTr: 'Kef', nameEn: 'Kaf', sound: 'k', exampleWord: 'كتاب', exampleMeaning: 'Kitap'),
    NuraLetter(character: 'ل', nameTr: 'Lam', nameEn: 'Lam', sound: 'l', exampleWord: 'ليمون', exampleMeaning: 'Limon'),
    NuraLetter(character: 'م', nameTr: 'Mim', nameEn: 'Mim', sound: 'm', exampleWord: 'ماء', exampleMeaning: 'Su'),
    NuraLetter(character: 'ن', nameTr: 'Nun', nameEn: 'Nun', sound: 'n', exampleWord: 'نجمة', exampleMeaning: 'Yıldız'),
    NuraLetter(character: 'ه', nameTr: 'He', nameEn: 'Ha', sound: 'h', exampleWord: 'هدية', exampleMeaning: 'Hediye'),
    NuraLetter(character: 'و', nameTr: 'Vav', nameEn: 'Waw', sound: 'v/u', exampleWord: 'ورد', exampleMeaning: 'Gül', isVowel: true),
    NuraLetter(character: 'ي', nameTr: 'Ye', nameEn: 'Ya', sound: 'y/i', exampleWord: 'يد', exampleMeaning: 'El', isVowel: true),
  ]);

  static const _russian = NuraAlphabet(languageCode: 'ru', name: 'Kiril Alfabesi', direction: AlphabetDirection.ltr, letters: [
    NuraLetter(character: 'А', nameTr: 'A', nameEn: 'A', sound: 'a', exampleWord: 'Автобус', exampleMeaning: 'Otobüs', isVowel: true),
    NuraLetter(character: 'Б', nameTr: 'Be', nameEn: 'Be', sound: 'b', exampleWord: 'Банан', exampleMeaning: 'Muz'),
    NuraLetter(character: 'В', nameTr: 'Ve', nameEn: 'Ve', sound: 'v', exampleWord: 'Вода', exampleMeaning: 'Su'),
    NuraLetter(character: 'Г', nameTr: 'Ge', nameEn: 'Ge', sound: 'g', exampleWord: 'Город', exampleMeaning: 'Şehir'),
    NuraLetter(character: 'Д', nameTr: 'De', nameEn: 'De', sound: 'd', exampleWord: 'Дом', exampleMeaning: 'Ev'),
    NuraLetter(character: 'Е', nameTr: 'Ye', nameEn: 'Ye', sound: 'ye', exampleWord: 'Еда', exampleMeaning: 'Yemek', isVowel: true),
    NuraLetter(character: 'Ж', nameTr: 'Je', nameEn: 'Zhe', sound: 'j', exampleWord: 'Жизнь', exampleMeaning: 'Hayat'),
    NuraLetter(character: 'З', nameTr: 'Ze', nameEn: 'Ze', sound: 'z', exampleWord: 'Звезда', exampleMeaning: 'Yıldız'),
    NuraLetter(character: 'И', nameTr: 'İ', nameEn: 'Ee', sound: 'i', exampleWord: 'Игра', exampleMeaning: 'Oyun', isVowel: true),
    NuraLetter(character: 'К', nameTr: 'Ka', nameEn: 'Ka', sound: 'k', exampleWord: 'Кот', exampleMeaning: 'Kedi'),
  ]);

  static const _japanese = NuraAlphabet(languageCode: 'ja', name: 'Hiragana', direction: AlphabetDirection.ltr, letters: [
    NuraLetter(character: 'あ', nameTr: 'A', nameEn: 'A', sound: 'a', exampleWord: 'あめ', exampleMeaning: 'Yağmur', isVowel: true),
    NuraLetter(character: 'い', nameTr: 'İ', nameEn: 'I', sound: 'i', exampleWord: 'いぬ', exampleMeaning: 'Köpek', isVowel: true),
    NuraLetter(character: 'う', nameTr: 'U', nameEn: 'U', sound: 'u', exampleWord: 'うみ', exampleMeaning: 'Deniz', isVowel: true),
    NuraLetter(character: 'え', nameTr: 'E', nameEn: 'E', sound: 'e', exampleWord: 'えき', exampleMeaning: 'İstasyon', isVowel: true),
    NuraLetter(character: 'お', nameTr: 'O', nameEn: 'O', sound: 'o', exampleWord: 'おちゃ', exampleMeaning: 'Çay', isVowel: true),
    NuraLetter(character: 'か', nameTr: 'Ka', nameEn: 'Ka', sound: 'ka', exampleWord: 'かさ', exampleMeaning: 'Şemsiye'),
    NuraLetter(character: 'き', nameTr: 'Ki', nameEn: 'Ki', sound: 'ki', exampleWord: 'きく', exampleMeaning: 'Dinlemek'),
    NuraLetter(character: 'く', nameTr: 'Ku', nameEn: 'Ku', sound: 'ku', exampleWord: 'くも', exampleMeaning: 'Bulut'),
  ]);

  static const _korean = NuraAlphabet(languageCode: 'ko', name: 'Hangul', direction: AlphabetDirection.ltr, letters: [
    NuraLetter(character: 'ㄱ', nameTr: 'Giyeok', nameEn: 'Giyeok', sound: 'g/k', exampleWord: '가방', exampleMeaning: 'Çanta'),
    NuraLetter(character: 'ㄴ', nameTr: 'Nieun', nameEn: 'Nieun', sound: 'n', exampleWord: '나라', exampleMeaning: 'Ülke'),
    NuraLetter(character: 'ㄷ', nameTr: 'Digeut', nameEn: 'Digeut', sound: 'd/t', exampleWord: '다리', exampleMeaning: 'Köprü'),
    NuraLetter(character: 'ㄹ', nameTr: 'Rieul', nameEn: 'Rieul', sound: 'r/l', exampleWord: '라면', exampleMeaning: 'Ramen'),
    NuraLetter(character: 'ㅁ', nameTr: 'Mieum', nameEn: 'Mieum', sound: 'm', exampleWord: '마을', exampleMeaning: 'Köy'),
    NuraLetter(character: 'ㅂ', nameTr: 'Bieup', nameEn: 'Bieup', sound: 'b/p', exampleWord: '바다', exampleMeaning: 'Deniz'),
  ]);

  static const _greek = NuraAlphabet(languageCode: 'el', name: 'Yunan Alfabesi', direction: AlphabetDirection.ltr, letters: [
    NuraLetter(character: 'Α', nameTr: 'Alfa', nameEn: 'Alpha', sound: 'a', exampleWord: 'Αθήνα', exampleMeaning: 'Atina', isVowel: true),
    NuraLetter(character: 'Β', nameTr: 'Vita', nameEn: 'Beta', sound: 'v', exampleWord: 'Βιβλίο', exampleMeaning: 'Kitap'),
    NuraLetter(character: 'Γ', nameTr: 'Gamma', nameEn: 'Gamma', sound: 'g/y', exampleWord: 'Γάλα', exampleMeaning: 'Süt'),
    NuraLetter(character: 'Δ', nameTr: 'Delta', nameEn: 'Delta', sound: 'dh', exampleWord: 'Δρόμος', exampleMeaning: 'Yol'),
  ]);

  static const _hebrew = NuraAlphabet(languageCode: 'he', name: 'İbrani Alfabesi', direction: AlphabetDirection.rtl, letters: [
    NuraLetter(character: 'א', nameTr: 'Alef', nameEn: 'Alef', sound: 'sessiz/a', exampleWord: 'אבא', exampleMeaning: 'Baba'),
    NuraLetter(character: 'ב', nameTr: 'Bet', nameEn: 'Bet', sound: 'b/v', exampleWord: 'בית', exampleMeaning: 'Ev'),
    NuraLetter(character: 'ג', nameTr: 'Gimel', nameEn: 'Gimel', sound: 'g', exampleWord: 'גמל', exampleMeaning: 'Deve'),
    NuraLetter(character: 'ד', nameTr: 'Dalet', nameEn: 'Dalet', sound: 'd', exampleWord: 'דג', exampleMeaning: 'Balık'),
  ]);

  static const _hindi = NuraAlphabet(languageCode: 'hi', name: 'Devanagari', direction: AlphabetDirection.ltr, letters: [
    NuraLetter(character: 'अ', nameTr: 'A', nameEn: 'A', sound: 'a', exampleWord: 'अनार', exampleMeaning: 'Nar', isVowel: true),
    NuraLetter(character: 'आ', nameTr: 'Aa', nameEn: 'Aa', sound: 'aa', exampleWord: 'आम', exampleMeaning: 'Mango', isVowel: true),
    NuraLetter(character: 'क', nameTr: 'Ka', nameEn: 'Ka', sound: 'ka', exampleWord: 'कमल', exampleMeaning: 'Nilüfer'),
    NuraLetter(character: 'ख', nameTr: 'Kha', nameEn: 'Kha', sound: 'kha', exampleWord: 'खरगोश', exampleMeaning: 'Tavşan'),
  ]);

  static const _thai = NuraAlphabet(languageCode: 'th', name: 'Tay Alfabesi', direction: AlphabetDirection.ltr, letters: [
    NuraLetter(character: 'ก', nameTr: 'Ko Kai', nameEn: 'Ko Kai', sound: 'k', exampleWord: 'ไก่', exampleMeaning: 'Tavuk'),
    NuraLetter(character: 'ข', nameTr: 'Kho Khai', nameEn: 'Kho Khai', sound: 'kh', exampleWord: 'ไข่', exampleMeaning: 'Yumurta'),
    NuraLetter(character: 'ค', nameTr: 'Kho Khwai', nameEn: 'Kho Khwai', sound: 'kh', exampleWord: 'ควาย', exampleMeaning: 'Bufalo'),
  ]);
}

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
    'en': _latin('en'), 'de': _german, 'fr': _french, 'es': _spanish,
    'it': _italian, 'pt': _portuguese, 'tr': _turkish,
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

  static const _german = NuraAlphabet(languageCode: 'de', name: 'Alman Alfabesi', direction: AlphabetDirection.ltr, letters: [
    NuraLetter(character: 'A', nameTr: 'A', nameEn: 'Ah', sound: 'a', exampleWord: 'Apfel', exampleMeaning: 'Elma', isVowel: true),
    NuraLetter(character: 'B', nameTr: 'Be', nameEn: 'Bay', sound: 'b', exampleWord: 'Buch', exampleMeaning: 'Kitap'),
    NuraLetter(character: 'C', nameTr: 'Tse', nameEn: 'Tsay', sound: 'ts/k', exampleWord: 'Computer', exampleMeaning: 'Bilgisayar'),
    NuraLetter(character: 'D', nameTr: 'De', nameEn: 'Day', sound: 'd', exampleWord: 'Dorf', exampleMeaning: 'Köy'),
    NuraLetter(character: 'E', nameTr: 'E', nameEn: 'Eh', sound: 'e', exampleWord: 'Ente', exampleMeaning: 'Ördek', isVowel: true),
    NuraLetter(character: 'F', nameTr: 'Ef', nameEn: 'Eff', sound: 'f', exampleWord: 'Fisch', exampleMeaning: 'Balık'),
    NuraLetter(character: 'G', nameTr: 'Ge', nameEn: 'Gay', sound: 'g', exampleWord: 'Garten', exampleMeaning: 'Bahçe'),
    NuraLetter(character: 'H', nameTr: 'Ha', nameEn: 'Hah', sound: 'h', exampleWord: 'Haus', exampleMeaning: 'Ev'),
    NuraLetter(character: 'I', nameTr: 'İ', nameEn: 'Ee', sound: 'i', exampleWord: 'Insel', exampleMeaning: 'Ada', isVowel: true),
    NuraLetter(character: 'J', nameTr: 'Yot', nameEn: 'Yot', sound: 'y', exampleWord: 'Junge', exampleMeaning: 'Erkek çocuk'),
    NuraLetter(character: 'K', nameTr: 'Ka', nameEn: 'Kah', sound: 'k', exampleWord: 'Katze', exampleMeaning: 'Kedi'),
    NuraLetter(character: 'L', nameTr: 'El', nameEn: 'Ell', sound: 'l', exampleWord: 'Liebe', exampleMeaning: 'Aşk'),
    NuraLetter(character: 'M', nameTr: 'Em', nameEn: 'Emm', sound: 'm', exampleWord: 'Mond', exampleMeaning: 'Ay'),
    NuraLetter(character: 'N', nameTr: 'En', nameEn: 'Enn', sound: 'n', exampleWord: 'Name', exampleMeaning: 'İsim'),
    NuraLetter(character: 'O', nameTr: 'O', nameEn: 'Oh', sound: 'o', exampleWord: 'Ofen', exampleMeaning: 'Fırın', isVowel: true),
    NuraLetter(character: 'P', nameTr: 'Pe', nameEn: 'Pay', sound: 'p', exampleWord: 'Papier', exampleMeaning: 'Kağıt'),
    NuraLetter(character: 'Q', nameTr: 'Ku', nameEn: 'Koo', sound: 'kv', exampleWord: 'Quelle', exampleMeaning: 'Kaynak'),
    NuraLetter(character: 'R', nameTr: 'Er', nameEn: 'Air', sound: 'r', exampleWord: 'Regen', exampleMeaning: 'Yağmur'),
    NuraLetter(character: 'S', nameTr: 'Es', nameEn: 'Ess', sound: 's/z', exampleWord: 'Sonne', exampleMeaning: 'Güneş'),
    NuraLetter(character: 'T', nameTr: 'Te', nameEn: 'Tay', sound: 't', exampleWord: 'Tisch', exampleMeaning: 'Masa'),
    NuraLetter(character: 'U', nameTr: 'U', nameEn: 'Oo', sound: 'u', exampleWord: 'Uhr', exampleMeaning: 'Saat', isVowel: true),
    NuraLetter(character: 'V', nameTr: 'Fau', nameEn: 'Fow', sound: 'f', exampleWord: 'Vogel', exampleMeaning: 'Kuş'),
    NuraLetter(character: 'W', nameTr: 'Ve', nameEn: 'Vay', sound: 'v', exampleWord: 'Wasser', exampleMeaning: 'Su'),
    NuraLetter(character: 'X', nameTr: 'İks', nameEn: 'Iks', sound: 'ks', exampleWord: 'Taxi', exampleMeaning: 'Taksi'),
    NuraLetter(character: 'Y', nameTr: 'Üpsilon', nameEn: 'Upsilon', sound: 'ü', exampleWord: 'Yoga', exampleMeaning: 'Yoga'),
    NuraLetter(character: 'Z', nameTr: 'Tset', nameEn: 'Tsett', sound: 'ts', exampleWord: 'Zeit', exampleMeaning: 'Zaman'),
    NuraLetter(character: 'Ä', nameTr: 'Umlaut A', nameEn: 'A-umlaut', sound: 'e', exampleWord: 'Äpfel', exampleMeaning: 'Elmalar', isVowel: true),
    NuraLetter(character: 'Ö', nameTr: 'Umlaut O', nameEn: 'O-umlaut', sound: 'ö', exampleWord: 'Öl', exampleMeaning: 'Yağ', isVowel: true),
    NuraLetter(character: 'Ü', nameTr: 'Umlaut U', nameEn: 'U-umlaut', sound: 'ü', exampleWord: 'Übung', exampleMeaning: 'Alıştırma', isVowel: true),
    NuraLetter(character: 'ß', nameTr: 'Eszett', nameEn: 'Eszett', sound: 'ss', exampleWord: 'Straße', exampleMeaning: 'Cadde'),
  ]);

  static const _french = NuraAlphabet(languageCode: 'fr', name: 'Fransız Alfabesi', direction: AlphabetDirection.ltr, letters: [
    NuraLetter(character: 'A', nameTr: 'A', nameEn: 'Ah', sound: 'a', exampleWord: 'Ami', exampleMeaning: 'Arkadaş', isVowel: true),
    NuraLetter(character: 'B', nameTr: 'Be', nameEn: 'Bay', sound: 'b', exampleWord: 'Bonjour', exampleMeaning: 'Merhaba'),
    NuraLetter(character: 'C', nameTr: 'Se', nameEn: 'Say', sound: 'k/s', exampleWord: 'Chat', exampleMeaning: 'Kedi'),
    NuraLetter(character: 'D', nameTr: 'De', nameEn: 'Day', sound: 'd', exampleWord: 'Danse', exampleMeaning: 'Dans'),
    NuraLetter(character: 'E', nameTr: 'E', nameEn: 'Uh', sound: 'ö/e', exampleWord: 'École', exampleMeaning: 'Okul', isVowel: true),
    NuraLetter(character: 'F', nameTr: 'Ef', nameEn: 'Eff', sound: 'f', exampleWord: 'Fleur', exampleMeaning: 'Çiçek'),
    NuraLetter(character: 'G', nameTr: 'Je', nameEn: 'Zhay', sound: 'g/j', exampleWord: 'Garçon', exampleMeaning: 'Erkek çocuk'),
    NuraLetter(character: 'H', nameTr: 'Aş', nameEn: 'Ash', sound: '(sessiz)', exampleWord: 'Hôtel', exampleMeaning: 'Otel'),
    NuraLetter(character: 'I', nameTr: 'İ', nameEn: 'Ee', sound: 'i', exampleWord: 'Île', exampleMeaning: 'Ada', isVowel: true),
    NuraLetter(character: 'J', nameTr: 'Ji', nameEn: 'Zhee', sound: 'j', exampleWord: 'Jardin', exampleMeaning: 'Bahçe'),
    NuraLetter(character: 'K', nameTr: 'Ka', nameEn: 'Kah', sound: 'k', exampleWord: 'Kilo', exampleMeaning: 'Kilo'),
    NuraLetter(character: 'L', nameTr: 'El', nameEn: 'Ell', sound: 'l', exampleWord: 'Lune', exampleMeaning: 'Ay'),
    NuraLetter(character: 'M', nameTr: 'Em', nameEn: 'Emm', sound: 'm', exampleWord: 'Maison', exampleMeaning: 'Ev'),
    NuraLetter(character: 'N', nameTr: 'En', nameEn: 'Enn', sound: 'n', exampleWord: 'Nom', exampleMeaning: 'İsim'),
    NuraLetter(character: 'O', nameTr: 'O', nameEn: 'Oh', sound: 'o', exampleWord: 'Oiseau', exampleMeaning: 'Kuş', isVowel: true),
    NuraLetter(character: 'P', nameTr: 'Pe', nameEn: 'Pay', sound: 'p', exampleWord: 'Pain', exampleMeaning: 'Ekmek'),
    NuraLetter(character: 'Q', nameTr: 'Kü', nameEn: 'Kew', sound: 'k', exampleWord: 'Quoi', exampleMeaning: 'Ne'),
    NuraLetter(character: 'R', nameTr: 'Er', nameEn: 'Air', sound: 'r (gırtlaktan)', exampleWord: 'Rouge', exampleMeaning: 'Kırmızı'),
    NuraLetter(character: 'S', nameTr: 'Es', nameEn: 'Ess', sound: 's', exampleWord: 'Soleil', exampleMeaning: 'Güneş'),
    NuraLetter(character: 'T', nameTr: 'Te', nameEn: 'Tay', sound: 't', exampleWord: 'Table', exampleMeaning: 'Masa'),
    NuraLetter(character: 'U', nameTr: 'Ü', nameEn: 'Ew', sound: 'ü', exampleWord: 'Une', exampleMeaning: 'Bir (dişil)', isVowel: true),
    NuraLetter(character: 'V', nameTr: 'Ve', nameEn: 'Vay', sound: 'v', exampleWord: 'Ville', exampleMeaning: 'Şehir'),
    NuraLetter(character: 'W', nameTr: 'Dubl Ve', nameEn: 'Double-V', sound: 'v/w', exampleWord: 'Wagon', exampleMeaning: 'Vagon'),
    NuraLetter(character: 'X', nameTr: 'İks', nameEn: 'Iks', sound: 'ks', exampleWord: 'Xylophone', exampleMeaning: 'Ksilofon'),
    NuraLetter(character: 'Y', nameTr: 'İgrek', nameEn: 'Igrek', sound: 'i', exampleWord: 'Yaourt', exampleMeaning: 'Yoğurt'),
    NuraLetter(character: 'Z', nameTr: 'Zed', nameEn: 'Zed', sound: 'z', exampleWord: 'Zéro', exampleMeaning: 'Sıfır'),
  ]);

  static const _spanish = NuraAlphabet(languageCode: 'es', name: 'İspanyol Alfabesi', direction: AlphabetDirection.ltr, letters: [
    NuraLetter(character: 'A', nameTr: 'A', nameEn: 'Ah', sound: 'a', exampleWord: 'Amigo', exampleMeaning: 'Arkadaş', isVowel: true),
    NuraLetter(character: 'B', nameTr: 'Be', nameEn: 'Bay', sound: 'b', exampleWord: 'Barco', exampleMeaning: 'Gemi'),
    NuraLetter(character: 'C', nameTr: 'Se', nameEn: 'Say', sound: 'k/s', exampleWord: 'Casa', exampleMeaning: 'Ev'),
    NuraLetter(character: 'D', nameTr: 'De', nameEn: 'Day', sound: 'd', exampleWord: 'Dedo', exampleMeaning: 'Parmak'),
    NuraLetter(character: 'E', nameTr: 'E', nameEn: 'Eh', sound: 'e', exampleWord: 'Elefante', exampleMeaning: 'Fil', isVowel: true),
    NuraLetter(character: 'F', nameTr: 'Efe', nameEn: 'Effay', sound: 'f', exampleWord: 'Flor', exampleMeaning: 'Çiçek'),
    NuraLetter(character: 'G', nameTr: 'Ge', nameEn: 'Hay', sound: 'g/h', exampleWord: 'Gato', exampleMeaning: 'Kedi'),
    NuraLetter(character: 'H', nameTr: 'Açe', nameEn: 'Achay', sound: '(sessiz)', exampleWord: 'Hola', exampleMeaning: 'Merhaba'),
    NuraLetter(character: 'I', nameTr: 'İ', nameEn: 'Ee', sound: 'i', exampleWord: 'Isla', exampleMeaning: 'Ada', isVowel: true),
    NuraLetter(character: 'J', nameTr: 'Jota', nameEn: 'Hota', sound: 'h', exampleWord: 'Jamón', exampleMeaning: 'Jambon'),
    NuraLetter(character: 'K', nameTr: 'Ka', nameEn: 'Kah', sound: 'k', exampleWord: 'Kilo', exampleMeaning: 'Kilo'),
    NuraLetter(character: 'L', nameTr: 'Ele', nameEn: 'Ellay', sound: 'l', exampleWord: 'Luna', exampleMeaning: 'Ay'),
    NuraLetter(character: 'M', nameTr: 'Eme', nameEn: 'Emmay', sound: 'm', exampleWord: 'Mesa', exampleMeaning: 'Masa'),
    NuraLetter(character: 'N', nameTr: 'Ene', nameEn: 'Ennay', sound: 'n', exampleWord: 'Nombre', exampleMeaning: 'İsim'),
    NuraLetter(character: 'Ñ', nameTr: 'Enye', nameEn: 'Enyay', sound: 'ny', exampleWord: 'Niño', exampleMeaning: 'Çocuk'),
    NuraLetter(character: 'O', nameTr: 'O', nameEn: 'Oh', sound: 'o', exampleWord: 'Oso', exampleMeaning: 'Ayı', isVowel: true),
    NuraLetter(character: 'P', nameTr: 'Pe', nameEn: 'Pay', sound: 'p', exampleWord: 'Pan', exampleMeaning: 'Ekmek'),
    NuraLetter(character: 'Q', nameTr: 'Ku', nameEn: 'Koo', sound: 'k', exampleWord: 'Queso', exampleMeaning: 'Peynir'),
    NuraLetter(character: 'R', nameTr: 'Ere', nameEn: 'Erray', sound: 'r', exampleWord: 'Ratón', exampleMeaning: 'Fare'),
    NuraLetter(character: 'S', nameTr: 'Ese', nameEn: 'Essay', sound: 's', exampleWord: 'Sol', exampleMeaning: 'Güneş'),
    NuraLetter(character: 'T', nameTr: 'Te', nameEn: 'Tay', sound: 't', exampleWord: 'Taza', exampleMeaning: 'Fincan'),
    NuraLetter(character: 'U', nameTr: 'U', nameEn: 'Oo', sound: 'u', exampleWord: 'Uva', exampleMeaning: 'Üzüm', isVowel: true),
    NuraLetter(character: 'V', nameTr: 'Uve', nameEn: 'Oovay', sound: 'b', exampleWord: 'Vaca', exampleMeaning: 'İnek'),
    NuraLetter(character: 'W', nameTr: 'Uve Doble', nameEn: 'Double-U', sound: 'w', exampleWord: 'Web', exampleMeaning: 'Web'),
    NuraLetter(character: 'X', nameTr: 'Equis', nameEn: 'Ekees', sound: 'ks', exampleWord: 'Taxi', exampleMeaning: 'Taksi'),
    NuraLetter(character: 'Y', nameTr: 'Ye', nameEn: 'Yay', sound: 'y/i', exampleWord: 'Yo', exampleMeaning: 'Ben'),
    NuraLetter(character: 'Z', nameTr: 'Zeta', nameEn: 'Zayta', sound: 's/z', exampleWord: 'Zapato', exampleMeaning: 'Ayakkabı'),
  ]);

  static const _italian = NuraAlphabet(languageCode: 'it', name: 'İtalyan Alfabesi', direction: AlphabetDirection.ltr, letters: [
    NuraLetter(character: 'A', nameTr: 'A', nameEn: 'Ah', sound: 'a', exampleWord: 'Amico', exampleMeaning: 'Arkadaş', isVowel: true),
    NuraLetter(character: 'B', nameTr: 'Bi', nameEn: 'Bee', sound: 'b', exampleWord: 'Bambino', exampleMeaning: 'Çocuk'),
    NuraLetter(character: 'C', nameTr: 'Çi', nameEn: 'Chee', sound: 'k/ç', exampleWord: 'Casa', exampleMeaning: 'Ev'),
    NuraLetter(character: 'D', nameTr: 'Di', nameEn: 'Dee', sound: 'd', exampleWord: 'Dolce', exampleMeaning: 'Tatlı'),
    NuraLetter(character: 'E', nameTr: 'E', nameEn: 'Eh', sound: 'e', exampleWord: 'Elefante', exampleMeaning: 'Fil', isVowel: true),
    NuraLetter(character: 'F', nameTr: 'Effe', nameEn: 'Effay', sound: 'f', exampleWord: 'Fiore', exampleMeaning: 'Çiçek'),
    NuraLetter(character: 'G', nameTr: 'Ci', nameEn: 'Jee', sound: 'g/c', exampleWord: 'Gatto', exampleMeaning: 'Kedi'),
    NuraLetter(character: 'H', nameTr: 'Akka', nameEn: 'Akka', sound: '(sessiz)', exampleWord: 'Hotel', exampleMeaning: 'Otel'),
    NuraLetter(character: 'I', nameTr: 'İ', nameEn: 'Ee', sound: 'i', exampleWord: 'Isola', exampleMeaning: 'Ada', isVowel: true),
    NuraLetter(character: 'L', nameTr: 'Elle', nameEn: 'Ellay', sound: 'l', exampleWord: 'Luna', exampleMeaning: 'Ay'),
    NuraLetter(character: 'M', nameTr: 'Emme', nameEn: 'Emmay', sound: 'm', exampleWord: 'Mare', exampleMeaning: 'Deniz'),
    NuraLetter(character: 'N', nameTr: 'Enne', nameEn: 'Ennay', sound: 'n', exampleWord: 'Nome', exampleMeaning: 'İsim'),
    NuraLetter(character: 'O', nameTr: 'O', nameEn: 'Oh', sound: 'o', exampleWord: 'Occhio', exampleMeaning: 'Göz', isVowel: true),
    NuraLetter(character: 'P', nameTr: 'Pi', nameEn: 'Pee', sound: 'p', exampleWord: 'Pane', exampleMeaning: 'Ekmek'),
    NuraLetter(character: 'Q', nameTr: 'Ku', nameEn: 'Koo', sound: 'k', exampleWord: 'Quadro', exampleMeaning: 'Tablo'),
    NuraLetter(character: 'R', nameTr: 'Erre', nameEn: 'Erray', sound: 'r', exampleWord: 'Rosso', exampleMeaning: 'Kırmızı'),
    NuraLetter(character: 'S', nameTr: 'Esse', nameEn: 'Essay', sound: 's', exampleWord: 'Sole', exampleMeaning: 'Güneş'),
    NuraLetter(character: 'T', nameTr: 'Ti', nameEn: 'Tee', sound: 't', exampleWord: 'Tavolo', exampleMeaning: 'Masa'),
    NuraLetter(character: 'U', nameTr: 'U', nameEn: 'Oo', sound: 'u', exampleWord: 'Uva', exampleMeaning: 'Üzüm', isVowel: true),
    NuraLetter(character: 'V', nameTr: 'Vi', nameEn: 'Vee', sound: 'v', exampleWord: 'Vento', exampleMeaning: 'Rüzgar'),
    NuraLetter(character: 'Z', nameTr: 'Zeta', nameEn: 'Zayta', sound: 'ts/dz', exampleWord: 'Zaino', exampleMeaning: 'Sırt çantası'),
  ]);

  static const _portuguese = NuraAlphabet(languageCode: 'pt', name: 'Portekiz Alfabesi', direction: AlphabetDirection.ltr, letters: [
    NuraLetter(character: 'A', nameTr: 'A', nameEn: 'Ah', sound: 'a', exampleWord: 'Amigo', exampleMeaning: 'Arkadaş', isVowel: true),
    NuraLetter(character: 'B', nameTr: 'Be', nameEn: 'Bay', sound: 'b', exampleWord: 'Bola', exampleMeaning: 'Top'),
    NuraLetter(character: 'C', nameTr: 'Se', nameEn: 'Say', sound: 'k/s', exampleWord: 'Casa', exampleMeaning: 'Ev'),
    NuraLetter(character: 'Ç', nameTr: 'Se Sedilya', nameEn: 'C-cedilla', sound: 's', exampleWord: 'Coração', exampleMeaning: 'Kalp'),
    NuraLetter(character: 'D', nameTr: 'De', nameEn: 'Day', sound: 'd', exampleWord: 'Dedo', exampleMeaning: 'Parmak'),
    NuraLetter(character: 'E', nameTr: 'E', nameEn: 'Eh', sound: 'e', exampleWord: 'Escola', exampleMeaning: 'Okul', isVowel: true),
    NuraLetter(character: 'F', nameTr: 'Efe', nameEn: 'Effay', sound: 'f', exampleWord: 'Flor', exampleMeaning: 'Çiçek'),
    NuraLetter(character: 'G', nameTr: 'Ge', nameEn: 'Zhay', sound: 'g/j', exampleWord: 'Gato', exampleMeaning: 'Kedi'),
    NuraLetter(character: 'H', nameTr: 'Aga', nameEn: 'Aga', sound: '(sessiz)', exampleWord: 'Hoje', exampleMeaning: 'Bugün'),
    NuraLetter(character: 'I', nameTr: 'İ', nameEn: 'Ee', sound: 'i', exampleWord: 'Ilha', exampleMeaning: 'Ada', isVowel: true),
    NuraLetter(character: 'J', nameTr: 'Jota', nameEn: 'Zhota', sound: 'j', exampleWord: 'Janela', exampleMeaning: 'Pencere'),
    NuraLetter(character: 'L', nameTr: 'Ele', nameEn: 'Ellay', sound: 'l', exampleWord: 'Lua', exampleMeaning: 'Ay'),
    NuraLetter(character: 'M', nameTr: 'Eme', nameEn: 'Emmay', sound: 'm', exampleWord: 'Mesa', exampleMeaning: 'Masa'),
    NuraLetter(character: 'N', nameTr: 'Ene', nameEn: 'Ennay', sound: 'n', exampleWord: 'Nome', exampleMeaning: 'İsim'),
    NuraLetter(character: 'O', nameTr: 'O', nameEn: 'Oh', sound: 'o', exampleWord: 'Olho', exampleMeaning: 'Göz', isVowel: true),
    NuraLetter(character: 'P', nameTr: 'Pe', nameEn: 'Pay', sound: 'p', exampleWord: 'Pão', exampleMeaning: 'Ekmek'),
    NuraLetter(character: 'Q', nameTr: 'Ke', nameEn: 'Kay', sound: 'k', exampleWord: 'Queijo', exampleMeaning: 'Peynir'),
    NuraLetter(character: 'R', nameTr: 'Erre', nameEn: 'Erray', sound: 'r/h', exampleWord: 'Rato', exampleMeaning: 'Fare'),
    NuraLetter(character: 'S', nameTr: 'Esse', nameEn: 'Essay', sound: 's', exampleWord: 'Sol', exampleMeaning: 'Güneş'),
    NuraLetter(character: 'T', nameTr: 'Te', nameEn: 'Tay', sound: 't', exampleWord: 'Tigre', exampleMeaning: 'Kaplan'),
    NuraLetter(character: 'U', nameTr: 'U', nameEn: 'Oo', sound: 'u', exampleWord: 'Uva', exampleMeaning: 'Üzüm', isVowel: true),
    NuraLetter(character: 'V', nameTr: 'Ve', nameEn: 'Vay', sound: 'v', exampleWord: 'Vento', exampleMeaning: 'Rüzgar'),
    NuraLetter(character: 'X', nameTr: 'Şis', nameEn: 'Sheesh', sound: 'ş/ks', exampleWord: 'Xadrez', exampleMeaning: 'Satranç'),
    NuraLetter(character: 'Z', nameTr: 'Ze', nameEn: 'Zay', sound: 'z', exampleWord: 'Zebra', exampleMeaning: 'Zebra'),
  ]);

  static const _turkish = NuraAlphabet(languageCode: 'tr', name: 'Türk Alfabesi', direction: AlphabetDirection.ltr, letters: [
    NuraLetter(character: 'A', nameTr: 'A', nameEn: 'A', sound: 'a', exampleWord: 'Araba', exampleMeaning: 'Taşıt', isVowel: true),
    NuraLetter(character: 'B', nameTr: 'Be', nameEn: 'Be', sound: 'b', exampleWord: 'Balık', exampleMeaning: 'Su canlısı'),
    NuraLetter(character: 'C', nameTr: 'Ce', nameEn: 'Je', sound: 'c', exampleWord: 'Ceviz', exampleMeaning: 'Sert kabuklu meyve'),
    NuraLetter(character: 'Ç', nameTr: 'Çe', nameEn: 'Che', sound: 'ç', exampleWord: 'Çiçek', exampleMeaning: 'Bitki organı'),
    NuraLetter(character: 'D', nameTr: 'De', nameEn: 'De', sound: 'd', exampleWord: 'Deniz', exampleMeaning: 'Büyük su kütlesi'),
    NuraLetter(character: 'E', nameTr: 'E', nameEn: 'E', sound: 'e', exampleWord: 'Elma', exampleMeaning: 'Meyve', isVowel: true),
    NuraLetter(character: 'F', nameTr: 'Fe', nameEn: 'Fe', sound: 'f', exampleWord: 'Fil', exampleMeaning: 'Büyük hayvan'),
    NuraLetter(character: 'G', nameTr: 'Ge', nameEn: 'Ge', sound: 'g', exampleWord: 'Gül', exampleMeaning: 'Çiçek türü'),
    NuraLetter(character: 'Ğ', nameTr: 'Yumuşak Ge', nameEn: 'Soft G', sound: '(uzatma)', exampleWord: 'Dağ', exampleMeaning: 'Yüksek arazi'),
    NuraLetter(character: 'H', nameTr: 'He', nameEn: 'He', sound: 'h', exampleWord: 'Hava', exampleMeaning: 'Atmosfer'),
    NuraLetter(character: 'I', nameTr: 'I', nameEn: 'I', sound: 'ı', exampleWord: 'Ilık', exampleMeaning: 'Az sıcak', isVowel: true),
    NuraLetter(character: 'İ', nameTr: 'İ', nameEn: 'I (noktalı)', sound: 'i', exampleWord: 'İnsan', exampleMeaning: 'Kişi', isVowel: true),
    NuraLetter(character: 'J', nameTr: 'Je', nameEn: 'Je', sound: 'j', exampleWord: 'Jilet', exampleMeaning: 'Tıraş bıçağı'),
    NuraLetter(character: 'K', nameTr: 'Ke', nameEn: 'Ke', sound: 'k', exampleWord: 'Kedi', exampleMeaning: 'Ev hayvanı'),
    NuraLetter(character: 'L', nameTr: 'Le', nameEn: 'Le', sound: 'l', exampleWord: 'Limon', exampleMeaning: 'Ekşi meyve'),
    NuraLetter(character: 'M', nameTr: 'Me', nameEn: 'Me', sound: 'm', exampleWord: 'Masa', exampleMeaning: 'Mobilya'),
    NuraLetter(character: 'N', nameTr: 'Ne', nameEn: 'Ne', sound: 'n', exampleWord: 'Nar', exampleMeaning: 'Meyve'),
    NuraLetter(character: 'O', nameTr: 'O', nameEn: 'O', sound: 'o', exampleWord: 'Okul', exampleMeaning: 'Eğitim yeri', isVowel: true),
    NuraLetter(character: 'Ö', nameTr: 'Ö', nameEn: 'Eu', sound: 'ö', exampleWord: 'Örümcek', exampleMeaning: 'Böcek', isVowel: true),
    NuraLetter(character: 'P', nameTr: 'Pe', nameEn: 'Pe', sound: 'p', exampleWord: 'Papatya', exampleMeaning: 'Çiçek türü'),
    NuraLetter(character: 'R', nameTr: 'Re', nameEn: 'Re', sound: 'r', exampleWord: 'Renk', exampleMeaning: 'Görsel özellik'),
    NuraLetter(character: 'S', nameTr: 'Se', nameEn: 'Se', sound: 's', exampleWord: 'Su', exampleMeaning: 'Sıvı'),
    NuraLetter(character: 'Ş', nameTr: 'Şe', nameEn: 'She', sound: 'ş', exampleWord: 'Şeker', exampleMeaning: 'Tatlandırıcı'),
    NuraLetter(character: 'T', nameTr: 'Te', nameEn: 'Te', sound: 't', exampleWord: 'Tavşan', exampleMeaning: 'Hayvan'),
    NuraLetter(character: 'U', nameTr: 'U', nameEn: 'U', sound: 'u', exampleWord: 'Uçak', exampleMeaning: 'Hava taşıtı', isVowel: true),
    NuraLetter(character: 'Ü', nameTr: 'Ü', nameEn: 'Ue', sound: 'ü', exampleWord: 'Üzüm', exampleMeaning: 'Meyve', isVowel: true),
    NuraLetter(character: 'V', nameTr: 'Ve', nameEn: 'Ve', sound: 'v', exampleWord: 'Vazo', exampleMeaning: 'Çiçek kabı'),
    NuraLetter(character: 'Y', nameTr: 'Ye', nameEn: 'Ye', sound: 'y', exampleWord: 'Yıldız', exampleMeaning: 'Gök cismi'),
    NuraLetter(character: 'Z', nameTr: 'Ze', nameEn: 'Ze', sound: 'z', exampleWord: 'Zeytin', exampleMeaning: 'Meyve'),
  ]);
}

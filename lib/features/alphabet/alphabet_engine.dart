import 'package:flutter_tts/flutter_tts.dart';
import 'alphabet_data.dart';

class AlphabetEngine {
  static final FlutterTts _tts = FlutterTts();

  static Future<void> init() async {
    await _tts.setPitch(1.2);
    await _tts.setSpeechRate(0.35);
  }

  static Future<void> speak(String text, String lang) async {
    await _tts.setLanguage(_map(lang));
    await _tts.speak(text);
  }

  static String _map(String lang) => switch (lang) {
        'ar' => 'ar-SA',
        'ru' => 'ru-RU',
        'ja' => 'ja-JP',
        'ko' => 'ko-KR',
        'el' => 'el-GR',
        'he' => 'he-IL',
        'hi' => 'hi-IN',
        'th' => 'th-TH',
        _ => 'en-US',
      };

  static List<AlphabetLetter> letters(String lang) => AlphabetData.forLang(lang);
}

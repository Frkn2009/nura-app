import 'dart:async';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_tts/flutter_tts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart';

/// Cihaz TTS + STT. Ses her zaman kadın.
class SpeechController {
  final _tts = FlutterTts();
  final _stt = SpeechToText();
  Timer? _tick;
  String _buffer = '';
  bool _ready = false;

  bool get deviceSpeechAvailable => _ready;

  static String localeOf(String langCode) => switch (langCode) {
        'es' => 'es-ES',
        'de' => 'de-DE',
        'fr' => 'fr-FR',
        'nl' => 'nl-NL',
        'ar' => 'ar-SA',
        'pt' => 'pt-PT',
        'it' => 'it-IT',
        'ru' => 'ru-RU',
        'zh' => 'zh-CN',
        'ja' => 'ja-JP',
        'ko' => 'ko-KR',
        'tr' => 'tr-TR',
        'pl' => 'pl-PL',
        'sv' => 'sv-SE',
        'da' => 'da-DK',
        'no' => 'nb-NO',
        'fi' => 'fi-FI',
        'el' => 'el-GR',
        'cs' => 'cs-CZ',
        'ro' => 'ro-RO',
        'hu' => 'hu-HU',
        'hi' => 'hi-IN',
        'th' => 'th-TH',
        'vi' => 'vi-VN',
        'id' => 'id-ID',
        'uk' => 'uk-UA',
        'he' => 'he-IL',
        'fa' => 'fa-IR',
        'sw' => 'sw-KE',
        _ => 'en-US',
      };

  /// Kadın ses seç — iOS ve Android'de farklı yöntemle
  Future<void> _setFemaleVoice(String langCode) async {
    try {
      final locale = localeOf(langCode);

      if (kIsWeb) return; // Web'de voice seçimi kısıtlı

      // Mevcut sesleri al
      final voices = await _tts.getVoices as List<dynamic>?;
      if (voices == null || voices.isEmpty) return;

      // Bu dil için kadın ses bul
      final femaleVoice = voices.cast<Map>().where((v) {
        final name = (v['name'] ?? '').toString().toLowerCase();
        final loc = (v['locale'] ?? '').toString().toLowerCase();
        final langMatch = loc.startsWith(langCode.toLowerCase());
        // Kadın ses isimleri genelde: female, woman, kadın,
        // veya belirli isimler: Samantha, Karen, Milena, Amelie, Yelda...
        final isFemale = name.contains('female') ||
            name.contains('woman') ||
            name.contains('kadın') ||
            // iOS yaygın kadın sesleri
            name.contains('samantha') ||
            name.contains('karen') ||
            name.contains('amelie') ||
            name.contains('anna') ||
            name.contains('milena') ||
            name.contains('yelda') ||
            name.contains('mei-jia') ||
            name.contains('kyoko') ||
            name.contains('yuna') ||
            name.contains('paulina') ||
            name.contains('ellen') ||
            name.contains('alice') ||
            name.contains('monica') ||
            name.contains('luciana') ||
            name.contains('nora') ||
            name.contains('sara') ||
            name.contains('zosia') ||
            name.contains('ioana') ||
            name.contains('mariam') ||
            name.contains('tessa') ||
            name.contains('kanya') ||
            name.contains('linh') ||
            name.contains('damayanti') ||
            name.contains('lesya') ||
            name.contains('carmit') ||
            // Android yaygın kadın ses göstergeleri
            name.contains('female') ||
            name.contains('f-') ||
            // gender alanı varsa
            (v['gender'] ?? '').toString().toLowerCase() == 'female';
        return langMatch && isFemale;
      }).toList();

      if (femaleVoice.isNotEmpty) {
        await _tts.setVoice({
          'name': femaleVoice.first['name'].toString(),
          'locale': femaleVoice.first['locale'].toString(),
        });
        return;
      }

      // Kadın ses bulunamazsa, bu dildeki herhangi bir sesi kullan
      // ama pitch'i yükselterek daha kadınsı yap
      if (!kIsWeb) {
        await _tts.setPitch(1.15); // biraz daha tiz = kadınsı
      }
    } catch (_) {
      // Ses seçimi başarısız olursa varsayılanla devam et
      try {
        await _tts.setPitch(1.15);
      } catch (_) {}
    }
  }

  Future<void> warmUp() async {
    try {
      await Permission.microphone.request();
      _ready = await _stt.initialize();
      await _tts.setSpeechRate(0.42);
      await _tts.setVolume(1);
      await _tts.setPitch(1.1); // varsayılan: hafif kadınsı ton
    } catch (_) {
      _ready = false;
    }
  }

  Future<void> speakTarget(String text, String langCode) async {
    try {
      await _tts.setLanguage(localeOf(langCode));
      await _setFemaleVoice(langCode);
      await _tts.stop();
      await _tts.speak(text);
    } catch (_) {}
  }

  Future<void> stopSpeak() async {
    try {
      await _tts.stop();
    } catch (_) {}
  }

  Future<void> startListen({
    required String langCode,
    required void Function(int seconds) onTick,
    void Function(String text)? onText,
  }) async {
    _buffer = '';
    var sec = 0;
    _tick?.cancel();
    _tick = Timer.periodic(const Duration(seconds: 1), (_) => onTick(++sec));
    if (!_ready) {
      try {
        _ready = await _stt.initialize();
      } catch (_) {}
    }
    if (!_ready) return;
    try {
      await _stt.listen(
        localeId: localeOf(langCode),
        listenFor: const Duration(seconds: 20),
        pauseFor: const Duration(seconds: 3),
        onResult: (r) {
          _buffer = r.recognizedWords;
          onText?.call(_buffer);
        },
      );
    } catch (_) {}
  }

  Future<String> stopListen() async {
    _tick?.cancel();
    try {
      await _stt.stop();
    } catch (_) {}
    return _buffer;
  }

  void dispose() {
    _tick?.cancel();
  }
}

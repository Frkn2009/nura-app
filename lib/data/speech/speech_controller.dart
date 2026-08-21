import 'dart:async';

import 'package:flutter_tts/flutter_tts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart';

/// Cihaz TTS + STT. Web'de veya izin yoksa sessizce süre sayacına düşer.
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

  Future<void> warmUp() async {
    try {
      await Permission.microphone.request();
      _ready = await _stt.initialize();
      await _tts.setSpeechRate(0.42);
      await _tts.setVolume(1);
    } catch (_) {
      _ready = false;
    }
  }

  Future<void> speakTarget(String text, String langCode) async {
    try {
      await _tts.setLanguage(localeOf(langCode));
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

import 'dart:async';

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_tts/flutter_tts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_to_text.dart';

import 'phoneme_scorer.dart';

/// Mikrofonun uygulamadaki kullanılabilirlik durumu.
enum SpeechAvailability {
  unknown,
  ready,
  permissionDenied,
  permissionPermanentlyDenied,
  unavailable,
}

/// Cihaz TTS + STT denetleyicisi.
///
/// Mobilde mikrofon iznini açıkça ister. Web'de izin akışını tarayıcıya
/// bırakarak SpeechRecognition desteği varsa sınırlı kullanım sağlar. TTS'te
/// cihazın ilgili dildeki kadın sesi seçilir; ses metadatası sunmayan eski
/// motorlarda kadın ses profiline yakın sabit pitch kullanılır.
class SpeechController {
  final _tts = FlutterTts();
  final _stt = SpeechToText();
  Timer? _tick;
  String _buffer = '';
  double _confidence = -1;
  bool _ready = false;
  SpeechAvailability _availability = SpeechAvailability.unknown;
  bool _usingNeuralVoice = false;

  bool get deviceSpeechAvailable => _ready;
  SpeechAvailability get availability => _availability;
  bool get usingNeuralVoice => _usingNeuralVoice;

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

  static const _femaleVoiceHints = <String>[
    'female', 'woman', 'kadın',
    // Apple / Microsoft / Android'de yaygın kadın sesleri.
    'samantha', 'karen', 'moira', 'tessa', 'fiona', 'amelie', 'audrey',
    'anna', 'petra', 'milena', 'yelda', 'mei-jia', 'ting-ting', 'kyoko',
    'o-ren', 'yuna', 'paulina', 'ellen', 'alice', 'monica', 'luciana',
    'nora', 'sara', 'zosia', 'ioana', 'mariam', 'kanya', 'linh',
    'damayanti', 'lesya', 'carmit', 'zuzana', 'alva', 'satu', 'veena',
    'filiz', 'susan', 'hazel', 'zira', 'aria', 'jenny', 'sonia', 'natasha',
  ];

  static int voiceQualityScore(Map voice, String langCode) {
    final name = (voice['name'] ?? '').toString().toLowerCase();
    final gender = (voice['gender'] ?? '').toString().toLowerCase();
    final locale = (voice['locale'] ?? '')
        .toString()
        .toLowerCase()
        .replaceAll('_', '-');
    if (!(locale == langCode || locale.startsWith('$langCode-'))) return -1000;
    var score = 0;
    final female = gender == 'female' ||
        gender == 'f' ||
        name.contains('female') ||
        name.contains('woman') ||
        name.contains('f-') ||
        _femaleVoiceHints.any(name.contains);
    if (female) score += 100;
    if (name.contains('neural') || name.contains('wavenet')) score += 50;
    if (name.contains('premium') || name.contains('enhanced')) score += 35;
    if (name.contains('natural') || name.contains('online')) score += 20;
    if ((voice['network_required'] ?? false) == false) score += 5;
    return score;
  }

  Future<void> _setFemaleVoice(String langCode) async {
    const femalePitch = 1.12;
    await _tts.setPitch(femalePitch);
    try {
      final rawVoices = await _tts.getVoices;
      if (rawVoices is! List || rawVoices.isEmpty) return;
      final voices = rawVoices.whereType<Map>().toList()
        ..sort((a, b) => voiceQualityScore(b, langCode)
            .compareTo(voiceQualityScore(a, langCode)));
      final matching = voices
          .where((voice) => voiceQualityScore(voice, langCode) >= 0)
          .toList();
      if (matching.isEmpty) return;

      // Önce kadın, kadın seçenekleri içinde neural/premium/enhanced kalite.
      final female = matching
          .where((voice) => voiceQualityScore(voice, langCode) >= 100)
          .toList();
      final selected = female.firstOrNull ?? matching.first;
      final name = selected['name'].toString();
      await _tts.setVoice({
        'name': name,
        'locale': selected['locale'].toString(),
      });
      final normalized = name.toLowerCase();
      _usingNeuralVoice = normalized.contains('neural') ||
          normalized.contains('wavenet') ||
          normalized.contains('premium') ||
          normalized.contains('enhanced') ||
          normalized.contains('natural');
    } catch (_) {
      _usingNeuralVoice = false;
      // Eski motorlarda kadın ses profili sabit pitch ile korunur.
    }
  }

  Future<bool> _initializeRecognition() async {
    try {
      _ready = await _stt.initialize(
        onError: (SpeechRecognitionError _) {},
      );
    } catch (_) {
      _ready = false;
    }
    _availability = _ready
        ? SpeechAvailability.ready
        : SpeechAvailability.unavailable;
    return _ready;
  }

  /// İzni hazırlar ve cihaz konuşma tanımayı destekliyorsa `true` döndürür.
  Future<bool> warmUp() async {
    try {
      // permission_handler web'de tarayıcı izin diyaloğunu yönetmez. STT'nin
      // ilk listen çağrısı güvenli tarayıcı bağlamında istemi kendisi açar.
      if (!kIsWeb) {
        var permission = await Permission.microphone.status;
        if (permission.isDenied) {
          permission = await Permission.microphone.request();
        }
        if (permission.isPermanentlyDenied || permission.isRestricted) {
          _availability = SpeechAvailability.permissionPermanentlyDenied;
          return false;
        }
        if (!permission.isGranted) {
          _availability = SpeechAvailability.permissionDenied;
          return false;
        }
      }

      final ready = await _initializeRecognition();
      await _tts.setSpeechRate(0.42);
      await _tts.setVolume(1);
      await _tts.setPitch(1.12);
      return ready;
    } catch (_) {
      _ready = false;
      _availability = SpeechAvailability.unavailable;
      return false;
    }
  }

  Future<void> speakTarget(
    String text,
    String langCode, {
    double rate = .42,
  }) async {
    try {
      await _tts.stop();
      await _tts.setLanguage(localeOf(langCode));
      await _tts.setSpeechRate(rate.clamp(.2, .6).toDouble());
      await _setFemaleVoice(langCode);
      await _tts.speak(text);
    } catch (_) {}
  }

  Future<void> stopSpeak() async {
    try {
      await _tts.stop();
    } catch (_) {}
  }

  /// Kaydı başlatır. Başarılı olmadığında sayaç çalıştırılmaz.
  Future<bool> startListen({
    required String langCode,
    required void Function(int seconds) onTick,
    void Function(String text)? onText,
  }) async {
    _buffer = '';
    _confidence = -1;
    _tick?.cancel();
    if (!_ready && !await warmUp()) return false;

    try {
      await _stt.listen(
        localeId: localeOf(langCode),
        listenFor: const Duration(seconds: 30),
        pauseFor: const Duration(seconds: 3),
        listenOptions: SpeechListenOptions(
          partialResults: true,
          cancelOnError: true,
          listenMode: ListenMode.confirmation,
        ),
        onResult: (result) {
          _buffer = result.recognizedWords;
          if (result.hasConfidenceRating) _confidence = result.confidence;
          onText?.call(_buffer);
        },
      );
      var seconds = 0;
      _tick = Timer.periodic(
        const Duration(seconds: 1),
        (_) => onTick(++seconds),
      );
      return true;
    } catch (_) {
      _availability = SpeechAvailability.unavailable;
      return false;
    }
  }

  Future<String> stopListen() async {
    _tick?.cancel();
    try {
      await _stt.stop();
    } catch (_) {}
    return _buffer;
  }

  PronunciationAssessment assessPronunciation({
    required String expected,
    required String heard,
    required String languageCode,
  }) =>
      PhonemeScorer.assess(
        expected: expected,
        heard: heard,
        languageCode: languageCode,
        acousticConfidence: _confidence,
      );

  /// Geriye dönük saf skor yardımcısı.
  static int pronunciationScore(String expected, String heard) =>
      PhonemeScorer.assess(
        expected: expected,
        heard: heard,
        languageCode: 'en',
      ).overall;


  void dispose() {
    _tick?.cancel();
    _stt.cancel();
    _tts.stop();
  }
}

extension<T> on Iterable<T> {
  T? get firstOrNull {
    final iterator = this.iterator;
    return iterator.moveNext() ? iterator.current : null;
  }
}

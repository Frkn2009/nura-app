import '../content/catalog.dart';
import '../models/models.dart';

enum TranslationOrigin { curriculum, dictionary, cloud }

class TranslationHit {
  const TranslationHit({
    required this.source,
    required this.target,
    required this.gloss,
    required this.confidence,
    required this.origin,
    this.scenarioId,
  });

  final String source;
  final String target;

  /// Diller arası güvenli pivot anlamı (müfredatta İngilizce açıklama).
  final String gloss;
  final double confidence;
  final TranslationOrigin origin;
  final String? scenarioId;
}

/// 30 dil arasında doğrulanmış müfredat ve sözlük verisiyle çeviri.
///
/// Serbest metin üretmez: giriş doğrulanmış bir sözlük girdisi veya müfredat
/// cümlesiyle eşleşmezse `null` döner. Müfredat cümleleri ortak İngilizce anlam
/// anahtarı üzerinden eşleştirildiği için 30×30 dil yönünün tamamı çalışır.
class OfflineTranslate {
  static TranslationHit? translate({
    required String input,
    required LearnLang from,
    required LearnLang to,
  }) {
    final query = _norm(input);
    if (query.isEmpty) return null;

    final dictionary = _dictionaryMatch(query, from);
    if (dictionary != null) {
      final translated = dictionary[to];
      if (translated == null) return null;
      return TranslationHit(
        source: input.trim(),
        target: translated,
        gloss: dictionary[LearnLang.en]!,
        confidence: 1,
        origin: TranslationOrigin.dictionary,
      );
    }

    final sourceMatch = _curriculumMatch(query, from);
    if (sourceMatch == null) return null;
    final targetMatch = _phraseForMeaning(sourceMatch.meaning, to);
    if (targetMatch == null) return null;

    return TranslationHit(
      source: sourceMatch.phrase.target,
      target: targetMatch.phrase.target,
      gloss: sourceMatch.meaning,
      confidence: sourceMatch.exact ? 1 : .86,
      origin: TranslationOrigin.curriculum,
      scenarioId: targetMatch.scenarioId,
    );
  }

  /// Eski çağrılar için uyumluluk: arayüz dilinden hedef öğrenme diline çevirir.
  static TranslationHit? lookup({
    required String input,
    required LearnLang learn,
    required UiLang ui,
  }) {
    final from = LearnLang.values.firstWhere(
      (language) => language.name == ui.name,
      orElse: () => LearnLang.en,
    );
    return translate(input: input, from: from, to: learn);
  }

  static List<String> suggestions(LearnLang language) => _dictionary
      .map((row) => row[language])
      .whereType<String>()
      .toList(growable: false);

  static Map<LearnLang, String>? _dictionaryMatch(
    String query,
    LearnLang from,
  ) {
    for (final row in _dictionary) {
      if (_norm(row[from] ?? '') == query) return row;
    }
    return null;
  }

  static _CurriculumMatch? _curriculumMatch(
    String query,
    LearnLang from,
  ) {
    _CurriculumMatch? partial;
    for (final scenario in Catalog.forLang(from)) {
      for (final phrase in scenario.phrases) {
        final target = _norm(phrase.target);
        final meaning = phrase.glossFor(UiLang.en);
        if (target == query) {
          return _CurriculumMatch(
            phrase: phrase,
            meaning: meaning,
            scenarioId: scenario.id,
            exact: true,
          );
        }
        // Kısa tek hecelerde yanlış eşleşmeyi önle. Kısmi eşleşme hiçbir zaman
        // yeni metin üretmez; yalnızca müfredattaki tam cümleyi döndürür.
        if (query.runes.length >= 3 && target.contains(query)) {
          partial ??= _CurriculumMatch(
            phrase: phrase,
            meaning: meaning,
            scenarioId: scenario.id,
            exact: false,
          );
        }
      }
    }
    return partial;
  }

  static _CurriculumMatch? _phraseForMeaning(
    String meaning,
    LearnLang language,
  ) {
    final normalizedMeaning = _norm(meaning);
    for (final scenario in Catalog.forLang(language)) {
      for (final phrase in scenario.phrases) {
        if (_norm(phrase.glossFor(UiLang.en)) == normalizedMeaning) {
          return _CurriculumMatch(
            phrase: phrase,
            meaning: meaning,
            scenarioId: scenario.id,
            exact: true,
          );
        }
      }
    }
    return null;
  }

  static String _norm(String value) => value
      .toLowerCase()
      .replaceAll(RegExp(r'[^\p{L}\p{N}\s]', unicode: true), ' ')
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim();

  /// İnsan tarafından doğrulanmış çekirdek seyahat sözlüğü. Her satırda 30
  /// dilin tamamı bulunur; eksik dil İngilizceyle doldurulmaz.
  static const List<Map<LearnLang, String>> _dictionary = [
    {
      LearnLang.en: 'hello', LearnLang.es: 'hola', LearnLang.de: 'hallo',
      LearnLang.fr: 'bonjour', LearnLang.nl: 'hallo', LearnLang.ar: 'مرحبا',
      LearnLang.pt: 'olá', LearnLang.it: 'ciao', LearnLang.ru: 'привет',
      LearnLang.zh: '你好', LearnLang.ja: 'こんにちは', LearnLang.ko: '안녕하세요',
      LearnLang.tr: 'merhaba', LearnLang.pl: 'cześć', LearnLang.sv: 'hej',
      LearnLang.da: 'hej', LearnLang.no: 'hei', LearnLang.fi: 'hei',
      LearnLang.el: 'γεια σας', LearnLang.cs: 'dobrý den', LearnLang.ro: 'bună',
      LearnLang.hu: 'szia', LearnLang.hi: 'नमस्ते', LearnLang.th: 'สวัสดี',
      LearnLang.vi: 'xin chào', LearnLang.id: 'halo', LearnLang.uk: 'привіт',
      LearnLang.he: 'שלום', LearnLang.fa: 'سلام', LearnLang.sw: 'jambo',
    },
    {
      LearnLang.en: 'please', LearnLang.es: 'por favor', LearnLang.de: 'bitte',
      LearnLang.fr: 's’il vous plaît', LearnLang.nl: 'alstublieft', LearnLang.ar: 'من فضلك',
      LearnLang.pt: 'por favor', LearnLang.it: 'per favore', LearnLang.ru: 'пожалуйста',
      LearnLang.zh: '请', LearnLang.ja: 'お願いします', LearnLang.ko: '부탁합니다',
      LearnLang.tr: 'lütfen', LearnLang.pl: 'proszę', LearnLang.sv: 'snälla',
      LearnLang.da: 'vær venlig', LearnLang.no: 'vær så snill', LearnLang.fi: 'ole hyvä',
      LearnLang.el: 'παρακαλώ', LearnLang.cs: 'prosím', LearnLang.ro: 'vă rog',
      LearnLang.hu: 'kérem', LearnLang.hi: 'कृपया', LearnLang.th: 'กรุณา',
      LearnLang.vi: 'làm ơn', LearnLang.id: 'tolong', LearnLang.uk: 'будь ласка',
      LearnLang.he: 'בבקשה', LearnLang.fa: 'لطفاً', LearnLang.sw: 'tafadhali',
    },
    {
      LearnLang.en: 'thank you', LearnLang.es: 'gracias', LearnLang.de: 'danke',
      LearnLang.fr: 'merci', LearnLang.nl: 'dank u', LearnLang.ar: 'شكرا',
      LearnLang.pt: 'obrigado', LearnLang.it: 'grazie', LearnLang.ru: 'спасибо',
      LearnLang.zh: '谢谢', LearnLang.ja: 'ありがとう', LearnLang.ko: '감사합니다',
      LearnLang.tr: 'teşekkürler', LearnLang.pl: 'dziękuję', LearnLang.sv: 'tack',
      LearnLang.da: 'tak', LearnLang.no: 'takk', LearnLang.fi: 'kiitos',
      LearnLang.el: 'ευχαριστώ', LearnLang.cs: 'děkuji', LearnLang.ro: 'mulțumesc',
      LearnLang.hu: 'köszönöm', LearnLang.hi: 'धन्यवाद', LearnLang.th: 'ขอบคุณ',
      LearnLang.vi: 'cảm ơn', LearnLang.id: 'terima kasih', LearnLang.uk: 'дякую',
      LearnLang.he: 'תודה', LearnLang.fa: 'ممنون', LearnLang.sw: 'asante',
    },
    {
      LearnLang.en: 'water', LearnLang.es: 'agua', LearnLang.de: 'wasser',
      LearnLang.fr: 'eau', LearnLang.nl: 'water', LearnLang.ar: 'ماء',
      LearnLang.pt: 'água', LearnLang.it: 'acqua', LearnLang.ru: 'вода',
      LearnLang.zh: '水', LearnLang.ja: '水', LearnLang.ko: '물',
      LearnLang.tr: 'su', LearnLang.pl: 'woda', LearnLang.sv: 'vatten',
      LearnLang.da: 'vand', LearnLang.no: 'vann', LearnLang.fi: 'vesi',
      LearnLang.el: 'νερό', LearnLang.cs: 'voda', LearnLang.ro: 'apă',
      LearnLang.hu: 'víz', LearnLang.hi: 'पानी', LearnLang.th: 'น้ำ',
      LearnLang.vi: 'nước', LearnLang.id: 'air', LearnLang.uk: 'вода',
      LearnLang.he: 'מים', LearnLang.fa: 'آب', LearnLang.sw: 'maji',
    },
    {
      LearnLang.en: 'help', LearnLang.es: 'ayuda', LearnLang.de: 'hilfe',
      LearnLang.fr: 'aide', LearnLang.nl: 'hulp', LearnLang.ar: 'مساعدة',
      LearnLang.pt: 'ajuda', LearnLang.it: 'aiuto', LearnLang.ru: 'помощь',
      LearnLang.zh: '帮助', LearnLang.ja: '助け', LearnLang.ko: '도움',
      LearnLang.tr: 'yardım', LearnLang.pl: 'pomoc', LearnLang.sv: 'hjälp',
      LearnLang.da: 'hjælp', LearnLang.no: 'hjelp', LearnLang.fi: 'apu',
      LearnLang.el: 'βοήθεια', LearnLang.cs: 'pomoc', LearnLang.ro: 'ajutor',
      LearnLang.hu: 'segítség', LearnLang.hi: 'मदद', LearnLang.th: 'ช่วยเหลือ',
      LearnLang.vi: 'giúp đỡ', LearnLang.id: 'bantuan', LearnLang.uk: 'допомога',
      LearnLang.he: 'עזרה', LearnLang.fa: 'کمک', LearnLang.sw: 'msaada',
    },
    {
      LearnLang.en: 'station', LearnLang.es: 'estación', LearnLang.de: 'bahnhof',
      LearnLang.fr: 'gare', LearnLang.nl: 'station', LearnLang.ar: 'محطة',
      LearnLang.pt: 'estação', LearnLang.it: 'stazione', LearnLang.ru: 'станция',
      LearnLang.zh: '车站', LearnLang.ja: '駅', LearnLang.ko: '역',
      LearnLang.tr: 'istasyon', LearnLang.pl: 'stacja', LearnLang.sv: 'station',
      LearnLang.da: 'station', LearnLang.no: 'stasjon', LearnLang.fi: 'asema',
      LearnLang.el: 'σταθμός', LearnLang.cs: 'nádraží', LearnLang.ro: 'stație',
      LearnLang.hu: 'állomás', LearnLang.hi: 'स्टेशन', LearnLang.th: 'สถานี',
      LearnLang.vi: 'nhà ga', LearnLang.id: 'stasiun', LearnLang.uk: 'станція',
      LearnLang.he: 'תחנה', LearnLang.fa: 'ایستگاه', LearnLang.sw: 'kituo',
    },
  ];
}

class _CurriculumMatch {
  const _CurriculumMatch({
    required this.phrase,
    required this.meaning,
    required this.scenarioId,
    required this.exact,
  });

  final Phrase phrase;
  final String meaning;
  final String scenarioId;
  final bool exact;
}

import '../content/catalog.dart';
import '../models/models.dart';

class TranslationHit {
  const TranslationHit({
    required this.source,
    required this.target,
    required this.gloss,
    required this.confidence,
    this.scenarioId,
  });

  final String source;
  final String target;
  final String gloss;
  final double confidence;
  final String? scenarioId;
}

/// Pedagogical translator: curriculum phrases first, then a travel lexicon.
/// Unknown free-text is not silently hallucinated.
class OfflineTranslate {
  static TranslationHit? lookup({
    required String input,
    required LearnLang learn,
    required UiLang ui,
  }) {
    final q = _norm(input);
    if (q.isEmpty) return null;

    // 1) Search in catalog scenarios for this language
    for (final s in Catalog.forLang(learn)) {
      for (final p in s.phrases) {
        final tNorm = _norm(p.target);
        final gNorm = _norm(p.glossFor(ui));
        if (tNorm == q || gNorm == q || tNorm.contains(q) || gNorm.contains(q)) {
          return TranslationHit(
            source: input.trim(),
            target: p.target,
            gloss: p.glossFor(ui),
            confidence: tNorm == q || gNorm == q ? 1 : 0.82,
            scenarioId: s.id,
          );
        }
      }
    }

    // 2) Search in travel lexicon
    final lex = _lexicon[learn];
    if (lex != null) {
      for (final e in lex.entries) {
        if (_norm(e.key) == q || _norm(e.value[ui] ?? '') == q) {
          return TranslationHit(
            source: input.trim(),
            target: e.key,
            gloss: e.value[ui] ?? e.value[UiLang.en] ?? e.key,
            confidence: 0.9,
          );
        }
      }
    }
    return null;
  }

  static String _norm(String s) {
    final cleaned = s.toLowerCase().replaceAll(RegExp("[¿?¡!.,'،。？！]"), '');
    return cleaned.replaceAll(RegExp(r'\s+'), ' ').trim();
  }

  /// Small travel lexicon — built from base words for all 30 languages
  static final Map<LearnLang, Map<String, Map<UiLang, String>>> _lexicon = {
    for (final lang in LearnLang.values) lang: _buildLex(lang),
  };

  static Map<String, Map<UiLang, String>> _buildLex(LearnLang lang) {
    // Base words: (en, es, de, fr, nl, ar, pt, it, ru, zh, ja, ko, tr)
    const rows = <List<String>>[
      ['hello', 'hola', 'hallo', 'bonjour', 'hallo', 'مرحبا', 'olá', 'ciao', 'здравствуйте', '你好', 'こんにちは', '안녕하세요', 'merhaba'],
      ['please', 'por favor', 'bitte', 's\'il vous plaît', 'alstublieft', 'من فضلك', 'por favor', 'per favore', 'пожалуйста', '请', 'お願いします', '주세요', 'lütfen'],
      ['thank you', 'gracias', 'danke', 'merci', 'dank je', 'شكرا', 'obrigado', 'grazie', 'спасибо', '谢谢', 'ありがとう', '감사합니다', 'teşekkürler'],
      ['yes', 'sí', 'ja', 'oui', 'ja', 'نعم', 'sim', 'sì', 'да', '是', 'はい', '네', 'evet'],
      ['no', 'no', 'nein', 'non', 'nee', 'لا', 'não', 'no', 'нет', '不', 'いいえ', '아니요', 'hayır'],
      ['water', 'agua', 'Wasser', 'eau', 'water', 'ماء', 'água', 'acqua', 'вода', '水', '水', '물', 'su'],
      ['bathroom', 'baño', 'Toilette', 'toilettes', 'toilet', 'الحمام', 'banheiro', 'bagno', 'туалет', '洗手间', 'トイレ', '화장실', 'tuvalet'],
      ['help', 'ayuda', 'Hilfe', 'aide', 'hulp', 'مساعدة', 'ajuda', 'aiuto', 'помощь', '帮助', '助け', '도움', 'yardım'],
      ['station', 'estación', 'Bahnhof', 'gare', 'station', 'المحطة', 'estação', 'stazione', 'станция', '车站', '駅', '역', 'istasyon'],
      ['airport', 'aeropuerto', 'Flughafen', 'aéroport', 'luchthaven', 'المطار', 'aeroporto', 'aeroporto', 'аэропорт', '机场', '空港', '공항', 'havaalanı'],
      ['rent', 'alquiler', 'Miete', 'loyer', 'huur', 'إيجار', 'aluguel', 'affitto', 'аренда', '房租', '家賃', '임대료', 'kira'],
      ['I don\'t understand', 'No entiendo', 'Ich verstehe nicht', 'Je ne comprends pas', 'Ik begrijp het niet', 'لا أفهم', 'Não entendo', 'Non capisco', 'Я не понимаю', '我不明白', '分かりません', '이해하지 못합니다', 'anlamıyorum'],
    ];

    final langIdx = switch (lang) {
      LearnLang.en => 0,
      LearnLang.es => 1,
      LearnLang.de => 2,
      LearnLang.fr => 3,
      LearnLang.nl => 4,
      LearnLang.ar => 5,
      LearnLang.pt => 6,
      LearnLang.it => 7,
      LearnLang.ru => 8,
      LearnLang.zh => 9,
      LearnLang.ja => 10,
      LearnLang.ko => 11,
      LearnLang.tr => 12,
      _ => 0, // fallback to EN for languages not in lexicon
    };

    final out = <String, Map<UiLang, String>>{};
    for (final r in rows) {
      final target = r[langIdx];
      out[target] = {
        UiLang.tr: r[12],
        UiLang.en: r[0],
        UiLang.es: r[1],
        UiLang.de: r[2],
        UiLang.fr: r[3],
        UiLang.nl: r[4],
        UiLang.ar: r[5],
        UiLang.pt: r[6],
        UiLang.it: r[7],
        UiLang.ru: r[8],
        UiLang.zh: r[9],
        UiLang.ja: r[10],
        UiLang.ko: r[11],
      };
    }
    return out;
  }
}

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
    final cleaned = s.toLowerCase().replaceAll(RegExp("[¿?¡!.,']"), '');
    return cleaned.replaceAll(RegExp(r'\s+'), ' ').trim();
  }

  /// Small travel lexicon: target phrase → gloss in every UI language.
  static final Map<LearnLang, Map<String, Map<UiLang, String>>> _lexicon = {
    for (final lang in LearnLang.values) lang: _buildLex(lang),
  };

  static Map<String, Map<UiLang, String>> _buildLex(LearnLang lang) {
    const rows = <(String, String, String, String, String, String, String)>[
      // targetEN, ES, DE, FR, NL, glossTR, glossEN
      ('hello', 'hola', 'hallo', 'bonjour', 'hallo', 'merhaba', 'hello'),
      ('please', 'por favor', 'bitte', 's’il vous plaît', 'alstublieft', 'lütfen', 'please'),
      ('thank you', 'gracias', 'danke', 'merci', 'dank je', 'teşekkürler', 'thank you'),
      ('yes', 'sí', 'ja', 'oui', 'ja', 'evet', 'yes'),
      ('no', 'no', 'nein', 'non', 'nee', 'hayır', 'no'),
      ('water', 'agua', 'Wasser', 'eau', 'water', 'su', 'water'),
      ('bathroom', 'baño', 'Toilette', 'toilettes', 'toilet', 'tuvalet', 'bathroom'),
      ('help', 'ayuda', 'Hilfe', 'aide', 'hulp', 'yardım', 'help'),
      ('today', 'hoy', 'heute', 'aujourd’hui', 'vandaag', 'bugün', 'today'),
      ('tomorrow', 'mañana', 'morgen', 'demain', 'morgen', 'yarın', 'tomorrow'),
      ('left', 'izquierda', 'links', 'gauche', 'links', 'sol', 'left'),
      ('right', 'derecha', 'rechts', 'droite', 'rechts', 'sağ', 'right'),
      ('station', 'estación', 'Bahnhof', 'gare', 'station', 'istasyon', 'station'),
      ('airport', 'aeropuerto', 'Flughafen', 'aéroport', 'luchthaven', 'havaalanı', 'airport'),
      ('rent', 'alquiler', 'Miete', 'loyer', 'huur', 'kira', 'rent'),
      ('contract', 'contrato', 'Vertrag', 'contrat', 'contract', 'sözleşme', 'contract'),
      ('NIE number', 'número NIE', 'NIE-Nummer', 'numéro NIE', 'NIE-nummer', 'NIE numarası', 'NIE number'),
      ('I don’t understand', 'No entiendo', 'Ich verstehe nicht', 'Je ne comprends pas', 'Ik begrijp het niet', 'anlamıyorum', 'I don’t understand'),
      ('Do you speak English?', '¿Hablas inglés?', 'Sprechen Sie Englisch?', 'Vous parlez anglais ?', 'Spreekt u Engels?', 'İngilizce biliyor musunuz?', 'Do you speak English?'),
    ];

    final out = <String, Map<UiLang, String>>{};
    for (final r in rows) {
      final target = switch (lang) {
        LearnLang.en => r.$1,
        LearnLang.es => r.$2,
        LearnLang.de => r.$3,
        LearnLang.fr => r.$4,
        LearnLang.nl => r.$5,
      };
      out[target] = {
        UiLang.tr: r.$6,
        UiLang.en: r.$7,
        UiLang.es: r.$2,
        UiLang.de: r.$3,
        UiLang.fr: r.$4,
        UiLang.nl: r.$5,
      };
    }
    return out;
  }
}

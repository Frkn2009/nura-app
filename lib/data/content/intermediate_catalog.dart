import '../models/models.dart';

/// A2/B1 çalışma paketlerini mevcut, insan tarafından doğrulanmış cümlelerden
/// üretir. Yeni çeviri uydurmak yerine bilişsel zorluğu cümleleri daha uzun,
/// bağlantılı görevlerde birleştirerek yükseltir.
class IntermediateCatalog {
  static List<Scenario> build(
    LearnLang language,
    List<Scenario> foundation,
  ) {
    if (foundation.length < 6) return const [];
    return [
      _scenario(
        language: language,
        level: Cefr.a2,
        suffix: 'a2_route',
        minutes: 9,
        titleTr: 'Bağlantılı günlük işler',
        titleEn: 'Connected daily tasks',
        sources: [
          foundation[0].phrases[0],
          foundation[1].phrases[0],
          foundation[2].phrases[0],
          foundation[3].phrases[0],
        ],
        prompts: const [
          'Start the situation politely.',
          'Explain what you already arranged.',
          'Ask for the next place or step.',
          'Close the exchange naturally.',
        ],
      ),
      _scenario(
        language: language,
        level: Cefr.b1,
        suffix: 'b1_solve',
        minutes: 12,
        titleTr: 'Sorun çözme konuşması',
        titleEn: 'Problem-solving conversation',
        sources: [
          foundation[1].phrases[1],
          foundation[2].phrases[2],
          foundation[4].phrases[0],
          foundation[4].phrases[1],
          foundation[5].phrases[2],
        ],
        prompts: const [
          'Clarify one important condition.',
          'Say what you did not understand.',
          'Describe what you are looking for.',
          'Ask about the cost or condition.',
          'Request a practical solution.',
        ],
      ),
    ];
  }

  static Scenario _scenario({
    required LearnLang language,
    required Cefr level,
    required String suffix,
    required int minutes,
    required String titleTr,
    required String titleEn,
    required List<Phrase> sources,
    required List<String> prompts,
  }) {
    final phrases = <Phrase>[
      for (var index = 0; index < sources.length; index++)
        Phrase(
          id: '${language.name}_${suffix}_$index',
          target: sources[index].target,
          gloss: Map<UiLang, String>.unmodifiable(sources[index].gloss),
          ipa: sources[index].ipa,
          hint: sources[index].hint,
        ),
    ];
    return Scenario(
      id: '${language.name}_$suffix',
      lang: language,
      cefr: level,
      minutes: minutes,
      titles: {UiLang.tr: titleTr, UiLang.en: titleEn},
      phrases: phrases,
      turns: [
        for (var index = 0; index < phrases.length; index++)
          SpeakTurn(
            prompt: prompts[index],
            expected: phrases[index].target,
            scaffold: index == 0 ? null : phrases[index - 1].target,
          ),
      ],
      clipLine: phrases.first.target,
    );
  }
}

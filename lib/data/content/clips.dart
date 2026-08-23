import '../models/models.dart';
import 'catalog.dart';

class LearningClip {
  const LearningClip({
    required this.id,
    required this.scenarioId,
    required this.scenario,
    required this.phrase,
    required this.position,
  });

  final String id;
  final String scenarioId;
  final Scenario scenario;
  final Phrase phrase;
  final int position;
}

/// Klipleri müfredattan otomatik üretir; manuel ve dil bazında eksik liste yoktur.
class ClipCatalog {
  static List<LearningClip> forLang(LearnLang language) {
    final clips = <LearningClip>[];
    for (final scenario in Catalog.forLang(language)) {
      for (var index = 0; index < scenario.phrases.length; index++) {
        final phrase = scenario.phrases[index];
        clips.add(
          LearningClip(
            id: 'clip_${phrase.id}',
            scenarioId: scenario.id,
            scenario: scenario,
            phrase: phrase,
            position: clips.length,
          ),
        );
      }
    }
    return clips;
  }
}

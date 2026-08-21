import 'package:flutter_test/flutter_test.dart';
import 'package:nura/data/content/catalog.dart';
import 'package:nura/data/content/language_guides.dart';
import 'package:nura/data/models/models.dart';
import 'package:nura/data/translate/offline_translate.dart';

void main() {
  test('all 30 learn languages have at least 8 scenarios', () {
    for (final lang in LearnLang.values) {
      final n = Catalog.forLang(lang).length;
      expect(n, greaterThanOrEqualTo(8), reason: '${lang.name} has $n scenarios');
    }
  });

  test('Spanish has 10 scenarios (8 base + NIE + contrato)', () {
    expect(Catalog.forLang(LearnLang.es).length, 10);
  });

  test('Arabic A1 pack exists', () {
    expect(Catalog.forLang(LearnLang.ar).length, greaterThanOrEqualTo(5));
    final cafe = Catalog.byId('ar_cafe');
    expect(cafe, isNotNull);
  });

  test('NIE phrase exists in Spanish', () {
    expect(Catalog.byId('es_nie'), isNotNull);
    expect(Catalog.phraseById('es_nie_0')?.target, contains('NIE'));
  });

  test('all 30 languages have a guide', () {
    for (final lang in LearnLang.values) {
      final g = LanguageGuide.of(lang);
      expect(g.lang, lang);
      expect(g.headline.isNotEmpty, true, reason: '${lang.name} guide headline empty');
    }
  });

  test('offline translate hits Spanish rent from Turkish', () {
    final hit = OfflineTranslate.lookup(
      input: 'kira',
      learn: LearnLang.es,
      ui: UiLang.tr,
    );
    expect(hit, isNotNull);
  });

  test('all learn languages have a flag and label', () {
    for (final lang in LearnLang.values) {
      expect(lang.flag().isNotEmpty, true);
      expect(lang.label(UiLang.en).isNotEmpty, true);
      expect(lang.label(UiLang.tr).isNotEmpty, true);
    }
  });

  test('total scenario count is 242', () {
    var total = 0;
    for (final lang in LearnLang.values) {
      total += Catalog.forLang(lang).length;
    }
    expect(total, 242);
  });
}

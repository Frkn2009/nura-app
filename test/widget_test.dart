import 'package:flutter_test/flutter_test.dart';
import 'package:nura/data/content/catalog.dart';
import 'package:nura/data/content/language_guides.dart';
import 'package:nura/data/models/models.dart';
import 'package:nura/data/translate/offline_translate.dart';

void main() {
  test('each learn language has a full A1 pack', () {
    for (final lang in LearnLang.values) {
      final n = Catalog.forLang(lang).length;
      expect(n, lang == LearnLang.es ? 10 : 8, reason: lang.name);
    }
  });

  test('Arabic A1 pack exists', () {
    expect(Catalog.forLang(LearnLang.ar).length, 8);
    expect(Catalog.byId('ar_cafe')?.phrases.first.target, contains('قهوة'));
    expect(LanguageGuide.of(LearnLang.ar).headline.toLowerCase(), contains('arapça'));
  });

  test('NIE phrase exists in Spanish', () {
    expect(Catalog.byId('es_nie'), isNotNull);
    expect(Catalog.phraseById('es_nie_0')?.target, contains('NIE'));
  });

  test('Dutch oe maps to u sound', () {
    final g = LanguageGuide.of(LearnLang.nl);
    expect(g.rules.first.written, 'oe');
    expect(g.tipFor('boek')?.heard.toLowerCase(), contains('u'));
  });

  test('offline translate hits Spanish rent from Turkish', () {
    final hit = OfflineTranslate.lookup(
      input: 'kira',
      learn: LearnLang.es,
      ui: UiLang.tr,
    );
    expect(hit, isNotNull);
    expect(hit!.target.toLowerCase(), contains('alquiler'));
  });
}

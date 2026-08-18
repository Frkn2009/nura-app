import 'package:flutter_test/flutter_test.dart';
import 'package:nura/data/content/catalog.dart';
import 'package:nura/data/models/models.dart';
import 'package:nura/data/translate/offline_translate.dart';

void main() {
  test('each learn language has 8 A1 scenes', () {
    for (final lang in LearnLang.values) {
      expect(Catalog.forLang(lang).length, 8, reason: lang.name);
    }
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

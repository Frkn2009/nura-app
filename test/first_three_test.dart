import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:nura/data/models/models.dart';
import 'package:nura/data/speech/phoneme_scorer.dart';
import 'package:nura/data/speech/speech_controller.dart';
import 'package:nura/data/translate/offline_translate.dart';
import 'package:nura/ui/brand.dart';

/// YAPILACAKLAR.md ilk 3 maddesi için doğrulama testleri:
/// 1. Logo — sol üstte NURA markası + AppBar her sayfada
/// 2. Konuş — 30 dil TTS/STT locale, kadın ses tercihi, fonem skoru
/// 3. Çeviri — 30 dil sözlük, swap yönü, uydurma çeviri yok
void main() {
  group('1. Logo — NURA markası', () {
    testWidgets('NuraWordmark: marka işareti + NURA yazısı', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: const NuraWordmark())),
      );
      expect(find.byType(NuraMark), findsOneWidget);
      expect(find.text('NURA'), findsOneWidget);
    });

    testWidgets('NuraAppBar: marka sol üstte otomatik görünür', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            appBar: NuraAppBar(pageTitle: const Text('Konuş')),
            body: const SizedBox.shrink(),
          ),
        ),
      );
      expect(find.byType(NuraAppBar), findsOneWidget);
      expect(find.byType(NuraMark), findsOneWidget);
      expect(find.text('NURA'), findsOneWidget);
      expect(find.text('Konuş'), findsOneWidget);
    });

    testWidgets('NuraAppBar başlıksız da markayı gösterir', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(appBar: NuraAppBar())),
      );
      expect(find.byType(NuraMark), findsOneWidget);
      expect(find.text('NURA'), findsOneWidget);
    });
  });

  group('2. Konuş — mikrofon, kadın ses, skor', () {
    test('30 dilin tamamında TTS/STT locale tanımlı', () {
      for (final lang in LearnLang.values) {
        final locale = SpeechController.localeOf(lang.code);
        expect(locale, isNotEmpty, reason: '${lang.name} locale boş');
        expect(locale, contains('-'), reason: '${lang.name} locale biçimsiz');
      }
    });

    test('kadın ses her zaman erkek sesten önde', () {
      for (final lang in LearnLang.values) {
        final locale = SpeechController.localeOf(lang.code);
        final female = SpeechController.voiceQualityScore(
          {'name': 'Samantha', 'gender': 'female', 'locale': locale},
          lang.code,
        );
        final male = SpeechController.voiceQualityScore(
          {'name': 'Tom', 'gender': 'male', 'locale': locale},
          lang.code,
        );
        expect(
          female,
          greaterThan(male),
          reason: '${lang.name} kadın ses öncelikli değil',
        );
        expect(
          female,
          greaterThanOrEqualTo(100),
          reason: '${lang.name} kadın ses puanı',
        );
      }
    });

    test('yanlış dildeki ses hiç seçilmez', () {
      for (final lang in LearnLang.values) {
        final score = SpeechController.voiceQualityScore(
          const {'name': 'Samantha', 'gender': 'female', 'locale': 'zz-ZZ'},
          lang.code,
        );
        expect(
          score,
          lessThan(0),
          reason: '${lang.name} yanlış dil sese izin veriyor',
        );
      }
    });

    test('fonem skoru: birebir tekrar yüksek, boş ses 0', () {
      final perfect = PhonemeScorer.assess(
        expected: 'hola',
        heard: 'hola',
        languageCode: 'es',
      );
      expect(perfect.overall, greaterThanOrEqualTo(90));
      expect(perfect.feedback, isNotEmpty);

      final empty = PhonemeScorer.assess(
        expected: 'hola',
        heard: '',
        languageCode: 'es',
      );
      expect(empty.overall, 0);

      final wrong = PhonemeScorer.assess(
        expected: 'hola',
        heard: 'xyz',
        languageCode: 'es',
      );
      expect(wrong.overall, lessThan(perfect.overall));
    });
  });

  group('3. Çeviri — 30 dil, swap, uydurma yok', () {
    test('sözlük: hello 30 dilin tamamında karşılık bulur', () {
      for (final lang in LearnLang.values) {
        final hit = OfflineTranslate.translate(
          input: 'hello',
          from: LearnLang.en,
          to: lang,
        );
        expect(hit, isNotNull, reason: '${lang.name} hello çevirisi eksik');
        expect(hit!.target, isNotEmpty, reason: '${lang.name} hello hedefi boş');
        expect(hit.origin, TranslationOrigin.dictionary);
      }
    });

    test('her dilde en az bir hızlı kalıp önerisi var', () {
      for (final lang in LearnLang.values) {
        expect(
          OfflineTranslate.suggestions(lang),
          isNotEmpty,
          reason: '${lang.name} önerisi yok',
        );
      }
    });

    test('tr → en ve swap yönü en → tr çalışır', () {
      final trEn = OfflineTranslate.translate(
        input: 'merhaba',
        from: LearnLang.tr,
        to: LearnLang.en,
      );
      expect(trEn?.target, 'hello');

      final enTr = OfflineTranslate.translate(
        input: 'hello',
        from: LearnLang.en,
        to: LearnLang.tr,
      );
      expect(enTr?.target, 'merhaba');
    });

    test('büyük/küçük harf ve noktalama yok sayılır', () {
      final hit = OfflineTranslate.translate(
        input: 'Merhaba!',
        from: LearnLang.tr,
        to: LearnLang.en,
      );
      expect(hit?.target, 'hello');
    });

    test('uydurma çeviri yok — bilinmeyen metin null döner', () {
      expect(
        OfflineTranslate.translate(
          input: 'xyzabc123',
          from: LearnLang.en,
          to: LearnLang.tr,
        ),
        isNull,
      );
    });

    test('30×30 yönü: hello sözlük karşılığı her dil çiftinde çalışır', () {
      final hellos = <LearnLang, String>{};
      for (final lang in LearnLang.values) {
        hellos[lang] = OfflineTranslate.translate(
          input: 'hello',
          from: LearnLang.en,
          to: lang,
        )!.target;
      }
      for (final from in LearnLang.values) {
        for (final to in LearnLang.values) {
          final hit = OfflineTranslate.translate(
            input: hellos[from]!,
            from: from,
            to: to,
          );
          expect(hit, isNotNull, reason: '${from.name} → ${to.name} eksik');
          expect(hit!.target, hellos[to]);
        }
      }
    });
  });
}

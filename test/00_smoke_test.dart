import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:nura/app.dart';
import 'package:nura/state/session.dart';

/// Açılış duman testi: NuraApp, boş profille onboarding'e düşer ve
/// hiçbir plugin çağrısı olmadan render olur.
///
/// Not: `prefsProvider` override EDİLMELİDİR — sessionProvider build()
/// sırasında okur; override yoksa UnimplementedError fırlatır.
void main() {
  testWidgets('NURA app opens without crash', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final preferences = await SharedPreferences.getInstance();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [prefsProvider.overrideWithValue(preferences)],
        child: const NuraApp(),
      ),
    );
    await tester.pump(); // GoRouter ilk navigasyon çerçevesi

    expect(find.byType(NuraApp), findsOneWidget);
    // İlk konum onboarding (yeni profil).
    expect(find.text('1 / 5'), findsOneWidget);
  });
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:nura/app.dart';
import 'package:nura/state/session.dart';

void main() {
  testWidgets('NURA app opens without crash', (tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();

    await tester.pumpWidget(
      ProviderScope(
        overrides: [prefsProvider.overrideWithValue(prefs)],
        child: const NuraApp(),
      ),
    );
    await tester.pump();

    expect(find.byType(NuraApp), findsOneWidget);
  });
}

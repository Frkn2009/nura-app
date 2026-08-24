import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app.dart';
import 'core/supabase_config.dart';
import 'data/notifications/notification_service.dart';
import 'features/plus/data/revenuecat_billing_service.dart';
import 'state/session.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Anahtarlar girildiyse bulut senkronu açılır.
  // Girilmediyse uygulama eskisi gibi tamamen yerel çalışır.
  if (SupaConfig.isSet) {
    await Supabase.initialize(
      url: SupaConfig.url,
      publishableKey: SupaConfig.publishableKey,
    );
  }

  // NURA_REVENUECAT_API_KEY dart-define'ı girilmediyse hiçbir şey yapmaz —
  // PlusController o zaman FakeBillingService kullanmaya devam eder.
  await RevenueCatBillingService.configureIfNeeded();

  try {
    await NotificationService.initialize();
  } catch (_) {
    // Bildirim desteği olmayan platformlarda uygulama açılışını engelleme.
  }

  final prefs = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      overrides: [prefsProvider.overrideWithValue(prefs)],
      child: const NuraApp(),
    ),
  );
}

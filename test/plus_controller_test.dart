import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nura/features/plus/data/fake_billing_service.dart';
import 'package:nura/features/plus/domain/entitlement.dart';
import 'package:nura/features/plus/state/plus_controller.dart';
import 'package:nura/state/session.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  test('initial entitlement is free', () async {
    final container = ProviderContainer(
      overrides: [
        billingServiceProvider.overrideWithValue(FakeBillingService()),
      ],
    );
    final controller = container.read(plusControllerProvider.notifier);
    expect(controller.state, NuraEntitlement.free);
  });

  test('purchase changes entitlement to plus', () async {
    SharedPreferences.setMockInitialValues({});
    final preferences = await SharedPreferences.getInstance();
    final container = ProviderContainer(
      overrides: [
        billingServiceProvider.overrideWithValue(FakeBillingService()),
        prefsProvider.overrideWithValue(preferences),
      ],
    );
    final controller = container.read(plusControllerProvider.notifier);
    await controller.purchase(nuraPlusYearly);
    expect(controller.state, NuraEntitlement.plus);
    expect(container.read(sessionProvider).isPlus, isTrue);
  });

  test('restore changes entitlement to plus', () async {
    SharedPreferences.setMockInitialValues({});
    final preferences = await SharedPreferences.getInstance();
    final container = ProviderContainer(
      overrides: [
        billingServiceProvider.overrideWithValue(FakeBillingService()),
        prefsProvider.overrideWithValue(preferences),
      ],
    );
    final controller = container.read(plusControllerProvider.notifier);
    await controller.restore();
    expect(controller.state, NuraEntitlement.plus);
    expect(container.read(sessionProvider).isPlus, isTrue);
  });
}

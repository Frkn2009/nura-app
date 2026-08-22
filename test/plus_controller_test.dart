import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:nura/features/plus/data/fake_billing_service.dart';
import 'package:nura/features/plus/domain/entitlement.dart';
import 'package:nura/features/plus/state/plus_controller.dart';

void main() {
  ProviderContainer makeContainer() {
    return ProviderContainer(
      overrides: [
        billingServiceProvider.overrideWithValue(FakeBillingService()),
      ],
    );
  }

  test('initial entitlement is free', () async {
    final container = makeContainer();
    addTearDown(container.dispose);

    final controller = container.read(plusControllerProvider.notifier);
    expect(controller.state, NuraEntitlement.free);
  });

  test('purchase changes entitlement to plus', () async {
    final container = makeContainer();
    addTearDown(container.dispose);

    final controller = container.read(plusControllerProvider.notifier);
    await controller.purchase(nuraPlusLifetimeProduct);

    expect(controller.state, NuraEntitlement.plus);
  });

  test('restore changes entitlement to plus', () async {
    final container = makeContainer();
    addTearDown(container.dispose);

    final controller = container.read(plusControllerProvider.notifier);
    await controller.restore();

    expect(controller.state, NuraEntitlement.plus);
  });

  test('loadEntitlement reflects the service state', () async {
    final service = FakeBillingService(entitlement: NuraEntitlement.plus);
    final container = ProviderContainer(
      overrides: [billingServiceProvider.overrideWithValue(service)],
    );
    addTearDown(container.dispose);

    final controller = container.read(plusControllerProvider.notifier);
    expect(controller.state, NuraEntitlement.free);

    await controller.loadEntitlement();
    expect(controller.state, NuraEntitlement.plus);
  });
}

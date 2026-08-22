import 'package:flutter_riverpod/flutter_riverpod.dart';

/// NURA zaman sözleşmesi: üretim kodu `DateTime.now()` yerine Clock'tan
/// zaman alır; testler FakeClock ile deterministik çalışır (Contract madde 5).
abstract class Clock {
  DateTime now();
  DateTime nowUtc();
}

class SystemClock implements Clock {
  const SystemClock();

  @override
  DateTime now() => DateTime.now();

  @override
  DateTime nowUtc() => DateTime.now().toUtc();
}

class FakeClock implements Clock {
  FakeClock(DateTime initial) : _now = initial.toUtc();

  DateTime _now;

  @override
  DateTime now() => _now.toLocal();

  @override
  DateTime nowUtc() => _now;

  void advance(Duration duration) {
    _now = _now.add(duration);
  }

  void setTime(DateTime time) {
    _now = time.toUtc();
  }
}

/// Varsayılan sistem saati. Testler bu provider'ı FakeClock ile override eder.
final clockProvider = Provider<Clock>((ref) {
  return const SystemClock();
});

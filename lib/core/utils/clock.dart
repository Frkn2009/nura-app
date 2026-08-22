import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  FakeClock(this._now);

  DateTime _now;

  @override
  DateTime now() => _now;

  @override
  DateTime nowUtc() => _now.toUtc();

  void advance(Duration duration) {
    _now = _now.add(duration);
  }

  void setTime(DateTime time) {
    _now = time;
  }
}

final clockProvider = Provider<Clock>((ref) {
  return const SystemClock();
});

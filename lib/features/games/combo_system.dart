import 'package:flutter_riverpod/flutter_riverpod.dart';

class ComboState {
  final int streak;
  final double multiplier;
  final bool fire;
  const ComboState({this.streak = 0, this.multiplier = 1, this.fire = false});
}

class ComboController extends Notifier<ComboState> {
  @override
  ComboState build() => const ComboState();

  void correct() {
    final n = state.streak + 1;
    state = ComboState(
      streak: n,
      multiplier: n >= 15 ? 3 : n >= 10 ? 2.5 : n >= 5 ? 2 : 1,
      fire: n >= 10,
    );
  }

  void wrong() => state = const ComboState();
}

final comboProvider = NotifierProvider<ComboController, ComboState>(ComboController.new);

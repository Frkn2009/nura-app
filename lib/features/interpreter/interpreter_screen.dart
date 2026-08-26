import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/tokens.dart';
import '../../data/models/models.dart';
import '../../data/speech/speech_controller.dart';
import '../../data/translate/interpreter_translate.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

class _Turn {
  _Turn({
    required this.speaker,
    required this.original,
    required this.translated,
  });
  final LearnLang speaker;
  final String original;
  final String translated;
}

/// Toplantı Çevirmeni: masaya konan telefonda iki taraf sırayla kendi
/// dilinin butonuna basılı tutup konuşur, karşı tarafın diline hem yazılı
/// hem sesli çevrilir. Google Translate API üzerinden düz/literal çeviri —
/// yorum/parafraz katmıyor. Dil geçişi şimdilik dokun-konuş: cihaz STT'si
/// bir oturumda tek dile kilitleniyor, iki dili aynı anda otomatik ayırt
/// edemiyor.
class InterpreterScreen extends ConsumerStatefulWidget {
  const InterpreterScreen({super.key});

  @override
  ConsumerState<InterpreterScreen> createState() => _InterpreterScreenState();
}

class _InterpreterScreenState extends ConsumerState<InterpreterScreen> {
  final speech = SpeechController();
  late LearnLang langA;
  late LearnLang langB;
  LearnLang? activeSide;
  bool _pressActive = false;
  String heard = '';
  bool translating = false;
  String? error;
  final List<_Turn> transcript = [];

  @override
  void initState() {
    super.initState();
    langA = LearnLang.tr;
    langB = LearnLang.en;
  }

  @override
  void dispose() {
    speech.dispose();
    super.dispose();
  }

  LearnLang _otherOf(LearnLang side) => side == langA ? langB : langA;

  void _gate() {
    if (!mounted) return;
    final p = ref.read(sessionProvider);
    if (p.isPlus || p.isBusiness) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Bugünkü Toplantı Çevirmeni kotan bitti, yarın sıfırlanır.',
          ),
        ),
      );
      return;
    }
    context.push('/ad?reward=interpreterTime');
  }

  String _mmss(int seconds) {
    final m = seconds ~/ 60;
    final s = seconds % 60;
    return '${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  Future<void> _down(LearnLang side) async {
    final p = ref.read(sessionProvider);
    if (!p.canUseInterpreter) {
      _gate();
      return;
    }
    if (translating) return;

    _pressActive = true;
    setState(() {
      activeSide = side;
      heard = '';
      error = null;
    });

    final started = await speech.startListen(
      langCode: side.code,
      onTick: (_) {
        if (!mounted || activeSide != side) return;
        ref.read(sessionProvider.notifier).consumeInterpreter(1);
        if (!ref.read(sessionProvider).canUseInterpreter) {
          _up(side).then((_) {
            if (mounted) _gate();
          });
        }
      },
      onText: (text) {
        if (mounted) setState(() => heard = text);
      },
    );

    if (!_pressActive) {
      if (started) await speech.stopListen();
      return;
    }
    if (!started) {
      _pressActive = false;
      if (!mounted) return;
      setState(() => activeSide = null);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(_microphoneMessage())));
    }
  }

  Future<void> _up(LearnLang side) async {
    _pressActive = false;
    if (activeSide != side) return;
    final text = await speech.stopListen();
    final recognized = (text.isEmpty ? heard : text).trim();
    if (!mounted) return;
    setState(() => activeSide = null);
    if (recognized.isEmpty) return;

    final target = _otherOf(side);
    setState(() {
      translating = true;
      error = null;
    });
    try {
      final translated = await InterpreterTranslate.translate(
        input: recognized,
        from: side,
        to: target,
      );
      if (!mounted) return;
      setState(() {
        transcript.add(
          _Turn(speaker: side, original: recognized, translated: translated),
        );
        translating = false;
      });
      unawaited(speech.speakTarget(translated, target.code));
    } catch (e) {
      if (!mounted) return;
      setState(() {
        translating = false;
        error = _errorMessage(e);
      });
    }
  }

  String _microphoneMessage() => switch (speech.availability) {
    SpeechAvailability.permissionPermanentlyDenied =>
      'Mikrofon izni kapalı. Telefon ayarlarından VOXELO için mikrofonu aç.',
    SpeechAvailability.permissionDenied =>
      'Konuşabilmek için mikrofon izni vermen gerekiyor.',
    SpeechAvailability.unavailable =>
      'Bu cihazda konuşma tanıma kullanılamıyor.',
    _ => 'Mikrofon başlatılamadı. Lütfen tekrar dene.',
  };

  String _errorMessage(Object error) {
    final code = error.toString();
    if (code.contains('authentication_required') ||
        code.contains('invalid_session')) {
      return 'Devam etmek için VOXELO hesabına giriş gerekiyor.';
    }
    if (code.contains('service_not_configured')) {
      return 'Çeviri sunucusu henüz yapılandırılmadı.';
    }
    return 'Çeviriye şu an ulaşılamıyor. Tekrar dene.';
  }

  @override
  Widget build(BuildContext context) {
    final p = ref.watch(sessionProvider);
    return Scaffold(
      appBar: VoxeloAppBar(
        pageTitle: const Text('Toplantı Çevirmeni'),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => context.pop(),
        ),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.0, 0.35],
            colors: [
              Voxelo.accent.withValues(alpha: .06),
              Theme.of(context).scaffoldBackgroundColor,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 4),
                child: Row(
                  children: [
                    Expanded(
                      child: _LangChip(
                        lang: langA,
                        uiLang: p.uiLang,
                        onChanged: (v) => setState(() {
                          if (v == langB) langB = langA;
                          langA = v;
                        }),
                      ),
                    ),
                    _SwapButton(
                      onTap: () => setState(() {
                        final t = langA;
                        langA = langB;
                        langB = t;
                      }),
                    ),
                    Expanded(
                      child: _LangChip(
                        lang: langB,
                        uiLang: p.uiLang,
                        onChanged: (v) => setState(() {
                          if (v == langA) langA = langB;
                          langB = v;
                        }),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Sadece çeviriyor, yorum katmıyor',
                      style: TextStyle(color: Voxelo.muted, fontSize: 12),
                    ),
                    Text(
                      'Bugün kalan: ${_mmss(p.interpreterSecondsLeft)}',
                      style: const TextStyle(
                        color: Voxelo.muted,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: transcript.isEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const VoxeloMascot(size: 72, mood: MascotMood.wave),
                              const SizedBox(height: 16),
                              const Text(
                                'Telefonu masaya koy. Konuşacak kişi kendi dilinin butonunu basılı tutup konuşsun, bırakınca karşı tarafın diline çevrilip hem yazılı hem sesli okunur.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Voxelo.muted,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : ListView.builder(
                        reverse: true,
                        padding: const EdgeInsets.fromLTRB(18, 4, 18, 4),
                        itemCount: transcript.length,
                        itemBuilder: (context, i) => _TurnBubble(
                          turn: transcript[transcript.length - 1 - i],
                          otherLang: _otherOf(
                            transcript[transcript.length - 1 - i].speaker,
                          ),
                          fromA:
                              transcript[transcript.length - 1 - i].speaker ==
                              langA,
                        ),
                      ),
              ),
              if (error != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    error!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Voxelo.coral),
                  ),
                ),
              if (translating)
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 6, 18, 18),
                child: Row(
                  children: [
                    Expanded(
                      child: _TalkButton(
                        lang: langA,
                        active: activeSide == langA,
                        onDown: () => _down(langA),
                        onUp: () => _up(langA),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: _TalkButton(
                        lang: langB,
                        active: activeSide == langB,
                        onDown: () => _down(langB),
                        onUp: () => _up(langB),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Dil seçici kart — eski çıplak `DropdownButton`, `Voxelo` kart üslubuna
/// (gölge/kenarlık) taşındı ki ekranın geri kalanıyla aynı ailede dursun.
class _LangChip extends StatelessWidget {
  const _LangChip({
    required this.lang,
    required this.uiLang,
    required this.onChanged,
  });
  final LearnLang lang;
  final UiLang uiLang;
  final ValueChanged<LearnLang> onChanged;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(Voxelo.radius),
        border: Border.all(
          color: Theme.of(
            context,
          ).dividerColor.withValues(alpha: isDark ? 1 : .6),
        ),
        boxShadow: isDark ? null : Voxelo.softShadow,
      ),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton<LearnLang>(
            value: lang,
            isExpanded: true,
            borderRadius: BorderRadius.circular(Voxelo.radius),
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: Voxelo.ink,
              fontSize: 14,
            ),
            items: LearnLang.values
                .map(
                  (l) => DropdownMenuItem(
                    value: l,
                    child: Text('${l.flag()}  ${l.label(uiLang)}'),
                  ),
                )
                .toList(),
            onChanged: (v) {
              if (v != null) onChanged(v);
            },
          ),
        ),
      ),
    );
  }
}

class _SwapButton extends StatelessWidget {
  const _SwapButton({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: Voxelo.heroGradient,
          boxShadow: [
            BoxShadow(
              color: Voxelo.accent.withValues(alpha: .3),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          shape: const CircleBorder(),
          child: InkWell(
            customBorder: const CircleBorder(),
            onTap: onTap,
            child: const Icon(Icons.swap_horiz, color: Colors.white, size: 20),
          ),
        ),
      ),
    );
  }
}

class _TurnBubble extends StatelessWidget {
  const _TurnBubble({
    required this.turn,
    required this.otherLang,
    required this.fromA,
  });
  final _Turn turn;
  final LearnLang otherLang;
  final bool fromA;

  @override
  Widget build(BuildContext context) {
    final t = turn;
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0, end: 1),
      duration: const Duration(milliseconds: 260),
      curve: Curves.easeOutBack,
      builder: (_, v, child) => Opacity(
        opacity: v.clamp(0, 1),
        child: Transform.translate(
          offset: Offset(0, (1 - v.clamp(0.0, 1.0)) * 10),
          child: child,
        ),
      ),
      child: Align(
        alignment: fromA ? Alignment.centerLeft : Alignment.centerRight,
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 5),
          constraints: const BoxConstraints(maxWidth: 320),
          child: VoxeloCard(
            color: fromA ? Voxelo.card : Voxelo.mint,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${t.speaker.flag()} ${t.original}',
                  style: TextStyle(
                    color: fromA ? Voxelo.muted : Colors.white70,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 4),
                Directionality(
                  textDirection: otherLang.isRtl
                      ? TextDirection.rtl
                      : TextDirection.ltr,
                  child: Text(
                    t.translated,
                    style: TextStyle(
                      color: fromA ? Voxelo.ink : Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _TalkButton extends StatefulWidget {
  const _TalkButton({
    required this.lang,
    required this.active,
    required this.onDown,
    required this.onUp,
  });

  final LearnLang lang;
  final bool active;
  final VoidCallback onDown;
  final VoidCallback onUp;

  @override
  State<_TalkButton> createState() => _TalkButtonState();
}

class _TalkButtonState extends State<_TalkButton>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pulse = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1000),
  )..repeat(reverse: true);

  @override
  void dispose() {
    _pulse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _pulse,
      builder: (_, _) {
        final t = widget.active ? _pulse.value : 0.0;
        return GestureDetector(
          onLongPressStart: (_) => widget.onDown(),
          onLongPressEnd: (_) => widget.onUp(),
          child: AnimatedScale(
            scale: widget.active ? 1.03 : 1.0,
            duration: const Duration(milliseconds: 140),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 18),
              decoration: BoxDecoration(
                gradient: widget.active ? Voxelo.heroGradient : null,
                color: widget.active ? null : Voxelo.mintDark,
                borderRadius: BorderRadius.circular(Voxelo.radius),
                boxShadow: [
                  BoxShadow(
                    color: (widget.active ? Voxelo.accent : Voxelo.mintDark)
                        .withValues(alpha: .25 + .2 * t),
                    blurRadius: 10 + 10 * t,
                    spreadRadius: t,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Icon(
                    widget.active ? Icons.mic : Icons.mic_none,
                    color: Colors.white,
                    size: 26,
                  ),
                  const SizedBox(height: 6),
                  Text(
                    widget.lang.flag(),
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    widget.active ? 'Dinliyor…' : 'Basılı tut, konuş',
                    style: const TextStyle(color: Colors.white70, fontSize: 11),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

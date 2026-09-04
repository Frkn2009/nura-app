import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/tokens.dart';
import '../../../data/ads/ad_service.dart';
import '../../../ui/widgets.dart';
import '../domain/ai_feedback.dart';
import '../state/ai_controller.dart';

/// AI Geri Bildirim Ekranı — konuşma sonrası detaylı analiz
class AiFeedbackScreen extends ConsumerStatefulWidget {
  const AiFeedbackScreen({
    super.key,
    required this.expectedText,
    required this.userText,
    required this.targetLang,
    required this.nativeLang,
  });

  final String expectedText;
  final String userText;
  final String targetLang;
  final String nativeLang;

  @override
  ConsumerState<AiFeedbackScreen> createState() => _AiFeedbackScreenState();
}

class _AiFeedbackScreenState extends ConsumerState<AiFeedbackScreen> {
  AiFeedback? feedback;
  bool loading = true;
  bool _watchingAd = false;
  bool _adBonusExhausted = false;
  String? _adError;

  @override
  void initState() {
    super.initState();
    _loadFeedback();
  }

  Future<void> _loadFeedback() async {
    final ai = ref.read(aiServiceProvider);
    final result = await ai.generateSentenceFeedback(
      sourceText: widget.expectedText,
      userAnswer: widget.userText,
      targetLanguage: widget.targetLang,
      nativeLanguage: widget.nativeLang,
    );
    if (mounted) {
      setState(() {
        feedback = result;
        loading = false;
      });
    }
  }

  /// Ücretsiz kullanıcı günlük 1 hakkını doldurunca gösterilen "Reklam
  /// izle, +1 hak kazan" butonu. Reklam gerçekten tamamlanıp ödül
  /// alındıktan SONRA sunucuya bildirilir (bkz. ClaudeAiService.
  /// claimFeedbackAdBonus), sonra analiz otomatik tekrar denenir.
  Future<void> _watchAdForBonus() async {
    setState(() {
      _watchingAd = true;
      _adError = null;
    });
    final earned = await AdService.showRewarded();
    if (!mounted) return;
    if (!earned) {
      setState(() {
        _watchingAd = false;
        _adError = AdService.supported
            ? 'Reklam tamamlanmadı. Ödül için videoyu sonuna kadar izle.'
            : 'Video reklamlar telefonda çalışır.';
      });
      return;
    }
    final bonus = await ref.read(claudeAiServiceProvider).claimFeedbackAdBonus();
    if (!mounted) return;
    if (bonus == null) {
      setState(() {
        _watchingAd = false;
        _adError = 'Bağlantı hatası, tekrar dene.';
      });
      return;
    }
    if (bonus == -1) {
      setState(() {
        _watchingAd = false;
        _adBonusExhausted = true;
      });
      return;
    }
    setState(() {
      _watchingAd = false;
      loading = true;
    });
    await _loadFeedback();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('🧠 AI Analiz')),
      body: SafeArea(
        child: loading
            ? const Center(child: CircularProgressIndicator())
            : ListView(
                padding: const EdgeInsets.fromLTRB(22, 16, 22, 28),
                children: [
                  // Skor (hak bittiyse — ücretsiz VEYA Plus günlük sınırı —
                  // skor yerine maskot: 0 puanlık boş bir daire yerine "hay
                  // aksi, hakkın bitti" hissini veriyor)
                  Center(
                    child: _isLimitState
                        ? const VoxelithMascot(
                            size: 100,
                            mood: MascotMood.encourage,
                          )
                        : Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _scoreColor(
                                feedback!.score,
                              ).withValues(alpha: 0.15),
                              border: Border.all(
                                color: _scoreColor(feedback!.score),
                                width: 3,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '${feedback!.score}',
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w800,
                                  color: _scoreColor(feedback!.score),
                                ),
                              ),
                            ),
                          ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    feedback!.encouragement,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Beklenen vs Senin cevabın
                  const Eyebrow('Beklenen cevap'),
                  const SizedBox(height: 8),
                  VoxelithCard(
                    color: Voxelith.mint.withValues(alpha: 0.1),
                    child: Text(
                      feedback!.correctedAnswer,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Eyebrow('Senin cevabın'),
                  const SizedBox(height: 8),
                  VoxelithCard(
                    child: Text(
                      feedback!.userAnswer.isEmpty
                          ? '(ses algılanamadı)'
                          : feedback!.userAnswer,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: feedback!.score >= 70
                            ? Voxelith.mint
                            : Voxelith.coral,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // İpuçları
                  const Eyebrow('💡 İpuçları'),
                  const SizedBox(height: 8),
                  for (final tip in feedback!.tips)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: VoxelithCard(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '→ ',
                              style: TextStyle(
                                color: Voxelith.mint,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                tip,
                                style: const TextStyle(height: 1.4),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  const SizedBox(height: 20),

                  FilledButton(
                    onPressed: _watchingAd
                        ? null
                        : _isPaywallNudge
                        ? () {
                            Navigator.pop(context);
                            context.push('/paywall');
                          }
                        : () => Navigator.pop(context),
                    child: Text(_isPaywallNudge ? 'Plus\'a Geç' : 'Devam Et'),
                  ),
                  if (_isPaywallNudge && !_adBonusExhausted) ...[
                    const SizedBox(height: 10),
                    OutlinedButton.icon(
                      onPressed: _watchingAd ? null : _watchAdForBonus,
                      icon: const Icon(Icons.play_circle_outline),
                      label: Text(
                        _watchingAd
                            ? 'Video hazırlanıyor…'
                            : 'Reklam izle, +1 hak kazan (günde 5\'e kadar)',
                      ),
                    ),
                  ],
                  if (_adBonusExhausted) ...[
                    const SizedBox(height: 10),
                    const Text(
                      'Bugünkü 5 reklam hakkına da ulaştın.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Voxelith.coral),
                    ),
                  ],
                  if (_adError != null) ...[
                    const SizedBox(height: 10),
                    Text(
                      _adError!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Voxelith.coral),
                    ),
                  ],
                ],
              ),
      ),
    );
  }

  bool get _isPaywallNudge => feedback?.encouragement.startsWith('🔒') ?? false;

  bool get _isLimitState =>
      _isPaywallNudge || (feedback?.encouragement.startsWith('⏳') ?? false);

  Color _scoreColor(int score) {
    if (score >= 80) return Voxelith.mint;
    if (score >= 60) return Voxelith.peach;
    return Voxelith.coral;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/tokens.dart';
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
                  // Skor
                  Center(
                    child: Container(
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
                  NuraCard(
                    color: Nura.mint.withValues(alpha: 0.1),
                    child: Text(
                      feedback!.correctedAnswer,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Nura.ink,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Eyebrow('Senin cevabın'),
                  const SizedBox(height: 8),
                  NuraCard(
                    child: Text(
                      feedback!.userAnswer.isEmpty
                          ? '(ses algılanamadı)'
                          : feedback!.userAnswer,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: feedback!.score >= 70 ? Nura.mint : Nura.coral,
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
                      child: NuraCard(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '→ ',
                              style: TextStyle(
                                color: Nura.mint,
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
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Devam Et'),
                  ),
                ],
              ),
      ),
    );
  }

  Color _scoreColor(int score) {
    if (score >= 80) return Nura.mint;
    if (score >= 60) return Nura.peach;
    return Nura.coral;
  }
}

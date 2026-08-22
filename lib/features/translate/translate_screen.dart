import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/tokens.dart';
import '../../data/models/models.dart';
import '../../data/speech/speech_controller.dart';
import '../../data/translate/cloud_translate.dart';
import '../../data/translate/offline_translate.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

/// Google Translate tarzı genel çeviri:
/// - 30 dil arası dropdown + swap
/// - Müfredat + sözlük tabanlı, uydurma yok
/// - Plus ile bulut genişletmesi (Edge Function)
/// - Kadın TTS, kopyala, temizle, hızlı kalıplar
class TranslateScreen extends ConsumerStatefulWidget {
  const TranslateScreen({super.key});

  @override
  ConsumerState<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends ConsumerState<TranslateScreen> {
  final ctrl = TextEditingController();
  final speech = SpeechController();
  TranslationHit? hit;
  bool searched = false;
  bool translating = false;
  String? cloudError;
  int _translationRequest = 0;
  late LearnLang fromLang;
  late LearnLang toLang;

  @override
  void initState() {
    super.initState();
    fromLang = LearnLang.tr;
    toLang = LearnLang.en;
    // TTS warm-up — kadın ses her zaman.
    speech.warmUp();
  }

  @override
  void dispose() {
    ctrl.dispose();
    speech.dispose();
    super.dispose();
  }

  void _swap() {
    _translationRequest++;
    final previousTranslation = hit?.target;
    setState(() {
      final previousFrom = fromLang;
      fromLang = toLang;
      toLang = previousFrom;
      if (previousTranslation != null) ctrl.text = previousTranslation;
      hit = null;
      searched = false;
      cloudError = null;
      translating = false;
    });
    if (ctrl.text.trim().isNotEmpty) _go();
  }

  void _setFrom(LearnLang language) {
    _translationRequest++;
    setState(() {
      if (language == toLang) toLang = fromLang;
      fromLang = language;
      hit = null;
      searched = false;
      cloudError = null;
      translating = false;
    });
  }

  void _setTo(LearnLang language) {
    _translationRequest++;
    setState(() {
      if (language == fromLang) fromLang = toLang;
      toLang = language;
      hit = null;
      searched = false;
      cloudError = null;
      translating = false;
    });
  }

  Future<void> _go() async {
    FocusManager.instance.primaryFocus?.unfocus();
    final request = ++_translationRequest;
    final input = ctrl.text.trim();
    if (input.isEmpty) {
      setState(() {
        searched = false;
        hit = null;
        cloudError = null;
        translating = false;
      });
      return;
    }

    final localHit = OfflineTranslate.translate(
      input: input,
      from: fromLang,
      to: toLang,
    );
    final plus = ref.read(sessionProvider).isPlus;
    setState(() {
      searched = true;
      hit = localHit;
      cloudError = null;
      translating = localHit == null && plus;
    });
    if (localHit != null || !plus) return;

    try {
      final cloudHit = await CloudTranslate.translate(
        input: input,
        from: fromLang,
        to: toLang,
      );
      if (mounted && request == _translationRequest) {
        setState(() => hit = cloudHit);
      }
    } catch (error) {
      if (mounted && request == _translationRequest) {
        setState(() => cloudError = _cloudErrorMessage(error));
      }
    } finally {
      if (mounted && request == _translationRequest) {
        setState(() => translating = false);
      }
    }
  }

  String _cloudErrorMessage(Object error) {
    final code = error.toString();
    if (code.contains('authentication_required') ||
        code.contains('invalid_session')) {
      return 'Plus bulut çevirisi için profilinden NURA hesabına giriş yap.';
    }
    if (code.contains('plus_required')) {
      return 'Bulut Plus hakkın henüz doğrulanmadı.';
    }
    if (code.contains('service_not_configured')) {
      return 'Bulut çeviri sunucusu henüz yapılandırılmadı.';
    }
    return 'Bulut çeviriye şu an ulaşılamıyor. Daha sonra tekrar dene.';
  }

  Future<void> _speak(String text, String langCode) async {
    await speech.speakTarget(text, langCode);
  }

  Future<void> _copy(String text) async {
    await Clipboard.setData(ClipboardData(text: text));
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Kopyalandı')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final i18n = ref.watch(i18nProvider);
    final p = ref.watch(sessionProvider);

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(22, 16, 22, 28),
        children: [
          Text(i18n.translate,
              style: Theme.of(context).textTheme.displayMedium),
          const SizedBox(height: 4),
          const Text(
            '30 dil · müfredat + sözlük doğrulamalı · uydurma yok',
            style: TextStyle(color: Nura.muted, fontSize: 13),
          ),
          const SizedBox(height: 16),

          // Dil seçici — Google Translate tarzı
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(Nura.radius),
              border: Border.all(color: Theme.of(context).dividerColor),
            ),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<LearnLang>(
                      value: fromLang,
                      isExpanded: true,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 14,
                      ),
                      items: LearnLang.values
                          .map(
                            (l) => DropdownMenuItem(
                              value: l,
                              child: Text(
                                '${l.flag()} ${l.label(p.uiLang)}',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value != null) _setFrom(value);
                      },
                    ),
                  ),
                ),
                Material(
                  color: Nura.mintLight,
                  borderRadius: BorderRadius.circular(Nura.radiusSm),
                  child: InkWell(
                    onTap: _swap,
                    borderRadius: BorderRadius.circular(Nura.radiusSm),
                    child: const Padding(
                      padding: EdgeInsets.all(8),
                      child: Icon(Icons.swap_horiz, color: Nura.mint, size: 22),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<LearnLang>(
                      value: toLang,
                      isExpanded: true,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 14,
                      ),
                      items: LearnLang.values
                          .map(
                            (l) => DropdownMenuItem(
                              value: l,
                              child: Text(
                                '${l.flag()} ${l.label(p.uiLang)}',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value != null) _setTo(value);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Kaynak metin kartı
          NuraCard(
            padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Text(
                      '${fromLang.flag()} ${fromLang.label(p.uiLang).toUpperCase()}',
                      style: const TextStyle(
                        color: Nura.muted,
                        fontSize: 11,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const Spacer(),
                    if (ctrl.text.isNotEmpty)
                      IconButton(
                        icon: const Icon(Icons.clear_rounded, size: 20),
                        color: Nura.muted,
                        tooltip: 'Temizle',
                        onPressed: () {
                          ctrl.clear();
                          setState(() {
                            hit = null;
                            searched = false;
                          });
                        },
                      ),
                  ],
                ),
                TextField(
                  controller: ctrl,
                  minLines: 3,
                  maxLines: 6,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (_) => _go(),
                  onChanged: (_) {
                    if (searched) {
                      setState(() {
                        searched = false;
                        hit = null;
                      });
                    }
                  },
                  decoration: InputDecoration(
                    hintText: i18n.typeToTranslate,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    filled: false,
                    contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  style: const TextStyle(fontSize: 18, height: 1.4),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.volume_up_rounded),
                      color: Nura.mintDark,
                      tooltip: 'Sesli oku · kadın',
                      onPressed: ctrl.text.trim().isEmpty
                          ? null
                          : () => _speak(ctrl.text.trim(), fromLang.code),
                    ),
                    const Spacer(),
                    FilledButton.icon(
                      onPressed: translating ? null : _go,
                      icon: translating
                          ? const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                color: Colors.white,
                              ),
                            )
                          : const Icon(Icons.translate_rounded, size: 18),
                      label: Text(translating ? 'Çevriliyor…' : i18n.translate),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // Hedef kartı / sonuç
          if (translating)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Center(child: CircularProgressIndicator()),
            ),
          if (searched && hit == null && !translating)
            NuraCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.verified_outlined,
                          color: Nura.muted, size: 20),
                      const SizedBox(width: 8),
                      const Eyebrow('Müfredat dışı'),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Bu cümle NURA sözlüğünde yok. Uydurma çeviri göstermiyoruz — yanlış kalıp öğretmektense boş bırakırız. Doğrulanan 6 sözlük + 302 sahne içinden eşleşirse gösteririz.',
                    style: TextStyle(color: Nura.ink, height: 1.5),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    cloudError ??
                        (p.isPlus
                            ? 'Plus bulut çevirisi için hesap ve aktif abonelik gerekir. Edge Function hazır, provider anahtarı eklenince açılır.'
                            : 'Plus ile genişletilmiş bulut çeviri ve kaydetme. Free’de sadece doğrulanmış müfredat/sözlük.'),
                    style: const TextStyle(color: Nura.muted, fontSize: 13, height: 1.4),
                  ),
                ],
              ),
            ),
          if (hit != null) ...[
            NuraCard(
              color: Nura.mint,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        '${toLang.flag()} ${toLang.label(p.uiLang).toUpperCase()}',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 11,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        icon: const Icon(Icons.volume_up_rounded,
                            color: Colors.white),
                        tooltip: 'Sesli oku · kadın',
                        onPressed: () =>
                            _speak(hit!.target, toLang.code),
                      ),
                      IconButton(
                        icon: const Icon(Icons.copy_rounded,
                            color: Colors.white70, size: 20),
                        tooltip: 'Kopyala',
                        onPressed: () => _copy(hit!.target),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  SelectableText(
                    hit!.target,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: .16),
                      borderRadius: BorderRadius.circular(Nura.radiusSm),
                    ),
                    child: Text(
                      switch (hit!.origin) {
                        TranslationOrigin.curriculum =>
                          '✓ NURA müfredatından doğrulandı',
                        TranslationOrigin.dictionary =>
                          '✓ NURA sözlüğünden doğrulandı',
                        TranslationOrigin.cloud =>
                          'Plus · güvenli bulut çevirisi',
                      },
                      style: const TextStyle(
                          color: Colors.white, fontSize: 12),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'güven ${(hit!.confidence * 100).round()}% · ${hit!.gloss}',
                    style: const TextStyle(
                        color: Colors.white60, fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _copy(hit!.target),
                    icon: const Icon(Icons.copy_rounded, size: 18),
                    label: const Text('Kopyala'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: FilledButton.icon(
                    onPressed: () {
                      final id =
                          'tr_${toLang.name}_${hit!.target.hashCode}';
                      ref
                          .read(sessionProvider.notifier)
                          .learnPhrase(id);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('SRS’e eklendi · yarın tekrar'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.bookmark_add_outlined, size: 18),
                    label: Text(i18n.savePhrase),
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: 24),

          // Hızlı kalıplar — sözlükten
          const Eyebrow('Hızlı kalıplar · sözlük'),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final suggestion
                  in OfflineTranslate.suggestions(fromLang))
                ActionChip(
                  avatar: Text(fromLang.flag(),
                      style: const TextStyle(fontSize: 12)),
                  label: Text(suggestion),
                  onPressed: () {
                    ctrl.text = suggestion;
                    _go();
                  },
                ),
            ],
          ),
          const SizedBox(height: 18),
          const Text(
            'NURA asla uydurma çeviri göstermez. Eşleşme yoksa boş bırakır. Plus’ta Supabase Edge Function üzerinden güvenli bulut çeviri açılır (gizli anahtar sunucuda).',
            style: TextStyle(color: Nura.muted, fontSize: 12, height: 1.45),
          ),
        ],
      ),
    );
  }
}

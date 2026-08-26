import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/tokens.dart';
import '../../data/models/models.dart';
import '../../data/translate/cloud_translate.dart';
import '../../data/translate/offline_translate.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

class TranslateScreen extends ConsumerStatefulWidget {
  const TranslateScreen({super.key});

  @override
  ConsumerState<TranslateScreen> createState() => _TranslateScreenState();
}

class _TranslateScreenState extends ConsumerState<TranslateScreen> {
  final ctrl = TextEditingController();
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
  }

  @override
  void dispose() {
    ctrl.dispose();
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

  @override
  Widget build(BuildContext context) {
    final i18n = ref.watch(i18nProvider);
    final p = ref.watch(sessionProvider);

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(22, 16, 22, 28),
        children: [
          Text(
            i18n.translate,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: 16),
          NuraCard(
            color: Nura.forest,
            onTap: () => context.push('/interpreter'),
            child: Row(
              children: [
                const Icon(Icons.groups, color: Colors.white, size: 28),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Toplantı Çevirmeni',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'İki dili sırayla dinler, hem yazılı hem sesli çevirir · bugün kalan ${p.interpreterSecondsLeft ~/ 60} dk',
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, color: Colors.white70),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Dil seçici (Google Translate tarzı)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Nura.radius),
              border: Border.all(color: Nura.fog),
            ),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<LearnLang>(
                      value: fromLang,
                      isExpanded: true,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Nura.ink,
                        fontSize: 14,
                      ),
                      items: LearnLang.values
                          .map(
                            (l) => DropdownMenuItem(
                              value: l,
                              child: Text('${l.flag()} ${l.label(p.uiLang)}'),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        if (value != null) _setFrom(value);
                      },
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _swap,
                  icon: const Icon(
                    Icons.swap_horiz,
                    color: Nura.mint,
                    size: 28,
                  ),
                ),
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<LearnLang>(
                      value: toLang,
                      isExpanded: true,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Nura.ink,
                        fontSize: 14,
                      ),
                      items: LearnLang.values
                          .map(
                            (l) => DropdownMenuItem(
                              value: l,
                              child: Text('${l.flag()} ${l.label(p.uiLang)}'),
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

          // Metin girişi
          TextField(
            controller: ctrl,
            minLines: 3,
            maxLines: 5,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _go(),
            decoration: InputDecoration(
              hintText: i18n.typeToTranslate,
              suffixIcon: IconButton(
                onPressed: _go,
                icon: const Icon(Icons.arrow_forward, color: Nura.mint),
              ),
            ),
          ),
          const SizedBox(height: 12),
          ForestButton(
            label: translating ? 'Çevriliyor…' : i18n.translate,
            onPressed: translating ? null : _go,
          ),
          const SizedBox(height: 18),

          // Sonuç
          if (translating)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 28),
              child: Center(child: CircularProgressIndicator()),
            ),
          if (searched && hit == null && !translating)
            NuraCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.info_outline, color: Nura.muted, size: 20),
                      const SizedBox(width: 8),
                      const Eyebrow('Müfredat dışı'),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Bu cümle NURA sözlüğünde yok. Uydurma çeviri göstermiyoruz — yanlış kalıp öğretmektense boş bırakırız.',
                    style: TextStyle(color: Nura.ink, height: 1.4),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    cloudError ??
                        (p.isPlus
                            ? 'Plus bulut çevirisi için hesap ve aktif abonelik gerekir.'
                            : 'Plus ile genişletilmiş bulut çeviri ve kaydetme.'),
                    style: const TextStyle(color: Nura.muted, fontSize: 13),
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
                  Text(
                    '${toLang.flag()} ${toLang.label(p.uiLang).toUpperCase()}',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Directionality(
                    textDirection: toLang.isRtl
                        ? TextDirection.rtl
                        : TextDirection.ltr,
                    child: Text(
                      hit!.target,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        height: 1.3,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    switch (hit!.origin) {
                      TranslationOrigin.curriculum =>
                        'NURA müfredatından doğrulandı',
                      TranslationOrigin.dictionary =>
                        'NURA sözlüğünden doğrulandı',
                      TranslationOrigin.cloud =>
                        'Plus · güvenli bulut çevirisi',
                    },
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'güven ${(hit!.confidence * 100).round()}% · ${hit!.gloss}',
                    style: const TextStyle(color: Colors.white60, fontSize: 12),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ForestButton(
              label: i18n.savePhrase,
              onPressed: () {
                final id = 'tr_${toLang.name}_${hit!.target.hashCode}';
                ref.read(sessionProvider.notifier).learnPhrase(id);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('SRS\'e eklendi · yarın tekrar'),
                  ),
                );
              },
            ),
          ],
          const SizedBox(height: 22),

          // Hızlı kalıplar
          const Eyebrow('Hızlı kalıplar'),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final suggestion in OfflineTranslate.suggestions(fromLang))
                ActionChip(
                  label: Text(suggestion),
                  onPressed: () {
                    ctrl.text = suggestion;
                    _go();
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }
}

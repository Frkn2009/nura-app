import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme/tokens.dart';
import '../../data/models/models.dart';
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
    setState(() {
      final temp = fromLang;
      fromLang = toLang;
      toLang = temp;
      if (ctrl.text.isNotEmpty) _go();
    });
  }

  void _go() {
    final p = ref.read(sessionProvider);
    setState(() {
      searched = true;
      // Hedef dilde ara
      hit = OfflineTranslate.lookup(
        input: ctrl.text,
        learn: toLang,
        ui: UiLang.values.firstWhere((u) => u.name == fromLang.name, orElse: () => p.uiLang),
      );
      // Bulunamadıysa kaynak dilde de ara
      if (hit == null) {
        hit = OfflineTranslate.lookup(
          input: ctrl.text,
          learn: fromLang,
          ui: UiLang.values.firstWhere((u) => u.name == toLang.name, orElse: () => UiLang.en),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final i18n = ref.watch(i18nProvider);
    final p = ref.watch(sessionProvider);

    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(22, 16, 22, 28),
        children: [
          Text(i18n.translate, style: Theme.of(context).textTheme.displayMedium),
          const SizedBox(height: 16),

          // Dil seçici (Google Translate tarzı)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Nura.fog),
            ),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<LearnLang>(
                      value: fromLang,
                      isExpanded: true,
                      style: const TextStyle(fontWeight: FontWeight.w600, color: Nura.ink, fontSize: 14),
                      items: LearnLang.values.map((l) => DropdownMenuItem(
                        value: l,
                        child: Text('${l.flag()} ${l.label(p.uiLang)}'),
                      )).toList(),
                      onChanged: (v) { if (v != null) setState(() => fromLang = v); },
                    ),
                  ),
                ),
                IconButton(
                  onPressed: _swap,
                  icon: const Icon(Icons.swap_horiz, color: Nura.mint, size: 28),
                ),
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<LearnLang>(
                      value: toLang,
                      isExpanded: true,
                      style: const TextStyle(fontWeight: FontWeight.w600, color: Nura.ink, fontSize: 14),
                      items: LearnLang.values.map((l) => DropdownMenuItem(
                        value: l,
                        child: Text('${l.flag()} ${l.label(p.uiLang)}'),
                      )).toList(),
                      onChanged: (v) { if (v != null) setState(() => toLang = v); },
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
              suffixIcon: IconButton(onPressed: _go, icon: const Icon(Icons.arrow_forward, color: Nura.mint)),
            ),
          ),
          const SizedBox(height: 12),
          ForestButton(label: i18n.translate, onPressed: _go),
          const SizedBox(height: 18),

          // Sonuç
          if (searched && hit == null)
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
                    p.isPlus
                        ? 'Plus bulut çeviri bir sonraki sürümde.'
                        : 'Plus ile genişletilmiş çeviri ve kaydetme.',
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
                  Text('${toLang.flag()} ${toLang.label(p.uiLang).toUpperCase()}',
                      style: const TextStyle(color: Colors.white70, fontSize: 11, letterSpacing: 1)),
                  const SizedBox(height: 8),
                  Text(hit!.target,
                      style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700, height: 1.3)),
                  const SizedBox(height: 10),
                  Text(hit!.gloss, style: const TextStyle(color: Colors.white70, fontSize: 16)),
                  const SizedBox(height: 8),
                  Text('güven ${(hit!.confidence * 100).round()}%',
                      style: const TextStyle(color: Colors.white60, fontSize: 12)),
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
                    const SnackBar(content: Text('SRS\'e eklendi · yarın tekrar')));
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
              for (final q in ['merhaba', 'teşekkürler', 'lütfen', 'ne kadar', 'tuvalet', 'anlamıyorum', 'yardım', 'istasyon', 'kira'])
                ActionChip(
                  label: Text(q),
                  onPressed: () {
                    ctrl.text = q;
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

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

  @override
  void dispose() {
    ctrl.dispose();
    super.dispose();
  }

  void _go() {
    final p = ref.read(sessionProvider);
    setState(() {
      searched = true;
      hit = OfflineTranslate.lookup(input: ctrl.text, learn: p.learnLang, ui: p.uiLang);
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
          const SizedBox(height: 6),
          Text(
            '${p.uiLang.nativeName()}  →  ${p.learnLang.label(p.uiLang)}',
            style: const TextStyle(color: Nura.muted),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: ctrl,
            minLines: 3,
            maxLines: 5,
            textInputAction: TextInputAction.done,
            onSubmitted: (_) => _go(),
            decoration: InputDecoration(
              hintText: i18n.typeToTranslate,
              suffixIcon: IconButton(onPressed: _go, icon: const Icon(Icons.arrow_forward)),
            ),
          ),
          const SizedBox(height: 12),
          ForestButton(label: i18n.translate, onPressed: _go),
          const SizedBox(height: 18),
          if (searched && hit == null)
            NuraCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Eyebrow('Müfredat dışı'),
                  const SizedBox(height: 8),
                  const Text(
                    'Bu cümle henüz NURA sözlüğünde yok. Uydurma çeviri göstermiyoruz — yanlış kalıp öğretmektense boş bırakırız.',
                    style: TextStyle(color: Nura.ink, height: 1.4),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    p.isPlus
                        ? 'Plus bulut çeviri (ML Kit / Cloud) bir sonraki build’de bağlanır.'
                        : 'Plus ile genişletilmiş çeviri ve kaydetme.',
                    style: const TextStyle(color: Nura.muted, fontSize: 13),
                  ),
                ],
              ),
            ),
          if (hit != null) ...[
            NuraCard(
              color: Nura.forest,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('HEDEF DİL', style: TextStyle(color: Nura.terrSoft, fontSize: 11, letterSpacing: 1)),
                  const SizedBox(height: 8),
                  Text(hit!.target, style: const TextStyle(color: Nura.cream, fontSize: 24, fontWeight: FontWeight.w600, height: 1.3)),
                  const SizedBox(height: 10),
                  Text(hit!.gloss, style: const TextStyle(color: Color(0xFFB8C8C0), fontSize: 16)),
                  const SizedBox(height: 8),
                  Text('güven ${(hit!.confidence * 100).round()}%', style: const TextStyle(color: Nura.terrSoft, fontSize: 12)),
                ],
              ),
            ),
            const SizedBox(height: 10),
            ForestButton(
              label: i18n.savePhrase,
              onPressed: () {
                final id = 'tr_${p.learnLang.name}_${hit!.target.hashCode}';
                ref.read(sessionProvider.notifier).learnPhrase(id);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('SRS’e eklendi · yarın tekrar')));
              },
            ),
          ],
          const SizedBox(height: 22),
          const Eyebrow('Hızlı kalıplar'),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              for (final q in ['teşekkürler', 'lütfen', 'ne kadar', 'tuvalet', 'anlamıyorum', 'kira'])
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

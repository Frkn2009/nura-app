import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/tokens.dart';
import '../../data/content/library.dart';
import '../../data/models/models.dart';
import '../../state/session.dart';
import '../../ui/widgets.dart';

class LibraryScreen extends ConsumerWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final p = ref.watch(sessionProvider);
    final stories = VoxeloLibrary.forLang(p.learnLang);

    return Scaffold(
      appBar: VoxeloAppBar(pageTitle: const Text('Kitaplık')),
      body: SafeArea(
        child: stories.isEmpty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(28),
                  child: Text(
                    '${p.learnLang.label(p.uiLang)} için kitaplık yakında geliyor.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Voxelo.muted),
                  ),
                ),
              )
            : ListView(
                padding: const EdgeInsets.fromLTRB(22, 16, 22, 28),
                children: [
                  Text(
                    '${p.learnLang.flag()} ${p.learnLang.label(p.uiLang)} · kısa okuma parçaları',
                    style: const TextStyle(color: Voxelo.muted),
                  ),
                  const SizedBox(height: 16),
                  for (final story in stories) ...[
                    VoxeloCard(
                      onTap: () => context.push('/library/${story.id}'),
                      child: Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: Voxelo.mintLight,
                              borderRadius: BorderRadius.circular(Voxelo.radius),
                            ),
                            child: const Icon(
                              Icons.menu_book_outlined,
                              color: Voxelo.mintDark,
                            ),
                          ),
                          const SizedBox(width: 13),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  story.titleTr,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  '${story.level.name.toUpperCase()} · ${story.sentences.length} cümle',
                                  style: const TextStyle(
                                    color: Voxelo.muted,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.chevron_right, color: Voxelo.soft),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ],
              ),
      ),
    );
  }
}

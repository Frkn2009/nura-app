import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme/tokens.dart';
import '../../data/models/clan.dart';
import '../../data/supabase/supa_service.dart';
import '../../ui/widgets.dart';
import 'clan_chat_screen.dart';

class ClanScreen extends ConsumerStatefulWidget {
  const ClanScreen({super.key});

  @override
  ConsumerState<ClanScreen> createState() => _ClanScreenState();
}

class _ClanScreenState extends ConsumerState<ClanScreen> {
  Future<List<ClanMemberEntry>>? request;
  String? error;

  @override
  void initState() {
    super.initState();
    if (Supa.currentEmail != null) request = Supa.myClan();
  }

  void reload() => setState(() {
    error = null;
    request = Supa.myClan();
  });

  @override
  Widget build(BuildContext context) {
    final email = ref.watch(authEmailProvider);
    return Scaffold(
      appBar: VoxeloAppBar(pageTitle: const Text('Takım')),
      body: SafeArea(
        child: email == null
            ? _login(context)
            : FutureBuilder<List<ClanMemberEntry>>(
                future: request ??= Supa.myClan(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) return _failed();
                  final members = snapshot.data ?? const [];
                  return members.isEmpty ? _empty() : _team(members);
                },
              ),
      ),
    );
  }

  Widget _login(BuildContext context) => Center(
    child: Padding(
      padding: const EdgeInsets.all(28),
      child: VoxeloCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.groups_outlined, size: 48, color: Voxelo.mintDark),
            const SizedBox(height: 12),
            const Text(
              'Takıma katılmak için giriş yap',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => context.push('/auth'),
              child: const Text('Giriş yap'),
            ),
          ],
        ),
      ),
    ),
  );

  Widget _empty() => ListView(
    padding: const EdgeInsets.fromLTRB(22, 24, 22, 30),
    children: [
      const VoxeloMascot(size: 110, mood: MascotMood.wave),
      const SizedBox(height: 16),
      Text(
        'Birlikte daha düzenli',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.displayMedium,
      ),
      const SizedBox(height: 8),
      const Text(
        'Takım kur veya 6 haneli davet koduyla arkadaşlarına katıl.',
        textAlign: TextAlign.center,
        style: TextStyle(color: Voxelo.muted, height: 1.45),
      ),
      const SizedBox(height: 24),
      FilledButton.icon(
        onPressed: _create,
        icon: const Icon(Icons.add),
        label: const Text('Takım kur'),
      ),
      const SizedBox(height: 10),
      OutlinedButton.icon(
        onPressed: _join,
        icon: const Icon(Icons.login),
        label: const Text('Kodla katıl'),
      ),
      if (error != null) ...[
        const SizedBox(height: 14),
        Text(
          error!,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Voxelo.coral),
        ),
      ],
    ],
  );

  Widget _team(List<ClanMemberEntry> members) {
    final clan = members.first;
    final me = members.where((member) => member.isMe).first;
    return ListView(
      padding: const EdgeInsets.fromLTRB(22, 16, 22, 30),
      children: [
        Text(clan.clanName, style: Theme.of(context).textTheme.displayMedium),
        const SizedBox(height: 4),
        const Text(
          'Bu haftanın yarışması · her Pazartesi sıfırlanır',
          style: TextStyle(color: Voxelo.muted, fontSize: 12),
        ),
        const SizedBox(height: 10),
        InkWell(
          onTap: () async {
            await Clipboard.setData(ClipboardData(text: clan.joinCode));
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Davet kodu kopyalandı')),
              );
            }
          },
          child: Row(
            children: [
              const Text('Davet kodu: ', style: TextStyle(color: Voxelo.muted)),
              Text(
                clan.joinCode,
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1.5,
                ),
              ),
              const SizedBox(width: 6),
              const Icon(Icons.copy, size: 16, color: Voxelo.mintDark),
            ],
          ),
        ),
        const SizedBox(height: 18),
        VoxeloCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              for (var index = 0; index < members.length; index++) ...[
                _member(members[index]),
                if (index < members.length - 1) const Divider(height: 1),
              ],
            ],
          ),
        ),
        const SizedBox(height: 10),
        OutlinedButton.icon(
          onPressed: () => Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (_) => const ClanChatScreen())),
          icon: const Icon(Icons.chat_bubble_outline),
          label: const Text('Klan sohbeti'),
        ),
        const SizedBox(height: 10),
        OutlinedButton(
          onPressed: () => _leave(me.isOwner, members.length),
          child: Text(
            me.isOwner && members.length > 1
                ? 'Sahip takımdan ayrılamaz'
                : 'Takımdan ayrıl',
          ),
        ),
      ],
    );
  }

  Widget _member(ClanMemberEntry member) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    child: Row(
      children: [
        SizedBox(
          width: 32,
          child: member.rank == 1
              ? const Icon(Icons.emoji_events, color: Voxelo.sunflower, size: 20)
              : Text(
                  '${member.rank}',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Voxelo.mintDark,
                    fontWeight: FontWeight.w700,
                  ),
                ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            '${member.playerName}${member.isMe ? ' · Sen' : ''}',
            style: TextStyle(
              fontWeight: member.isMe ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ),
        if (member.isOwner)
          const Padding(
            padding: EdgeInsets.only(right: 8),
            child: Icon(Icons.shield_outlined, size: 18, color: Voxelo.sunflower),
          ),
        Text(
          '${member.xp} XP',
          style: const TextStyle(
            color: Voxelo.mintDark,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    ),
  );

  Widget _failed() => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text('Takım bilgisi alınamadı.'),
        const SizedBox(height: 10),
        OutlinedButton(onPressed: reload, child: const Text('Tekrar dene')),
      ],
    ),
  );

  Future<void> _create() async {
    final name = await _input('Takım kur', 'Takım adı');
    if (name == null) return;
    try {
      await Supa.createClan(name);
      reload();
    } catch (exception) {
      setState(() => error = _message(exception));
    }
  }

  Future<void> _join() async {
    final code = await _input('Takıma katıl', '6 haneli davet kodu');
    if (code == null) return;
    try {
      await Supa.joinClan(code);
      reload();
    } catch (exception) {
      setState(() => error = _message(exception));
    }
  }

  Future<void> _leave(bool owner, int memberCount) async {
    if (owner && memberCount > 1) return;
    await Supa.leaveClan();
    reload();
  }

  Future<String?> _input(String title, String label) async {
    final controller = TextEditingController();
    final value = await showDialog<String>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(title),
        content: TextField(
          controller: controller,
          autofocus: true,
          maxLength: 32,
          decoration: InputDecoration(labelText: label),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text('Vazgeç'),
          ),
          FilledButton(
            onPressed: () =>
                Navigator.pop(dialogContext, controller.text.trim()),
            child: const Text('Devam'),
          ),
        ],
      ),
    );
    controller.dispose();
    return value == null || value.isEmpty ? null : value;
  }

  String _message(Object error) {
    final text = error.toString();
    if (text.contains('already_in_clan')) return 'Zaten bir takımdasın.';
    if (text.contains('clan_not_found')) {
      return 'Bu davet koduyla takım bulunamadı.';
    }
    return 'İşlem tamamlanamadı. Tekrar dene.';
  }
}

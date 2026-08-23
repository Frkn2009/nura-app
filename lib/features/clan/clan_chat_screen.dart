import 'package:flutter/material.dart';

import '../../core/theme/tokens.dart';
import '../../data/models/clan.dart';
import '../../data/supabase/supa_service.dart';
import '../../ui/widgets.dart';

class ClanChatScreen extends StatefulWidget {
  const ClanChatScreen({super.key});

  @override
  State<ClanChatScreen> createState() => _ClanChatScreenState();
}

class _ClanChatScreenState extends State<ClanChatScreen> {
  final _input = TextEditingController();
  Future<List<ClanChatMessage>>? _request;
  bool _sending = false;

  @override
  void initState() {
    super.initState();
    _request = Supa.clanMessages();
  }

  @override
  void dispose() {
    _input.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    final text = _input.text.trim();
    if (text.isEmpty || _sending) return;
    setState(() => _sending = true);
    try {
      await Supa.sendClanMessage(text);
      _input.clear();
      setState(() => _request = Supa.clanMessages());
    } finally {
      if (mounted) setState(() => _sending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NuraAppBar(
        pageTitle: const Text('Klan Sohbeti'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => setState(() => _request = Supa.clanMessages()),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<ClanChatMessage>>(
                future: _request,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  final messages = snapshot.data ?? const [];
                  if (messages.isEmpty) {
                    return const Center(
                      child: Text(
                        'Henüz mesaj yok. Klanına ilk mesajı sen at.',
                        style: TextStyle(color: Nura.muted),
                      ),
                    );
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: messages.length,
                    itemBuilder: (_, i) {
                      final m = messages[i];
                      return Align(
                        alignment: m.isMe
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          constraints: const BoxConstraints(maxWidth: 280),
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 10,
                          ),
                          decoration: BoxDecoration(
                            color: m.isMe ? Nura.mintDark : Nura.cloud,
                            borderRadius: BorderRadius.circular(Nura.radius),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (!m.isMe)
                                Text(
                                  m.playerName,
                                  style: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w700,
                                    color: Nura.mintDark,
                                  ),
                                ),
                              Text(
                                m.text,
                                style: TextStyle(
                                  color: m.isMe ? Colors.white : Nura.ink,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _input,
                        decoration: const InputDecoration(
                          hintText: 'Klanına bir şey yaz...',
                        ),
                        onSubmitted: (_) => _send(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    IconButton.filled(
                      onPressed: _sending ? null : _send,
                      icon: const Icon(Icons.send),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

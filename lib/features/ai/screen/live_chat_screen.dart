import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/tokens.dart';
import '../../../data/models/models.dart';
import '../../../data/speech/speech_controller.dart';
import '../../../state/session.dart';
import '../../../ui/widgets.dart';
import '../data/live_chat_service.dart';

class _Bubble {
  const _Bubble({required this.fromUser, required this.text});
  final bool fromUser;
  final String text;
}

class LiveChatScreen extends ConsumerStatefulWidget {
  const LiveChatScreen({super.key});

  @override
  ConsumerState<LiveChatScreen> createState() => _LiveChatScreenState();
}

class _LiveChatScreenState extends ConsumerState<LiveChatScreen> {
  final _speech = SpeechController();
  final _input = TextEditingController();
  final _scroll = ScrollController();
  final _messages = <_Bubble>[];
  bool _sending = false;
  bool _listening = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    _speech.warmUp();
  }

  @override
  void dispose() {
    _speech.dispose();
    _input.dispose();
    _scroll.dispose();
    super.dispose();
  }

  void _scrollToEnd() {
    if (!_scroll.hasClients) return;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scroll.hasClients) return;
      _scroll.animateTo(
        _scroll.position.maxScrollExtent,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOut,
      );
    });
  }

  Future<void> _toggleMic(String langCode) async {
    if (_listening) {
      final text = await _speech.stopListen();
      setState(() {
        _listening = false;
        if (text.isNotEmpty) _input.text = text;
      });
      return;
    }
    final started = await _speech.startListen(
      langCode: langCode,
      onTick: (_) {},
      onText: (text) => setState(() => _input.text = text),
    );
    setState(() => _listening = started);
  }

  Future<void> _send() async {
    final text = _input.text.trim();
    if (text.isEmpty || _sending) return;
    final p = ref.read(sessionProvider);
    final history = _messages
        .map((b) => ChatTurn(role: b.fromUser ? 'user' : 'ai', text: b.text))
        .toList();

    setState(() {
      _messages.add(_Bubble(fromUser: true, text: text));
      _input.clear();
      _sending = true;
      _error = null;
    });
    _scrollToEnd();

    try {
      final reply = await LiveChatService.reply(
        message: text,
        targetLanguage: p.learnLang.code,
        nativeLanguage: p.uiLang.code,
        level: p.cefr.name,
        history: history,
      );
      if (!mounted) return;
      setState(() {
        _messages.add(_Bubble(fromUser: false, text: reply));
        _sending = false;
      });
      _scrollToEnd();
      unawaited(_speech.speakTarget(reply, p.learnLang.code));
    } on LiveChatException catch (e) {
      if (!mounted) return;
      setState(() {
        _sending = false;
        _error = switch (e.code) {
          'plus_required' => 'Canlı sohbet Plus özelliğidir.',
          'authentication_required' => 'Önce giriş yapmalısın.',
          _ => 'Şu an bağlanamadım, birazdan tekrar dene.',
        };
      });
    } catch (_) {
      if (!mounted) return;
      setState(() {
        _sending = false;
        _error = 'Şu an bağlanamadım, birazdan tekrar dene.';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final p = ref.watch(sessionProvider);
    if (!p.isPlus) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: NuraCard(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.forum_outlined,
                  size: 48,
                  color: Nura.mintDark,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Nura ile serbest konuş',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Script yok, kural yok — gerçek zamanlı serbest sohbet Plus üyelere özel.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Nura.muted),
                ),
                const SizedBox(height: 16),
                FilledButton(
                  onPressed: () => context.push('/paywall'),
                  child: const Text('Plus\'a geç'),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Column(
        children: [
          Expanded(
            child: _messages.isEmpty
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(28),
                      child: Text(
                        '${p.learnLang.label(p.uiLang)} pratiği için bir şeyler yaz veya mikrofona konuş.',
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Nura.muted),
                      ),
                    ),
                  )
                : ListView.builder(
                    controller: _scroll,
                    padding: const EdgeInsets.all(16),
                    itemCount: _messages.length,
                    itemBuilder: (_, i) {
                      final m = _messages[i];
                      return Align(
                        alignment: m.fromUser
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
                            color: m.fromUser ? Nura.mintDark : Nura.cloud,
                            borderRadius: BorderRadius.circular(Nura.radius),
                          ),
                          child: Text(
                            m.text,
                            style: TextStyle(
                              color: m.fromUser ? Colors.white : Nura.ink,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          if (_error != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(_error!, style: const TextStyle(color: Nura.coral)),
            ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 12),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => _toggleMic(p.learnLang.code),
                    icon: Icon(
                      _listening ? Icons.mic : Icons.mic_none,
                      color: _listening ? Nura.coral : Nura.mintDark,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      controller: _input,
                      decoration: const InputDecoration(
                        hintText: 'Bir şey yaz...',
                      ),
                      onSubmitted: (_) => _send(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton.filled(
                    onPressed: _sending ? null : _send,
                    icon: _sending
                        ? const SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

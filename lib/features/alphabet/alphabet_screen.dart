import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/theme/tokens.dart';
import '../../ui/mascot/nura_companion.dart';
import 'alphabet_engine.dart';

class AlphabetScreen extends StatefulWidget {
  final String langCode;
  const AlphabetScreen({super.key, required this.langCode});
  @override
  State<AlphabetScreen> createState() => _AlphabetScreenState();
}

class _AlphabetScreenState extends State<AlphabetScreen> {
  final _learned = <String>{};

  @override
  void initState() {
    super.initState();
    AlphabetEngine.init();
    _load();
  }

  Future<void> _load() async {
    final p = await SharedPreferences.getInstance();
    setState(() {
      _learned.addAll(p.getStringList('learned_${widget.langCode}') ?? []);
    });
  }

  Future<void> _mark(String ch) async {
    _learned.add(ch);
    final p = await SharedPreferences.getInstance();
    await p.setStringList('learned_${widget.langCode}', _learned.toList());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final letters = AlphabetEngine.letters(widget.langCode);
    final progress = letters.isEmpty ? 0.0 : _learned.length / letters.length;
    return Scaffold(
      appBar: AppBar(title: const Text('Alfabe')),
      body: Column(
        children: [
          NuraCompanion(
            message: 'Harfe dokun, sesini dinle. Öğrendim de.',
            state: MascotState.thinking,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 10,
              borderRadius: BorderRadius.circular(8),
              color: NuraTokens.primary,
              backgroundColor: Colors.black12,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: letters.length,
              itemBuilder: (_, i) {
                final l = letters[i];
                final done = _learned.contains(l.char);
                return Card(
                  child: ListTile(
                    leading: Text(l.char, style: const TextStyle(fontSize: 32)),
                    title: Text(l.name, style: GoogleFonts.nunito(fontWeight: FontWeight.w800)),
                    subtitle: Text('${l.soundLike} · ${l.example}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.volume_up, color: NuraTokens.accent),
                          onPressed: () => AlphabetEngine.speak(l.char, widget.langCode),
                        ),
                        IconButton(
                          icon: Icon(done ? Icons.check_circle : Icons.check_circle_outline,
                              color: done ? NuraTokens.primary : Colors.grey),
                          onPressed: () => _mark(l.char),
                        ),
                      ],
                    ),
                    onTap: () => context.push('/practice/${widget.langCode}/${Uri.encodeComponent(l.example)}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

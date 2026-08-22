import 'package:flutter/material.dart';
import '../../core/theme/tokens.dart';
import 'alphabet_engine.dart';

class AlphabetScreen extends StatefulWidget {
  const AlphabetScreen({super.key, required this.languageCode});
  final String languageCode;

  @override
  State<AlphabetScreen> createState() => _AlphabetScreenState();
}

class _AlphabetScreenState extends State<AlphabetScreen> {
  late NuraAlphabet _alphabet;
  final Set<String> _learned = {};

  @override
  void initState() {
    super.initState();
    _alphabet = AlphabetEngine.getAlphabet(widget.languageCode);
    AlphabetEngine.initTts();
  }

  @override
  Widget build(BuildContext context) {
    final progress = _alphabet.letters.isEmpty ? 0.0 : _learned.length / _alphabet.letters.length;

    return Scaffold(
      appBar: AppBar(
        title: Text(_alphabet.name, style: const TextStyle(fontWeight: FontWeight.w800)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(child: Text('%${(progress * 100).toInt()}', style: const TextStyle(fontWeight: FontWeight.w900, color: NuraTokens.primary))),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: LinearProgressIndicator(
                value: progress,
                minHeight: 10,
                color: NuraTokens.primary,
                backgroundColor: NuraTokens.primary.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(99),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: _alphabet.letters.length,
                itemBuilder: (context, index) {
                  final letter = _alphabet.letters[index];
                  final isLearned = _learned.contains(letter.character);

                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      color: NuraTokens.surface,
                      borderRadius: BorderRadius.circular(NuraTokens.radiusMedium),
                      boxShadow: NuraTokens.softShadow,
                      border: Border.all(color: isLearned ? NuraTokens.primary : Colors.transparent, width: 2),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(12),
                      onTap: () {
                        AlphabetEngine.speak(letter.character, widget.languageCode);
                      },
                      leading: Container(
                        width: 56, height: 56,
                        decoration: BoxDecoration(
                          gradient: isLearned ? NuraTokens.heroGradient : null,
                          color: isLearned ? null : NuraTokens.accent.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Center(
                          child: Text(letter.character, style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: isLearned ? Colors.white : NuraTokens.textPrimary)),
                        ),
                      ),
                      title: Text('${letter.nameTr}  ·  ${letter.sound}', style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                      subtitle: Text('${letter.exampleWord}  →  ${letter.exampleMeaning}', style: const TextStyle(color: NuraTokens.textSecondary)),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.volume_up, color: NuraTokens.accent),
                            onPressed: () => AlphabetEngine.speak(letter.exampleWord, widget.languageCode),
                          ),
                          IconButton(
                            icon: Icon(isLearned ? Icons.check_circle : Icons.circle_outlined, color: isLearned ? NuraTokens.primary : NuraTokens.textSecondary),
                            onPressed: () {
                              setState(() {
                                if (isLearned) { _learned.remove(letter.character); }
                                else { _learned.add(letter.character); }
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

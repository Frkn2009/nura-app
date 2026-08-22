import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/theme/tokens.dart';

class TreasureChestScreen extends StatefulWidget {
  const TreasureChestScreen({super.key});
  @override
  State<TreasureChestScreen> createState() => _TreasureChestScreenState();
}

class _TreasureChestScreenState extends State<TreasureChestScreen> {
  int keys = 0;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((p) {
      setState(() => keys = p.getInt('chest_keys') ?? 0);
    });
  }

  Future<void> _open() async {
    if (keys < 3) return;
    final p = await SharedPreferences.getInstance();
    await p.setInt('chest_keys', keys - 3);
    setState(() => keys -= 3);
    if (!mounted) return;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Kasa açıldı', style: GoogleFonts.nunito(fontWeight: FontWeight.w800)),
        content: const Text('+80 XP ve 1 can kazandın.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ready = keys >= 3;
    return Scaffold(
      appBar: AppBar(title: const Text('Hazine')),
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(ready ? Icons.lock_open : Icons.lock, size: 84, color: ready ? NuraTokens.gold : Colors.grey),
                Text('$keys / 3 anahtar', style: GoogleFonts.nunito(fontSize: 22, fontWeight: FontWeight.w800)),
                const SizedBox(height: 8),
                const Text('Her 5 doğru cevap = 1 anahtar'),
                const SizedBox(height: 16),
                ElevatedButton(onPressed: ready ? _open : null, child: const Text('KASAYI AÇ')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

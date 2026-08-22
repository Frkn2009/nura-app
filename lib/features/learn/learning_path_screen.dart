import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/tokens.dart';

class LearningPathScreen extends StatelessWidget {
  const LearningPathScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nodes = [
      ('Alfabe', 'done', '/alphabet/ar'),
      ('İlk harfler', 'active', '/alphabet/ar'),
      ('İlk kelimeler', 'locked', null),
      ('Kısa cümleler', 'locked', null),
      ('Sahneler', 'locked', null),
      ('Hikayeler', 'locked', '/stories'),
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Yol haritası')),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: nodes.length,
        separatorBuilder: (_, __) => const SizedBox(height: 16),
        itemBuilder: (_, i) {
          final (title, status, route) = nodes[i];
          final color = status == 'done'
              ? NuraTokens.primary
              : status == 'active'
                  ? NuraTokens.accent
                  : Colors.grey.shade300;
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: color,
              child: Icon(
                status == 'done'
                    ? Icons.check
                    : status == 'active'
                        ? Icons.play_arrow
                        : Icons.lock,
                color: Colors.white,
              ),
            ),
            title: Text(title, style: GoogleFonts.nunito(fontWeight: FontWeight.w800)),
            onTap: route == null ? null : () => context.push(route),
          );
        },
      ),
    );
  }
}

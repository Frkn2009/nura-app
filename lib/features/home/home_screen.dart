import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../core/theme/tokens.dart';
import '../../ui/mascot/nura_companion.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final hour = DateTime.now().hour;
    final hi = hour < 12 ? 'Günaydın' : hour < 18 ? 'İyi günler' : 'İyi akşamlar';
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // ── Hero: logo + selamlama ────────────────────────
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: NuraGradients.hero,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: NuraTokens.accent.withValues(alpha: 0.35),
                    blurRadius: 18,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Text('🦊', style: TextStyle(fontSize: 44)),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'NURA',
                          style: GoogleFonts.nunito(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            letterSpacing: 2,
                          ),
                        ),
                        Text(
                          '$hi! 🌟',
                          style: GoogleFonts.nunito(
                            fontSize: 26,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Bugün de öğrenmeye devam!',
                          style: GoogleFonts.nunito(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Colors.white.withValues(alpha: 0.9),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.local_fire_department, color: Colors.white, size: 36),
                ],
              ),
            ),
            const SizedBox(height: 12),
            const NuraCompanion(
              message: 'Önce alfabeyi bitir, sonra çarkı çevir. Birlikte yapacağız!',
              state: MascotState.encourage,
            ),
            // ── Günlük hedef ──────────────────────────────────
            Card(
              child: ListTile(
                leading: const Icon(Icons.local_fire_department, color: NuraTokens.danger, size: 36),
                title: Text('Günlük hedef', style: GoogleFonts.nunito(fontWeight: FontWeight.w800)),
                subtitle: const Padding(
                  padding: EdgeInsets.only(top: 6),
                  child: LinearProgressIndicator(value: 0.4, minHeight: 8),
                ),
                trailing: Text('40%', style: GoogleFonts.nunito(fontWeight: FontWeight.w900, color: NuraTokens.primary)),
              ),
            ),
            const SizedBox(height: 12),
            // ── Ödül kartları ─────────────────────────────────
            Row(
              children: [
                Expanded(
                  child: _ActionCard(
                    gradient: NuraGradients.gold,
                    icon: '🎡',
                    title: 'Günlük Çark',
                    subtitle: 'Ödülün hazır!',
                    onTap: () => context.push('/wheel'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _ActionCard(
                    gradient: NuraGradients.primary,
                    icon: '🗺️',
                    title: 'Yol Haritası',
                    subtitle: 'Sıradaki ders',
                    onTap: () => context.push('/path'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _ActionCard(
                    gradient: NuraGradients.accent,
                    icon: '📖',
                    title: 'Hikayeler',
                    subtitle: 'Mini kitaplar',
                    onTap: () => context.push('/stories'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _ActionCard(
                    gradient: NuraGradients.purple,
                    icon: '💰',
                    title: 'Hazine',
                    subtitle: 'Anahtarlarınla aç',
                    onTap: () => context.push('/chest'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _ActionCard(
                    gradient: NuraGradients.coral,
                    icon: '🎙️',
                    title: 'Konuş',
                    subtitle: 'AI öğretmeninle',
                    onTap: () => context.push('/app/speak'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _ActionCard(
                    gradient: NuraGradients.hero,
                    icon: '🅰️',
                    title: 'Alfabe',
                    subtitle: 'Harf harf başla',
                    onTap: () => context.push('/alphabet/ar'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

/// Canlı, dokunulası aksiyon kartı.
class _ActionCard extends StatelessWidget {
  final LinearGradient gradient;
  final String icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const _ActionCard({
    required this.gradient,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Ink(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.10),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(icon, style: const TextStyle(fontSize: 30)),
              const SizedBox(height: 8),
              Text(
                title,
                style: GoogleFonts.nunito(
                  fontSize: 16,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
              Text(
                subtitle,
                style: GoogleFonts.nunito(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withValues(alpha: 0.9),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

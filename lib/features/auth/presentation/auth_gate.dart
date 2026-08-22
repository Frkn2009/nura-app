import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../core/theme/tokens.dart';

class AuthGate extends StatefulWidget {
  final Widget child;
  const AuthGate({super.key, required this.child});

  @override
  State<AuthGate> createState() => _AuthGateState();
}

class _AuthGateState extends State<AuthGate> {
  static const _lockKey = 'nura_guest_expired';
  static const _guestSeconds = 120;
  Timer? _timer;
  int _elapsed = 0;
  bool _locked = false;

  @override
  void initState() {
    super.initState();
    _boot();
  }

  Future<void> _boot() async {
    final prefs = await SharedPreferences.getInstance();
    final locked = prefs.getBool(_lockKey) ?? false;
    if (!mounted) return;
    setState(() => _locked = locked);
    if (Supabase.instance.client.auth.currentUser != null) return;
    if (locked) {
      _goLogin();
      return;
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (_) async {
      if (!mounted) return;
      setState(() => _elapsed++);
      if (_elapsed >= _guestSeconds) {
        await prefs.setBool(_lockKey, true);
        _goLogin();
      }
    });
  }

  void _goLogin() {
    _timer?.cancel();
    if (!mounted) return;
    context.go('/login');
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;
    if (user != null) return widget.child;
    if (_locked) return const SizedBox.shrink();

    return Stack(
      children: [
        widget.child,
        if (_elapsed >= 60)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Material(
              color: NuraTokens.gold,
              child: SafeArea(
                bottom: false,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    'Süreniz bitiyor. Kayıt olun, ilerlemeniz kaybolmasın.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w800,
                      color: NuraTokens.textDark,
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

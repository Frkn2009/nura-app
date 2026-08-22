import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/tokens.dart';
import '../../../data/supabase/supa_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool _loading = false;
  String? _error;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> _signIn() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      await Supa.signIn(_email.text.trim(), _password.text);
      if (mounted) context.go('/app');
    } catch (e) {
      if (mounted) setState(() => _error = 'Giriş başarısız. E-posta veya şifre hatalı.');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _signUp() async {
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final hasSession = await Supa.signUp(_email.text.trim(), _password.text);
      if (!hasSession) {
        if (mounted) setState(() => _error = 'Doğrulama e-postası gönderildi. Linke tıklayıp giriş yap.');
        return;
      }
      if (mounted) context.go('/app');
    } catch (e) {
      if (mounted) setState(() => _error = 'Kayıt başarısız. Şifre en az 6 karakter olmalı.');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('NURA', style: GoogleFonts.nunito(fontSize: 40, fontWeight: FontWeight.w900, color: NuraTokens.primary)),
              const SizedBox(height: 8),
              Text('İlerlemeni kaydet, öğrenmeye devam et.', style: GoogleFonts.nunito(fontSize: 16, color: NuraTokens.muted)),
              const SizedBox(height: 32),
              TextField(controller: _email, decoration: const InputDecoration(labelText: 'E-posta')),
              const SizedBox(height: 12),
              TextField(controller: _password, obscureText: true, decoration: const InputDecoration(labelText: 'Şifre')),
              if (_error != null) ...[
                const SizedBox(height: 12),
                Text(_error!, style: const TextStyle(color: NuraTokens.danger)),
              ],
              const Spacer(),
              ElevatedButton(
                onPressed: _loading ? null : _signIn,
                child: Text(_loading ? '...' : 'Giriş Yap'),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: _loading ? null : _signUp,
                child: const Text('Hesap Oluştur'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

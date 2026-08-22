import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../core/theme/tokens.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;
  bool _isSignUp = false;

  Future<void> _auth() async {
    setState(() => _isLoading = true);
    try {
      if (_isSignUp) {
        await Supabase.instance.client.auth.signUp(email: _emailController.text, password: _passwordController.text);
      } else {
        await Supabase.instance.client.auth.signInWithPassword(email: _emailController.text, password: _passwordController.text);
      }
    } catch (e) {
      if (mounted) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Hata: $e'), backgroundColor: NuraTokens.danger));
    }
    if (mounted) setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NuraTokens.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              const Text('🦊', style: TextStyle(fontSize: 80)),
              const SizedBox(height: 16),
              Text('NURA', style: GoogleFonts.nunito(fontSize: 48, fontWeight: FontWeight.w900, color: NuraTokens.primary, letterSpacing: 4)),
              const SizedBox(height: 8),
              Text(_isSignUp ? 'Hesap oluştur' : 'Hoş geldin!', style: GoogleFonts.nunito(fontSize: 18, color: Colors.grey)),
              const SizedBox(height: 48),
              TextField(controller: _emailController, keyboardType: TextInputType.emailAddress, decoration: InputDecoration(labelText: 'E-posta', border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)), prefixIcon: const Icon(Icons.email)), style: GoogleFonts.nunito()),
              const SizedBox(height: 16),
              TextField(controller: _passwordController, obscureText: true, decoration: InputDecoration(labelText: 'Şifre', border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)), prefixIcon: const Icon(Icons.lock)), style: GoogleFonts.nunito()),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity, height: 56,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _auth,
                  child: _isLoading ? const CircularProgressIndicator(color: Colors.white) : Text(_isSignUp ? 'Kayıt Ol' : 'Giriş Yap', style: GoogleFonts.nunito(fontSize: 18, fontWeight: FontWeight.w800)),
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => setState(() => _isSignUp = !_isSignUp),
                child: Text(_isSignUp ? 'Zaten hesabın var mı? Giriş yap' : 'Hesabın yok mu? Kayıt ol', style: GoogleFonts.nunito(color: NuraTokens.accent, fontWeight: FontWeight.w700)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

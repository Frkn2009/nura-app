import 'package:flutter/material.dart';

import '../../core/theme/tokens.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Gizlilik')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(22, 12, 22, 32),
        children: const [
          Text('NURA gizlilik özeti', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
          SizedBox(height: 12),
          Text(
            'Konuşma sesi, mümkün olduğunca cihazında işlenir. Ücretsiz katmanda buluta ses göndermeyiz.\n\n'
            'Saklanan: seçtiğin dil, seri, öğrendiğin kalıp kimlikleri. Bu veri telefonda SharedPreferences içindedir.\n\n'
            'Plus ileride bulut AI kullanırsa bunu ayrı onaylarız.\n\n'
            'Hesabı sil: Sen → Hesabı sil. Tüm yerel veri silinir.\n\n'
            'Çocuklara yönelik değil (13+).\n\n'
            'İletişim: gizlilik@nura.app (yer tutucu — domain bağlanınca güncellenir).',
            style: TextStyle(height: 1.5, color: Nura.ink, fontSize: 15),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../core/theme/tokens.dart';
import '../../ui/widgets.dart';

/// Apple'ın otomatik yenilenen abonelik satan uygulamalar için zorunlu
/// tuttuğu Kullanım Koşulları (EULA) ekranı — App Store Kural 3.1.2.
/// Daha önce sadece gizlilik ekranı vardı, ödeme öncesi hiçbir yerde
/// abonelik şartlarına (yenileme, iptal, süre) link verilmiyordu.
class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VoxelithAppBar(pageTitle: const Text('Kullanım Koşulları')),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(22, 12, 22, 32),
        children: const [
          Text(
            'VOXELITH Kullanım Koşulları',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          SizedBox(height: 12),
          Text(
            'VOXELITH Plus ve VOXELITH Business abonelikleri, seçtiğin süre için '
            '(aylık/yıllık) otomatik olarak yenilenir. Ücret, satın alma '
            'onayında hesabına yansıtılır ve mevcut dönem bitmeden en az '
            '24 saat önce iptal etmediğin sürece yenileme dönemi başına '
            'aynı tutar tekrar tahsil edilir.\n\n'
            'Aboneliğini istediğin an, dönem sonuna kadar erişimini '
            'kaybetmeden iptal edebilirsin: cihazının mağaza hesap '
            'ayarlarından (App Store veya Google Play abonelikler) '
            'yönetilir — VOXELITH içinden değil, çünkü ödemeyi mağaza alır.\n\n'
            'Ücretsiz katmandan Plus/Business\'a geçiş anında etkinleşir. '
            'İndirimli/tanıtım fiyatları yalnızca belirtilen ilk dönem '
            'için geçerlidir, sonraki yenilemeler tam fiyattan yapılır.\n\n'
            'Uygulama içi içerik (konuşma senaryoları, alfabe, kitaplık, '
            'AI sohbet, Toplantı Çevirmeni) kişisel ve ticari olmayan '
            'öğrenim amaçlıdır; yeniden dağıtılamaz veya satılamaz.\n\n'
            'Hesabını istediğin an silebilirsin (Sen → Hesabı sil); bu '
            'aktif bir aboneliği otomatik iptal etmez, aboneliği ayrıca '
            'mağaza üzerinden iptal etmen gerekir.\n\n'
            'Sorular için: destek@voxelith.app (yer tutucu — domain '
            'bağlanınca güncellenir). Gizlilik uygulamaların için ayrı '
            'Gizlilik sayfasına bak.',
            style: TextStyle(height: 1.5, color: Voxelith.ink, fontSize: 15),
          ),
        ],
      ),
    );
  }
}

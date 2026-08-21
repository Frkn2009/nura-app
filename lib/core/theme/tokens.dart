import 'package:flutter/material.dart';

/// NURA renk paleti — Drops + Duolingo ilhamı
/// Sevimli, sıcak, güven veren ama oyunsu
class Nura {
  // Ana renkler
  static const mint = Color(0xFF2EC4B6);       // Ana yeşil-turkuaz (taze, enerjik)
  static const mintDark = Color(0xFF1A9E92);    // Koyu mint (appbar, vurgu)
  static const mintLight = Color(0xFFD4F5F0);   // Açık mint (arka plan kartlar)

  // Sıcak vurgular
  static const coral = Color(0xFFFF6B6B);       // Mercan kırmızı (dikkat, hata)
  static const peach = Color(0xFFFFBE76);       // Şeftali (ödül, başarı)
  static const sunflower = Color(0xFFF9CA24);   // Sarı (yıldız, streak)

  // Mor / mavi aksan
  static const lavender = Color(0xFF9B72CF);    // Lavanta (Plus, premium)
  static const sky = Color(0xFF74B9FF);          // Gökyüzü mavi (link, bilgi)

  // Nötr tonlar
  static const snow = Color(0xFFFAFAFA);         // Arka plan (beyaza yakın)
  static const cloud = Color(0xFFF0F0F3);        // Kart arka plan
  static const fog = Color(0xFFE8E8ED);          // Çizgi, ayraç
  static const ink = Color(0xFF2D3436);          // Ana metin
  static const muted = Color(0xFF636E72);        // İkincil metin
  static const soft = Color(0xFFB2BEC3);         // Pasif metin

  // Eski isimlerin uyumluluğu (kademeli geçiş)
  static const cream = snow;
  static const cream2 = cloud;
  static const forest = mintDark;
  static const forestMid = Color(0xFF1A9E92);
  static const terr = coral;
  static const terrSoft = peach;
  static const line = fog;
  static const pale = mintLight;
  static const card = Color(0xFFFFFFFF);
  static const white = Color(0xFFFFFFFF);

  static const radius = 20.0;
  static const radiusLg = 28.0;
}

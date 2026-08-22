# v1.3 Doğrulama Raporu

**Tarih:** 2026-08-22
**Kontrol edilen kaynak:** `arena/01a0275f-nura-app` branch'i (son commit: `9848427` — docs(handoff))
**pubspec version:** `0.2.1+3`
**Gönderilen iddia:** "Sen Uyurken v1.3 Tamamlandı" — danışman dalgaları 5+7+8 harmanı (maddeler 7–14)

---

## ⛔ ÖZET: Gönderilen v1.3 değişikliklerinin HİÇBİRİ bu branch'te yok.

Depoda tek commit var (`9848427`), başka branch yok (sadece `main` + bu çalışma branch'i).
Yedek olarak gösterilen `nura-BACKUP-full.zip` internette erişilebilir bir adres değil
(`http://nura-BACKUP-full.zip` — kendi bilgisayarındaki/kurulumundaki dosya olabilir),
yani karşılaştırabilmem için dosyaları bana yüklemen gerekiyor.

---

## Madde madde karşılaştırma

| # | İddia (gönderilen) | Benim repomda | Detay |
|---|---|---|---|
| Dosya 8 | `OfflineState` widget'ı eklendi | ❌ YOK | `grep OfflineState` → 0 sonuç |
| 7 | Hive local DB (NURA-006) — SRS kartları Hive kutusunda | ❌ YOK | pubspec'ta `hive`/`hive_flutter` yok; koddan hiçbir iz yok |
| 8 | Repository pattern — `SrsRepository` + Hive impl + memory fallback + Riverpod provider | ❌ YOK | `SrsRepository` diye dosya/class hiç yok; SRS hâlâ `session.dart` içinde SharedPreferences üzerinden `Map` olarak yönetiliyor (satır 196: `state.srs`) |
| 9 | Analytics arayüzü (NURA-004) — Debug/Prod servis + global hook | ❌ YOK | `lib/` içinde analytics servisi yok, pubspec'ta analytics paketi yok |
| 10 | Text scale ≤1.5x (textScaler) | ❌ YOK | `lib/` içinde `textScaler`/`textScaleFactor` geçmiyor (grep → 0 sonuç) |
| 11 | GoRouter — 7 sekmede StatefulShellRoute | ⚠️ KISMEN | `go_router` var ama **`ShellRoute`** kullanılmış (state korunmaz), sekme sayısı **5**: /app, /app/speak, /app/games, /app/translate, /app/you |
| 12 | M3 tema — spec rengi **#4F46E5** | ⚠️ KISMEN | `useMaterial3: true` zaten vardı ama primary renk **Nura.mint `#147D76`**; `#4F46E5` repoda hiç geçmiyor |
| 13 | Onboarding persistence — yarım kalırsa kaldığı adımdan açılır | ❌ YOK | `onboarding_flow.dart` içinde `int step = 0` **local state** — kapatıp açınca sıfırdan başlar. Sadece `finishOnboarding()` ile `onboarded: true` kaydediliyor |
| 14 | Secure storage (encryptedSharedPrefs) | ❌ YOK | `flutter_secure_storage` pubspec'ta yok; her şey düz `SharedPreferences` |

---

## Sonuç ve öneriler

1. **Yedek dosyayı bana yükle** (zip içindeki `lib/`, `pubspec.yaml`, `android/` klasörleri yeterli).
   Yükleyince 14 maddenin tamamını gerçek kod üzerinden doğrular, gerekirse bu branch'e
   merge ederim.
2. **Eğer v1.3 kodları başka bir makinede/kurulumdaysa:** O repodan değişiklikleri export et
   (örn. `git format-patch` çıktısı ya da `git diff` patch dosyası) ve bana ilet.
3. **Varsa kanıt olarak** `git log` çıktısı, pubspec'taki yeni sürüm numarası (benimkinde
   `0.2.1+3`) ve yeni dosya listesi de işe yarar.
4. Bu rapordaki "❌ YOK" tespitleri doğrulanana kadar, v1.3'ün bu repoya aktarıldığını
   varsayamayız — derleme/test adımları da o yüzden şimdilik yapılmamalı.

**İstenen not (danışmanlara iletilebilir):** "v1.3 iddia listesi (madde 7–14) hedef reponun
`arena/01a0275f-nura-app` branch'inde karşılığı olmayan iddialar içeriyor; ya değişiklikler
farklı bir repoda ya da yedek dosya paylaşılmadı. Gerçek durumu doğrulamak için yedek zip
veya diff gerekiyor."

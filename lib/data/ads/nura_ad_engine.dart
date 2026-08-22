import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/// NURA Reklam Motoru — Sadece Ödüllü Reklam. Banner/Interstitial YASAK!
class NuraAdEngine {
  RewardedAd? _rewardedAd;
  bool _isAdReady = false;

  // Test ID — Store hesabı açılınca gerçek ID yazılacak
  static const String _adUnitId = 'ca-app-pub-3940256099942544/5224354917';

  void loadRewardedAd() {
    RewardedAd.load(
      adUnitId: _adUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd = ad;
          _isAdReady = true;
          _setupCallback();
        },
        onAdFailedToLoad: (error) {
          _isAdReady = false;
          debugPrint('AdMob Load Failed: $error');
        },
      ),
    );
  }

  void _setupCallback() {
    _rewardedAd?.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (ad) {
        ad.dispose();
        loadRewardedAd(); // Sonraki reklamı hemen yükle
      },
      onAdFailedToShowFullScreenContent: (ad, error) {
        ad.dispose();
        loadRewardedAd();
      },
    );
  }

  /// Kullanıcı süre/streak kurtarmak için reklam izler
  void showRewardedAd({required VoidCallback onRewardEarned}) {
    if (_isAdReady && _rewardedAd != null) {
      _rewardedAd!.show(
        onUserEarnedReward: (ad, reward) {
          onRewardEarned();
        },
      );
      _isAdReady = false;
    } else {
      loadRewardedAd();
    }
  }

  bool get isReady => _isAdReady;

  void dispose() {
    _rewardedAd?.dispose();
  }
}

final adEngineProvider = Provider<NuraAdEngine>((ref) {
  final engine = NuraAdEngine();
  engine.loadRewardedAd();
  ref.onDispose(() => engine.dispose());
  return engine;
});

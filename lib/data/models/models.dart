enum LearnLang { en, es, de, fr, nl }

enum UiLang { tr, en, es, de, fr, nl }

enum Motive { work, travel, exam, life }

enum Cefr { a1, a2, b1, b2 }

extension LearnLangX on LearnLang {
  String get code => name;
  String flag() {
    switch (this) {
      case LearnLang.en:
        return '🇬🇧';
      case LearnLang.es:
        return '🇪🇸';
      case LearnLang.de:
        return '🇩🇪';
      case LearnLang.fr:
        return '🇫🇷';
      case LearnLang.nl:
        return '🇳🇱';
    }
  }

  String label(UiLang ui) {
    const map = {
      LearnLang.en: {
        UiLang.tr: 'İngilizce',
        UiLang.en: 'English',
        UiLang.es: 'Inglés',
        UiLang.de: 'Englisch',
        UiLang.fr: 'Anglais',
        UiLang.nl: 'Engels',
      },
      LearnLang.es: {
        UiLang.tr: 'İspanyolca',
        UiLang.en: 'Spanish',
        UiLang.es: 'Español',
        UiLang.de: 'Spanisch',
        UiLang.fr: 'Espagnol',
        UiLang.nl: 'Spaans',
      },
      LearnLang.de: {
        UiLang.tr: 'Almanca',
        UiLang.en: 'German',
        UiLang.es: 'Alemán',
        UiLang.de: 'Deutsch',
        UiLang.fr: 'Allemand',
        UiLang.nl: 'Duits',
      },
      LearnLang.fr: {
        UiLang.tr: 'Fransızca',
        UiLang.en: 'French',
        UiLang.es: 'Francés',
        UiLang.de: 'Französisch',
        UiLang.fr: 'Français',
        UiLang.nl: 'Frans',
      },
      LearnLang.nl: {
        UiLang.tr: 'Flemenkçe',
        UiLang.en: 'Dutch',
        UiLang.es: 'Neerlandés',
        UiLang.de: 'Niederländisch',
        UiLang.fr: 'Néerlandais',
        UiLang.nl: 'Nederlands',
      },
    };
    return map[this]![ui]!;
  }
}

extension UiLangX on UiLang {
  String get code => name;
  String nativeName() {
    switch (this) {
      case UiLang.tr:
        return 'Türkçe';
      case UiLang.en:
        return 'English';
      case UiLang.es:
        return 'Español';
      case UiLang.de:
        return 'Deutsch';
      case UiLang.fr:
        return 'Français';
      case UiLang.nl:
        return 'Nederlands';
    }
  }
}

class Phrase {
  const Phrase({
    required this.id,
    required this.target,
    required this.gloss,
    this.ipa,
    this.hint,
  });

  final String id;
  final String target;
  final Map<UiLang, String> gloss;
  final String? ipa;
  final String? hint;

  String glossFor(UiLang ui) => gloss[ui] ?? gloss[UiLang.en] ?? target;
}

class SpeakTurn {
  const SpeakTurn({required this.prompt, required this.expected, this.scaffold});

  final String prompt;
  final String expected;
  final String? scaffold;
}

class Scenario {
  const Scenario({
    required this.id,
    required this.lang,
    required this.cefr,
    required this.minutes,
    required this.titles,
    required this.phrases,
    required this.turns,
    required this.clipLine,
  });

  final String id;
  final LearnLang lang;
  final Cefr cefr;
  final int minutes;
  final Map<UiLang, String> titles;
  final List<Phrase> phrases;
  final List<SpeakTurn> turns;
  final String clipLine;

  String title(UiLang ui) => titles[ui] ?? titles[UiLang.en] ?? id;
}

class UserProfile {
  const UserProfile({
    required this.uiLang,
    required this.learnLang,
    required this.motive,
    required this.cefr,
    required this.dailyGoalMin,
    required this.onboarded,
    required this.isPlus,
    required this.streak,
    required this.phrasesKnown,
    required this.speakSecondsUsed,
    required this.speakDayKey,
    required this.bonusSpeakSeconds,
    required this.adsWatchedToday,
    required this.learnedIds,
    required this.srs,
  });

  final UiLang uiLang;
  final LearnLang learnLang;
  final Motive motive;
  final Cefr cefr;
  final int dailyGoalMin;
  final bool onboarded;
  final bool isPlus;
  final int streak;
  final int phrasesKnown;
  final int speakSecondsUsed;
  final String speakDayKey;
  final int bonusSpeakSeconds;
  final int adsWatchedToday;
  final Set<String> learnedIds;
  final Map<String, int> srs; // phraseId -> due epoch days

  static const empty = UserProfile(
    uiLang: UiLang.tr,
    learnLang: LearnLang.es,
    motive: Motive.travel,
    cefr: Cefr.a1,
    dailyGoalMin: 12,
    onboarded: false,
    isPlus: false,
    streak: 0,
    phrasesKnown: 0,
    speakSecondsUsed: 0,
    speakDayKey: '',
    bonusSpeakSeconds: 0,
    adsWatchedToday: 0,
    learnedIds: {},
    srs: {},
  );

  static const maxRewardedAdsPerDay = 3;

  int get speakAllowance => isPlus ? 3600 : 60 + bonusSpeakSeconds;

  int remainingSpeakSeconds() {
    if (isPlus) return 3600;
    return (speakAllowance - speakSecondsUsed).clamp(0, speakAllowance);
  }

  bool get canWatchAd => !isPlus && adsWatchedToday < maxRewardedAdsPerDay;

  UserProfile copyWith({
    UiLang? uiLang,
    LearnLang? learnLang,
    Motive? motive,
    Cefr? cefr,
    int? dailyGoalMin,
    bool? onboarded,
    bool? isPlus,
    int? streak,
    int? phrasesKnown,
    int? speakSecondsUsed,
    String? speakDayKey,
    int? bonusSpeakSeconds,
    int? adsWatchedToday,
    Set<String>? learnedIds,
    Map<String, int>? srs,
  }) {
    return UserProfile(
      uiLang: uiLang ?? this.uiLang,
      learnLang: learnLang ?? this.learnLang,
      motive: motive ?? this.motive,
      cefr: cefr ?? this.cefr,
      dailyGoalMin: dailyGoalMin ?? this.dailyGoalMin,
      onboarded: onboarded ?? this.onboarded,
      isPlus: isPlus ?? this.isPlus,
      streak: streak ?? this.streak,
      phrasesKnown: phrasesKnown ?? this.phrasesKnown,
      speakSecondsUsed: speakSecondsUsed ?? this.speakSecondsUsed,
      speakDayKey: speakDayKey ?? this.speakDayKey,
      bonusSpeakSeconds: bonusSpeakSeconds ?? this.bonusSpeakSeconds,
      adsWatchedToday: adsWatchedToday ?? this.adsWatchedToday,
      learnedIds: learnedIds ?? this.learnedIds,
      srs: srs ?? this.srs,
    );
  }

  Map<String, dynamic> toJson() => {
        'uiLang': uiLang.name,
        'learnLang': learnLang.name,
        'motive': motive.name,
        'cefr': cefr.name,
        'dailyGoalMin': dailyGoalMin,
        'onboarded': onboarded,
        'isPlus': isPlus,
        'streak': streak,
        'phrasesKnown': phrasesKnown,
        'speakSecondsUsed': speakSecondsUsed,
        'speakDayKey': speakDayKey,
        'bonusSpeakSeconds': bonusSpeakSeconds,
        'adsWatchedToday': adsWatchedToday,
        'learnedIds': learnedIds.toList(),
        'srs': srs,
      };

  factory UserProfile.fromJson(Map<String, dynamic> j) {
    return UserProfile(
      uiLang: UiLang.values.byName(j['uiLang'] as String? ?? 'tr'),
      learnLang: LearnLang.values.byName(j['learnLang'] as String? ?? 'es'),
      motive: Motive.values.byName(j['motive'] as String? ?? 'travel'),
      cefr: Cefr.values.byName(j['cefr'] as String? ?? 'a1'),
      dailyGoalMin: j['dailyGoalMin'] as int? ?? 12,
      onboarded: j['onboarded'] as bool? ?? false,
      isPlus: j['isPlus'] as bool? ?? false,
      streak: j['streak'] as int? ?? 0,
      phrasesKnown: j['phrasesKnown'] as int? ?? 0,
      speakSecondsUsed: j['speakSecondsUsed'] as int? ?? 0,
      speakDayKey: j['speakDayKey'] as String? ?? '',
      bonusSpeakSeconds: j['bonusSpeakSeconds'] as int? ?? 0,
      adsWatchedToday: j['adsWatchedToday'] as int? ?? 0,
      learnedIds: {...(j['learnedIds'] as List? ?? const []).cast<String>()},
      srs: ((j['srs'] as Map?) ?? const {}).map((k, v) => MapEntry('$k', (v as num).toInt())),
    );
  }
}

import '../../data/models/models.dart';

class I18n {
  I18n(this.ui);
  final UiLang ui;

  String get _c => ui.name;

  String t(Map<String, String> m) => m[_c] ?? m['en'] ?? m.values.first;

  String get appName => 'NURA';
  String get speakToLearn => t({
    'tr': 'Konuşarak öğren',
    'en': 'Learn by speaking',
    'es': 'Aprende hablando',
    'de': 'Sprechend lernen',
    'fr': 'Apprendre en parlant',
    'nl': 'Leren door te spreken',
    'ar': 'تعلم بالتحدث',
  });

  String get continueCta => t({
    'tr': 'Devam',
    'en': 'Continue',
    'es': 'Continuar',
    'de': 'Weiter',
    'fr': 'Continuer',
    'nl': 'Doorgaan',
    'ar': 'استمر',
  });

  String get startSpeak => t({
    'tr': 'Konuşmaya başla',
    'en': 'Start conversation',
    'es': 'Empezar conversación',
    'de': 'Gespräch starten',
    'fr': 'Commencer',
    'nl': 'Start gesprek',
    'ar': 'ابدأ المحادثة',
  });

  String get todaySpeak => t({
    'tr': 'Bugünün konuşması',
    'en': "Today's Speak",
    'es': 'Habla de hoy',
    'de': 'Heutiges Sprechen',
    'fr': 'Parler aujourd’hui',
    'nl': 'Vandaag spreken',
  });

  String get home => t({
    'tr': 'Ana sayfa',
    'en': 'Home',
    'es': 'Inicio',
    'de': 'Start',
    'fr': 'Accueil',
    'nl': 'Home',
    'ar': 'الرئيسية',
  });
  String get speak => t({
    'tr': 'Konuş',
    'en': 'Speak',
    'es': 'Hablar',
    'de': 'Sprechen',
    'fr': 'Parler',
    'nl': 'Spreken',
    'ar': 'تحدث',
  });
  String get clips => t({
    'tr': 'Klipler',
    'en': 'Clips',
    'es': 'Clips',
    'de': 'Clips',
    'fr': 'Extraits',
    'nl': 'Clips',
    'ar': 'مقاطع',
  });
  String get translate => t({
    'tr': 'Çevir',
    'en': 'Translate',
    'es': 'Traducir',
    'de': 'Übersetzen',
    'fr': 'Traduire',
    'nl': 'Vertalen',
    'ar': 'ترجم',
  });
  String get you => t({
    'tr': 'Sen',
    'en': 'You',
    'es': 'Tú',
    'de': 'Du',
    'fr': 'Toi',
    'nl': 'Jij',
    'ar': 'أنت',
  });

  String get whyTitle => t({
    'tr': 'Neden konuşmak istiyorsun?',
    'en': 'Why do you want to speak?',
    'es': '¿Por qué quieres hablar?',
    'de': 'Warum willst du sprechen?',
    'fr': 'Pourquoi veux-tu parler ?',
    'nl': 'Waarom wil je spreken?',
  });

  String get nativeTitle => t({
    'tr': 'Ana dilin hangisi?',
    'en': 'What is your native language?',
    'es': '¿Cuál es tu lengua materna?',
    'de': 'Was ist deine Muttersprache?',
    'fr': 'Quelle est ta langue maternelle ?',
    'nl': 'Wat is je moedertaal?',
  });

  String get learnTitle => t({
    'tr': 'Hangi dili konuşacaksın?',
    'en': 'Which language will you speak?',
    'es': '¿Qué idioma vas a hablar?',
    'de': 'Welche Sprache willst du sprechen?',
    'fr': 'Quelle langue vas-tu parler ?',
    'nl': 'Welke taal ga je spreken?',
  });

  String get levelTitle => t({
    'tr': 'Şu anki seviyen',
    'en': 'Your current level',
    'es': 'Tu nivel actual',
    'de': 'Dein Niveau',
    'fr': 'Ton niveau',
    'nl': 'Je niveau',
  });

  String motive(Motive m) {
    switch (m) {
      case Motive.work:
        return t({
          'tr': 'İş ve kariyer',
          'en': 'Work & career',
          'es': 'Trabajo',
          'de': 'Beruf',
          'fr': 'Travail',
          'nl': 'Werk',
        });
      case Motive.travel:
        return t({
          'tr': 'Seyahat / taşınma',
          'en': 'Travel & moving',
          'es': 'Viajar / mudarse',
          'de': 'Reisen / Umzug',
          'fr': 'Voyage / déménagement',
          'nl': 'Reizen / verhuizen',
        });
      case Motive.exam:
        return t({
          'tr': 'Sınav',
          'en': 'Exams',
          'es': 'Exámenes',
          'de': 'Prüfungen',
          'fr': 'Examens',
          'nl': 'Examens',
        });
      case Motive.life:
        return t({
          'tr': 'Günlük hayat',
          'en': 'Everyday life',
          'es': 'Vida diaria',
          'de': 'Alltag',
          'fr': 'Quotidien',
          'nl': 'Dagelijks leven',
        });
    }
  }

  String get remainingToday => t({
    'tr': 'Bugün kalan konuşma',
    'en': 'Speaking left today',
    'es': 'Habla restante hoy',
    'de': 'Sprechen übrig',
    'fr': 'Parole restante',
    'nl': 'Spreken over vandaag',
  });

  String get freeMinute => t({
    'tr': 'Ücretsiz: günde 1 dakika',
    'en': 'Free: 1 minute per day',
    'es': 'Gratis: 1 minuto al día',
    'de': 'Gratis: 1 Minute pro Tag',
    'fr': 'Gratuit : 1 minute par jour',
    'nl': 'Gratis: 1 minuut per dag',
  });

  String get holdToSpeak => t({
    'tr': 'Konuşmak için basılı tut',
    'en': 'Hold to speak',
    'es': 'Mantén para hablar',
    'de': 'Halten zum Sprechen',
    'fr': 'Maintenir pour parler',
    'nl': 'Vasthouden om te spreken',
  });

  String get plusCta => t({
    'tr': '7 gün ücretsiz dene',
    'en': 'Start 7-day free trial',
    'es': 'Prueba 7 días',
    'de': '7 Tage testen',
    'fr': 'Essai 7 jours',
    'nl': '7 dagen proberen',
  });

  String get paywallTitle => t({
    'tr': 'Her gün konuş. Akıcı ol.',
    'en': 'Speak every day. Become fluent.',
    'es': 'Habla cada día. Gana fluidez.',
    'de': 'Täglich sprechen. Flüssig werden.',
    'fr': 'Parle chaque jour. Deviens fluide.',
    'nl': 'Elke dag spreken. Vloeiend worden.',
  });

  String get review => t({
    'tr': 'Tekrar',
    'en': 'Review',
    'es': 'Repaso',
    'de': 'Wiederholen',
    'fr': 'Réviser',
    'nl': 'Herhalen',
  });
  String get savePhrase => t({
    'tr': 'Kalıbı kaydet',
    'en': 'Save phrase',
    'es': 'Guardar frase',
    'de': 'Phrase speichern',
    'fr': 'Enregistrer',
    'nl': 'Zin opslaan',
  });
  String get typeToTranslate => t({
    'tr': 'Çevirmek için yaz…',
    'en': 'Type to translate…',
    'es': 'Escribe para traducir…',
    'de': 'Zum Übersetzen tippen…',
    'fr': 'Écrire pour traduire…',
    'nl': 'Typ om te vertalen…',
  });

  String get streak => t({
    'tr': 'Seri',
    'en': 'Streak',
    'es': 'Racha',
    'de': 'Serie',
    'fr': 'Série',
    'nl': 'Reeks',
  });
  String get phrases => t({
    'tr': 'Kalıp',
    'en': 'Phrases',
    'es': 'Frases',
    'de': 'Phrasen',
    'fr': 'Phrases',
    'nl': 'Zinnen',
  });
  String get shadow => t({
    'tr': 'Gölgele',
    'en': 'Shadow',
    'es': 'Sombra',
    'de': 'Schatten',
    'fr': 'Ombre',
    'nl': 'Schaduw',
  });
  String get slow => t({
    'tr': 'Yavaş',
    'en': 'Slow',
    'es': 'Lento',
    'de': 'Langsam',
    'fr': 'Lent',
    'nl': 'Langzaam',
  });
  String get goodGreeting {
    final h = DateTime.now().hour;
    if (h < 12) {
      return t({
        'tr': 'Günaydın',
        'en': 'Good morning',
        'es': 'Buenos días',
        'de': 'Guten Morgen',
        'fr': 'Bonjour',
        'nl': 'Goedemorgen',
        'ar': 'صباح الخير',
      });
    } else if (h < 18) {
      return t({
        'tr': 'İyi günler',
        'en': 'Good afternoon',
        'es': 'Buenas tardes',
        'de': 'Guten Tag',
        'fr': 'Bon après-midi',
        'nl': 'Goedemiddag',
        'ar': 'مساء الخير',
      });
    } else {
      return t({
        'tr': 'İyi akşamlar',
        'en': 'Good evening',
        'es': 'Buenas tardes',
        'de': 'Guten Abend',
        'fr': 'Bonsoir',
        'nl': 'Goedenavond',
        'ar': 'مساء الخير',
      });
    }
  }

  // Backwards compat alias
  String get goodEvening => goodGreeting;

  String minutesLeft(int m) => t({
    'tr': '$m dk kaldı',
    'en': '$m min left',
    'es': '$m min restantes',
    'de': 'noch $m Min',
    'fr': '$m min restantes',
    'nl': 'nog $m min',
    'ar': 'بقي $m دقيقة',
  });

  String get progress => t({
    'tr': 'İlerleme',
    'en': 'Progress',
    'es': 'Progreso',
    'de': 'Fortschritt',
    'fr': 'Progrès',
    'nl': 'Voortgang',
    'ar': 'التقدم',
  });

  String pronunciationGuide(String langName) => t({
    'tr': '$langName nasıl okunur',
    'en': 'How to pronounce $langName',
    'es': 'Cómo pronunciar $langName',
    'de': '$langName Aussprache',
    'fr': 'Prononciation $langName',
    'nl': '$langName uitspraak',
    'ar': 'كيف تنطق $langName',
  });

  String reviewReady(int n) => t({
    'tr': '$n kart hazır',
    'en': '$n cards ready',
    'es': '$n tarjetas listas',
    'de': '$n Karten bereit',
    'fr': '$n cartes prêtes',
    'nl': '$n kaarten klaar',
    'ar': '$n بطاقات جاهزة',
  });
}

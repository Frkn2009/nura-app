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

  String get skipCta => t({
    'tr': 'Atla',
    'en': 'Skip',
    'es': 'Omitir',
    'de': 'Überspringen',
    'fr': 'Passer',
    'nl': 'Overslaan',
    'ar': 'تخطي',
  });

  String get letsBeginCta => t({
    'tr': 'Hadi başlayalım',
    'en': "Let's begin",
    'es': 'Empecemos',
    'de': "Los geht's",
    'fr': 'Commençons',
    'nl': 'Laten we beginnen',
    'ar': 'هيا نبدأ',
  });

  String get storySlide1Title => t({
    'tr': 'Bir dili öğrenmek\nezber değildir.',
    'en': "Learning a language\nisn't memorizing.",
    'es': 'Aprender un idioma\nno es memorizar.',
    'de': 'Eine Sprache lernen\nheißt nicht auswendig lernen.',
    'fr': "Apprendre une langue,\nce n'est pas mémoriser.",
    'nl': 'Een taal leren\nis geen stampwerk.',
    'ar': 'تعلّم لغة\nليس حفظاً.',
  });

  String get storySlide1Body => t({
    'tr':
        'Kelime listeleri unutulur, konuşma cesareti kalıcı olur. '
        'Nura seni ilk cümleyi kurmaya, oradan devamına götürür.',
    'en':
        'Word lists get forgotten, the courage to speak stays. '
        'Nura gets you to your first sentence, then keeps you going.',
    'es':
        'Las listas de palabras se olvidan, el valor para hablar '
        'permanece. Nura te lleva a tu primera frase y luego más allá.',
    'de':
        'Wortlisten werden vergessen, der Mut zu sprechen bleibt. '
        'Nura bringt dich zum ersten Satz — und weiter.',
    'fr':
        'Les listes de mots s\'oublient, le courage de parler reste. '
        'Nura t\'amène à ta première phrase, puis à la suite.',
    'nl':
        'Woordenlijsten worden vergeten, spreekdurf blijft. '
        'Nura brengt je naar je eerste zin, en verder.',
    'ar':
        'قوائم الكلمات تُنسى، شجاعة الكلام تبقى. '
        'نورا توصلك إلى جملتك الأولى، ثم إلى ما بعدها.',
  });

  String get storySlide2Title => t({
    'tr': 'Derse değil,\nkonuşmaya çağırıyoruz.',
    'en': "Not a lesson —\na call to speak.",
    'es': 'No es una lección,\nes una invitación a hablar.',
    'de': 'Kein Unterricht —\neine Einladung zu sprechen.',
    'fr': 'Pas un cours —\nune invitation à parler.',
    'nl': 'Geen les —\neen uitnodiging om te spreken.',
    'ar': 'لا درس —\nبل دعوة للكلام.',
  });

  String get storySlide2Body => t({
    'tr':
        'Her alıştırma sesli. Kuralı ezberlemek değil, ağzından '
        'doğru çıkana kadar denemek — asıl öğrenme orada oluyor.',
    'en':
        'Every exercise is spoken aloud. Not memorizing the rule, '
        "but trying until it comes out right — that's real learning.",
    'es':
        'Cada ejercicio es en voz alta. No memorizar la regla, sino '
        'intentarlo hasta decirla bien — ahí está el aprendizaje real.',
    'de':
        'Jede Übung wird laut gesprochen. Nicht die Regel auswendig '
        'lernen, sondern üben, bis es stimmt — dort passiert echtes Lernen.',
    'fr':
        'Chaque exercice se dit à voix haute. Pas mémoriser la règle, '
        'mais réessayer jusqu\'à bien la dire — c\'est ça, apprendre.',
    'nl':
        'Elke oefening is hardop. Niet de regel uit je hoofd leren, '
        'maar net zo lang proberen tot het goed klinkt — daar leer je van.',
    'ar':
        'كل تمرين يُقال بصوت عالٍ. ليس حفظ القاعدة، بل المحاولة حتى '
        'تُنطق صحيحاً — هناك يحدث التعلّم الحقيقي.',
  });

  String get storySlide3Title => t({
    'tr': 'Küçük adımlar,\ngerçek ilerleme.',
    'en': 'Small steps,\nreal progress.',
    'es': 'Pasos pequeños,\nprogreso real.',
    'de': 'Kleine Schritte,\nechter Fortschritt.',
    'fr': 'Petits pas,\nvrais progrès.',
    'nl': 'Kleine stapjes,\nechte vooruitgang.',
    'ar': 'خطوات صغيرة،\nتقدّم حقيقي.',
  });

  String get storySlide3Body => t({
    'tr':
        'Günde birkaç dakika yeter. Bir ay sonra karşındaki '
        'kişiyle gerçekten konuşabildiğini fark edeceksin.',
    'en':
        "A few minutes a day is enough. A month from now, you'll "
        'notice you can actually talk to the person in front of you.',
    'es':
        'Bastan unos minutos al día. En un mes notarás que de '
        'verdad puedes hablar con la persona que tienes delante.',
    'de':
        'Ein paar Minuten am Tag reichen. In einem Monat merkst du, '
        'dass du wirklich mit der Person vor dir sprechen kannst.',
    'fr':
        'Quelques minutes par jour suffisent. Dans un mois, tu '
        'remarqueras que tu peux vraiment parler avec la personne en face.',
    'nl':
        'Een paar minuten per dag is genoeg. Over een maand merk '
        'je dat je echt met die persoon tegenover je kunt praten.',
    'ar':
        'بضع دقائق يومياً تكفي. بعد شهر ستلاحظ أنك تستطيع فعلاً '
        'التحدث مع من أمامك.',
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

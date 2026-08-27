import '../../data/models/models.dart';

class I18n {
  I18n(this.ui);
  final UiLang ui;

  String get _c => ui.name;

  String t(Map<String, String> m) => m[_c] ?? m['en'] ?? m.values.first;

  String get appName => 'VOXELO';
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
        'Voxelo seni ilk cümleyi kurmaya, oradan devamına götürür.',
    'en':
        'Word lists get forgotten, the courage to speak stays. '
        'Voxelo gets you to your first sentence, then keeps you going.',
    'es':
        'Las listas de palabras se olvidan, el valor para hablar '
        'permanece. Voxelo te lleva a tu primera frase y luego más allá.',
    'de':
        'Wortlisten werden vergessen, der Mut zu sprechen bleibt. '
        'Voxelo bringt dich zum ersten Satz — und weiter.',
    'fr':
        'Les listes de mots s\'oublient, le courage de parler reste. '
        'Voxelo t\'amène à ta première phrase, puis à la suite.',
    'nl':
        'Woordenlijsten worden vergeten, spreekdurf blijft. '
        'Voxelo brengt je naar je eerste zin, en verder.',
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

  String get homeTourXpTitle => t({
    'tr': 'Günlük hedefin',
    'en': 'Your daily goal',
    'es': 'Tu objetivo diario',
    'de': 'Dein Tagesziel',
    'fr': 'Ton objectif quotidien',
    'nl': 'Je dagelijkse doel',
    'ar': 'هدفك اليومي',
  });

  String get homeTourXpBody => t({
    'tr':
        'Her gün XP kazanarak seviyeni ilerlet. Çubuk dolunca günlük '
        'hedefini tamamlamış olursun.',
    'en':
        "Earn XP every day to level up. When the bar fills, you've hit "
        'your daily goal.',
    'es':
        'Gana XP cada día para subir de nivel. Cuando la barra se llena, '
        'has cumplido tu objetivo diario.',
    'de':
        'Verdiene jeden Tag XP, um aufzusteigen. Wenn die Leiste voll '
        'ist, hast du dein Tagesziel erreicht.',
    'fr':
        "Gagne de l'XP chaque jour pour progresser. Quand la barre est "
        'pleine, tu as atteint ton objectif quotidien.',
    'nl':
        'Verdien elke dag XP om te stijgen. Als de balk vol is, heb je '
        'je dagelijkse doel gehaald.',
    'ar':
        'اكسب نقاط خبرة كل يوم لترتقي. عند امتلاء الشريط تكون قد أتممت '
        'هدفك اليومي.',
  });

  String get homeTourSpeakTitle => t({
    'tr': 'Bugünün konuşması',
    'en': "Today's speaking",
    'es': 'La conversación de hoy',
    'de': 'Das heutige Gespräch',
    'fr': "La conversation d'aujourd'hui",
    'nl': 'Het gesprek van vandaag',
    'ar': 'محادثة اليوم',
  });

  String get homeTourSpeakBody => t({
    'tr':
        'Her gün sana özel kısa bir konuşma pratiği seçiyoruz. Buradan '
        'başla, dinle ve tekrar et.',
    'en':
        'Every day we pick a short speaking practice just for you. '
        'Start here, listen, and repeat.',
    'es':
        'Cada día elegimos una breve práctica de conversación para ti. '
        'Empieza aquí, escucha y repite.',
    'de':
        'Jeden Tag wählen wir eine kurze Sprechübung nur für dich. '
        'Starte hier, hör zu und wiederhole.',
    'fr':
        "Chaque jour, on choisit un court exercice de conversation "
        'rien que pour toi. Commence ici, écoute et répète.',
    'nl':
        'Elke dag kiezen we een korte spreekoefening speciaal voor jou. '
        'Begin hier, luister en herhaal.',
    'ar':
        'كل يوم نختار لك تمرين محادثة قصيرًا خاصًا بك. ابدأ من هنا، '
        'استمع وكرر.',
  });

  String get homeTourLibraryTitle => t({
    'tr': 'Kitaplık',
    'en': 'Library',
    'es': 'Biblioteca',
    'de': 'Bibliothek',
    'fr': 'Bibliothèque',
    'nl': 'Bibliotheek',
    'ar': 'المكتبة',
  });

  String get homeTourLibraryBody => t({
    'tr':
        'Seviyene uygun kısa hikayeleri okuyup dinleyerek okuma ve '
        'telaffuz pratiği yap.',
    'en':
        'Read and listen to short stories at your level to practice '
        'reading and pronunciation.',
    'es':
        'Lee y escucha historias cortas a tu nivel para practicar '
        'lectura y pronunciación.',
    'de':
        'Lies und hör kurze Geschichten auf deinem Niveau, um Lesen '
        'und Aussprache zu üben.',
    'fr':
        "Lis et écoute des histoires courtes à ton niveau pour "
        "t'entraîner à la lecture et à la prononciation.",
    'nl':
        'Lees en luister naar korte verhalen op jouw niveau om lezen '
        'en uitspraak te oefenen.',
    'ar': 'اقرأ واستمع إلى قصص قصيرة بمستواك لتتمرن على القراءة والنطق.',
  });

  String get homeTourReviewTitle => t({
    'tr': 'Tekrar',
    'en': 'Review',
    'es': 'Repaso',
    'de': 'Wiederholung',
    'fr': 'Révision',
    'nl': 'Herhaling',
    'ar': 'المراجعة',
  });

  String get homeTourReviewBody => t({
    'tr':
        'Öğrendiğin kelimeler zamanı gelince burada tekrar için '
        'birikir — unutmadan pekiştir.',
    'en':
        "Words you've learned collect here for review right when it's "
        'time — reinforce them before you forget.',
    'es':
        'Las palabras que aprendiste se acumulan aquí para repasarlas '
        'en el momento justo — refuérzalas antes de olvidarlas.',
    'de':
        'Gelernte Wörter sammeln sich hier zur Wiederholung genau zur '
        'richtigen Zeit — festige sie, bevor du sie vergisst.',
    'fr':
        "Les mots que tu as appris s'accumulent ici pour être révisés "
        'au bon moment — renforce-les avant de les oublier.',
    'nl':
        'Geleerde woorden verzamelen zich hier voor herhaling op het '
        'juiste moment — verstevig ze voordat je ze vergeet.',
    'ar':
        'الكلمات التي تعلمتها تتجمع هنا للمراجعة في الوقت المناسب — '
        'ثبّتها قبل أن تنساها.',
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
    'tr': '3 gün ücretsiz dene',
    'en': 'Start 3-day free trial',
    'es': 'Prueba 3 días',
    'de': '3 Tage testen',
    'fr': 'Essai 3 jours',
    'nl': '3 dagen proberen',
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

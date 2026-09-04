import '../../data/models/models.dart';

class I18n {
  I18n(this.ui);
  final UiLang ui;

  String get _c => ui.name;

  String t(Map<String, String> m) => m[_c] ?? m['en'] ?? m.values.first;

  String get appName => 'VOXELITH';
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
        'Voxelith seni ilk cümleyi kurmaya, oradan devamına götürür.',
    'en':
        'Word lists get forgotten, the courage to speak stays. '
        'Voxelith gets you to your first sentence, then keeps you going.',
    'es':
        'Las listas de palabras se olvidan, el valor para hablar '
        'permanece. Voxelith te lleva a tu primera frase y luego más allá.',
    'de':
        'Wortlisten werden vergessen, der Mut zu sprechen bleibt. '
        'Voxelith bringt dich zum ersten Satz — und weiter.',
    'fr':
        'Les listes de mots s\'oublient, le courage de parler reste. '
        'Voxelith t\'amène à ta première phrase, puis à la suite.',
    'nl':
        'Woordenlijsten worden vergeten, spreekdurf blijft. '
        'Voxelith brengt je naar je eerste zin, en verder.',
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
    'tr': 'Ücretsiz: günde 30 saniye',
    'en': 'Free: 30 seconds per day',
    'es': 'Gratis: 30 segundos al día',
    'de': 'Gratis: 30 Sekunden pro Tag',
    'fr': 'Gratuit : 30 secondes par jour',
    'nl': 'Gratis: 30 seconden per dag',
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

  // Generic
  String get retryCta => t({
    'tr': 'Tekrar dene',
    'en': 'Try again',
    'es': 'Reintentar',
    'de': 'Erneut versuchen',
    'fr': 'Réessayer',
    'nl': 'Opnieuw proberen',
    'ar': 'أعد المحاولة',
  });
  String get cancelCta => t({
    'tr': 'Vazgeç',
    'en': 'Cancel',
    'es': 'Cancelar',
    'de': 'Abbrechen',
    'fr': 'Annuler',
    'nl': 'Annuleren',
    'ar': 'إلغاء',
  });
  String get closeTooltip => t({
    'tr': 'Kapat',
    'en': 'Close',
    'es': 'Cerrar',
    'de': 'Schließen',
    'fr': 'Fermer',
    'nl': 'Sluiten',
    'ar': 'إغلاق',
  });
  String get maybeLaterCta => t({
    'tr': 'Belki sonra',
    'en': 'Maybe later',
    'es': 'Quizás luego',
    'de': 'Vielleicht später',
    'fr': 'Plus tard',
    'nl': 'Misschien later',
    'ar': 'ربما لاحقاً',
  });

  // Nav (app shell)
  String get navGames => t({
    'tr': 'Oyun',
    'en': 'Games',
    'es': 'Juegos',
    'de': 'Spiele',
    'fr': 'Jeux',
    'nl': 'Spellen',
    'ar': 'ألعاب',
  });
  String get navChat => t({
    'tr': 'Sohbet',
    'en': 'Chat',
    'es': 'Chat',
    'de': 'Chat',
    'fr': 'Discuter',
    'nl': 'Chat',
    'ar': 'محادثة',
  });

  // Translate screen
  String get interpreterMeetingTitle => t({
    'tr': 'Toplantı Çevirmeni',
    'en': 'Meeting Interpreter',
    'es': 'Intérprete de reuniones',
    'de': 'Besprechungsdolmetscher',
    'fr': 'Interprète de réunion',
    'nl': 'Vergadertolk',
    'ar': 'مترجم الاجتماعات',
  });
  String interpreterCardSubtitle(int minutes) => t({
    'tr': 'İki dili sırayla dinler, hem yazılı hem sesli çevirir · bugün kalan $minutes dk',
    'en': 'Listens to two languages in turn, translates both text and speech · $minutes min left today',
    'es': 'Escucha dos idiomas por turnos, traduce texto y voz · $minutes min restantes hoy',
    'de': 'Hört abwechselnd zwei Sprachen, übersetzt Text und Sprache · noch $minutes Min heute',
    'fr': "Écoute deux langues à tour de rôle, traduit texte et voix · $minutes min restantes aujourd'hui",
    'nl': 'Luistert om beurten naar twee talen, vertaalt tekst en spraak · nog $minutes min vandaag',
    'ar': 'يستمع للغتين بالتناوب، يترجم نصاً وصوتاً · تبقى $minutes دقيقة اليوم',
  });
  String get translateSignInRequired => t({
    'tr': 'Plus bulut çevirisi için profilinden VOXELITH hesabına giriş yap.',
    'en': 'Sign in to your VOXELITH account from your profile for Plus cloud translation.',
    'es': 'Inicia sesión en tu cuenta VOXELITH desde tu perfil para la traducción en la nube Plus.',
    'de': 'Melde dich über dein Profil bei deinem VOXELITH-Konto an, um die Plus-Cloud-Übersetzung zu nutzen.',
    'fr': 'Connecte-toi à ton compte VOXELITH depuis ton profil pour la traduction cloud Plus.',
    'nl': 'Log via je profiel in op je VOXELITH-account voor Plus-cloudvertaling.',
    'ar': 'سجّل الدخول إلى حساب VOXELITH من ملفك الشخصي لاستخدام الترجمة السحابية Plus.',
  });
  String get translatePlusNotVerified => t({
    'tr': 'Bulut Plus hakkın henüz doğrulanmadı.',
    'en': "Your cloud Plus access hasn't been verified yet.",
    'es': 'Tu acceso Plus en la nube aún no se ha verificado.',
    'de': 'Dein Cloud-Plus-Zugang wurde noch nicht bestätigt.',
    'fr': "Ton accès cloud Plus n'a pas encore été vérifié.",
    'nl': 'Je cloud Plus-toegang is nog niet geverifieerd.',
    'ar': 'لم يتم التحقق من صلاحية Plus السحابية الخاصة بك بعد.',
  });
  String get translateServiceNotConfigured => t({
    'tr': 'Bulut çeviri sunucusu henüz yapılandırılmadı.',
    'en': "The cloud translation server isn't configured yet.",
    'es': 'El servidor de traducción en la nube aún no está configurado.',
    'de': 'Der Cloud-Übersetzungsserver ist noch nicht konfiguriert.',
    'fr': "Le serveur de traduction cloud n'est pas encore configuré.",
    'nl': 'De cloudvertaalserver is nog niet geconfigureerd.',
    'ar': 'لم يتم إعداد خادم الترجمة السحابية بعد.',
  });
  String get translateCloudUnavailable => t({
    'tr': 'Bulut çeviriye şu an ulaşılamıyor. Daha sonra tekrar dene.',
    'en': "Cloud translation isn't reachable right now. Try again later.",
    'es': 'La traducción en la nube no está disponible ahora. Inténtalo más tarde.',
    'de': 'Die Cloud-Übersetzung ist gerade nicht erreichbar. Versuch es später erneut.',
    'fr': 'La traduction cloud est actuellement inaccessible. Réessaie plus tard.',
    'nl': 'Cloudvertaling is nu niet bereikbaar. Probeer het later opnieuw.',
    'ar': 'الترجمة السحابية غير متاحة الآن. حاول لاحقاً.',
  });
  String get translatingEllipsis => t({
    'tr': 'Çevriliyor…',
    'en': 'Translating…',
    'es': 'Traduciendo…',
    'de': 'Übersetzt…',
    'fr': 'Traduction…',
    'nl': 'Vertalen…',
    'ar': 'جارٍ الترجمة…',
  });
  String get translateOutOfCurriculum => t({
    'tr': 'Müfredat dışı',
    'en': 'Outside curriculum',
    'es': 'Fuera del temario',
    'de': 'Außerhalb des Lehrplans',
    'fr': 'Hors programme',
    'nl': 'Buiten het curriculum',
    'ar': 'خارج المنهج',
  });
  String get translateNoResultBody => t({
    'tr':
        'Bu cümle VOXELITH sözlüğünde yok. Uydurma çeviri göstermiyoruz — '
        'yanlış kalıp öğretmektense boş bırakırız.',
    'en':
        "This sentence isn't in the VOXELITH dictionary. We don't show "
        "made-up translations — we'd rather leave it blank than teach the "
        'wrong phrase.',
    'es':
        'Esta frase no está en el diccionario de VOXELITH. No mostramos '
        'traducciones inventadas — preferimos dejarlo en blanco antes que '
        'enseñar una frase incorrecta.',
    'de':
        'Dieser Satz steht nicht im VOXELITH-Wörterbuch. Wir zeigen keine '
        'erfundenen Übersetzungen — lieber leer lassen als eine falsche '
        'Redewendung lehren.',
    'fr':
        "Cette phrase n'est pas dans le dictionnaire VOXELITH. Nous "
        "n'affichons pas de traduction inventée — mieux vaut laisser vide "
        "que d'enseigner une mauvaise formule.",
    'nl':
        'Deze zin staat niet in het VOXELITH-woordenboek. We tonen geen '
        'verzonnen vertaling — liever leeg dan een verkeerde uitdrukking '
        'aanleren.',
    'ar':
        'هذه الجملة غير موجودة في قاموس VOXELITH. لا نعرض ترجمة مُلفّقة — '
        'نفضّل تركها فارغة على تعليم عبارة خاطئة.',
  });
  String get translatePlusRequiredNote => t({
    'tr': 'Plus bulut çevirisi için hesap ve aktif abonelik gerekir.',
    'en': 'Plus cloud translation requires an account and an active subscription.',
    'es': 'La traducción en la nube Plus requiere una cuenta y una suscripción activa.',
    'de': 'Die Plus-Cloud-Übersetzung erfordert ein Konto und ein aktives Abonnement.',
    'fr': 'La traduction cloud Plus nécessite un compte et un abonnement actif.',
    'nl': 'Plus-cloudvertaling vereist een account en een actief abonnement.',
    'ar': 'تتطلب الترجمة السحابية Plus حساباً واشتراكاً نشطاً.',
  });
  String get translatePlusUpsellNote => t({
    'tr': 'Plus ile genişletilmiş bulut çeviri ve kaydetme.',
    'en': 'Get expanded cloud translation and saving with Plus.',
    'es': 'Con Plus obtienes traducción en la nube ampliada y guardado.',
    'de': 'Mit Plus erhältst du erweiterte Cloud-Übersetzung und Speichern.',
    'fr': 'Avec Plus, profite d\'une traduction cloud étendue et de la sauvegarde.',
    'nl': 'Met Plus krijg je uitgebreide cloudvertaling en opslaan.',
    'ar': 'مع Plus تحصل على ترجمة سحابية موسّعة وإمكانية الحفظ.',
  });
  String get translateOriginCurriculum => t({
    'tr': 'VOXELITH müfredatından doğrulandı',
    'en': 'Verified from the VOXELITH curriculum',
    'es': 'Verificado en el temario de VOXELITH',
    'de': 'Aus dem VOXELITH-Lehrplan bestätigt',
    'fr': 'Vérifié depuis le programme VOXELITH',
    'nl': 'Geverifieerd vanuit het VOXELITH-curriculum',
    'ar': 'تم التحقق من منهج VOXELITH',
  });
  String get translateOriginDictionary => t({
    'tr': 'VOXELITH sözlüğünden doğrulandı',
    'en': 'Verified from the VOXELITH dictionary',
    'es': 'Verificado en el diccionario de VOXELITH',
    'de': 'Aus dem VOXELITH-Wörterbuch bestätigt',
    'fr': 'Vérifié depuis le dictionnaire VOXELITH',
    'nl': 'Geverifieerd vanuit het VOXELITH-woordenboek',
    'ar': 'تم التحقق من قاموس VOXELITH',
  });
  String get translateOriginCloud => t({
    'tr': 'Plus · güvenli bulut çevirisi',
    'en': 'Plus · secure cloud translation',
    'es': 'Plus · traducción en la nube segura',
    'de': 'Plus · sichere Cloud-Übersetzung',
    'fr': 'Plus · traduction cloud sécurisée',
    'nl': 'Plus · beveiligde cloudvertaling',
    'ar': 'Plus · ترجمة سحابية آمنة',
  });
  String translateConfidence(int percent) => t({
    'tr': 'güven $percent%',
    'en': '$percent% confidence',
    'es': '$percent% de confianza',
    'de': '$percent % Konfidenz',
    'fr': '$percent % de confiance',
    'nl': '$percent% betrouwbaarheid',
    'ar': 'الثقة $percent%',
  });
  String get translateSavedToSrs => t({
    'tr': "SRS'e eklendi · yarın tekrar",
    'en': 'Added to SRS · review tomorrow',
    'es': 'Añadido al SRS · repaso mañana',
    'de': 'Zum SRS hinzugefügt · morgen wiederholen',
    'fr': 'Ajouté au SRS · révision demain',
    'nl': 'Toegevoegd aan SRS · morgen herhalen',
    'ar': 'أُضيف إلى SRS · مراجعة غداً',
  });
  String get translateQuickPhrases => t({
    'tr': 'Hızlı kalıplar',
    'en': 'Quick phrases',
    'es': 'Frases rápidas',
    'de': 'Schnelle Phrasen',
    'fr': 'Phrases rapides',
    'nl': 'Snelle zinnen',
    'ar': 'عبارات سريعة',
  });

  // Interpreter screen
  String get interpreterQuotaExhausted => t({
    'tr': 'Bugünkü Toplantı Çevirmeni kotan bitti, yarın sıfırlanır.',
    'en': "Your Meeting Interpreter quota for today is used up, it resets tomorrow.",
    'es': 'Tu cuota del Intérprete de reuniones de hoy se agotó, se reinicia mañana.',
    'de': 'Dein heutiges Kontingent für den Besprechungsdolmetscher ist aufgebraucht, es wird morgen zurückgesetzt.',
    'fr': "Ton quota d'Interprète de réunion du jour est épuisé, il se réinitialise demain.",
    'nl': 'Je quotum voor de Vergadertolk van vandaag is op, morgen wordt het gereset.',
    'ar': 'انتهت حصتك اليومية من مترجم الاجتماعات، وستُعاد ضبطها غداً.',
  });
  String get interpreterDisclaimer => t({
    'tr': 'Sadece çeviriyor, yorum katmıyor',
    'en': 'Only translates, adds no commentary',
    'es': 'Solo traduce, no añade comentarios',
    'de': 'Übersetzt nur, fügt keine Kommentare hinzu',
    'fr': 'Traduit seulement, sans ajouter de commentaire',
    'nl': 'Vertaalt alleen, voegt geen commentaar toe',
    'ar': 'يترجم فقط، دون إضافة تعليق',
  });
  String interpreterRemainingTime(String time) => t({
    'tr': 'Bugün kalan: $time',
    'en': 'Left today: $time',
    'es': 'Restante hoy: $time',
    'de': 'Heute übrig: $time',
    'fr': "Restant aujourd'hui : $time",
    'nl': 'Nog over vandaag: $time',
    'ar': 'المتبقي اليوم: $time',
  });
  String get interpreterEmptyStateBody => t({
    'tr':
        'Telefonu masaya koy. Konuşacak kişi kendi dilinin butonunu basılı '
        'tutup konuşsun, bırakınca karşı tarafın diline çevrilip hem yazılı '
        'hem sesli okunur.',
    'en':
        'Put the phone on the table. Whoever wants to speak holds down '
        "their own language's button, and on release it's translated into "
        "the other side's language and read out loud and shown in text.",
    'es':
        'Pon el teléfono sobre la mesa. Quien vaya a hablar mantiene '
        'pulsado el botón de su idioma; al soltarlo se traduce al idioma '
        'del otro y se muestra por escrito y se lee en voz alta.',
    'de':
        'Leg das Telefon auf den Tisch. Wer sprechen möchte, hält die '
        'Taste seiner Sprache gedrückt; beim Loslassen wird es in die '
        'Sprache der Gegenseite übersetzt und schriftlich sowie laut '
        'vorgelesen.',
    'fr':
        'Pose le téléphone sur la table. La personne qui veut parler '
        "maintient le bouton de sa langue enfoncé ; au relâchement, c'est "
        "traduit dans la langue de l'autre, affiché à l'écrit et lu à "
        'voix haute.',
    'nl':
        'Leg de telefoon op tafel. Wie wil spreken houdt de knop van zijn '
        'eigen taal ingedrukt; bij loslaten wordt het vertaald naar de '
        'taal van de ander en zowel geschreven als hardop voorgelezen.',
    'ar':
        'ضع الهاتف على الطاولة. من يريد التحدث يضغط مطولاً على زر لغته، '
        'وعند تركه تُترجم العبارة إلى لغة الطرف الآخر وتُعرض كتابةً '
        'وتُقرأ صوتياً.',
  });
  String get interpreterMicPermanentlyDenied => t({
    'tr': 'Mikrofon izni kapalı. Telefon ayarlarından VOXELITH için mikrofonu aç.',
    'en': 'Microphone access is off. Turn on the microphone for VOXELITH in your phone settings.',
    'es': 'El acceso al micrófono está desactivado. Actívalo para VOXELITH en los ajustes del teléfono.',
    'de': 'Mikrofonzugriff ist deaktiviert. Aktiviere das Mikrofon für VOXELITH in den Telefoneinstellungen.',
    'fr': "L'accès au microphone est désactivé. Active le micro pour VOXELITH dans les réglages du téléphone.",
    'nl': 'Microfoontoegang staat uit. Zet de microfoon voor VOXELITH aan in je telefooninstellingen.',
    'ar': 'إذن الميكروفون مغلق. فعّل الميكروفون لتطبيق VOXELITH من إعدادات الهاتف.',
  });
  String get interpreterMicPermissionDenied => t({
    'tr': 'Konuşabilmek için mikrofon izni vermen gerekiyor.',
    'en': 'You need to grant microphone permission to speak.',
    'es': 'Necesitas conceder permiso de micrófono para hablar.',
    'de': 'Du musst die Mikrofonberechtigung erteilen, um zu sprechen.',
    'fr': 'Tu dois autoriser le micro pour pouvoir parler.',
    'nl': 'Je moet microfoontoestemming geven om te kunnen spreken.',
    'ar': 'يجب منح إذن الميكروفون حتى تتمكن من التحدث.',
  });
  String get interpreterMicUnavailable => t({
    'tr': 'Bu cihazda konuşma tanıma kullanılamıyor.',
    'en': "Speech recognition isn't available on this device.",
    'es': 'El reconocimiento de voz no está disponible en este dispositivo.',
    'de': 'Spracherkennung ist auf diesem Gerät nicht verfügbar.',
    'fr': "La reconnaissance vocale n'est pas disponible sur cet appareil.",
    'nl': 'Spraakherkenning is niet beschikbaar op dit apparaat.',
    'ar': 'التعرف على الكلام غير متاح على هذا الجهاز.',
  });
  String get interpreterMicStartFailed => t({
    'tr': 'Mikrofon başlatılamadı. Lütfen tekrar dene.',
    'en': "Couldn't start the microphone. Please try again.",
    'es': 'No se pudo iniciar el micrófono. Inténtalo de nuevo.',
    'de': 'Mikrofon konnte nicht gestartet werden. Bitte versuch es erneut.',
    'fr': 'Impossible de démarrer le micro. Réessaie.',
    'nl': 'Kan microfoon niet starten. Probeer het opnieuw.',
    'ar': 'تعذّر تشغيل الميكروفون. حاول مرة أخرى.',
  });
  String get interpreterSignInRequired => t({
    'tr': 'Devam etmek için VOXELITH hesabına giriş gerekiyor.',
    'en': 'You need to sign in to your VOXELITH account to continue.',
    'es': 'Necesitas iniciar sesión en tu cuenta VOXELITH para continuar.',
    'de': 'Du musst dich bei deinem VOXELITH-Konto anmelden, um fortzufahren.',
    'fr': 'Tu dois te connecter à ton compte VOXELITH pour continuer.',
    'nl': 'Je moet inloggen op je VOXELITH-account om door te gaan.',
    'ar': 'يجب تسجيل الدخول إلى حساب VOXELITH للمتابعة.',
  });
  String get interpreterServiceNotConfigured => t({
    'tr': 'Çeviri sunucusu henüz yapılandırılmadı.',
    'en': "The translation server isn't configured yet.",
    'es': 'El servidor de traducción aún no está configurado.',
    'de': 'Der Übersetzungsserver ist noch nicht konfiguriert.',
    'fr': "Le serveur de traduction n'est pas encore configuré.",
    'nl': 'De vertaalserver is nog niet geconfigureerd.',
    'ar': 'لم يتم إعداد خادم الترجمة بعد.',
  });
  String get interpreterCloudUnavailable => t({
    'tr': 'Çeviriye şu an ulaşılamıyor. Tekrar dene.',
    'en': "Translation isn't reachable right now. Try again.",
    'es': 'La traducción no está disponible ahora. Inténtalo de nuevo.',
    'de': 'Übersetzung ist gerade nicht erreichbar. Versuch es erneut.',
    'fr': 'La traduction est actuellement inaccessible. Réessaie.',
    'nl': 'Vertaling is nu niet bereikbaar. Probeer opnieuw.',
    'ar': 'الترجمة غير متاحة الآن. حاول مرة أخرى.',
  });
  String get interpreterListening => t({
    'tr': 'Dinliyor…',
    'en': 'Listening…',
    'es': 'Escuchando…',
    'de': 'Hört zu…',
    'fr': 'Écoute…',
    'nl': 'Luistert…',
    'ar': 'يستمع…',
  });
  String get interpreterHoldToTalk => t({
    'tr': 'Basılı tut, konuş',
    'en': 'Hold and speak',
    'es': 'Mantén pulsado y habla',
    'de': 'Halten und sprechen',
    'fr': 'Maintenir et parler',
    'nl': 'Houd vast en spreek',
    'ar': 'اضغط مطولاً وتحدث',
  });

  // Home screen
  String homeXpToday(int daily, int goal) => t({
    'tr': 'Bugün $daily / $goal XP',
    'en': 'Today $daily / $goal XP',
    'es': 'Hoy $daily / $goal XP',
    'de': 'Heute $daily / $goal XP',
    'fr': "Aujourd'hui $daily / $goal XP",
    'nl': 'Vandaag $daily / $goal XP',
    'ar': '$daily / $goal XP اليوم',
  });
  String get homeGoalCompleted => t({
    'tr': 'Hedef tamamlandı',
    'en': 'Goal completed',
    'es': 'Objetivo completado',
    'de': 'Ziel erreicht',
    'fr': 'Objectif atteint',
    'nl': 'Doel behaald',
    'ar': 'تم إنجاز الهدف',
  });
  String homeXpRemaining(int n) => t({
    'tr': '$n XP kaldı',
    'en': '$n XP left',
    'es': '$n XP restantes',
    'de': 'noch $n XP',
    'fr': '$n XP restants',
    'nl': 'nog $n XP',
    'ar': 'تبقى $n XP',
  });
  String get homeEventJoinedNote => t({
    'tr': 'Katıldın · İspanyolca pratik yap',
    'en': 'Joined · practice Spanish',
    'es': 'Te uniste · practica español',
    'de': 'Beigetreten · Spanisch üben',
    'fr': "Rejoint · pratique l'espagnol",
    'nl': 'Meegedaan · oefen Spaans',
    'ar': 'انضممت · تدرّب على الإسبانية',
  });
  String get homeEventJoinCta => t({
    'tr': 'Video ile katıl · bu hafta',
    'en': 'Join with video · this week',
    'es': 'Únete con vídeo · esta semana',
    'de': 'Mit Video beitreten · diese Woche',
    'fr': 'Rejoindre avec vidéo · cette semaine',
    'nl': 'Doe mee met video · deze week',
    'ar': 'انضم بالفيديو · هذا الأسبوع',
  });
  String homeSceneMinutes(int minutes, String title) => t({
    'tr': '$minutes dk · $title',
    'en': '$minutes min · $title',
    'es': '$minutes min · $title',
    'de': '$minutes Min · $title',
    'fr': '$minutes min · $title',
    'nl': '$minutes min · $title',
    'ar': '$minutes دقيقة · $title',
  });
  String get homeWeeklyLeaderboard => t({
    'tr': 'Haftalık sıralama',
    'en': 'Weekly leaderboard',
    'es': 'Clasificación semanal',
    'de': 'Wochenrangliste',
    'fr': 'Classement hebdomadaire',
    'nl': 'Wekelijks klassement',
    'ar': 'الترتيب الأسبوعي',
  });
  String homeAlphabetCta(String flag) => t({
    'tr': 'Alfabe · $flag harfleri öğren',
    'en': 'Alphabet · learn $flag letters',
    'es': 'Alfabeto · aprende las letras $flag',
    'de': 'Alphabet · $flag Buchstaben lernen',
    'fr': 'Alphabet · apprends les lettres $flag',
    'nl': 'Alfabet · leer $flag letters',
    'ar': 'الأبجدية · تعلّم حروف $flag',
  });
  String get homeFreeChatTitle => t({
    'tr': 'Serbest Sohbet',
    'en': 'Free Chat',
    'es': 'Chat libre',
    'de': 'Freies Gespräch',
    'fr': 'Discussion libre',
    'nl': 'Vrij gesprek',
    'ar': 'محادثة حرة',
  });
  String get homeFreeChatPlusNote => t({
    'tr': 'Voxelith ile canlı konuş',
    'en': 'Talk live with Voxelith',
    'es': 'Habla en vivo con Voxelith',
    'de': 'Live mit Voxelith sprechen',
    'fr': 'Parle en direct avec Voxelith',
    'nl': 'Praat live met Voxelith',
    'ar': 'تحدث مباشرة مع Voxelith',
  });
  String get homeFreeChatLockedNote => t({
    'tr': 'Plus ile aç',
    'en': 'Unlock with Plus',
    'es': 'Desbloquea con Plus',
    'de': 'Mit Plus freischalten',
    'fr': 'Débloquer avec Plus',
    'nl': 'Ontgrendel met Plus',
    'ar': 'افتحه مع Plus',
  });
  String get homePlusAdFreeNote => t({
    'tr': 'Plus · reklamsız, sınırsız konuşma',
    'en': 'Plus · ad-free, unlimited speaking',
    'es': 'Plus · sin anuncios, conversación ilimitada',
    'de': 'Plus · werbefrei, unbegrenztes Sprechen',
    'fr': 'Plus · sans publicité, conversation illimitée',
    'nl': 'Plus · advertentievrij, onbeperkt spreken',
    'ar': 'Plus · بلا إعلانات، محادثة غير محدودة',
  });

  // Clan screen
  String get clanTitle => t({
    'tr': 'Takım',
    'en': 'Team',
    'es': 'Equipo',
    'de': 'Team',
    'fr': 'Équipe',
    'nl': 'Team',
    'ar': 'الفريق',
  });
  String get clanLoginPrompt => t({
    'tr': 'Takıma katılmak için giriş yap',
    'en': 'Sign in to join a team',
    'es': 'Inicia sesión para unirte a un equipo',
    'de': 'Melde dich an, um einem Team beizutreten',
    'fr': 'Connecte-toi pour rejoindre une équipe',
    'nl': 'Log in om lid te worden van een team',
    'ar': 'سجّل الدخول للانضمام إلى فريق',
  });
  String get clanLoginCta => t({
    'tr': 'Giriş yap',
    'en': 'Sign in',
    'es': 'Iniciar sesión',
    'de': 'Anmelden',
    'fr': 'Se connecter',
    'nl': 'Inloggen',
    'ar': 'تسجيل الدخول',
  });
  String get clanWeeklyContestNote => t({
    'tr': 'Bu haftanın yarışması · her Pazartesi sıfırlanır',
    'en': "This week's contest · resets every Monday",
    'es': 'Concurso de esta semana · se reinicia cada lunes',
    'de': 'Wettbewerb dieser Woche · setzt sich jeden Montag zurück',
    'fr': 'Concours de la semaine · réinitialisé chaque lundi',
    'nl': 'Wedstrijd van deze week · reset elke maandag',
    'ar': 'مسابقة هذا الأسبوع · تُعاد كل يوم اثنين',
  });
  String get clanEmptyTitle => t({
    'tr': 'Birlikte daha düzenli',
    'en': 'More consistent, together',
    'es': 'Más constancia, juntos',
    'de': 'Gemeinsam konsequenter',
    'fr': 'Plus réguliers, ensemble',
    'nl': 'Samen consistenter',
    'ar': 'أكثر انتظاماً معاً',
  });
  String get clanEmptyBody => t({
    'tr': 'Takım kur veya 6 haneli davet koduyla arkadaşlarına katıl.',
    'en': 'Create a team, or join friends with a 6-digit invite code.',
    'es': 'Crea un equipo o únete a tus amigos con un código de invitación de 6 dígitos.',
    'de': 'Erstelle ein Team oder tritt Freunden mit einem 6-stelligen Einladungscode bei.',
    'fr': "Crée une équipe ou rejoins tes amis avec un code d'invitation à 6 chiffres.",
    'nl': 'Maak een team of doe mee met vrienden via een 6-cijferige uitnodigingscode.',
    'ar': 'أنشئ فريقاً أو انضم إلى أصدقائك برمز دعوة من 6 أرقام.',
  });
  String get clanCreateCta => t({
    'tr': 'Takım kur',
    'en': 'Create team',
    'es': 'Crear equipo',
    'de': 'Team erstellen',
    'fr': 'Créer une équipe',
    'nl': 'Team maken',
    'ar': 'إنشاء فريق',
  });
  String get clanJoinCta => t({
    'tr': 'Kodla katıl',
    'en': 'Join with code',
    'es': 'Unirse con código',
    'de': 'Mit Code beitreten',
    'fr': 'Rejoindre avec un code',
    'nl': 'Meedoen met code',
    'ar': 'انضم برمز',
  });
  String get clanCodeCopied => t({
    'tr': 'Davet kodu kopyalandı',
    'en': 'Invite code copied',
    'es': 'Código de invitación copiado',
    'de': 'Einladungscode kopiert',
    'fr': "Code d'invitation copié",
    'nl': 'Uitnodigingscode gekopieerd',
    'ar': 'تم نسخ رمز الدعوة',
  });
  String get clanInviteCodeLabel => t({
    'tr': 'Davet kodu: ',
    'en': 'Invite code: ',
    'es': 'Código de invitación: ',
    'de': 'Einladungscode: ',
    'fr': "Code d'invitation : ",
    'nl': 'Uitnodigingscode: ',
    'ar': 'رمز الدعوة: ',
  });
  String get clanChatCta => t({
    'tr': 'Klan sohbeti',
    'en': 'Clan chat',
    'es': 'Chat del clan',
    'de': 'Clan-Chat',
    'fr': 'Discussion du clan',
    'nl': 'Clanchat',
    'ar': 'محادثة العشيرة',
  });
  String get clanOwnerCannotLeave => t({
    'tr': 'Sahip takımdan ayrılamaz',
    'en': "Owner can't leave the team",
    'es': 'El propietario no puede abandonar el equipo',
    'de': 'Der Besitzer kann das Team nicht verlassen',
    'fr': 'Le propriétaire ne peut pas quitter l\'équipe',
    'nl': 'Eigenaar kan het team niet verlaten',
    'ar': 'لا يمكن للمالك مغادرة الفريق',
  });
  String get clanLeaveCta => t({
    'tr': 'Takımdan ayrıl',
    'en': 'Leave team',
    'es': 'Abandonar equipo',
    'de': 'Team verlassen',
    'fr': "Quitter l'équipe",
    'nl': 'Team verlaten',
    'ar': 'مغادرة الفريق',
  });
  String get clanLoadFailed => t({
    'tr': 'Takım bilgisi alınamadı.',
    'en': "Couldn't load team info.",
    'es': 'No se pudo cargar la información del equipo.',
    'de': 'Teaminformationen konnten nicht geladen werden.',
    'fr': "Impossible de charger les infos de l'équipe.",
    'nl': 'Teaminformatie kon niet worden geladen.',
    'ar': 'تعذّر تحميل معلومات الفريق.',
  });
  String get clanNameLabel => t({
    'tr': 'Takım adı',
    'en': 'Team name',
    'es': 'Nombre del equipo',
    'de': 'Teamname',
    'fr': "Nom de l'équipe",
    'nl': 'Teamnaam',
    'ar': 'اسم الفريق',
  });
  String get clanJoinDialogTitle => t({
    'tr': 'Takıma katıl',
    'en': 'Join team',
    'es': 'Unirse al equipo',
    'de': 'Team beitreten',
    'fr': "Rejoindre l'équipe",
    'nl': 'Team joinen',
    'ar': 'الانضمام إلى فريق',
  });
  String get clanInviteCodeHint => t({
    'tr': '6 haneli davet kodu',
    'en': '6-digit invite code',
    'es': 'Código de invitación de 6 dígitos',
    'de': '6-stelliger Einladungscode',
    'fr': "Code d'invitation à 6 chiffres",
    'nl': '6-cijferige uitnodigingscode',
    'ar': 'رمز دعوة من 6 أرقام',
  });
  String get clanAlreadyInClan => t({
    'tr': 'Zaten bir takımdasın.',
    'en': "You're already in a team.",
    'es': 'Ya estás en un equipo.',
    'de': 'Du bist bereits in einem Team.',
    'fr': 'Tu es déjà dans une équipe.',
    'nl': 'Je zit al in een team.',
    'ar': 'أنت بالفعل في فريق.',
  });
  String get clanCodeNotFound => t({
    'tr': 'Bu davet koduyla takım bulunamadı.',
    'en': 'No team found with this invite code.',
    'es': 'No se encontró ningún equipo con este código de invitación.',
    'de': 'Mit diesem Einladungscode wurde kein Team gefunden.',
    'fr': "Aucune équipe trouvée avec ce code d'invitation.",
    'nl': 'Geen team gevonden met deze uitnodigingscode.',
    'ar': 'لم يُعثر على فريق بهذا الرمز.',
  });
  String get clanActionFailed => t({
    'tr': 'İşlem tamamlanamadı. Tekrar dene.',
    'en': "Action couldn't be completed. Try again.",
    'es': 'No se pudo completar la acción. Inténtalo de nuevo.',
    'de': 'Aktion konnte nicht abgeschlossen werden. Versuch es erneut.',
    'fr': "L'action n'a pas pu être terminée. Réessaie.",
    'nl': 'Actie kon niet worden voltooid. Probeer opnieuw.',
    'ar': 'تعذّر إتمام العملية. حاول مرة أخرى.',
  });

  // Peer correction (clan)
  String get peerCorrectionCta => t({
    'tr': 'Cümle düzeltme',
    'en': 'Sentence correction',
    'es': 'Corrección de frases',
    'de': 'Satzkorrektur',
    'fr': 'Correction de phrases',
    'nl': 'Zinscorrectie',
    'ar': 'تصحيح الجمل',
  });
  String get peerCorrectionCardSubtitle => t({
    'tr': 'Bir cümle dene, klanın düzeltsin',
    'en': 'Try a sentence, let your team correct it',
    'es': 'Prueba una frase, deja que tu equipo la corrija',
    'de': 'Probiere einen Satz, dein Team korrigiert ihn',
    'fr': 'Essaie une phrase, ton équipe la corrige',
    'nl': 'Probeer een zin, je team corrigeert hem',
    'ar': 'جرّب جملة ودع فريقك يصححها',
  });
  String get peerCorrectionTitle => t({
    'tr': 'Cümle düzeltme',
    'en': 'Sentence correction',
    'es': 'Corrección de frases',
    'de': 'Satzkorrektur',
    'fr': 'Correction de phrases',
    'nl': 'Zinscorrectie',
    'ar': 'تصحيح الجمل',
  });
  String get peerCorrectionEmpty => t({
    'tr': 'Henüz deneme yok. İlk cümleni gönder.',
    'en': 'No attempts yet. Submit the first sentence.',
    'es': 'Aún no hay intentos. Envía la primera frase.',
    'de': 'Noch keine Versuche. Sende den ersten Satz.',
    'fr': "Pas encore d'essai. Envoie la première phrase.",
    'nl': 'Nog geen pogingen. Stuur de eerste zin.',
    'ar': 'لا محاولات بعد. أرسل أول جملة.',
  });
  String get peerCorrectionLoadFailed => t({
    'tr': 'Denemeler yüklenemedi.',
    'en': "Couldn't load attempts.",
    'es': 'No se pudieron cargar los intentos.',
    'de': 'Versuche konnten nicht geladen werden.',
    'fr': 'Impossible de charger les essais.',
    'nl': 'Pogingen konden niet worden geladen.',
    'ar': 'تعذّر تحميل المحاولات.',
  });
  String get peerCorrectionSubmitCta => t({
    'tr': 'Deneme gönder',
    'en': 'Submit attempt',
    'es': 'Enviar intento',
    'de': 'Versuch senden',
    'fr': 'Envoyer un essai',
    'nl': 'Poging versturen',
    'ar': 'إرسال المحاولة',
  });
  String get peerCorrectionAttemptLabel => t({
    'tr': 'Cümlen (hedef dilde)',
    'en': 'Your sentence (target language)',
    'es': 'Tu frase (idioma de destino)',
    'de': 'Dein Satz (Zielsprache)',
    'fr': 'Ta phrase (langue cible)',
    'nl': 'Jouw zin (doeltaal)',
    'ar': 'جملتك (اللغة الهدف)',
  });
  String get peerCorrectionNoteLabel => t({
    'tr': 'Ne demek istedin? (opsiyonel)',
    'en': 'What did you mean to say? (optional)',
    'es': '¿Qué querías decir? (opcional)',
    'de': 'Was wolltest du sagen? (optional)',
    'fr': 'Que voulais-tu dire ? (facultatif)',
    'nl': 'Wat wilde je zeggen? (optioneel)',
    'ar': 'ماذا كنت تقصد؟ (اختياري)',
  });
  String get peerCorrectionAddCta => t({
    'tr': 'Düzeltme ekle',
    'en': 'Add correction',
    'es': 'Añadir corrección',
    'de': 'Korrektur hinzufügen',
    'fr': 'Ajouter une correction',
    'nl': 'Correctie toevoegen',
    'ar': 'إضافة تصحيح',
  });
  String get peerCorrectionTextLabel => t({
    'tr': 'Düzeltmen',
    'en': 'Your correction',
    'es': 'Tu corrección',
    'de': 'Deine Korrektur',
    'fr': 'Ta correction',
    'nl': 'Jouw correctie',
    'ar': 'تصحيحك',
  });
  String get peerCorrectionNoCorrectionsYet => t({
    'tr': 'Henüz düzeltme yok',
    'en': 'No corrections yet',
    'es': 'Aún no hay correcciones',
    'de': 'Noch keine Korrekturen',
    'fr': 'Pas encore de correction',
    'nl': 'Nog geen correcties',
    'ar': 'لا تصحيحات بعد',
  });
  String peerCorrectionCount(int n) => t({
    'tr': '$n düzeltme',
    'en': '$n corrections',
    'es': '$n correcciones',
    'de': '$n Korrekturen',
    'fr': '$n corrections',
    'nl': '$n correcties',
    'ar': '$n تصحيحات',
  });
  String get peerCorrectionDeleteSubmission => t({
    'tr': 'Denemeni sil',
    'en': 'Delete your attempt',
    'es': 'Eliminar tu intento',
    'de': 'Deinen Versuch löschen',
    'fr': 'Supprimer ton essai',
    'nl': 'Je poging verwijderen',
    'ar': 'حذف محاولتك',
  });
  String get peerCorrectionDeleteCorrection => t({
    'tr': 'Düzeltmeni sil',
    'en': 'Delete your correction',
    'es': 'Eliminar tu corrección',
    'de': 'Deine Korrektur löschen',
    'fr': 'Supprimer ta correction',
    'nl': 'Je correctie verwijderen',
    'ar': 'حذف تصحيحك',
  });

  // Daily wheel screen
  String get dailyWheelTitle => t({
    'tr': '🎡 Günlük Çark',
    'en': '🎡 Daily Wheel',
    'es': '🎡 Ruleta diaria',
    'de': '🎡 Tagesrad',
    'fr': '🎡 Roue quotidienne',
    'nl': '🎡 Dagelijks rad',
    'ar': '🎡 العجلة اليومية',
  });
  String get dailyWheelSubtitle => t({
    'tr': 'Günlük ödülünü al!',
    'en': 'Claim your daily reward!',
    'es': '¡Reclama tu recompensa diaria!',
    'de': 'Hol dir deine tägliche Belohnung!',
    'fr': 'Récupère ta récompense quotidienne !',
    'nl': 'Haal je dagelijkse beloning op!',
    'ar': 'احصل على مكافأتك اليومية!',
  });
  String get dailyWheelTryPlusPrize => t({
    'tr': 'Plus Dene',
    'en': 'Try Plus',
    'es': 'Prueba Plus',
    'de': 'Plus testen',
    'fr': 'Essayer Plus',
    'nl': 'Probeer Plus',
    'ar': 'جرّب Plus',
  });
  String dailyWheelCongrats(String icon) => t({
    'tr': '$icon Tebrikler!',
    'en': '$icon Congratulations!',
    'es': '$icon ¡Felicidades!',
    'de': '$icon Glückwunsch!',
    'fr': '$icon Félicitations !',
    'nl': '$icon Gefeliciteerd!',
    'ar': '$icon تهانينا!',
  });
  String dailyWheelXpAwarded(int awarded) => t({
    'tr': '$awarded XP hesabına eklendi!',
    'en': '$awarded XP added to your account!',
    'es': '¡$awarded XP añadidos a tu cuenta!',
    'de': '$awarded XP deinem Konto gutgeschrieben!',
    'fr': '$awarded XP ajoutés à ton compte !',
    'nl': '$awarded XP toegevoegd aan je account!',
    'ar': 'أُضيفت $awarded XP إلى حسابك!',
  });
  String get dailyWheelPlusPitch => t({
    'tr': 'Plus ile sınırsız konuşma ve reklamsız deneyimi keşfet.',
    'en': 'Discover unlimited speaking and an ad-free experience with Plus.',
    'es': 'Descubre conversación ilimitada y una experiencia sin anuncios con Plus.',
    'de': 'Entdecke unbegrenztes Sprechen und ein werbefreies Erlebnis mit Plus.',
    'fr': 'Découvre la conversation illimitée et une expérience sans publicité avec Plus.',
    'nl': 'Ontdek onbeperkt spreken en een advertentievrije ervaring met Plus.',
    'ar': 'اكتشف محادثة غير محدودة وتجربة بلا إعلانات مع Plus.',
  });
  String get dailyWheelGoPlusCta => t({
    'tr': "Plus'a geç",
    'en': 'Go Plus',
    'es': 'Pásate a Plus',
    'de': 'Zu Plus wechseln',
    'fr': 'Passer à Plus',
    'nl': 'Ga voor Plus',
    'ar': 'انتقل إلى Plus',
  });
  String get dailyWheelCollectCta => t({
    'tr': 'Topla',
    'en': 'Collect',
    'es': 'Recoger',
    'de': 'Einsammeln',
    'fr': 'Récupérer',
    'nl': 'Verzamelen',
    'ar': 'اجمع',
  });
  String get dailyWheelSpinningCta => t({
    'tr': 'Dönüyor...',
    'en': 'Spinning...',
    'es': 'Girando...',
    'de': 'Dreht sich...',
    'fr': 'Ça tourne...',
    'nl': 'Draait...',
    'ar': 'يدور...',
  });
  String get dailyWheelComeBackTomorrowCta => t({
    'tr': 'Yarın tekrar!',
    'en': 'Come back tomorrow!',
    'es': '¡Vuelve mañana!',
    'de': 'Komm morgen wieder!',
    'fr': 'Reviens demain !',
    'nl': 'Kom morgen terug!',
    'ar': 'عد غداً!',
  });
  String get dailyWheelSpinCta => t({
    'tr': 'ÇEVİR!',
    'en': 'SPIN!',
    'es': '¡GIRA!',
    'de': 'DREHEN!',
    'fr': 'TOURNER !',
    'nl': 'DRAAIEN!',
    'ar': 'أدر!',
  });
}

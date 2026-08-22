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

  String get home => t({'tr': 'Ana sayfa', 'en': 'Home', 'es': 'Inicio', 'de': 'Start', 'fr': 'Accueil', 'nl': 'Home', 'ar': 'الرئيسية'});
  String get speak => t({'tr': 'Konuş', 'en': 'Speak', 'es': 'Hablar', 'de': 'Sprechen', 'fr': 'Parler', 'nl': 'Spreken', 'ar': 'تحدث'});
  String get clips => t({'tr': 'Klipler', 'en': 'Clips', 'es': 'Clips', 'de': 'Clips', 'fr': 'Extraits', 'nl': 'Clips', 'ar': 'مقاطع'});
  String get translate => t({'tr': 'Çevir', 'en': 'Translate', 'es': 'Traducir', 'de': 'Übersetzen', 'fr': 'Traduire', 'nl': 'Vertalen', 'ar': 'ترجم'});
  String get you => t({'tr': 'Sen', 'en': 'You', 'es': 'Tú', 'de': 'Du', 'fr': 'Toi', 'nl': 'Jij', 'ar': 'أنت'});

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
        return t({'tr': 'İş ve kariyer', 'en': 'Work & career', 'es': 'Trabajo', 'de': 'Beruf', 'fr': 'Travail', 'nl': 'Werk'});
      case Motive.travel:
        return t({'tr': 'Seyahat / taşınma', 'en': 'Travel & moving', 'es': 'Viajar / mudarse', 'de': 'Reisen / Umzug', 'fr': 'Voyage / déménagement', 'nl': 'Reizen / verhuizen'});
      case Motive.exam:
        return t({'tr': 'Sınav', 'en': 'Exams', 'es': 'Exámenes', 'de': 'Prüfungen', 'fr': 'Examens', 'nl': 'Examens'});
      case Motive.life:
        return t({'tr': 'Günlük hayat', 'en': 'Everyday life', 'es': 'Vida diaria', 'de': 'Alltag', 'fr': 'Quotidien', 'nl': 'Dagelijks leven'});
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

  String get review => t({'tr': 'Tekrar', 'en': 'Review', 'es': 'Repaso', 'de': 'Wiederholen', 'fr': 'Réviser', 'nl': 'Herhalen'});
  String get savePhrase => t({'tr': 'Kalıbı kaydet', 'en': 'Save phrase', 'es': 'Guardar frase', 'de': 'Phrase speichern', 'fr': 'Enregistrer', 'nl': 'Zin opslaan'});
  String get typeToTranslate => t({
        'tr': 'Çevirmek için yaz…',
        'en': 'Type to translate…',
        'es': 'Escribe para traducir…',
        'de': 'Zum Übersetzen tippen…',
        'fr': 'Écrire pour traduire…',
        'nl': 'Typ om te vertalen…',
      });

  String get streak => t({'tr': 'Seri', 'en': 'Streak', 'es': 'Racha', 'de': 'Serie', 'fr': 'Série', 'nl': 'Reeks'});
  String get phrases => t({'tr': 'Kalıp', 'en': 'Phrases', 'es': 'Frases', 'de': 'Phrasen', 'fr': 'Phrases', 'nl': 'Zinnen'});
  String get shadow => t({'tr': 'Gölgele', 'en': 'Shadow', 'es': 'Sombra', 'de': 'Schatten', 'fr': 'Ombre', 'nl': 'Schaduw'});
  String get slow => t({'tr': 'Yavaş', 'en': 'Slow', 'es': 'Lento', 'de': 'Langsam', 'fr': 'Lent', 'nl': 'Langzaam'});
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

  // ---------- v1.4: Swipe tekrar akışı ----------

  String get reviewPrompt => t({
        'tr': 'Söyle, sonra aç',
        'en': 'Say it, then reveal',
        'es': 'Dilo y luego muestra',
        'de': 'Sag es, dann aufdecken',
        'fr': 'Dis-le, puis révèle',
        'nl': 'Zeg het, dan onthullen',
        'ar': 'قلها ثم اعرض',
      });

  String get reviewReveal => t({
        'tr': 'Cevabı göster',
        'en': 'Show answer',
        'es': 'Mostrar respuesta',
        'de': 'Antwort zeigen',
        'fr': 'Révéler la réponse',
        'nl': 'Antwoord tonen',
        'ar': 'إظهار الإجابة',
      });

  String get reviewSwipeHint => t({
        'tr': 'Sola kaydır: tekrar · Sağa kaydır: hatırladım',
        'en': 'Swipe left: again · Swipe right: remembered',
        'es': 'Desliza izq: otra vez · Der: recordé',
        'de': 'Links: nochmal · Rechts: gemeint',
        'fr': 'Gauche : à nouveau · Droite : je me souviens',
        'nl': 'Links: opnieuw · Rechts: onthouden',
        'ar': 'اسحب يسارًا: مرة أخرى · يمينًا: تذكرتها',
      });

  String get reviewNoDue => t({
        'tr': 'Bugün tekrar yok. Konuş, kalıp biriksin.',
        'en': 'Nothing to review today. Speak, and phrases will gather.',
        'es': 'Nada por repasar hoy. Habla y las frases se acumularán.',
        'de': 'Heute nichts zu wiederholen. Sprich, die Phrasen sammeln sich.',
        'fr': 'Rien à revoir aujourd’hui. Parle, les phrases s’accumulent.',
        'nl': 'Vandaag niks om te herhalen. Spreek en zinnen verzamelen zich.',
        'ar': 'لا يوجد ما يُعاد اليوم. تحدث وستتراكم العبارات.',
      });

  // Bilişsel etiketler (CognitiveTracker) — UI'da gösterilirse buradan alınır.
  String get cognReflex =>
      t({'tr': 'Refleks', 'en': 'Reflex', 'es': 'Reflejo', 'de': 'Reflex', 'fr': 'Réflexe', 'nl': 'Reflex', 'ar': 'غريزة'});
  String get cognRecall =>
      t({'tr': 'Hatırlama', 'en': 'Recall', 'es': 'Memoria', 'de': 'Erinnerung', 'fr': 'Mémoire', 'nl': 'Terugroep', 'ar': 'تذكّر'});
  String get cognGuess =>
      t({'tr': 'Tahmin', 'en': 'Guess', 'es': 'Suposición', 'de': 'Raten', 'fr': 'Devinettes', 'nl': 'Raden', 'ar': 'تخمين'});
  String get cognLapse =>
      t({'tr': 'Kaçan kart', 'en': 'Lapse', 'es': 'Error', 'de': 'Versagen', 'fr': 'Oubli', 'nl': 'Gemist', 'ar': 'فائت'});

  String get restorePurchases => t({
        'tr': 'Satın alımı geri yükle',
        'en': 'Restore purchases',
        'es': 'Restaurar compras',
        'de': 'Käufe wiederherstellen',
        'fr': 'Restaurer les achats',
        'nl': 'Aankopen herstellen',
        'ar': 'استعادة الشراء',
      });

  String get accent => t({
        'tr': 'Vurgu rengi',
        'en': 'Accent colour',
        'es': 'Color de acento',
        'de': 'Akzentfarbe',
        'fr': 'Couleur d’accent',
        'nl': 'Accentkleur',
        'ar': 'لون التمييز',
      });

  // ---------- v1.4: Gizlilik ekranı (7 dil) ----------

  String get privacyTitle => t({
        'tr': 'Gizlilik',
        'en': 'Privacy',
        'es': 'Privacidad',
        'de': 'Datenschutz',
        'fr': 'Confidentialité',
        'nl': 'Privacy',
        'ar': 'الخصوصية',
      });

  String get privacyBody => t({
        'tr':
            'Konuşma sesi, mümkün olduğunca cihazında işlenir. Ücretsiz katmanda buluta ses göndermeyiz.\n\n'
            'Saklanan: seçtiğin dil, seri, öğrendiğin kalıp kimlikleri. Bu veri telefonda SharedPreferences içindedir.\n\n'
            'Plus bulut çevirisi yalnızca giriş ve aktif abonelikle çalışır; metin çeviri sağlayıcısına gönderilir.\n\n'
            'Free sürümde Google AdMob video reklamları kullanılabilir. Bölgen gerektiriyorsa reklam izni formu gösterilir; Plus kullanıcıya reklam isteği yapılmaz.\n\n'
            'Hesabı sil: Sen → Hesabı sil. Tüm yerel veri silinir.\n\n'
            'Çocuklara yönelik değil (13+).\n\n'
            'İletişim: gizlilik@nura.app (yer tutucu — domain bağlanınca güncellenir).',
        'en':
            'Speech is processed on your device whenever possible. The free tier never sends audio to the cloud.\n\n'
            'What is stored: your chosen language, streak, and the ids of phrases you learned. This data lives in SharedPreferences on your phone.\n\n'
            'Plus cloud translation only works with sign-in and an active subscription; text is sent to the translation provider.\n\n'
            'The free version may show Google AdMob video ads. If your region requires it, an ad permission form is shown; Plus users are never asked for ads.\n\n'
            'Delete account: You → Delete account. All local data is removed.\n\n'
            'Not directed at children (13+).\n\n'
            'Contact: gizlilik@nura.app (placeholder — updated once the domain is connected).',
        'es':
            'El habla se procesa en tu dispositivo siempre que es posible. La capa gratuita nunca envía audio a la nube.\n\n'
            'Lo que se guarda: el idioma elegido, tu racha y los ids de las frases aprendidas. Estos datos viven en SharedPreferences de tu teléfono.\n\n'
            'La traducción en la nube de Plus solo funciona con inicio de sesión y una suscripción activa; el texto se envía al proveedor de traducción.\n\n'
            'La versión gratuita puede mostrar anuncios de video de Google AdMob. Si tu región lo requiere, se muestra un formulario de permiso de anuncios; a los usuarios de Plus nunca se les piden anuncios.\n\n'
            'Eliminar cuenta: Tú → Eliminar cuenta. Se borra todos los datos locales.\n\n'
            'No dirigido a niños (13+).\n\n'
            'Contacto: gizlilik@nura.app (marcador — se actualizará al conectar el dominio).',
        'de':
            'Sprache wird wann immer möglich auf deinem Gerät verarbeitet. Die kostenlose Ebene sendet niemals Audio in die Cloud.\n\n'
            'Gespeichert: deine gewählte Sprache, deine Serie und die IDs gelernter Phrasen. Diese Daten liegen in den SharedPreferences deines Telefons.\n\n'
            'Plus-Cloud-Übersetzung funktioniert nur mit Anmeldung und aktivem Abo; der Text wird an den Übersetzungsanbieter gesendet.\n\n'
            'Die kostenlose Version kann Google-AdMob-Videoanzeigen zeigen. Falls deine Region es verlangt, wird ein Werbe-Einwilligungsformular angezeigt; Plus-Nutzer erhalten nie Werbeanfragen.\n\n'
            'Konto löschen: Du → Konto löschen. Alle lokalen Daten werden entfernt.\n\n'
            'Nicht für Kinder (13+).\n\n'
            'Kontakt: gizlilik@nura.app (Platzhalter — wird aktualisiert, sobald die Domain verbunden ist).',
        'fr':
            'La voix est traitée sur ton appareil dès que possible. L’offre gratuite n’envoie jamais d’audio dans le cloud.\n\n'
            'Ce qui est stocké : ta langue choisie, ta série et les identifiants des phrases apprises. Ces données vivent dans SharedPreferences de ton téléphone.\n\n'
            'La traduction cloud Plus ne fonctionne qu’avec la connexion et un abonnement actif ; le texte est envoyé au fournisseur de traduction.\n\n'
            'La version gratuite peut afficher des publicités vidéo Google AdMob. Si ta région l’exige, un formulaire d’autorisation est montré ; les utilisateurs Plus ne reçoivent jamais de demande de pub.\n\n'
            'Supprimer le compte : Toi → Supprimer le compte. Toutes les données locales sont effacées.\n\n'
            'Non destiné aux enfants (13+).\n\n'
            'Contact : gizlilik@nura.app (réservé — mis à jour dès que le domaine sera connecté).',
        'nl':
            'Spraak wordt zo mogelijk op je apparaat verwerkt. Het gratis niveau stuurt nooit audio naar de cloud.\n\n'
            'Wat wordt bewaard: je gekozen taal, je reeks en de id’s van geleerde zinnen. Deze gegevens zitten in SharedPreferences op je telefoon.\n\n'
            'Plus cloud-vertaling werkt alleen met inloggen en een actief abonnement; de tekst wordt naar de vertaalaanbieding gestuurd.\n\n'
            'De gratis versie kan Google-AdMob-videoadvertenties tonen. Als je regio dat vereist, wordt een advertentieverzoek-formulier getoond; Plus-gebruikers krijgen nooit advertentieverzoeken.\n\n'
            'Account verwijderen: Jij → Account verwijderen. Alle lokale data wordt verwijderd.\n\n'
            'Niet voor kinderen (13+).\n\n'
            'Contact: gizlilik@nura.app (placeholder — wordt bijgewerkt zodra het domein verbonden is).',
        'ar':
            'يتم معالجة الصوت على جهازك كلما أمكن ذلك. لا ترسل النسخة المجانية أي تسجيل صوتي إلى السحابة.\n\n'
            'ما يُخزَّن: اللغة المختارة، سلسلة أيامك، ومعرفات العبارات التي تعلمتها. هذه البيانات في SharedPreferences على هاتفك.\n\n'
            'الترجمة السحابية للـ Plus تعمل فقط مع تسجيل الدخول واشتراك نشط؛ تُرسل النص إلى مزود الترجمة.\n\n'
            'قد تعرض النسخة المجانية إعلانات فيديو Google AdMob. إذا طلبت منطقتك ذلك، يُعرض نموذج إذن الإعلان؛ لا تُطلب إعلانات من مستخدمي Plus أبدًا.\n\n'
            'حذف الحساب: أنت → حذف الحساب. تُحذف جميع البيانات المحلية.\n\n'
            'ليس موجّهًا للأطفال (13+).\n\n'
            'التواصل: gizlilik@nura.app (موقع مؤقت — يُحدَّث عند ربط النطاق).',
      });
}

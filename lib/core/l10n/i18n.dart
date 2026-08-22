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

  // ── Hukuki ekranlar ────────────────────────────────────────────────
  String get privacyPolicy => t({
        'tr': 'Gizlilik Politikası',
        'en': 'Privacy Policy',
        'es': 'Política de privacidad',
        'de': 'Datenschutzerklärung',
        'fr': 'Politique de confidentialité',
        'nl': 'Privacybeleid',
        'ar': 'سياسة الخصوصية',
      });

  String get termsOfService => t({
        'tr': 'Kullanım Şartları',
        'en': 'Terms of Service',
        'es': 'Términos del servicio',
        'de': 'Nutzungsbedingungen',
        'fr': 'Conditions d’utilisation',
        'nl': 'Gebruiksvoorwaarden',
        'ar': 'شروط الاستخدام',
      });

  String get privacyBody => t({
        'tr': '1. Toplanan Bilgiler\n'
            'NURA, dil tercihlerini, öğrenme istatistiklerini, başarımları ve tekrar verilerini cihazında saklar. Konuşma sesi mümkün olduğunca cihazında işlenir. İsteğe bağlı senkron açıksa veriler NURA sunucularına iletilebilir.\n\n'
            '2. Verilerin Kullanımı\n'
            'Verilerin yalnızca öğrenme deneyimini sağlamak için kullanılır. Kişisel veriler satılmaz veya alakasız reklamcılıkta kullanılmaz.\n\n'
            '3. Saklama ve Silme\n'
            'Hesabını ve yerel verilerini profil menüsünden dilediğin zaman silebilirsin. Silinen veriler geri getirilemez.\n\n'
            '4. İletişim\n'
            'Gizlilik talepleri için gizlilik@nura.app adresine yazabilirsin. Talepler makul sürede yanıtlanır.',
        'en': '1. Information We Collect\n'
            'NURA stores your language preferences, learning statistics, achievements and review data on your device. Speech audio is processed on-device whenever possible. If optional sync is enabled, this data may be transmitted to NURA servers.\n\n'
            '2. How We Use Data\n'
            'Your data is used only to provide the learning experience. We do not sell personal data or use it for unrelated advertising.\n\n'
            '3. Data Retention and Deletion\n'
            'You can delete your account and local data at any time from the profile menu. Deleted data cannot be recovered.\n\n'
            '4. Contact\n'
            'For privacy requests, contact privacy@nura.app. We respond within a reasonable time.',
        'es': '1. Información que recopilamos\n'
            'NURA guarda tus preferencias de idioma, estadísticas, logros y datos de repaso en tu dispositivo. Si activas la sincronización opcional, estos datos pueden enviarse a los servidores de NURA.\n\n'
            '2. Uso de los datos\n'
            'Tus datos solo se usan para ofrecer la experiencia de aprendizaje. No vendemos datos personales ni los usamos para publicidad no relacionada.\n\n'
            '3. Conservación y eliminación\n'
            'Puedes eliminar tu cuenta y tus datos locales en cualquier momento desde el menú de perfil.\n\n'
            '4. Contacto\n'
            'Para solicitudes de privacidad: privacy@nura.app.',
        'de': '1. Erhobene Daten\n'
            'NURA speichert Sprachpräferenzen, Lernstatistiken, Erfolge und Wiederholungsdaten auf deinem Gerät. Wenn die optionale Synchronisierung aktiv ist, können Daten an NURA-Server übertragen werden.\n\n'
            '2. Verwendung der Daten\n'
            'Deine Daten werden nur zur Bereitstellung des Lernerlebnisses verwendet. Wir verkaufen keine personenbezogenen Daten.\n\n'
            '3. Speicherung und Löschung\n'
            'Du kannst dein Konto und lokale Daten jederzeit im Profilmenü löschen.\n\n'
            '4. Kontakt\n'
            'Datenschutzanfragen: privacy@nura.app.',
        'fr': '1. Informations collectées\n'
            'NURA stocke vos préférences, statistiques, succès et données de révision sur votre appareil. Si la synchronisation facultative est activée, ces données peuvent être transmises aux serveurs NURA.\n\n'
            '2. Utilisation des données\n'
            'Vos données servent uniquement à fournir l’expérience d’apprentissage. Nous ne vendons pas de données personnelles.\n\n'
            '3. Conservation et suppression\n'
            'Vous pouvez supprimer votre compte et vos données locales à tout moment depuis le menu profil.\n\n'
            '4. Contact\n'
            'Demandes de confidentialité : privacy@nura.app.',
        'nl': '1. Verzamelde gegevens\n'
            'NURA bewaart je taalvoorkeuren, leerstatistieken, prestaties en herhaalgegevens op je apparaat. Als optionele synchronisatie aan staat, kunnen gegevens naar NURA-servers worden verzonden.\n\n'
            '2. Gebruik van gegevens\n'
            'Je gegevens worden alleen gebruikt om de leerervaring te bieden. We verkopen geen persoonlijke gegevens.\n\n'
            '3. Bewaring en verwijdering\n'
            'Je kunt je account en lokale gegevens altijd verwijderen via het profielmenu.\n\n'
            '4. Contact\n'
            'Privacyverzoeken: privacy@nura.app.',
        'ar': '1. المعلومات التي نجمعها\n'
            'تخزن NURA تفضيلاتك اللغوية وإحصاءات التعلم والإنجازات وبيانات المراجعة على جهازك. إذا كانت المزامنة الاختيارية مفعلة، فقد تُرسل هذه البيانات إلى خوادم NURA.\n\n'
            '2. استخدام البيانات\n'
            'تُستخدم بياناتك فقط لتقديم تجربة التعلم. لا نبيع البيانات الشخصية.\n\n'
            '3. الاحتفاظ بالبيانات وحذفها\n'
            'يمكنك حذف حسابك وبياناتك المحلية في أي وقت من قائمة الملف الشخصي.\n\n'
            '4. التواصل\n'
            'لطلبات الخصوصية: privacy@nura.app.',
      });

  String get termsBody => t({
        'tr': '1. Şartların Kabulü\n'
            'NURA’yı kullanarak bu şartları kabul etmiş olursun. Kabul etmiyorsan lütfen uygulamayı kullanmayı bırak.\n\n'
            '2. Uygulama Kullanımı\n'
            'NURA kişisel dil öğrenimi için sunulur. Uygulamayı tersine mühendislik, yeniden satma veya kötüye kullanma hakkın yoktur.\n\n'
            '3. Değişiklikler\n'
            'Bu şartlar gelecek sürümlerde güncellenebilir. Değişiklikten sonra kullanıma devam etmen, yeni şartları kabul ettiğin anlamına gelir.',
        'en': '1. Acceptance of Terms\n'
            'By using NURA, you accept these terms. If you do not agree, please stop using the application.\n\n'
            '2. Use of the App\n'
            'NURA is provided for personal language learning. You may not reverse engineer, resell or misuse the application.\n\n'
            '3. Changes\n'
            'These terms may be updated in future versions. Continued use after changes means acceptance of the new terms.',
        'es': '1. Aceptación de los términos\n'
            'Al usar NURA aceptas estos términos. Si no estás de acuerdo, deja de usar la aplicación.\n\n'
            '2. Uso de la aplicación\n'
            'NURA se ofrece para el aprendizaje personal de idiomas. No puedes realizar ingeniería inversa, revender ni hacer mal uso de la aplicación.\n\n'
            '3. Cambios\n'
            'Estos términos pueden actualizarse en futuras versiones.',
        'de': '1. Annahme der Bedingungen\n'
            'Mit der Nutzung von NURA akzeptierst du diese Bedingungen. Wenn du nicht einverstanden bist, beende die Nutzung.\n\n'
            '2. Nutzung der App\n'
            'NURA dient dem persönlichen Sprachenlernen. Reverse Engineering, Weiterverkauf oder Missbrauch sind untersagt.\n\n'
            '3. Änderungen\n'
            'Diese Bedingungen können in zukünftigen Versionen aktualisiert werden.',
        'fr': '1. Acceptation des conditions\n'
            'En utilisant NURA, vous acceptez ces conditions. Si vous n’êtes pas d’accord, cessez d’utiliser l’application.\n\n'
            '2. Utilisation de l’application\n'
            'NURA est destinée à l’apprentissage personnel des langues. Toute ingénierie inverse, revente ou utilisation abusive est interdite.\n\n'
            '3. Modifications\n'
            'Ces conditions peuvent être mises à jour dans les versions futures.',
        'nl': '1. Aanvaarding van voorwaarden\n'
            'Door NURA te gebruiken aanvaardt u deze voorwaarden. Als u het niet eens bent, stop dan met de app.\n\n'
            '2. Gebruik van de app\n'
            'NURA is bedoeld voor persoonlijk taalonderwijs. Reverse-engineering, doorverkoop of misbruik is niet toegestaan.\n\n'
            '3. Wijzigingen\n'
            'Deze voorwaarden kunnen in toekomstige versies worden bijgewerkt.',
        'ar': '1. قبول الشروط\n'
            'باستخدام NURA فإنك تقبل هذه الشروط. إذا لم توافق، يرجى التوقف عن استخدام التطبيق.\n\n'
            '2. استخدام التطبيق\n'
            'NURA مخصصة للتعلم الشخصي للغات. لا يحق لك إجراء هندسة عكسية أو إعادة بيع التطبيق أو إساءة استخدامه.\n\n'
            '3. التغييرات\n'
            'قد يتم تحديث هذه الشروط في الإصدارات المستقبلية.',
      });

  // ── Durum widget'ları ──────────────────────────────────────────────
  String get retry => t({
        'tr': 'Tekrar dene',
        'en': 'Retry',
        'es': 'Reintentar',
        'de': 'Erneut versuchen',
        'fr': 'Réessayer',
        'nl': 'Opnieuw proberen',
        'ar': 'إعادة المحاولة',
      });

  String get offline => t({
        'tr': 'İnternet bağlantın yok.',
        'en': 'You are offline.',
        'es': 'Estás sin conexión.',
        'de': 'Du bist offline.',
        'fr': 'Vous êtes hors ligne.',
        'nl': 'Je bent offline.',
        'ar': 'أنت غير متصل بالإنترنت.',
      });
}

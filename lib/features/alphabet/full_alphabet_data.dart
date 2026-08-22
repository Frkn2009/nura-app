class AlphabetData {
  static final Map<String, List<AlphabetChar>> all = {
    // ARAPÇA (28 Harf + 3 Hareke)
    'ar': [
      AlphabetChar(char: 'ا', name: 'Elif', nameLocal: 'أَلِف', sound: 'a/aa', turkish: 'A sesi', example: 'أَسَدٌ (asadun - aslan)', type: CharType.letter),
      AlphabetChar(char: 'ب', name: 'Ba', nameLocal: 'بَاء', sound: 'b', turkish: 'B sesi', example: 'بَابٌ (babun - kapı)', type: CharType.letter),
      AlphabetChar(char: 'ت', name: 'Ta', nameLocal: 'تَاء', sound: 't', turkish: 'T sesi', example: 'تَمْرٌ (tamrun - hurma)', type: CharType.letter),
      AlphabetChar(char: 'ث', name: 'Sa', nameLocal: 'ثَاء', sound: 's (kalın)', turkish: 'S sesi (kalın)', example: 'ثَعْلَبٌ (sa\'labun - tilki)', type: CharType.letter),
      AlphabetChar(char: 'ج', name: 'Cim', nameLocal: 'جِيم', sound: 'c/ccc', turkish: 'C sesi', example: 'جَمَلٌ (camalun - deve)', type: CharType.letter),
      AlphabetChar(char: 'ح', name: 'Ha', nameLocal: 'حَاء', sound: 'h (derin)', turkish: 'H sesi (nefesli)', example: 'حَسَنٌ (hasanun - güzel)', type: CharType.letter),
      AlphabetChar(char: 'خ', name: 'Hu', nameLocal: 'خَاء', sound: 'h/x', turkish: 'H sesi (yumuşak)', example: 'خُبْزٌ (hubzun - ekmek)', type: CharType.letter),
      AlphabetChar(char: 'د', name: 'Dal', nameLocal: 'دَال', sound: 'd', turkish: 'D sesi', example: 'دَارٌ (daarun - ev)', type: CharType.letter),
      AlphabetChar(char: 'ذ', name: 'Zal', nameLocal: 'ذَال', sound: 'z (kalın)', turkish: 'Z sesi (kalın)', example: 'ذِهَابٌ (zihaabun - gitmek)', type: CharType.letter),
      AlphabetChar(char: 'ر', name: 'Ra', nameLocal: 'رَاء', sound: 'r', turkish: 'R sesi', example: 'رَجُلٌ (raculun - adam)', type: CharType.letter),
      AlphabetChar(char: 'ز', name: 'Ze', nameLocal: 'زَاي', sound: 'z', turkish: 'Z sesi', example: 'زَيْتٌ (zaytun - zeytin)', type: CharType.letter),
      AlphabetChar(char: 'س', name: 'Sin', nameLocal: 'سِين', sound: 's', turkish: 'S sesi', example: 'سَمَاءٌ (samaa\'un - gökyüzü)', type: CharType.letter),
      AlphabetChar(char: 'ش', name: 'Şin', nameLocal: 'شِين', sound: 'ş', turkish: 'Ş sesi', example: 'شَمْسٌ (şamsun - güneş)', type: CharType.letter),
      AlphabetChar(char: 'ص', name: 'Sat', nameLocal: 'صَاد', sound: 's (kalın)', turkish: 'S sesi (gırtlaktan)', example: 'صَبْرٌ (sabrun - sabır)', type: CharType.letter),
      AlphabetChar(char: 'ض', name: 'Dat', nameLocal: 'ضَاد', sound: 'd (kalın)', turkish: 'D sesi (yanak)', example: 'ضَرْبٌ (darbun - vurmak)', type: CharType.letter),
      AlphabetChar(char: 'ط', name: 'Tı', nameLocal: 'طَاء', sound: 't (kalın)', turkish: 'T sesi (gırtlaktan)', example: 'طَالِبٌ (talibun - öğrenci)', type: CharType.letter),
      AlphabetChar(char: 'ظ', name: 'Zı', nameLocal: 'ظَاء', sound: 'z (kalın)', turkish: 'Z sesi (gırtlaktan)', example: 'ظَرْفٌ (zarfun - zarf)', type: CharType.letter),
      AlphabetChar(char: 'ع', name: 'Ayn', nameLocal: 'عَين', sound: '\' (gırtlak)', turkish: 'Gırtlak sesi', example: 'عَيْنٌ (\'aymun - göz)', type: CharType.letter),
      AlphabetChar(char: 'غ', name: 'Gayn', nameLocal: 'غَين', sound: 'ğ/g', turkish: 'G (yumuşak G)', example: 'غُرْفَةٌ (ğurfatun - oda)', type: CharType.letter),
      AlphabetChar(char: 'ف', name: 'Fa', nameLocal: 'فَاء', sound: 'f', turkish: 'F sesi', example: 'فَرَاشَةٌ (faraaşatun - kelebek)', type: CharType.letter),
      AlphabetChar(char: 'ق', name: 'Kaf', nameLocal: 'قَاف', sound: 'k/q', turkish: 'K sesi (gırtlaktan)', example: 'قَلَمٌ (qalamun - kalem)', type: CharType.letter),
      AlphabetChar(char: 'ك', name: 'Kef', nameLocal: 'كَاف', sound: 'k', turkish: 'K sesi', example: 'كِتَابٌ (kitaabun - kitap)', type: CharType.letter),
      AlphabetChar(char: 'ل', name: 'Lam', nameLocal: 'لَام', sound: 'l', turkish: 'L sesi', example: 'لَيْلَةٌ (laylatun - gece)', type: CharType.letter),
      AlphabetChar(char: 'م', name: 'Mim', nameLocal: 'مِيم', sound: 'm', turkish: 'M sesi', example: 'مَاءٌ (maa\'un - su)', type: CharType.letter),
      AlphabetChar(char: 'ن', name: 'Nun', nameLocal: 'نُون', sound: 'n', turkish: 'N sesi', example: 'نَهْرٌ (nahrun - nehir)', type: CharType.letter),
      AlphabetChar(char: 'ه', name: 'He', nameLocal: 'هَاء', sound: 'h', turkish: 'H sesi', example: 'هَاتِفٌ (haatifun - telefon)', type: CharType.letter),
      AlphabetChar(char: 'و', name: 'Vav', nameLocal: 'وَاو', sound: 'w/v/o/u', turkish: 'V veya O/U sesi', example: 'وَلَدٌ (waladun - çocuk)', type: CharType.letter),
      AlphabetChar(char: 'ي', name: 'Ye', nameLocal: 'يَاء', sound: 'y/i', turkish: 'Y veya İ sesi', example: 'يَدٌ (yaddun - el)', type: CharType.letter),
      // Hareke (Türkçe karşılığı yok, Arapça okuma için şart)
      AlphabetChar(char: 'َ', name: 'Fetha', nameLocal: 'فَتْحَة', sound: 'a', turkish: 'A sesi verir', example: 'بَ = ba', type: CharType.harakat),
      AlphabetChar(char: 'ِ', name: 'Kesre', nameLocal: 'كَسْرَة', sound: 'i', turkish: 'İ/I sesi verir', example: 'بِ = bi', type: CharType.harakat),
      AlphabetChar(char: 'ُ', name: 'Damme', nameLocal: 'ضَمَّة', sound: 'u', turkish: 'U/O sesi verir', example: 'بُ = bu', type: CharType.harakat),
    ],

    // RUSÇA KİRİL (33 Harf)
    'ru': [
      AlphabetChar(char: 'А', name: 'A', nameLocal: 'А', sound: 'a', turkish: 'A', example: 'Аист (aist - leylek)', type: CharType.letter),
      AlphabetChar(char: 'Б', name: 'Be', nameLocal: 'Бэ', sound: 'b', turkish: 'B', example: 'Банка (banka - kavanoz)', type: CharType.letter),
      AlphabetChar(char: 'В', name: 'Ve', nameLocal: 'Вэ', sound: 'v', turkish: 'V', example: 'Вода (voda - su)', type: CharType.letter),
      AlphabetChar(char: 'Г', name: 'Ge', nameLocal: 'Гэ', sound: 'g', turkish: 'G', example: 'Город (gorod - şehir)', type: CharType.letter),
      AlphabetChar(char: 'Д', name: 'De', nameLocal: 'Дэ', sound: 'd', turkish: 'D', example: 'Дом (dom - ev)', type: CharType.letter),
      AlphabetChar(char: 'Е', name: 'Ye', nameLocal: 'Е', sound: 'ye', turkish: 'YE', example: 'Ель (yel\' - ladin)', type: CharType.letter),
      AlphabetChar(char: 'Ё', name: 'Yo', nameLocal: 'Ё', sound: 'yo', turkish: 'YO', example: 'Ёлка (yolka - Noel ağacı)', type: CharType.letter),
      AlphabetChar(char: 'Ж', name: 'Je', nameLocal: 'Жэ', sound: 'j', turkish: 'J', example: 'Жук (juk - böcek)', type: CharType.letter),
      AlphabetChar(char: 'З', name: 'Ze', nameLocal: 'Зэ', sound: 'z', turkish: 'Z', example: 'Закон (zakon - yasa)', type: CharType.letter),
      AlphabetChar(char: 'И', name: 'İ', nameLocal: 'И', sound: 'i', turkish: 'İ', example: 'Игла (igla - iğne)', type: CharType.letter),
      AlphabetChar(char: 'Й', name: 'İ kratkoye', nameLocal: 'И краткое', sound: 'y', turkish: 'Kısa Y', example: 'Йогурт (yogurt - yoğurt)', type: CharType.letter),
      AlphabetChar(char: 'К', name: 'Ka', nameLocal: 'Кэ', sound: 'k', turkish: 'K', example: 'Книга (kniga - kitap)', type: CharType.letter),
      AlphabetChar(char: 'Л', name: 'El', nameLocal: 'Эль', sound: 'l', turkish: 'L', example: 'Лампа (lampa - lamba)', type: CharType.letter),
      AlphabetChar(char: 'М', name: 'Em', nameLocal: 'Эм', sound: 'm', turkish: 'M', example: 'Мама (mama - anne)', type: CharType.letter),
      AlphabetChar(char: 'Н', name: 'En', nameLocal: 'Эн', sound: 'n', turkish: 'N', example: 'Нос (nos - burun)', type: CharType.letter),
      AlphabetChar(char: 'О', name: 'O', nameLocal: 'О', sound: 'o', turkish: 'O', example: 'Окно (okno - pencere)', type: CharType.letter),
      AlphabetChar(char: 'П', name: 'Pe', nameLocal: 'Пэ', sound: 'p', turkish: 'P', example: 'Парк (park - park)', type: CharType.letter),
      AlphabetChar(char: 'Р', name: 'Er', nameLocal: 'Эр', sound: 'r', turkish: 'R (tekli)', example: 'Рука (ruka - el)', type: CharType.letter),
      AlphabetChar(char: 'С', name: 'Es', nameLocal: 'Эс', sound: 's', turkish: 'S', example: 'Сок (sok - meyve suyu)', type: CharType.letter),
      AlphabetChar(char: 'Т', name: 'Te', nameLocal: 'Тэ', sound: 't', turkish: 'T', example: 'Торт (tort - pasta)', type: CharType.letter),
      AlphabetChar(char: 'У', name: 'U', nameLocal: 'У', sound: 'u', turkish: 'U', example: 'Ухо (uho - kulak)', type: CharType.letter),
      AlphabetChar(char: 'Ф', name: 'Ef', nameLocal: 'Эф', sound: 'f', turkish: 'F', example: 'Фрукт (frukt - meyve)', type: CharType.letter),
      AlphabetChar(char: 'Х', name: 'Ha', nameLocal: 'Ха', sound: 'h', turkish: 'H', example: 'Хлеб (hleb - ekmek)', type: CharType.letter),
      AlphabetChar(char: 'Ц', name: 'Tse', nameLocal: 'Цэ', sound: 'ts', turkish: 'TS', example: 'Цветок (tsvetok - çiçek)', type: CharType.letter),
      AlphabetChar(char: 'Ч', name: 'Çe', nameLocal: 'Чэ', sound: 'ç', turkish: 'Ç', example: 'Чай (çay - çay)', type: CharType.letter),
      AlphabetChar(char: 'Ш', name: 'Şa', nameLocal: 'Ша', sound: 'ş', turkish: 'Ş', example: 'Школа (şkola - okul)', type: CharType.letter),
      AlphabetChar(char: 'Щ', name: 'Şça', nameLocal: 'Ща', sound: 'şç', turkish: 'ŞÇ', example: 'Щука (şçuka - turna balığı)', type: CharType.letter),
      AlphabetChar(char: 'Ъ', name: 'Tvyordiy znak', nameLocal: 'Твёрдый знак', sound: 'sert işaret', turkish: 'Sert işaret', example: 'объект (obyekt)', type: CharType.sign),
      AlphabetChar(char: 'Ы', name: 'Yı', nameLocal: 'Ы', sound: 'ı', turkish: 'I', example: 'Мышь (mış - fare)', type: CharType.letter),
      AlphabetChar(char: 'Ь', name: 'Myagkiy znak', nameLocal: 'Мягкий знак', sound: 'yumuşak', turkish: 'Yumuşak işaret', example: 'конь (kon\' - at)', type: CharType.sign),
      AlphabetChar(char: 'Э', name: 'E', nameLocal: 'Э', sound: 'e', turkish: 'E', example: 'Это (eto - bu)', type: CharType.letter),
      AlphabetChar(char: 'Ю', name: 'Yu', nameLocal: 'Ю', sound: 'yu', turkish: 'YU', example: 'Юг (yug - güney)', type: CharType.letter),
      AlphabetChar(char: 'Я', name: 'Ya', nameLocal: 'Я', sound: 'ya', turkish: 'YA', example: 'Яблоко (yabloko - elma)', type: CharType.letter),
    ],

    // JAPONCA HİRAGANA (46 Harf + 25 Dakuten)
    'ja': [
      // Sesli harfler (a, i, u, e, o)
      AlphabetChar(char: 'あ', name: 'a', nameLocal: 'ア', sound: 'a', turkish: 'A', example: 'あさ (asa - sabah)', type: CharType.vowel),
      AlphabetChar(char: 'い', name: 'i', nameLocal: 'イ', sound: 'i', turkish: 'İ', example: 'いぬ (inu - köpek)', type: CharType.vowel),
      AlphabetChar(char: 'う', name: 'u', nameLocal: 'ウ', sound: 'u', turkish: 'U', example: 'うみ (umi - deniz)', type: CharType.vowel),
      AlphabetChar(char: 'え', name: 'e', nameLocal: 'エ', sound: 'e', turkish: 'E', example: 'えき (eki - istasyon)', type: CharType.vowel),
      AlphabetChar(char: 'お', name: 'o', nameLocal: 'オ', sound: 'o', turkish: 'O', example: 'おちゃ (ocha - çay)', type: CharType.vowel),
      // K-sertleri (ka, ki, ku, ke, ko)
      AlphabetChar(char: 'か', name: 'ka', nameLocal: 'カ', sound: 'ka', turkish: 'KA', example: 'かさ (kasa - şemsiye)', type: CharType.consonantK),
      AlphabetChar(char: 'き', name: 'ki', nameLocal: 'キ', sound: 'ki', turkish: 'Kİ', example: 'きもの (kimono - kimono)', type: CharType.consonantK),
      AlphabetChar(char: 'く', name: 'ku', nameLocal: 'ク', sound: 'ku', turkish: 'KU', example: 'くに (kuni - ülke)', type: CharType.consonantK),
      AlphabetChar(char: 'け', name: 'ke', nameLocal: 'ケ', sound: 'ke', turkish: 'KE', example: 'けさ (kesa - bu sabah)', type: CharType.consonantK),
      AlphabetChar(char: 'こ', name: 'ko', nameLocal: 'コ', sound: 'ko', turkish: 'KO', example: 'こえ (koe - ses)', type: CharType.consonantK),
      // S-sertleri
      AlphabetChar(char: 'さ', name: 'sa', nameLocal: 'サ', sound: 'sa', turkish: 'SA', example: 'さくら (sakura - kiraz çiçeği)', type: CharType.consonantS),
      AlphabetChar(char: 'し', name: 'shi', nameLocal: 'シ', sound: 'şi', turkish: 'Şİ', example: 'しお (şio - tuz)', type: CharType.consonantS),
      AlphabetChar(char: 'す', name: 'su', nameLocal: 'ス', sound: 'su', turkish: 'SU', example: 'すし (sushi - suşi)', type: CharType.consonantS),
      AlphabetChar(char: 'せ', name: 'se', nameLocal: 'セ', sound: 'se', turkish: 'SE', example: 'せんせい (sensei - öğretmen)', type: CharType.consonantS),
      AlphabetChar(char: 'そ', name: 'so', nameLocal: 'ソ', sound: 'so', turkish: 'SO', example: 'そら (sora - gökyüzü)', type: CharType.consonantS),
      // T-sertleri
      AlphabetChar(char: 'た', name: 'ta', nameLocal: 'タ', sound: 'ta', turkish: 'TA', example: 'たまご (tamago - yumurta)', type: CharType.consonantT),
      AlphabetChar(char: 'ち', name: 'chi', nameLocal: 'チ', sound: 'çi', turkish: 'Çİ', example: 'ちず (çizu - harita)', type: CharType.consonantT),
      AlphabetChar(char: 'つ', name: 'tsu', nameLocal: 'ツ', sound: 'tsu', turkish: 'TSU', example: 'つき (tsuki - ay)', type: CharType.consonantT),
      AlphabetChar(char: 'て', name: 'te', nameLocal: 'テ', sound: 'te', turkish: 'TE', example: 'てがみ (tegami - mektup)', type: CharType.consonantT),
      AlphabetChar(char: 'と', name: 'to', nameLocal: 'ト', sound: 'to', turkish: 'TO', example: 'とり (tori - kuş)', type: CharType.consonantT),
      // N
      AlphabetChar(char: 'な', name: 'na', nameLocal: 'ナ', sound: 'na', turkish: 'NA', example: 'なつ (natsu - yaz)', type: CharType.consonantN),
      AlphabetChar(char: 'に', name: 'ni', nameLocal: 'ニ', sound: 'ni', turkish: 'Nİ', example: 'にほん (nihon - Japonya)', type: CharType.consonantN),
      AlphabetChar(char: 'ぬ', name: 'nu', nameLocal: 'ヌ', sound: 'nu', turkish: 'NU', example: 'いぬ (inu - köpek)', type: CharType.consonantN),
      AlphabetChar(char: 'ね', name: 'ne', nameLocal: 'ネ', sound: 'ne', turkish: 'NE', example: 'ねこ (neko - kedi)', type: CharType.consonantN),
      AlphabetChar(char: 'の', name: 'no', nameLocal: 'ノ', sound: 'no', turkish: 'NO', example: 'のみもの (nomimono - içecek)', type: CharType.consonantN),
      // H-sertleri
      AlphabetChar(char: 'は', name: 'ha', nameLocal: 'ハ', sound: 'ha', turkish: 'HA', example: 'はな (hana - çiçek)', type: CharType.consonantH),
      AlphabetChar(char: 'ひ', name: 'hi', nameLocal: 'ヒ', sound: 'hi', turkish: 'Hİ', example: 'ひと (hito - insan)', type: CharType.consonantH),
      AlphabetChar(char: 'ふ', name: 'fu', nameLocal: 'フ', sound: 'fu', turkish: 'FÜ', example: 'ふゆ (fuyu - kış)', type: CharType.consonantH),
      AlphabetChar(char: 'へ', name: 'he', nameLocal: 'ヘ', sound: 'he', turkish: 'HE', example: 'へや (heya - oda)', type: CharType.consonantH),
      AlphabetChar(char: 'ほ', name: 'ho', nameLocal: 'ホ', sound: 'ho', turkish: 'HO', example: 'ほん (hon - kitap)', type: CharType.consonantH),
      // M-sertleri
      AlphabetChar(char: 'ま', name: 'ma', nameLocal: 'マ', sound: 'ma', turkish: 'MA', example: 'まど (mado - pencere)', type: CharType.consonantM),
      AlphabetChar(char: 'み', name: 'mi', nameLocal: 'ミ', sound: 'mi', turkish: 'Mİ', example: 'みず (mizu - su)', type: CharType.consonantM),
      AlphabetChar(char: 'む', name: 'mu', nameLocal: 'ム', sound: 'mu', turkish: 'MU', example: 'むら (mura - köy)', type: CharType.consonantM),
      AlphabetChar(char: 'め', name: 'me', nameLocal: 'メ', sound: 'me', turkish: 'ME', example: 'め (me - göz)', type: CharType.consonantM),
      AlphabetChar(char: 'も', name: 'mo', nameLocal: 'モ', sound: 'mo', turkish: 'MO', example: 'もり (mori - orman)', type: CharType.consonantM),
      // Y-sertleri
      AlphabetChar(char: 'や', name: 'ya', nameLocal: 'ヤ', sound: 'ya', turkish: 'YA', example: 'やま (yama - dağ)', type: CharType.consonantY),
      AlphabetChar(char: 'ゆ', name: 'yu', nameLocal: 'ユ', sound: 'yu', turkish: 'YÜ', example: 'ゆき (yuki - kar)', type: CharType.consonantY),
      AlphabetChar(char: 'よ', name: 'yo', nameLocal: 'ヨ', sound: 'yo', turkish: 'YO', example: 'よる (yoru - gece)', type: CharType.consonantY),
      // R-sertleri
      AlphabetChar(char: 'ら', name: 'ra', nameLocal: 'ラ', sound: 'ra', turkish: 'RA', example: 'らいねん (rainen - gelecek yıl)', type: CharType.consonantR),
      AlphabetChar(char: 'り', name: 'ri', nameLocal: 'リ', sound: 'ri', turkish: 'Rİ', example: 'りくつ (rikuu - mantık)', type: CharType.consonantR),
      AlphabetChar(char: 'る', name: 'ru', nameLocal: 'ル', sound: 'ru', turkish: 'RU', example: 'るす (rusu - evde yokluk)', type: CharType.consonantR),
      AlphabetChar(char: 'れ', name: 're', nameLocal: 'レ', sound: 're', turkish: 'RE', example: 'れきし (rekisi - tarih)', type: CharType.consonantR),
      AlphabetChar(char: 'ろ', name: 'ro', nameLocal: 'ロ', sound: 'ro', turkish: 'RO', example: 'ろく (roku - altı)', type: CharType.consonantR),
      // W-sertleri
      AlphabetChar(char: 'わ', name: 'wa', nameLocal: 'ワ', sound: 'wa', turkish: 'VA', example: 'わたし (vaţi - ben)', type: CharType.consonantW),
      // N (tek başına)
      AlphabetChar(char: 'ん', name: 'n', nameLocal: 'ン', sound: 'n', turkish: 'N', example: 'にほん (nihon - Japonya)', type: CharType.consonantN),
    ],

    // KORECE HANGUL (40 Harf - 19 ünsüz + 21 ünlü)
    'ko': [
      // Ünsüzler (자음)
      AlphabetChar(char: 'ㄱ', name: 'giyeok', nameLocal: '기역', sound: 'g/k', turkish: 'G/K (sert)', example: '가다 (gada - gitmek)', type: CharType.consonant),
      AlphabetChar(char: 'ㄴ', name: 'nieun', nameLocal: '니은', sound: 'n', turkish: 'N', example: '나 (na - ben)', type: CharType.consonant),
      AlphabetChar(char: 'ㄷ', name: 'digeut', nameLocal: '디귿', sound: 'd/t', turkish: 'D/T (sert)', example: '다 (da - burada)', type: CharType.consonant),
      AlphabetChar(char: 'ㄹ', name: 'rieul', nameLocal: '리을', sound: 'r/l', turkish: 'R/L', example: '라 (ra - oran)', type: CharType.consonant),
      AlphabetChar(char: 'ㅁ', name: 'mieum', nameLocal: '미음', sound: 'm', turkish: 'M', example: '마 (ma - at)', type: CharType.consonant),
      AlphabetChar(char: 'ㅂ', name: 'bieup', nameLocal: '비읍', sound: 'b/p', turkish: 'B/P', example: '바 (ba - bar)', type: CharType.consonant),
      AlphabetChar(char: 'ㅅ', name: 'siot', nameLocal: '시옷', sound: 's', turkish: 'S', example: '사 (sa - dört)', type: CharType.consonant),
      AlphabetChar(char: 'ㅇ', name: 'ieung', nameLocal: '이응', sound: 'sessiz/i', turkish: 'Sessiz/İ', example: '아 (a - ah)', type: CharType.consonant),
      AlphabetChar(char: 'ㅈ', name: 'jieut', nameLocal: '지읒', sound: 'c', turkish: 'C', example: '자 (ca - çocuk)', type: CharType.consonant),
      AlphabetChar(char: 'ㅊ', name: 'chieut', nameLocal: '치읓', sound: 'ç', turkish: 'Ç', example: '차 (ça - araba)', type: CharType.consonant),
      AlphabetChar(char: 'ㅋ', name: 'kieuk', nameLocal: '키읔', sound: 'k (sert)', turkish: 'K (sert)', example: '카 (ka - ka)', type: CharType.consonant),
      AlphabetChar(char: 'ㅌ', name: 'tieut', nameLocal: '티읕', sound: 't (sert)', turkish: 'T (sert)', example: '타 (ta - taban)', type: CharType.consonant),
      AlphabetChar(char: 'ㅍ', name: 'pieup', nameLocal: '피읕', sound: 'p', turkish: 'P', example: '파 (pa - armut)', type: CharType.consonant),
      AlphabetChar(char: 'ㅎ', name: 'hieut', nameLocal: '히읗', sound: 'h', turkish: 'H', example: '하 (ha - aşağı)', type: CharType.consonant),
      // Ünlüler (모음)
      AlphabetChar(char: 'ㅏ', name: 'a', nameLocal: '아', sound: 'a', turkish: 'A', example: '가 (ka - gitmek)', type: CharType.vowel),
      AlphabetChar(char: 'ㅑ', name: 'ya', nameLocal: '야', sound: 'ya', turkish: 'YA', example: '야 (ya - gece)', type: CharType.vowel),
      AlphabetChar(char: 'ㅓ', name: 'eo', nameLocal: '어', sound: 'eo', turkish: 'E/O', example: '어 (eo - anne)', type: CharType.vowel),
      AlphabetChar(char: 'ㅕ', name: 'yeo', nameLocal: '여', sound: 'yeo', turkish: 'YE', example: '여자 (yeoça - kadın)', type: CharType.vowel),
      AlphabetChar(char: 'ㅗ', name: 'o', nameLocal: '오', sound: 'o', turkish: 'O', example: '오 (o - beş)', type: CharType.vowel),
      AlphabetChar(char: 'ㅛ', name: 'yo', nameLocal: '요', sound: 'yo', turkish: 'YO', example: '요리 (yori - yemek yapmak)', type: CharType.vowel),
      AlphabetChar(char: 'ㅜ', name: 'u', nameLocal: '우', sound: 'u', turkish: 'U', example: '우유 (uyu - süt)', type: CharType.vowel),
      AlphabetChar(char: 'ㅠ', name: 'yu', nameLocal: '유', sound: 'yu', turkish: 'YÜ', example: '유리 (yuri - cam)', type: CharType.vowel),
      AlphabetChar(char: 'ㅡ', name: 'eu', nameLocal: '으', sound: 'eu', turkish: 'EÜ', example: '으 (eu - )', type: CharType.vowel),
      AlphabetChar(char: 'ㅣ', name: 'i', nameLocal: '이', sound: 'i', turkish: 'İ', example: '이 (i - bu)', type: CharType.vowel),
      // Çift ünlüler
      AlphabetChar(char: 'ㅐ', name: 'ae', nameLocal: '애', sound: 'ae', turkish: 'AE', example: '개 (kae - köpek)', type: CharType.vowel),
      AlphabetChar(char: 'ㅒ', name: 'yae', nameLocal: '얘', sound: 'yae', turkish: 'YAE', example: '얘기 (yaeki - hikaye)', type: CharType.vowel),
      AlphabetChar(char: 'ㅔ', name: 'e', nameLocal: '에', sound: 'e', turkish: 'E', example: '에어컨 (e-eokon - klima)', type: CharType.vowel),
      AlphabetChar(char: 'ㅖ', name: 'ye', nameLocal: '예', sound: 'ye', turkish: 'YE', example: '예쁘다 (yeppurda - güzel)', type: CharType.vowel),
      AlphabetChar(char: 'ㅘ', name: 'wa', nameLocal: '와', sound: 'va', turkish: 'VA', example: '와이파이 (vayifay - wifi)', type: CharType.vowel),
      AlphabetChar(char: 'ㅙ', name: 'wae', nameLocal: '왜', sound: 'vae', turkish: 'VAE', example: '왜 (vae - neden)', type: CharType.vowel),
      AlphabetChar(char: 'ㅚ', name: 'oe', nameLocal: '외', sound: 'oe', turkish: 'OE', example: '외국인 (oegugin - yabancı)', type: CharType.vowel),
      AlphabetChar(char: 'ㅝ', name: 'wo', nameLocal: '워', sound: 'vo', turkish: 'VO', example: '워드 (vodeu - word)', type: CharType.vowel),
      AlphabetChar(char: 'ㅞ', name: 'we', nameLocal: '웨', sound: 've', turkish: 'VE', example: '웨이터 (veiteo - garson)', type: CharType.vowel),
      AlphabetChar(char: 'ㅟ', name: 'wi', nameLocal: '위', sound: 'vi', turkish: 'Vİ', example: '위 (vi - üst)', type: CharType.vowel),
      AlphabetChar(char: 'ㅢ', name: 'ui', nameLocal: '의', sound: 'ui', turkish: 'Üİ', example: '의미 (uimi - anlam)', type: CharType.vowel),
    ],
  };
}

enum CharType { letter, vowel, consonant, consonantK, consonantS, consonantT, consonantN, consonantH, consonantM, consonantY, consonantR, consonantW, harakat, sign }

class AlphabetChar {
  final String char;
  final String name;
  final String nameLocal;
  final String sound;
  final String turkish;
  final String example;
  final CharType type;
  AlphabetChar({required this.char, required this.name, required this.nameLocal, required this.sound, required this.turkish, required this.example, required this.type});
}

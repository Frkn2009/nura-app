enum Achievement {
  firstStep,
  fireStarted,
  tenPhrases,
  gamer,
  traveler,
  plus,
  weeklyChampion,
  dailyHundred,
  sevenDayStreak,
  perfect,
}

extension AchievementX on Achievement {
  String get title => switch (this) {
    Achievement.firstStep => 'İlk Adım',
    Achievement.fireStarted => 'Ateş Başladı',
    Achievement.tenPhrases => '10 Kalıp',
    Achievement.gamer => 'Oyuncu',
    Achievement.traveler => 'Gezgin',
    Achievement.plus => 'Plus',
    Achievement.weeklyChampion => 'Hafta Birincisi',
    Achievement.dailyHundred => '100 XP',
    Achievement.sevenDayStreak => '7 Gün Seri',
    Achievement.perfect => 'Mükemmel',
  };

  String get description => switch (this) {
    Achievement.firstStep => 'İlk sahneni tamamla',
    Achievement.fireStarted => '3 gün üst üste pratik yap',
    Achievement.tenPhrases => '10 cümle öğren',
    Achievement.gamer => 'İlk oyununu tamamla',
    Achievement.traveler => '3 farklı dilde sahne tamamla',
    Achievement.plus => 'VOXELITH Plus üyesi ol',
    Achievement.weeklyChampion => 'Haftalık sıralamada birinci ol',
    Achievement.dailyHundred => 'Günlük 100 XP hedefine ulaş',
    Achievement.sevenDayStreak => '7 gün kesintisiz pratik yap',
    Achievement.perfect => 'Bir oyunu %100 doğru bitir',
  };
}

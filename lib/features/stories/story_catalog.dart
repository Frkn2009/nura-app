class MiniStory {
  final String id;
  final String title;
  final String lang;
  final int level;
  final List<String> words;
  final List<String> questions;
  const MiniStory(this.id, this.title, this.lang, this.level, this.words, this.questions);
}

const stories = [
  MiniStory('ar1', 'Su', 'ar', 1, ['أنا', 'أريد', 'ماء'], ['ماء ne demek?', 'Kim su istiyor?', 'Cümleyi tekrar et']),
  MiniStory('ru1', 'Dom', 'ru', 1, ['Это', 'мой', 'дом'], ['дом ne?', 'мой ne?', 'Cümleyi oku']),
  MiniStory('ja1', 'Neko', 'ja', 1, ['ねこ', 'です'], ['ねこ ne?', 'です ne işe yarar?', 'Tekrar et']),
];

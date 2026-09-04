class LeaderboardEntry {
  const LeaderboardEntry({
    required this.rank,
    required this.userId,
    required this.playerName,
    required this.xp,
    required this.isMe,
  });

  final int rank;
  final String userId;
  final String playerName;
  final int xp;
  final bool isMe;

  factory LeaderboardEntry.fromJson(Map<String, dynamic> json) =>
      LeaderboardEntry(
        rank: (json['rank'] as num).toInt(),
        userId: json['user_id'] as String,
        playerName: json['player_name'] as String? ?? 'VOXELITH Öğrencisi',
        xp: (json['xp'] as num?)?.toInt() ?? 0,
        isMe: json['is_me'] as bool? ?? false,
      );
}

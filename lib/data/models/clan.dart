class ClanMemberEntry {
  const ClanMemberEntry({
    required this.clanId,
    required this.clanName,
    required this.joinCode,
    required this.rank,
    required this.userId,
    required this.playerName,
    required this.xp,
    required this.isMe,
    required this.isOwner,
  });

  final String clanId;
  final String clanName;
  final String joinCode;
  final int rank;
  final String userId;
  final String playerName;
  final int xp;
  final bool isMe;
  final bool isOwner;

  factory ClanMemberEntry.fromJson(Map<String, dynamic> json) =>
      ClanMemberEntry(
        clanId: json['clan_id'] as String,
        clanName: json['clan_name'] as String,
        joinCode: json['join_code'] as String,
        rank: (json['rank'] as num?)?.toInt() ?? 0,
        userId: json['user_id'] as String,
        playerName: json['player_name'] as String? ?? 'NURA Öğrencisi',
        xp: (json['xp'] as num?)?.toInt() ?? 0,
        isMe: json['is_me'] as bool? ?? false,
        isOwner: json['is_owner'] as bool? ?? false,
      );
}

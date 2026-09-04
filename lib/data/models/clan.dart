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
        playerName: json['player_name'] as String? ?? 'VOXELITH Öğrencisi',
        xp: (json['xp'] as num?)?.toInt() ?? 0,
        isMe: json['is_me'] as bool? ?? false,
        isOwner: json['is_owner'] as bool? ?? false,
      );
}

class ClanChatMessage {
  const ClanChatMessage({
    required this.id,
    required this.userId,
    required this.playerName,
    required this.text,
    required this.createdAt,
    required this.isMe,
  });

  final int id;
  final String userId;
  final String playerName;
  final String text;
  final DateTime createdAt;
  final bool isMe;

  factory ClanChatMessage.fromJson(Map<String, dynamic> json) =>
      ClanChatMessage(
        id: (json['id'] as num).toInt(),
        userId: json['user_id'] as String,
        playerName: json['player_name'] as String? ?? 'VOXELITH Öğrencisi',
        text: json['text'] as String? ?? '',
        createdAt: DateTime.parse(json['created_at'] as String),
        isMe: json['is_me'] as bool? ?? false,
      );
}

/// Bir öğrencinin klanına gönderdiği cümle denemesi (peer correction).
class PeerSubmission {
  const PeerSubmission({
    required this.id,
    required this.userId,
    required this.playerName,
    required this.lang,
    required this.attemptText,
    required this.note,
    required this.createdAt,
    required this.isMe,
    required this.correctionCount,
  });

  final int id;
  final String userId;
  final String playerName;
  final String lang;
  final String attemptText;
  final String? note;
  final DateTime createdAt;
  final bool isMe;
  final int correctionCount;

  factory PeerSubmission.fromJson(Map<String, dynamic> json) =>
      PeerSubmission(
        id: (json['id'] as num).toInt(),
        userId: json['user_id'] as String,
        playerName: json['player_name'] as String? ?? 'VOXELITH Öğrencisi',
        lang: json['lang'] as String? ?? '',
        attemptText: json['attempt_text'] as String? ?? '',
        note: json['note'] as String?,
        createdAt: DateTime.parse(json['created_at'] as String),
        isMe: json['is_me'] as bool? ?? false,
        correctionCount: (json['correction_count'] as num?)?.toInt() ?? 0,
      );
}

/// Bir denemeye klan üyelerinden gelen düzeltme/yorum.
class PeerCorrection {
  const PeerCorrection({
    required this.id,
    required this.userId,
    required this.playerName,
    required this.correctionText,
    required this.note,
    required this.createdAt,
    required this.isMe,
  });

  final int id;
  final String userId;
  final String playerName;
  final String correctionText;
  final String? note;
  final DateTime createdAt;
  final bool isMe;

  factory PeerCorrection.fromJson(Map<String, dynamic> json) =>
      PeerCorrection(
        id: (json['id'] as num).toInt(),
        userId: json['user_id'] as String,
        playerName: json['player_name'] as String? ?? 'VOXELITH Öğrencisi',
        correctionText: json['correction_text'] as String? ?? '',
        note: json['note'] as String?,
        createdAt: DateTime.parse(json['created_at'] as String),
        isMe: json['is_me'] as bool? ?? false,
      );
}

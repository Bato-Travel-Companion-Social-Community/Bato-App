import './index.dart' show LikeUser;

class Comment {
  final String id;
  final LikeUser user; // Reusing LikeUser since it has the fields we need
  final String text;
  final DateTime createdAt;

  Comment({
    required this.id,
    required this.user,
    required this.text,
    required this.createdAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['_id'] ?? '',
      user: LikeUser.fromJson(json['user'] ?? {}),
      text: json['text'] ?? '',
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
    );
  }
}

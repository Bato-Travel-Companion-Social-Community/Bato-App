import '../models/index.dart' show UserModel;

// Post Model
class MyCommunityPostModel {
  final String id;
  final List<String> images;
  final String caption;
  final String location;
  final UserModel owner;
  final List<LikeUser> likes;
  final int likeCount;
  final bool isLiked;
  final int commentCount;

  MyCommunityPostModel({
    required this.id,
    required this.images,
    required this.caption,
    required this.location,
    required this.owner,
    required this.likes,
    required this.likeCount,
    required this.isLiked,
    this.commentCount = 0,
  });

  // Factory method to create an instance from JSON
  factory MyCommunityPostModel.fromJson(Map<String, dynamic> json) {
    // print('Likes data from backend: ${json['likes']}');
    return MyCommunityPostModel(
      id: (json['_id'] ?? '').toString(), // Ensure it's a string
      images: List<String>.from(json['images'] ?? []),
      caption: (json['caption'] ?? '').toString(), // Ensure it's a string
      location: (json['location'] ?? '').toString(), // Ensure it's a string
      owner: UserModel.fromJson(json['ownerId'] ?? {}),
      likes: (json['likes'] as List<dynamic>?)
              ?.map((like) => LikeUser.fromJson(like))
              .toList() ??
          [],
      likeCount: json['likeCount'] ?? 0,
      isLiked: json['isLiked'] ?? false,
      commentCount: json['commentCount'] ?? 0,
    );
  }

  // Convert to JSON (optional)
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'images': images,
      'caption': caption,
      'location': location,
      'ownerId': owner.toJson(),
      'likes': likes,
      'likeCount': likeCount,
      'isLiked': isLiked,
      'commentCount': commentCount,
    };
  }
}

class LikeUser {
  final String id;
  final String displayName;
  final String avatar;

  LikeUser({
    required this.id,
    required this.displayName,
    required this.avatar,
  });

  factory LikeUser.fromJson(Map<String, dynamic> json) {
    return LikeUser(
      id: json['_id'] ?? '',
      displayName: json['display_name'] ?? '',
      avatar: json['avatar'] ?? '',
    );
  }
}

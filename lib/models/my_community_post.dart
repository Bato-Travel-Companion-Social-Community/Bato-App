import '../models/index.dart' show UserModel;

// Post Model
class MyCommunityPostModel {
  final String id;
  final List<String> images;
  final String caption;
  final String location;
  final UserModel owner;

  MyCommunityPostModel({
    required this.id,
    required this.images,
    required this.caption,
    required this.location,
    required this.owner,
  });

  // Factory method to create an instance from JSON
  factory MyCommunityPostModel.fromJson(Map<String, dynamic> json) {
    return MyCommunityPostModel(
      id: (json['_id'] ?? '').toString(), // Ensure it's a string
      images: List<String>.from(json['images'] ?? []),
      caption: (json['caption'] ?? '').toString(), // Ensure it's a string
      location: (json['location'] ?? '').toString(), // Ensure it's a string
      owner: UserModel.fromJson(json['ownerId'] ?? {}),
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
    };
  }
}

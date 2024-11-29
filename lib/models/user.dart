// User Model
class UserModel {
  final String id;
  final String displayName;
  final String avatar;

  UserModel({
    required this.id,
    required this.displayName,
    required this.avatar,
  });

  // Factory method to create an instance from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: (json['_id'] ?? '').toString(), // Ensure it's a string
      displayName:
          (json['display_name'] ?? '').toString(), // Ensure it's a string
      avatar: (json['avatar'] ?? '').toString(), // Ensure it's a string
    );
  }

  // Convert to JSON (optional)
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'display_name': displayName,
      'avatar': avatar,
    };
  }
}

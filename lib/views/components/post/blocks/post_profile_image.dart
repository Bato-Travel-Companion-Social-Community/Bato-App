import 'package:flutter/material.dart';

class PostProfileImage extends StatelessWidget {
  final String profileImageUrl;

  const PostProfileImage({
    super.key,
    required this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.network(
        profileImageUrl,
        width: 40,
        height: 40,
        fit: BoxFit.cover,
      ),
    );
  }
}

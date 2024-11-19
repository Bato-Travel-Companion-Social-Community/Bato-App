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
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return const SizedBox(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(strokeWidth: 2),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return const Icon(
            Icons.account_circle,
            size: 40,
            color: Colors.grey,
          );
        },
      ),
    );
  }
}

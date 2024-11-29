import 'package:flutter/material.dart';

class PostImage extends StatelessWidget {
  final String imageUrl;

  const PostImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15), // Apply border radius
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

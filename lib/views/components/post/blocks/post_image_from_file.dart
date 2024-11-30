import 'dart:io';

import 'package:flutter/material.dart';

class PostImageFromFile extends StatelessWidget {
  final File imagePath;

  const PostImageFromFile({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15), // Apply border radius
        child: Image.file(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

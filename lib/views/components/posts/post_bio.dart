import 'package:flutter/material.dart';

class PostBio extends StatelessWidget {
  final String bio;

  const PostBio({
    super.key,
    required this.bio,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        bio,
        style: const TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }
}

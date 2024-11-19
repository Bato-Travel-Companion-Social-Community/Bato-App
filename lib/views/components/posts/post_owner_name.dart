import 'package:flutter/material.dart';

class PostOwnerName extends StatelessWidget {
  final String ownerName;

  const PostOwnerName({
    super.key,
    required this.ownerName,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      ownerName,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }
}

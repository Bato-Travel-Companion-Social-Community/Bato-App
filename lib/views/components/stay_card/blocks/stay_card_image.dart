import 'package:flutter/material.dart';

class StayCardImage extends StatelessWidget {
  final String imageUrl;

  StayCardImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      child: Image.network(
        imageUrl,
        width: double.infinity,
        height: 150,
        fit: BoxFit.cover,
      ),
    );
  }
}

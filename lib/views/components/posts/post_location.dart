import 'package:flutter/material.dart';

class PostLocation extends StatelessWidget {
  final String location;

  const PostLocation({
    super.key,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      location,
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 12,
      ),
    );
  }
}

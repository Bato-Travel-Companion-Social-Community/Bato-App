import 'package:flutter/material.dart';

class PostDetails extends StatelessWidget {
  final String postOwnerName;
  final String postLocation;
  final String postProfileImageUrl;
  final String postCaption;

  const PostDetails({
    super.key,
    required this.postOwnerName,
    required this.postLocation,
    required this.postProfileImageUrl,
    required this.postCaption,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            // Correct way to add a border
            color: Theme.of(context).primaryColor,
            width: 1,
          ),
        ),
      ),
    );
  }
}

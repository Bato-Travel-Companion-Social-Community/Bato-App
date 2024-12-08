import 'package:flutter/material.dart';

class PostPreview extends StatelessWidget {
  final String postOwnerName;
  final String postLocation;
  final String postProfileImageUrl;
  final List<String> imageUrls;
  final String postCaption;

  PostPreview({
    super.key,
    required this.postOwnerName,
    required this.postLocation,
    required this.postProfileImageUrl,
    required this.imageUrls,
    required this.postCaption,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 200, // Set the desired width
      height: 300, // Set the desired height
      decoration: BoxDecoration(
        color: Colors.grey[200], // Background color
        borderRadius: BorderRadius.circular(16), // Rounded corners
        image: DecorationImage(
          image: NetworkImage(imageUrls[0]),
          fit: BoxFit.cover, // Adjust the image to cover the box
        ),
      ),
    );
  }
}

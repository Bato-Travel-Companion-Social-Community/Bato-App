import 'package:flutter/material.dart';
import 'package:bato_app/views/pages/my_profile/screens/post.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PostPage(
                postOwnerName: postOwnerName,
                postLocation: postLocation,
                postProfileImageUrl: postProfileImageUrl,
                imageUrls: imageUrls,
                postCaption: postCaption,
              ),
            ),
          );
        },
        child: Container(
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
        ),
      ),
    );
  }
}

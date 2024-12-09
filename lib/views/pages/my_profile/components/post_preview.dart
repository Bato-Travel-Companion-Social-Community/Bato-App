import 'package:bato_app/models/my_community_post.dart';
import 'package:flutter/material.dart';
import 'package:bato_app/views/pages/my_profile/screens/post.dart';

class PostPreview extends StatelessWidget {
  final String id;
  final String postOwnerName;
  final String postLocation;
  final String postProfileImageUrl;
  final List<String> imageUrls;
  final String postCaption;
  final bool isLiked;
  final int likeCount;
  final List<LikeUser> likes;
  final int commentCount;
  PostPreview({
    super.key,
    required this.id,
    required this.postOwnerName,
    required this.postLocation,
    required this.postProfileImageUrl,
    required this.imageUrls,
    required this.postCaption,
    required this.isLiked,
    required this.likeCount,
    required this.likes,
    this.commentCount = 0,
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
                id: id,
                postOwnerName: postOwnerName,
                postLocation: postLocation,
                postProfileImageUrl: postProfileImageUrl,
                imageUrls: imageUrls,
                postCaption: postCaption,
                isLiked: isLiked,
                likeCount: likeCount,
                likes: likes,
                commentCount: commentCount,
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

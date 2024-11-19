import 'package:flutter/material.dart';
import 'post_top_bar.dart';
import 'post_image.dart';
import 'post_bio.dart';

class MyCommunityImagePost extends StatelessWidget {
  final String ownerName;
  final String location;
  final String profileImageUrl;
  final String imageUrl;
  final String bio;

  const MyCommunityImagePost({
    super.key,
    required this.ownerName,
    required this.location,
    required this.profileImageUrl,
    required this.imageUrl,
    required this.bio,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostTopBar(
              ownerName: ownerName,
              location: location,
              profileImageUrl: profileImageUrl),
          PostImage(imageUrl: imageUrl),
          PostBio(bio: bio),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'post_profile_image.dart';
import 'post_owner_name.dart';
import 'post_location.dart';

class PostTopBar extends StatelessWidget {
  final String ownerName;
  final String location;
  final String profileImageUrl;

  const PostTopBar({
    super.key,
    required this.ownerName,
    required this.location,
    required this.profileImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          PostProfileImage(profileImageUrl: profileImageUrl),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PostOwnerName(ownerName: ownerName),
              PostLocation(location: location),
            ],
          ),
        ],
      ),
    );
  }
}

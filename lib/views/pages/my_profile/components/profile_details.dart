import 'package:flutter/material.dart';
import './index.dart' show ProfileAvatar, ProfileContentColumn;

class ProfileDetails extends StatelessWidget {
  String profileAvatar;

  ProfileDetails({required this.profileAvatar});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment:
          CrossAxisAlignment.end, // Vertically align text and image
      children: [
        ProfileContentColumn(),
        SizedBox(width: 20),
        ProfileAvatar(profileAvatar: profileAvatar),
      ],
    );
  }
}

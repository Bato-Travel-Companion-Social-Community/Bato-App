import 'package:flutter/material.dart';
import './index.dart'
    show ProfileAvatar, ProfileContentColumn, ProfileContentColumn2;

class ProfileDetails extends StatelessWidget {
  String profileAvatar;
  String displayName;

  ProfileDetails({required this.profileAvatar, required this.displayName});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment:
          CrossAxisAlignment.end, // Vertically align text and image
      children: [
        ProfileContentColumn(),
        SizedBox(width: 20),
        ProfileAvatar(profileAvatar: profileAvatar, displayName: displayName),
        SizedBox(width: 20),
        ProfileContentColumn2(),
      ],
    );
  }
}

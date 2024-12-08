import 'package:flutter/material.dart';
import './index.dart'
    show ProfileAvatar, ProfileContentColumn, ProfileContentColumn2;

class ProfileDetails extends StatelessWidget {
  final String profileAvatar;
  final String displayName;

  ProfileDetails({required this.profileAvatar, required this.displayName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment:
            CrossAxisAlignment.end, // Vertically align text and image
        children: [
          ProfileContentColumn2(),
          SizedBox(width: 10),
          ProfileContentColumn(),
          SizedBox(width: 20),
          ProfileAvatar(profileAvatar: profileAvatar, displayName: displayName),
        ],
      ),
    );
  }
}

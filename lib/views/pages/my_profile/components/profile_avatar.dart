import 'package:flutter/material.dart';
import './index.dart' show ProfileName;

class ProfileAvatar extends StatelessWidget {
  final String profileAvatar;
  final String displayName;

  ProfileAvatar({required this.profileAvatar, required this.displayName});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 130, // Set the desired width
          height: 180, // Set the desired height
          decoration: BoxDecoration(
            color: Colors.grey[200], // Background color
            borderRadius: BorderRadius.circular(16), // Rounded corners
            image: DecorationImage(
              image: NetworkImage(profileAvatar),
              fit: BoxFit.cover, // Adjust the image to cover the box
            ),
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(bottom: 7),
          child: ProfileName(displayName: displayName),
        ),
      ],
    );
  }
}

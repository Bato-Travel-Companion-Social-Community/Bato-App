import 'package:flutter/material.dart';
import 'package:bato_app/views/index.dart' show AppTextStyles, AppColors;

class ProfileAvatar extends StatelessWidget {
  String profileAvatar;

  ProfileAvatar({required this.profileAvatar});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200, // Set the desired width
      height: 300, // Set the desired height
      decoration: BoxDecoration(
        color: Colors.grey[200], // Background color
        borderRadius: BorderRadius.circular(16), // Rounded corners
        image: DecorationImage(
          image: NetworkImage(profileAvatar),
          fit: BoxFit.cover, // Adjust the image to cover the box
        ),
      ),
    );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:bato_app/views/index.dart' show SendPostButton;

class AddPostCaptionAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  final List<File> files;
  final String caption;

  AddPostCaptionAppBar({required this.files, required this.caption});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context)
          .scaffoldBackgroundColor, // Use the scaffold background color from the current theme
      elevation: 0, // Prevent any shadow effects
      scrolledUnderElevation:
          0, // Prevent app bar from changing elevation on scroll
      actions: [
        SendPostButton(
          files: files,
          caption: caption,
        ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(65.0); // You can adjust the height here as needed
}

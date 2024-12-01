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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      scrolledUnderElevation: 0,
      actions: [
        SendPostButton(
          files: files,
          caption: caption, // This will always have the updated caption
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(65.0);
}

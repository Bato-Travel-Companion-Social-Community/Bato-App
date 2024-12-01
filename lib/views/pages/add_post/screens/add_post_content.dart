import 'dart:io';
import 'package:flutter/material.dart';

import 'package:bato_app/views/index.dart'
    show PostCaptionInputField, AddPostCaptionAppBar;

class AddPostContent extends StatefulWidget {
  final List<File> files;

  AddPostContent({required this.files});
  @override
  _AddPostContentState createState() => _AddPostContentState();
}

class _AddPostContentState extends State<AddPostContent> {
  final TextEditingController inputController = TextEditingController();

  // Initialize caption as empty string
  String caption = '';

  @override
  void initState() {
    super.initState();
    // Add a listener to update the caption on text changes
    inputController.addListener(() {
      setState(() {
        // Update the caption with the latest text
        caption = inputController.text;
      });
    });
  }

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AddPostCaptionAppBar(
        files: widget.files,
        caption: caption, // Use the updated caption here
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
          child: PostCaptionInputField(inputController: inputController),
        ),
      ),
    );
  }
}

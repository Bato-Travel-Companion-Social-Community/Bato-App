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

  void sendData() {
    // Create JSON from the input field
    final jsonData = {
      "input": inputController.text,
    };

    // Log or send this JSON object
    print(jsonData);
  }

  @override
  void dispose() {
    // Dispose controller to avoid memory leaks
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AddPostCaptionAppBar(
          files: widget.files,
          caption: inputController.text,
        ),
        body: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
              child: PostCaptionInputField(inputController: inputController)),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

import 'package:bato_app/views/index.dart' show AddPostPreview, AppTextStyles;

class AddPostPage extends StatefulWidget {
  @override
  _AddPostPageState createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  List<File> files = []; // Store multiple selected images

  final ImagePicker _picker = ImagePicker();

  // Request Camera and Gallery permissions
  Future<void> _requestPermissions() async {
    await Permission.camera.request();
    await Permission.photos.request();
  }

  // Function to pick multiple images from the gallery
  Future<void> _pickImagesFromGallery() async {
    final pickedFiles =
        await _picker.pickMultiImage(); // Allow multiple selection
    if (pickedFiles != null) {
      setState(() {
        files.addAll(
            pickedFiles.map((pickedFile) => File(pickedFile.path)).toList());
      });
    }
  }

  // Function to take a picture with the camera
  Future<void> _takePhoto() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() {
        files.add(File(pickedFile.path));
      });
    }
  }

  // Function to submit the post (mock for now)
  void _submitPost() {
    if (files.isNotEmpty) {
      context.push('/add-post-content', extra: files);
    } else {
      print('No images selected!');
    }
  }

  @override
  void initState() {
    super.initState();
    _requestPermissions(); // Request permissions when the page is opened
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        // Display selected images as thumbnails
        files.isEmpty
            ? SizedBox(
                height: 500,
                child: Center(
                  child: Text(
                    'No images selected yet!',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppTextStyles.fontFamilyPrimary),
                  ),
                ),
              )
            : AddPostPreview(imagePaths: files),

        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              onPressed: _pickImagesFromGallery,
              icon: Icon(Icons.photo),
              color: Theme.of(context).primaryColor,
              iconSize: 30,
            ),
            IconButton(
              onPressed: _takePhoto,
              icon: Icon(Icons.add_a_photo),
              color: Theme.of(context).primaryColor,
              iconSize: 40,
            ),
            IconButton(
                onPressed: _submitPost,
                icon: Icon(Icons.queue_play_next),
                color: Theme.of(context).primaryColor,
                iconSize: 30),
          ],
        ),
      ],
    );
  }
}

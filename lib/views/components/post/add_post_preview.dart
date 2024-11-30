import 'dart:io';
import 'package:flutter/material.dart';
import 'blocks/index.dart' show PostImageFromFile;

class AddPostPreview extends StatelessWidget {
  final List<File> imagePaths;

  AddPostPreview({
    super.key,
    required this.imagePaths,
  });

  // PageController with initial page set to 1
  final PageController _controller =
      PageController(initialPage: 1, viewportFraction: 0.90);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.0, // Maintains a 1:1 aspect ratio (square)
      child: PageView.builder(
        controller: _controller,
        scrollDirection: Axis.horizontal, // Set scroll direction to horizontal
        itemCount:
            imagePaths.length, // Include an extra item for the first widget
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
            child: PostImageFromFile(imagePath: imagePaths[index]),
          );
        },
      ),
    );
  }
}

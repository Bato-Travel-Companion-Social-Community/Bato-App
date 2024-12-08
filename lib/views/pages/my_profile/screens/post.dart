import 'package:flutter/material.dart';
import 'package:bato_app/views/index.dart' show PostDetails;

class PostPage extends StatelessWidget {
  final String postOwnerName;
  final String postLocation;
  final String postProfileImageUrl;
  final List<String> imageUrls;
  final String postCaption;

  PostPage({
    super.key,
    required this.postOwnerName,
    required this.postLocation,
    required this.postProfileImageUrl,
    required this.imageUrls,
    required this.postCaption,
  });

  // PageController with initial page set to 1
  final PageController _controller =
      PageController(initialPage: 1, viewportFraction: 0.90);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Center(
          child: SizedBox(
        height: 500.0, // Maintains a 1:1 aspect ratio (square)
        child: PageView.builder(
          controller: _controller,
          scrollDirection:
              Axis.horizontal, // Set scroll direction to horizontal
          itemCount: imageUrls.length +
              1, // Include an extra item for the first widget
          itemBuilder: (context, index) {
            if (index == 0) {
              // First widget: A special widget not part of imageUrls
              return PostDetails(
                postOwnerName: postOwnerName,
                postLocation: postLocation,
                postProfileImageUrl: postProfileImageUrl,
                postCaption: postCaption,
              );
            } else {
              // Other widgets: Images from imageUrls
              final imageIndex = index - 1; // Adjust index for imageUrls
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.circular(15), // Apply border radius
                  child: Image.network(
                    imageUrls[imageIndex],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            }
          },
        ),
      )),
    );
  }
}
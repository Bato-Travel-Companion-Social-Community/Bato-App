import 'package:flutter/material.dart';
import '../../index.dart' show MyCommunityPost;
import '../../../controllers/index.dart' show PostsService;
import '../../../models/index.dart' show MyCommunityPostModel;

class MyCommunityPage extends StatelessWidget {
  const MyCommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MyCommunityPostModel>?>(
      future: PostsService().getAllImagePosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Text('No posts found.');
        } else {
          final posts = snapshot.data!;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return MyCommunityPost(
                postOwnerName: post.owner.displayName,
                postLocation: post.location,
                postProfileImageUrl: post.owner.avatar,
                imageUrls: post.images, // Use the first image as an example
                postCaption: post.caption,
              );
            },
          );
        }
      },
    );
  }
}

import 'dart:convert';
import 'package:flutter/material.dart';
import '../index.dart' show MyCommunityImagePost;
import '../../controllers/index.dart' show PostsService;

class MyCommunityPage extends StatelessWidget {
  const MyCommunityPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PostsService postsService = PostsService();

    return FutureBuilder<List<dynamic>?>(
      future: postsService.getAllImagePosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.hasData) {
          final posts = snapshot.data;
          if (posts == null || posts.isEmpty) {
            return const Center(child: Text('No posts available.'));
          }
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return MyCommunityImagePost(
                ownerName: post['ownerId']['display_name'] ?? 'Unknown',
                location: post['location'] ?? 'Unknown location',
                profileImageUrl: post['ownerId']['avatar'] ?? '',
                imageUrl: post['images'][0] ??
                    '', // Assuming there is at least one image
                bio: post['caption'] ?? '',
              );
            },
          );
        } else {
          return const Center(child: Text('No posts available.'));
        }
      },
    );
  }
}

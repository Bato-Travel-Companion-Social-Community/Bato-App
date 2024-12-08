import 'package:flutter/material.dart';
import 'package:bato_app/views/index.dart' show AppTextStyles, AppColors;
import 'package:bato_app/models/index.dart' show MyCommunityPostModel;
import 'package:bato_app/controllers/index.dart' show PostsService;
import './index.dart' show PostPreview;

class MyTrips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Text(
            'My Trips',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w900,
              color: Theme.of(context).primaryColor,
              fontFamily: AppTextStyles.fontFamilyPrimary,
            ),
          ),
        ),
        FutureBuilder<List<MyCommunityPostModel>?>(
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
              return Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return PostPreview(
                      postOwnerName: post.owner.displayName,
                      postLocation: post.location,
                      postProfileImageUrl: post.owner.avatar,
                      imageUrls: post.images,
                      postCaption: post.caption,
                    );
                  },
                ),
              );
            }
          },
        )
      ],
    );
  }
}

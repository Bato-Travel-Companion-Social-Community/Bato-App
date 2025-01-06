import 'package:flutter/material.dart';
import 'index.dart' show PostTopBar, PostCaption, PostBottomBar;
import '../../../../models/index.dart' show LikeUser;

class PostDetails extends StatelessWidget {
  final String id;
  final String postOwnerName;
  final String postLocation;
  final String postProfileImageUrl;
  final String postCaption;
  final bool isLiked;
  final int likeCount;
  final List<LikeUser> likes;
  final int commentCount;
  final Function(bool, List<LikeUser>) onLikeChanged;
  final Function(int)? onCommentCountChanged;

  const PostDetails({
    super.key,
    required this.id,
    required this.postOwnerName,
    required this.postLocation,
    required this.postProfileImageUrl,
    required this.postCaption,
    required this.isLiked,
    required this.likeCount,
    required this.likes,
    this.commentCount = 0,
    required this.onLikeChanged,
    this.onCommentCountChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostTopBar(
                postOwnerName: postOwnerName,
                postLocation: postLocation,
                postProfileImageUrl: postProfileImageUrl),
            PostCaption(postCaption: postCaption),
            PostBottomBar(
              postId: id,
              isLiked: isLiked,
              likeCount: likeCount,
              likes: likes,
              commentCount: commentCount,
              onLikeChanged: onLikeChanged,
              onCommentCountChanged: onCommentCountChanged,
            ),
          ],
        ),
      ),
    );
  }
}

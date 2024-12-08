import 'package:flutter/material.dart';
import 'blocks/index.dart' show PostDetails;
import '../../../models/index.dart' show LikeUser;

class MyCommunityPost extends StatefulWidget {
  final String id;
  final String postOwnerName;
  final String postLocation;
  final String postProfileImageUrl;
  final List<String> imageUrls;
  final String postCaption;
  final bool isLiked;
  final int likeCount;
  final List<LikeUser> likes;
  final int commentCount;
  const MyCommunityPost({
    super.key,
    required this.id,
    required this.postOwnerName,
    required this.postLocation,
    required this.postProfileImageUrl,
    required this.imageUrls,
    required this.postCaption,
    required this.isLiked,
    required this.likeCount,
    required this.likes,
    this.commentCount = 0,
  });

  @override
  State<MyCommunityPost> createState() => _MyCommunityPostState();
}

class _MyCommunityPostState extends State<MyCommunityPost> {
  final PageController _controller =
      PageController(initialPage: 1, viewportFraction: 0.90);

  // Add state variables
  late bool _isLiked;
  late int _likeCount;
  late List<LikeUser> _likes;
  late int _commentCount;
  @override
  void initState() {
    super.initState();
    _isLiked = widget.isLiked;
    _likeCount = widget.likeCount;
    _likes = widget.likes;
    _commentCount = widget.commentCount;
  }

  @override
  void didUpdateWidget(MyCommunityPost oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isLiked != widget.isLiked) {
      _isLiked = widget.isLiked;
    }
    if (oldWidget.likeCount != widget.likeCount) {
      _likeCount = widget.likeCount;
    }
    if (oldWidget.likes != widget.likes) {
      _likes = widget.likes;
    }
  }

  void _handleLikeChanged(bool newLikeState, List<LikeUser> updatedLikes) {
    setState(() {
      _isLiked = newLikeState;
      _likeCount = newLikeState ? _likeCount + 1 : _likeCount - 1;
      _likes = updatedLikes;
    });
  }

  void _handleCommentCountChanged(int newCount) {
    // Add this
    setState(() {
      _commentCount = newCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500.0,
      child: PageView.builder(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        itemCount: widget.imageUrls.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return PostDetails(
              id: widget.id,
              postOwnerName: widget.postOwnerName,
              postLocation: widget.postLocation,
              postProfileImageUrl: widget.postProfileImageUrl,
              postCaption: widget.postCaption,
              isLiked: _isLiked,
              likeCount: _likeCount,
              likes: _likes,
              onLikeChanged: (bool newLikeState, List<LikeUser> updatedLikes) =>
                  _handleLikeChanged(newLikeState, updatedLikes),
              commentCount: _commentCount,
              onCommentCountChanged: _handleCommentCountChanged,
            );
          } else {
            final imageIndex = index - 1;
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3, vertical: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  widget.imageUrls[imageIndex],
                  fit: BoxFit.cover,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

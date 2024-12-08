import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../controllers/posts/services/index.dart'
    show LikePostService, CommentPostService;
import '../../../../models/index.dart' show LikeUser;
import 'index.dart' show PostLikesModal, PostCommentsModal;
import '../../../../controllers/index.dart' show PostsService;

class PostBottomBar extends StatefulWidget {
  final String postId;
  final bool isLiked;
  final int likeCount;
  final List<LikeUser> likes;
  final int commentCount;
  final Function(bool, List<LikeUser>)? onLikeChanged;
  final Function(int)? onCommentCountChanged;

  const PostBottomBar({
    Key? key,
    required this.postId,
    required this.isLiked,
    required this.likeCount,
    required this.likes,
    this.commentCount = 0,
    this.onLikeChanged,
    this.onCommentCountChanged,
  }) : super(key: key);

  @override
  State<PostBottomBar> createState() => _PostBottomBarState();
}

class _PostBottomBarState extends State<PostBottomBar> {
  final LikePostService _likeService = LikePostService(
    baseUrl: PostsService.baseUrl,
  );
  final CommentPostService _commentService = CommentPostService(
    baseUrl: PostsService.baseUrl,
  );
  late bool _isLiked;
  late int _likeCount;
  late List<LikeUser> _likes;

  @override
  void initState() {
    super.initState();
    _isLiked = widget.isLiked;
    _likeCount = widget.likeCount;
    _likes = widget.likes;
  }

  @override
  void didUpdateWidget(PostBottomBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.likes != widget.likes) {
      _likes = widget.likes;
    }
  }

  Future<void> _handleLike() async {
    final result = await _likeService.toggleLike(widget.postId);
    if (result != null) {
      final updatedLikes = (result['likes'] as List<dynamic>?)
              ?.map((like) => LikeUser.fromJson(like))
              .toList() ??
          _likes;

      setState(() {
        _isLiked = result['isLiked'] ?? !_isLiked;
        _likeCount = result['likeCount'] ?? _likeCount;
        _likes = updatedLikes;
      });
      if (widget.onLikeChanged != null) {
        widget.onLikeChanged!(_isLiked, updatedLikes);
      }
    }
  }

  void _showLikesModal() {
    if (_likeCount > 0) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) => PostLikesModal(likes: _likes),
      );
    }
  }

  void _showCommentsModal() async {
    final comments = await _commentService.getComments(widget.postId);
    if (!mounted) return;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => PostCommentsModal(
        postId: widget.postId,
        initialComments: comments,
        onCommentCountChanged: (count) {
          if (widget.onCommentCountChanged != null) {
            widget.onCommentCountChanged!(count);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          IconButton(
            icon: FaIcon(
              _isLiked ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
              color: _isLiked ? Colors.red : null,
            ),
            iconSize: 25.0,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: _handleLike,
          ),
          GestureDetector(
            onTap: _showLikesModal,
            child: Text(
              '$_likeCount likes',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                icon: const FaIcon(FontAwesomeIcons.comment),
                iconSize: 25.0,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: _showCommentsModal,
              ),
              if (widget.commentCount > 0)
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        widget.commentCount.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          IconButton(
            icon: FaIcon(FontAwesomeIcons.paperPlane),
            iconSize: 25.0,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

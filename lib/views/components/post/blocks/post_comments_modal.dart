import 'package:flutter/material.dart';
import '../../../../models/index.dart' show Comment;
import '../../../../controllers/index.dart' show PostsService;
import '../../../../controllers/posts/services/index.dart'
    show CommentPostService;

class PostCommentsModal extends StatefulWidget {
  final String postId;
  final List<Comment> initialComments;
  final Function(int) onCommentCountChanged;

  const PostCommentsModal({
    Key? key,
    required this.postId,
    required this.initialComments,
    required this.onCommentCountChanged,
  }) : super(key: key);

  @override
  State<PostCommentsModal> createState() => _PostCommentsModalState();
}

class _PostCommentsModalState extends State<PostCommentsModal> {
  final TextEditingController _commentController = TextEditingController();
  final CommentPostService _commentService = CommentPostService(
    baseUrl: PostsService.baseUrl,
  );

  List<Comment> _comments = [];

  @override
  void initState() {
    super.initState();
    _comments = widget.initialComments;
  }

  Future<void> _addComment() async {
    if (_commentController.text.trim().isEmpty) return;

    final result = await _commentService.addComment(
      widget.postId,
      _commentController.text.trim(),
    );

    if (result != null) {
      setState(() {
        _comments.add(result['comment'] as Comment);
        _commentController.clear();
      });
      widget.onCommentCountChanged(_comments.length);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).dividerColor,
                  width: 0.5,
                ),
              ),
            ),
            child: Center(
              child: Text(
                'Comments',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _comments.length,
              itemBuilder: (context, index) {
                final comment = _comments[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(comment.user.avatar),
                  ),
                  title: Text(comment.user.displayName),
                  subtitle: Text(comment.text),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 8,
              right: 8,
              top: 8,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    decoration: InputDecoration(
                      hintText: 'Add a comment...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _addComment,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../models/index.dart' show LikeUser;

class PostLikesModal extends StatelessWidget {
  final List<LikeUser> likes;

  const PostLikesModal({
    Key? key,
    required this.likes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.5,
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
                'Likes',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: likes.length,
              itemBuilder: (context, index) {
                final user = likes[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(user.avatar),
                    radius: 20,
                  ),
                  title: Text(
                    user.displayName,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../views/index.dart' show AppTextStyles;

class PostCaption extends StatelessWidget {
  final String postCaption;

  const PostCaption({
    super.key,
    required this.postCaption,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // Use Expanded to avoid overflow
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Text(
          postCaption,
          style: TextStyle(
            fontSize: 12,
            fontFamily: AppTextStyles.fontFamilyPrimary,
          ),
          softWrap: true, // Ensure text wraps
          overflow: TextOverflow.visible, // Handle overflow
        ),
      ),
    );
  }
}

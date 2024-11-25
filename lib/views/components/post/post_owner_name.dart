import 'package:flutter/material.dart';
import '../../index.dart' show AppTextStyles;

class PostOwnerName extends StatelessWidget {
  final String ownerName;

  const PostOwnerName({
    super.key,
    required this.ownerName,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      ownerName,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: AppTextStyles.fontFamilyPrimary,
        fontSize: 16,
      ),
    );
  }
}

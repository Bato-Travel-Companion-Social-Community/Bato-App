import 'package:flutter/material.dart';
import 'package:bato_app/views/index.dart' show AppTextStyles;

class ProfileName extends StatelessWidget {
  String displayName;

  ProfileName({required this.displayName});

  @override
  Widget build(BuildContext context) {
    return Text(
      displayName,
      style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
          fontFamily: AppTextStyles.fontFamilyPrimary),
    );
  }
}

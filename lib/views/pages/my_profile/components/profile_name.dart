import 'package:flutter/material.dart';
import 'package:bato_app/views/index.dart' show AppTextStyles;

class ProfileName extends StatelessWidget {
  String displayName;

  ProfileName({required this.displayName});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -10), // Move the text 10 units upwards
      child: Text(
        displayName,
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w900,
            color: Theme.of(context).primaryColor,
            fontFamily: AppTextStyles.fontFamilyPrimary),
      ),
    );
  }
}

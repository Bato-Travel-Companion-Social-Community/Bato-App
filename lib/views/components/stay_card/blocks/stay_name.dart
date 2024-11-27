import 'package:flutter/material.dart';
import '../../../../views/index.dart' show AppTextStyles;

class StayName extends StatelessWidget {
  final String propertyName;

  StayName({required this.propertyName});

  @override
  Widget build(BuildContext context) {
    return Text(
      propertyName,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontFamily: AppTextStyles.fontFamilyPrimary,
      ),
    );
  }
}

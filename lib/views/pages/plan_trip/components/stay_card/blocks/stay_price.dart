import 'package:flutter/material.dart';
import '../../../../../index.dart' show AppTextStyles;

class StayPrice extends StatelessWidget {
  final String pricePerNight;

  StayPrice({required this.pricePerNight});

  @override
  Widget build(BuildContext context) {
    return Text(
      '\$$pricePerNight ',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        fontFamily: AppTextStyles.fontFamilyPrimary,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../views/index.dart' show AppTextStyles;

class StayLocation extends StatelessWidget {
  final String propertyLocation;

  StayLocation({super.key, required this.propertyLocation});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, -5),
      child: Text(
        propertyLocation,
        style: TextStyle(
          fontSize: 11,
          fontFamily: AppTextStyles.fontFamilyPrimary,
          color: Colors.grey,
        ),
      ),
    );
  }
}

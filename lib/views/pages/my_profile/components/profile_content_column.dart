import 'package:flutter/material.dart';
import 'package:bato_app/views/index.dart'
    show AppTextStyles, AppColors; // Import text styles

class ProfileContentColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          '50',
          style: TextStyle(
            fontSize: 40,
            color: AppColors.primary,
            fontFamily: AppTextStyles.fontFamilyPrimary,
          ),
        ),
        Transform.translate(
          offset: Offset(0, -16), // Move the text 10 units upwards
          child: Text(
            'trips',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
                fontFamily: AppTextStyles.fontFamilyPrimary),
          ),
        ),
        Text(
          '6',
          style: TextStyle(
            fontSize: 40,
            color: AppColors.primary,
            fontFamily: AppTextStyles.fontFamilyPrimary,
          ),
        ),
        Transform.translate(
          offset: Offset(0, -16), // Move the text 10 units upwards
          child: Text(
            'Countries',
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
                fontFamily: AppTextStyles.fontFamilyPrimary),
          ),
        ),
      ],
    );
  }
}

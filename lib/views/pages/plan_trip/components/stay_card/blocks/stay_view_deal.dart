import 'package:flutter/material.dart';
import '../../../../../index.dart' show AppTextStyles;

class StayViewDeal extends StatelessWidget {
  StayViewDeal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 35,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Theme.of(context).primaryColor, width: 1)),
      child: Align(
        alignment: Alignment.center,
        child: Text(
          'View Deal',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: AppTextStyles.fontFamilyPrimary,
          ),
        ),
      ),
    );
  }
}

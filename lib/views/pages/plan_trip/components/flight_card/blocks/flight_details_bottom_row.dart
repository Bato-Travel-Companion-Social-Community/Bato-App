import 'package:flutter/material.dart';
import '../../../../../index.dart' show AppTextStyles;

class FlightDetailsBottomRow extends StatelessWidget {
  final String origin;
  final String destination;
  final String duration;

  FlightDetailsBottomRow({
    required this.origin,
    required this.destination,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$origin - $destination',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontFamily: AppTextStyles.fontFamilyPrimary,
            color: Colors.grey,
          ),
        ),
        Text(
          duration,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            fontFamily: AppTextStyles.fontFamilyPrimary,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

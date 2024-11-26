import 'package:flutter/material.dart';
import '../../../../views/index.dart' show AppTextStyles;

class FlightDetailsTopRow extends StatelessWidget {
  final String departureDate;
  final String arrivalDate;
  final String flightStatus;

  FlightDetailsTopRow({
    required this.departureDate,
    required this.arrivalDate,
    required this.flightStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '$departureDate - $arrivalDate',
          style: TextStyle(
            fontSize: 16,
            fontFamily: AppTextStyles.fontFamilyPrimary,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Text(
          flightStatus,
          style: TextStyle(
            fontSize: 12,
            fontFamily: AppTextStyles.fontFamilyPrimary,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}

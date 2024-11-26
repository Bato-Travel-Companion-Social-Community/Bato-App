import 'package:flutter/material.dart';
import '../../../../views/index.dart' show AppTextStyles;

class FlightPrice extends StatelessWidget {
  final String price;

  FlightPrice({
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          '$price',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: AppTextStyles.fontFamilyPrimary,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}

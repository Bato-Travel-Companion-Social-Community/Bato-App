import 'package:flutter/material.dart';
import './index.dart' show FlightPrice, FlightViewDeal;

class FLightDealRow extends StatelessWidget {
  final String price;

  FLightDealRow({required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FlightViewDeal(),
        FlightPrice(price: price),
      ],
    );
  }
}

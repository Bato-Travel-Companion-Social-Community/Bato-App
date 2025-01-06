import 'package:flutter/material.dart';
import 'index.dart' show StayPrice, StayViewDeal;

class StayCardBottomRow extends StatelessWidget {
  final String pricePerNight;

  StayCardBottomRow({required this.pricePerNight});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      StayViewDeal(),
      StayPrice(pricePerNight: pricePerNight),
    ]);
  }
}

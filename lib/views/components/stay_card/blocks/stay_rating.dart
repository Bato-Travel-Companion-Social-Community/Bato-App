import 'package:flutter/material.dart';

class StayRating extends StatelessWidget {
  final String rating;
  final String reviewCount;

  StayRating({
    required this.rating,
    required this.reviewCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: Theme.of(context).primaryColor,
          size: 10,
        ),
        Text(
          rating,
          style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              fontFamily: 'Montserrat',
              color: Colors.grey),
        ),
      ],
    );
  }
}

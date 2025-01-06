import 'package:flutter/material.dart';
import 'blocks/index.dart' show StayCardImage, StayDetails;

class StayCard extends StatelessWidget {
  final String propertyName;
  final String propertyLocation;
  final String pricePerNight;
  final String rating;
  final String propertyImageUrl;
  final String reviewCount;
  final VoidCallback onBookNowPressed;

  StayCard({
    required this.propertyName,
    required this.propertyLocation,
    required this.pricePerNight,
    required this.rating,
    required this.propertyImageUrl,
    required this.reviewCount,
    required this.onBookNowPressed,
  });

  @override
  Widget build(BuildContext context) {
    // Check if the app is in dark mode
    return Card(
      color: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
          side: BorderSide(
            color: Theme.of(context).primaryColor, // Border color in dark mode
            width: 1,
          ) // No border in light mode
          ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        // Image
        StayCardImage(propertyImageUrl: propertyImageUrl),
        // Details
        StayDetails(
            propertyLocation: propertyLocation,
            propertyName: propertyName,
            pricePerNight: pricePerNight,
            rating: rating,
            reviewCount: reviewCount)
      ]),
    );
  }
}

import 'package:flutter/material.dart';
import '../../index.dart' show AppTextStyles;

class HotelCard extends StatelessWidget {
  final String hotelName;
  final String hotelLocation;
  final String pricePerNight;
  final String rating;
  final String imageUrl;
  final String reviewCount;
  final VoidCallback onBookNowPressed;

  HotelCard({
    required this.hotelName,
    required this.hotelLocation,
    required this.pricePerNight,
    required this.rating,
    required this.imageUrl,
    required this.reviewCount,
    required this.onBookNowPressed,
  });

  @override
  Widget build(BuildContext context) {
    // Check if the app is in dark mode
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Card(
      color: Theme.of(context).scaffoldBackgroundColor,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: isDarkMode
            ? BorderSide(
                color:
                    Theme.of(context).primaryColor, // Border color in dark mode
                width: 2,
              )
            : BorderSide.none,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hotel image
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hotel name
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      hotelName,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppTextStyles.fontFamilyPrimary,
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 18,
                            ),
                            SizedBox(width: 4),
                            Text(
                              rating,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 8),
                            Text(
                              '($reviewCount reviews)',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          // price
                          children: [
                            Icon(Icons.attach_money,
                                color: Colors.green, size: 18),
                            Text(
                              pricePerNight,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
                // Hotel location
                Text(
                  hotelLocation,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

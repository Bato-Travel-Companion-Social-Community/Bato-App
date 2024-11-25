import 'package:flutter/material.dart';
import '../../index.dart' show AppColors, AppTextStyles;

class OneWayFlightCard extends StatelessWidget {
  final String origin;
  final String destination;
  final String departureDate;
  final String price;
  final String airlineName;
  final String flightNumber;
  final String imageUrl;

  OneWayFlightCard({
    required this.origin,
    required this.destination,
    required this.departureDate,
    required this.price,
    required this.airlineName,
    required this.flightNumber,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    // Check if the app is in dark mode
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Card(
      elevation: 2,
      color: Theme.of(context).scaffoldBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: isDarkMode
            ? BorderSide(
                color:
                    Theme.of(context).primaryColor, // Border color in dark mode
                width: 2,
              )
            : BorderSide.none, // No border in light mode
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Flight Route and Date
            Row(
              children: [
                Text(
                  '$origin → $destination',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: AppTextStyles.fontFamilyPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  '$departureDate',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 8),

            // Airline Name and Flight Number
            Row(
              children: [
                // Airline logo image
                Image.network(
                  imageUrl,
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.expectedTotalBytes != null
                                ? (loadingProgress.cumulativeBytesLoaded /
                                    (loadingProgress.expectedTotalBytes ?? 1))
                                : null
                            : null,
                      );
                    }
                  },
                ),
                SizedBox(width: 10),

                // Airline Name
                Text(
                  airlineName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: AppTextStyles.fontFamilyPrimary,
                  ),
                ),
                Spacer(),

                // Flight Number
                Text(
                  flightNumber,
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
            SizedBox(height: 12),

            // Price Display
            Row(
              children: [
                Text(
                  'Price: ',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                Text(
                  '\$$price',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green, // Price in green for visibility
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

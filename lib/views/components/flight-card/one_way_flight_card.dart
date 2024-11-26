import 'package:flutter/material.dart';
import ',,/../../../../views/index.dart' show AppTextStyles;
import 'blocks/index.dart' show FlightAirlineName, FlightDetails, FlightPrice;

class OneWayFlightCard extends StatelessWidget {
  final String origin;
  final String destination;
  final String departureDate;
  final String arrivalDate;
  final String price;
  final String airlineName;
  final String flightNumber;
  final String flightStatus;
  final String duration;

  OneWayFlightCard({
    super.key,
    required this.origin,
    required this.destination,
    required this.departureDate,
    required this.arrivalDate,
    required this.price,
    required this.airlineName,
    required this.flightNumber,
    required this.flightStatus,
    required this.duration,
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
                  color: Theme.of(context)
                      .primaryColor, // Border color in dark mode
                  width: 2,
                )
              : BorderSide.none, // No border in light mode
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FlightAirlineName(airlineName: airlineName),
              FlightDetails(
                origin: origin,
                destination: destination,
                departureDate: departureDate,
                arrivalDate: arrivalDate,
                flightStatus: flightStatus,
                duration: duration,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: FlightPrice(price: price),
              ),
            ],
          ),
        ));
  }
}

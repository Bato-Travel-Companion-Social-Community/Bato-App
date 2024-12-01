import 'package:flutter/material.dart';
import 'blocks/index.dart' show FlightDetails, FLightDealRow, AirlineLogo;

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
  final String airlineLogoUrl;

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
    required this.airlineLogoUrl,
  });

  @override
  Widget build(BuildContext context) {
    // Check if the app is in dark mode

    return Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(
              color:
                  Theme.of(context).primaryColor, // Border color in dark mode
              width: 1,
            ) // No border in light mode
            ),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  AirlineLogo(airlineLogoUrl: airlineLogoUrl),
                ],
              ),
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
                child: FLightDealRow(price: price),
              ),
            ],
          ),
        ));
  }
}

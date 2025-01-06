import 'package:flutter/material.dart';
import 'index.dart' show FlightDetailsTopRow, FlightDetailsBottomRow;

class FlightDetails extends StatelessWidget {
  final String origin;
  final String destination;
  final String departureDate;
  final String arrivalDate;
  final String flightStatus;
  final String duration;

  FlightDetails({
    super.key,
    required this.origin,
    required this.destination,
    required this.departureDate,
    required this.arrivalDate,
    required this.flightStatus,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, bottom: 8.0),
      child: Column(
        children: [
          FlightDetailsTopRow(
              arrivalDate: arrivalDate,
              departureDate: departureDate,
              flightStatus: flightStatus),
          FlightDetailsBottomRow(
              origin: origin, destination: destination, duration: duration),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class AirlineLogo extends StatelessWidget {
  final String airlineLogoUrl;

  const AirlineLogo({super.key, required this.airlineLogoUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ClipRRect(
          borderRadius:
              BorderRadius.circular(0), // Half of width/height for a circle
          child: Image.network(
            airlineLogoUrl,
            width: 50,
            height: 50,
          )),
    );
  }
}

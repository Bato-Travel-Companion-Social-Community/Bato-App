import 'package:flutter/material.dart';
import '../../views/main.dart' show Logo; // Import the Logo widget

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Logo(size: 100), // Use the Logo widget
      ),
    );
  }
}

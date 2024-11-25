import 'package:flutter/material.dart';
import '../index.dart' show Logo; // Import the Logo widget

class MessengerPage extends StatelessWidget {
  const MessengerPage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Logo(size: 100), // Use the Logo widget
      ),
    );
  }
}

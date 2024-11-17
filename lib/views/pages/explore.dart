import 'package:flutter/material.dart';
import '../../views/main.dart' show CustomAppBar, CustomBottomBar;

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Explore Page'), // Use the Logo widget
      ),
    );
  }
}

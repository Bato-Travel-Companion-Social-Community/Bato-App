import 'package:flutter/material.dart';
import '../../views/main.dart'
    show CustomAppBar, CustomBottomBar; // Import the CustomAppBar widget

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarActions: [
          // First IconButton for notifications
          IconButton(
            icon: const Icon(Icons.notifications_none_outlined),
            color: Theme.of(context)
                .primaryColor, // Set the icon color to primaryColor from the theme
            onPressed: () {
              // Handle notification icon tap
              print("Notifications tapped");
            },
          ),

          // Second IconButton for settings
          IconButton(
            icon: const Icon(Icons.messenger_outline_sharp),
            color: Theme.of(context)
                .primaryColor, // Set the icon color to primaryColor from the theme
            onPressed: () {
              // Handle settings icon tap
              print("Settings tapped");
            },
          ),

          // Add more IconButton actions as needed
        ],
      ),
      body: Center(
        child: Text('Home Page'),
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}

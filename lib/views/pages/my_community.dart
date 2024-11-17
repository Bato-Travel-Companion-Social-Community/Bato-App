import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../views/main.dart' show CustomAppBar, CustomBottomBar;

class MyCommunityPage extends StatelessWidget {
  const MyCommunityPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appBarActions: [
          // First IconButton for notifications
          IconButton(
            icon: const Icon(Icons.notifications_none_outlined),
            iconSize: 28,
            color: Theme.of(context)
                .primaryColor, // Set the icon color to primaryColor from the theme
            onPressed: () {
              // Handle notification icon tap
              print("Notifications tapped");
            },
          ),

          // Second IconButton for settings
          IconButton(
            icon: const Icon(Icons.message_outlined),
            color: Theme.of(context)
                .primaryColor, // Set the icon color to primaryColor from the theme
            iconSize: 28,
            onPressed: () {
              // Handle settings icon tap
              print("Settings tapped");
            },
          ),

          // Add more IconButton actions as needed
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 200, // Add a height to the container
            color: Colors.red,
          ),
          Container(
            height: 200, // Add a height to the container
            color: Colors.blue,
          ),
          Container(
            height: 200, // Add a height to the container
            color: Colors.green,
          ),
          Container(
            height: 200, // Add a height to the container
            color: Colors.yellow,
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomBar(),
    );
  }
}

import 'package:flutter/material.dart';

// Function to get the list of IconButtons
List<Widget> getMyProfilePageAppBarActions(BuildContext context) {
  return [
    IconButton(
      icon: const Icon(Icons.menu),
      iconSize: 28,
      color: Theme.of(context).primaryColor,
      onPressed: () {
        print("Notifications tapped");
      },
    ),
  ];
}

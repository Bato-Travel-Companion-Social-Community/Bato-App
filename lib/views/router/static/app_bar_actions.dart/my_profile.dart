import 'package:flutter/material.dart';

// Function to get the list of IconButtons
List<Widget> getMyProfilePageAppBarActions(BuildContext context) {
  return [
    IconButton(
      icon: const Icon(Icons.notifications_none_outlined),
      iconSize: 28,
      color: Theme.of(context).primaryColor,
      onPressed: () {
        print("Notifications tapped");
      },
    ),
    IconButton(
      icon: const Icon(Icons.message_outlined),
      iconSize: 28,
      color: Theme.of(context).primaryColor,
      onPressed: () {
        print("Messages tapped");
      },
    ),
  ];
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Function to get the list of IconButtons
List<Widget> getMyCommunityPageAppBarActions(BuildContext context) {
  return [
    IconButton(
      icon: const FaIcon(FontAwesomeIcons.bell),
      iconSize: 20.0,
      color: Theme.of(context).primaryColor,
      onPressed: () {
        print("Notifications tapped");
      },
    ),
    IconButton(
      icon: const FaIcon(FontAwesomeIcons.message),
      iconSize: 20.0,
      color: Theme.of(context).primaryColor,
      onPressed: () {
        print("Messages tapped");
      },
    ),
  ];
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Function to get the list of IconButtons
List<Widget> getMyProfilePageAppBarActions(BuildContext context) {
  return [
    Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: IconButton(
        icon: const Icon(Icons.menu),
        iconSize: 28,
        color: Theme.of(context).primaryColor,
        onPressed: () {
          context.push('/menu');
        },
      ),
    ),
  ];
}

import 'package:flutter/material.dart';
import '../../views/main.dart'
    show Logo; // Assuming Logo is defined in views/main.dart

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  // This property holds the list of actions (like icons) in the AppBar
  final List<Widget> appBarActions;

  // Constructor to accept appBarActions as optional parameter
  const CustomAppBar({
    super.key,
    this.appBarActions =
        const [], // Default empty list if no actions are passed
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Logo(
        size: 40, // Customize the size of your logo as needed
      ),
      backgroundColor: Theme.of(context)
          .scaffoldBackgroundColor, // Use the scaffold background color from the current theme
      elevation: 0,
      // Conditionally add actions to the AppBar if any are passed
      actions: appBarActions,
    );
  }

  // Implement the preferredSize property (this defines the height of the AppBar)
  @override
  Size get preferredSize =>
      const Size.fromHeight(65.0); // You can adjust the height here as needed
}

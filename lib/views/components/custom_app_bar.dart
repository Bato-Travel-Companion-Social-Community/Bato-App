import 'package:flutter/material.dart';
import '../../views/main.dart'
    show Logo; // Assuming Logo is defined in views/main.dart

/// A custom AppBar widget that includes a logo and optional actions.
///
/// This widget extends [StatelessWidget] and implements [PreferredSizeWidget]
/// to provide a custom AppBar with a logo and a list of actions.
///
/// The [CustomAppBar] widget takes an optional list of [appBarActions] which
/// are displayed as actions in the AppBar. If no actions are provided, an
/// empty list is used by default.
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// A list of widgets to be displayed as actions in the AppBar.
  final List<Widget> appBarActions;

  /// Creates a [CustomAppBar] widget.
  ///
  /// The [appBarActions] parameter is optional and defaults to an empty list
  /// if not provided.
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
      elevation: 0, // Prevent any shadow effects
      scrolledUnderElevation:
          0, // Prevent app bar from changing elevation on scroll
      actions: appBarActions,
    );
  }

  /// The preferred size of the AppBar.
  ///
  /// This property defines the height of the AppBar. The default height is set
  /// to 65.0.
  @override
  Size get preferredSize =>
      const Size.fromHeight(65.0); // You can adjust the height here as needed
}

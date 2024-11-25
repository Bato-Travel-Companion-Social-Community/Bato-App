import 'package:flutter/material.dart';

/// A custom BottomAppBar widget that includes dynamic actions.
///
/// This widget extends [StatelessWidget] to provide a custom BottomAppBar
/// with a list of actions.
///
/// The [CustomBottomBar] widget takes a required [pageIndex] and an optional
/// list of [bottomBarActions] which are displayed as actions in the BottomAppBar.
/// If no actions are provided, an empty list is used by default.
class CustomBottomBar extends StatelessWidget {
  /// The index of the currently selected page.
  final int pageIndex;

  /// A list of widgets to be displayed as actions in the BottomAppBar.
  final List<Widget> bottomBarActions;

  /// Creates a [CustomBottomBar] widget.
  ///
  /// The [pageIndex] parameter is required to indicate the current page index.
  /// The [bottomBarActions] parameter is optional and defaults to an empty list
  /// if not provided.
  const CustomBottomBar({
    super.key,
    required this.pageIndex,
    this.bottomBarActions =
        const [], // Default empty list if no actions are passed
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 70.0,
      shape: const CircularNotchedRectangle(),
      color: Theme.of(context)
          .scaffoldBackgroundColor, // Use the scaffold background color from the current theme
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: bottomBarActions, // Use actions passed dynamically
      ),
    );
  }
}

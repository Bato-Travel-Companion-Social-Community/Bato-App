import 'package:flutter/material.dart';
import '../../index.dart' show CustomBottomBar;
import '../static/index.dart' show getDefaultBottomBarActions;

/// A function that determines the index of the active page in the bottom navigation bar.
///
/// The [getPageIndexOfBottomBar] function returns an integer index based on the provided route path.
/// This index corresponds to the position of the page in the bottom navigation bar. It helps to
/// track and display the correct page in a navigation stack with the [IndexedStack] widget.
///
/// [Parameters]:
/// - [fullPath]: A string representing the current route path. This helps identify which page
///   is currently active, and in turn, which index should be shown in the bottom navigation bar.
///
/// [Returns]:
/// - An integer index that corresponds to the active page in the bottom navigation bar.
///   If the route does not require a bottom navigation bar, the function returns -1.
///
/// [Example Usage]:
/// ```dart
/// int pageIndex = getPageIndexOfBottomBar('/my_community');
/// ```
int getPageIndexOfBottomBar(String? fullPath) {
  switch (fullPath) {
    case '/my_community':
      return 0; // Index for the 'My Community' page
    case '/explore':
      return 1; // Index for the 'Explore' page
    case '/add_post':
      return 2; // Index for the 'Add Post' page
    case '/plan_trip':
      return 3; // Index for the 'Plan Trip' page
    case '/my_profile':
      return 4; // Index for the 'My Profile' page
    default:
      return -1; // Routes without a bottom navigation bar (e.g., splash, login)
  }
}

/// A function that returns a customized [CustomBottomBar] with actions based on the current route.
///
/// The [getBottomBar] function generates a [CustomBottomBar] widget, which is a customized bottom
/// navigation bar, for the active page. The bottom navigation bar's actions are fetched dynamically
/// based on the current route path using the [getDefaultBottomBarActions] helper function.
///
/// The [pageIndex] is determined by the route path using the [getPageIndexOfBottomBar] function.
/// This index is then used to display the correct page in the bottom navigation and to show the
/// relevant actions in the bottom bar.
///
/// [Parameters]:
/// - [context]: The [BuildContext] of the widget tree, used to retrieve necessary information like
///   theme or inherited widgets for the bottom bar actions.
/// - [fullPath]: A string representing the current route path, which determines the active page and
///   the actions to be included in the bottom navigation bar.
///
/// [Returns]:
/// - A [CustomBottomBar] widget customized with actions for the current route. If the route requires
///   a bottom navigation bar, the appropriate page index and actions will be applied.
///
/// [Example Usage]:
/// ```dart
/// CustomBottomBar bottomBar = getBottomBar(context, '/explore');
/// ```
CustomBottomBar getBottomBar(BuildContext context, String? fullPath) {
  final int pageIndex = getPageIndexOfBottomBar(fullPath);

  switch (fullPath) {
    default:
      return CustomBottomBar(
        pageIndex: pageIndex, // Set the active page index for navigation
        bottomBarActions: getDefaultBottomBarActions(
            context, pageIndex), // Actions for the bottom bar
      );
  }
}

import 'package:flutter/material.dart';
import '../../../views/main.dart' show CustomAppBar;
import '../static/main.dart'
    show getMyCommunityPageAppBarActions, getMyProfilePageAppBarActions;

/// A function that returns a customized [CustomAppBar] based on the current route path.
///
/// The [getAppBar] function is responsible for returning a customized app bar widget
/// depending on the current navigation path (`fullPath`). The app bar can be tailored
/// with specific actions that are relevant to the page being displayed. The actions
/// are dynamically generated using helper functions for specific pages like 'My Community'
/// and 'My Profile'.
///
/// If the route matches `/my_community`, the app bar will include actions defined
/// by the `getMyCommunityPageAppBarActions` helper function. If the route matches `/my_profile`,
/// it will include actions defined by the `getMyProfilePageAppBarActions` helper function.
/// For any other routes, the function returns a default `CustomAppBar` without additional actions.
///
/// This function allows for modular and route-specific customization of the app bar for different screens.
///
/// [Parameters]:
/// - [context]: The [BuildContext] of the widget tree, used to retrieve relevant information
///   like theme or inherited widgets.
/// - [fullPath]: A string representing the current route path, which helps determine
///   which actions should be included in the app bar.
///
/// [Returns]:
/// - A [CustomAppBar] widget tailored with the appropriate actions for the current route.
///
/// [Example Usage]:
/// ```dart
/// AppBar appBar = getAppBar(context, '/my_community');
/// ```
CustomAppBar getAppBar(BuildContext context, String? fullPath) {
  switch (fullPath) {
    case '/my_community':
      return CustomAppBar(
        appBarActions: getMyCommunityPageAppBarActions(context),
      );
    case '/my_profile':
      return CustomAppBar(
        appBarActions: getMyProfilePageAppBarActions(context),
      );
    default:
      return CustomAppBar(); // Default empty app bar for other routes
  }
}

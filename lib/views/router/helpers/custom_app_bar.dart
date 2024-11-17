import 'package:flutter/material.dart';
import '../../../views/main.dart' show CustomAppBar;
import '../static/main.dart'
    show getMyCommunityPageAppBarActions, getMyProfilePageAppBarActions;

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

import 'package:flutter/material.dart';
import '../../../views/main.dart' show CustomBottomBar;
import '../static/main.dart'
    show getMyCommunityPageBottomBarActions, getDefaultBottomBarActions;

int getPageIndexOfBottomBar(String? fullPath) {
  switch (fullPath) {
    case '/my_community':
      return 0;
    case '/explore':
      return 1;
    case '/add_post':
      return 2;
    case '/plan_trip':
      return 3;
    case '/my_profile':
      return 4;
    default:
      return -1; // Routes without a bottom navigation bar
  }
}

CustomBottomBar getBottomBar(BuildContext context, String? fullPath) {
  final int pageIndex = getPageIndexOfBottomBar(fullPath);

  switch (fullPath) {
    default:
      return CustomBottomBar(
          pageIndex: pageIndex,
          bottomBarActions: getDefaultBottomBarActions(context, pageIndex));
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../views/main.dart' show AppColors;

List<Widget> getDefaultBottomBarActions(BuildContext context, int pageIndex) {
  double iconSize = 34;
  return [
    IconButton(
      icon: const Icon(Icons.home_outlined),
      color:
          pageIndex == 0 ? AppColors.primary : Theme.of(context).primaryColor,
      iconSize: iconSize,
      onPressed: () {
        if (pageIndex != 0) {
          GoRouter.of(context).go('/my_community');
        }
      },
    ),
    IconButton(
      icon: const Icon(Icons.explore_outlined),
      color:
          pageIndex == 1 ? AppColors.primary : Theme.of(context).primaryColor,
      iconSize: iconSize,
      onPressed: () {
        if (pageIndex != 1) {
          GoRouter.of(context).go('/explore');
        }
      },
    ),
    IconButton(
      icon: const Icon(Icons.add_outlined),
      color:
          pageIndex == 2 ? AppColors.primary : Theme.of(context).primaryColor,
      iconSize: iconSize,
      onPressed: () {
        if (pageIndex != 2) {
          GoRouter.of(context).go('/add_post');
        }
      },
    ),
    IconButton(
      icon: const Icon(Icons.airplane_ticket_outlined),
      color:
          pageIndex == 3 ? AppColors.primary : Theme.of(context).primaryColor,
      iconSize: iconSize,
      onPressed: () {
        if (pageIndex != 3) {
          GoRouter.of(context).go('/plan_trip');
        }
      },
    ),
    IconButton(
      icon: const Icon(Icons.account_box_outlined),
      color:
          pageIndex == 4 ? AppColors.primary : Theme.of(context).primaryColor,
      iconSize: iconSize,
      onPressed: () {
        if (pageIndex != 4) {
          GoRouter.of(context).go('/my_profile');
        }
      },
    ),
  ];
}

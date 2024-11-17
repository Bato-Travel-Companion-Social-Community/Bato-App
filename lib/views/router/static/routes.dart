import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../views/main.dart'
    show
        CustomBottomBar,
        MyCommunityPage,
        ExplorePage,
        PlanTripPage,
        MyProfilePage,
        SplashPage,
        LoginPage,
        SignupPage;
import '../helpers/main.dart' show getPageIndexOfBottomBar, getAppBar;

final List<RouteBase> routes = [
  // ShellRoute for pages with bottom navigation bar
  ShellRoute(
    builder: (context, state, child) {
      final int pageIndex = getPageIndexOfBottomBar(state.fullPath);

      // This list will hold the content of each page
      final List<Widget> pages = [
        MyCommunityPage(),
        ExplorePage(),
        PlanTripPage(),
        MyProfilePage(),
      ];

      return Scaffold(
        appBar: getAppBar(context, state.fullPath),
        body: SafeArea(
          child: IndexedStack(
            index: pageIndex, // Use the index to display the active page
            children: pages, // The pages will be preserved in memory
          ),
        ),
        bottomNavigationBar:
            pageIndex != -1 ? CustomBottomBar(pageIndex: pageIndex) : null,
      );
    },
    routes: [
      GoRoute(
        path: '/my_community',
        builder: (context, state) => MyCommunityPage(),
      ),
      GoRoute(
        path: '/explore',
        builder: (context, state) => ExplorePage(),
      ),
      GoRoute(
        path: '/plan_trip',
        builder: (context, state) => PlanTripPage(),
      ),
      GoRoute(
        path: '/my_profile',
        builder: (context, state) => MyProfilePage(),
      ),
    ],
  ),
  // Routes without bottom navigation bar
  GoRoute(
    path: '/',
    builder: (context, state) => SplashPage(),
  ),
  GoRoute(
    path: '/login',
    builder: (context, state) => LoginPage(),
  ),
  GoRoute(
    path: '/signup',
    builder: (context, state) => SignupPage(),
  ),
];

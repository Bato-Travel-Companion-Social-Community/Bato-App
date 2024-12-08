import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../index.dart'
    show
        MyCommunityPage,
        ExplorePage,
        PlanTripPage,
        MyProfilePage,
        AddPostPage,
        SplashPage,
        LoginPage,
        AddPostContent,
        MenuPage,
        SignupPage;
import '../helpers/main.dart'
    show getPageIndexOfBottomBar, getAppBar, getBottomBar;

/// A function that defines and returns the routing configuration for the app.
///
/// The [AppRoutes] function sets up a list of routes using the [GoRouter] package.
/// It organizes the routes into two categories:
/// 1. Routes with a bottom navigation bar (using a [ShellRoute])
/// 2. Routes without a bottom navigation bar (using [GoRoute])
///
/// The bottom navigation bar and the app bar are managed by the [ShellRoute], which displays
/// various pages (e.g., MyCommunityPage, ExplorePage) and allows navigation between them
/// using an indexed stack. Pages are only rebuilt when the active page changes,
/// improving app performance by keeping pages alive in memory.
///
/// The standalone routes, like the splash, login, and signup pages, do not display
/// the bottom navigation bar, providing a clean navigation flow for specific actions.
final List<RouteBase> routes = [
  // ShellRoute for pages with bottom navigation bar
  ShellRoute(
    builder: (context, state, child) {
      // Get the active page index based on the current URL
      final int pageIndex = getPageIndexOfBottomBar(state.fullPath);

      // List of pages corresponding to each navigation item
      final List<Widget> pages = [
        MyCommunityPage(),
        ExplorePage(),
        AddPostPage(),
        PlanTripPage(),
        MyProfilePage(),
      ];

      return Scaffold(
        appBar: getAppBar(
            context, state.fullPath), // App bar based on the current route
        body: SafeArea(
          child: IndexedStack(
            index: pageIndex, // Display the active page
            children: pages, // List of pages in the bottom navigation
          ),
        ),
        // Conditional bottom navigation bar (only shown when pageIndex is valid)
        bottomNavigationBar:
            pageIndex != -1 ? getBottomBar(context, state.fullPath) : null,
      );
    },
    routes: [
      // Individual routes for each page within the bottom navigation bar
      GoRoute(
        path: '/my_community', // Community page
        builder: (context, state) => MyCommunityPage(),
      ),
      GoRoute(
        path: '/explore', // Explore page
        builder: (context, state) => ExplorePage(),
      ),
      GoRoute(
        path: '/add_post', // Add post page
        builder: (context, state) => AddPostPage(),
      ),
      GoRoute(
        path: '/plan_trip', // Plan trip page
        builder: (context, state) => PlanTripPage(),
      ),
      GoRoute(
        path: '/my_profile', // Profile page
        builder: (context, state) => MyProfilePage(),
      ),
    ],
  ),

  // Routes without a bottom navigation bar (e.g., for login, signup, and splash)
  GoRoute(
    path: '/', // Splash page (initial route)
    builder: (context, state) => SplashPage(),
  ),
  GoRoute(
    path: '/login', // Login page for user authentication
    builder: (context, state) => LoginPage(),
  ),
  GoRoute(
    path: '/signup', // Signup page for user registration
    builder: (context, state) => SignupPage(),
  ),
  GoRoute(
    path: '/add-post-content',
    builder: (context, state) {
      final files = state.extra as List<File>; // Retrieve extra data
      return AddPostContent(files: files);
    },
  ),
  GoRoute(
    path: '/menu', // Signup page for user registration
    builder: (context, state) => MenuPage(),
  ),
];

import 'dart:async'; // For Timer
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../controllers/main.dart' show AuthService;
import '../../views/main.dart' show SplashPage; // Import SplashPage

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    // Start a 5-second timer to determine navigation
    Timer(const Duration(seconds: 8), _checkUserLoginStatus);
  }

  /// Checks if the user is logged in and navigates accordingly
  Future<void> _checkUserLoginStatus() async {
    bool isLoggedIn = await _authService.isUserLoggedIn();
    if (mounted) {
      if (isLoggedIn) {
        // Navigate to MyCommunityPage if logged in
        context.go('/my_community');
      } else {
        // Navigate to LoginPage if not logged in
        context.go('/login');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // Use SplashPage as the content during the 5-second timer
    return const SplashPage();
  }
}

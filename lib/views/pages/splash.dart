import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../controllers/index.dart' show AuthService; // Import AuthService
import '../index.dart' show Logo; // Import Logo widget

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Instance of AuthService to check login status
    final AuthService _authService = AuthService();

    // Add a delay of 3 seconds before checking the login status
    Future.delayed(const Duration(seconds: 3), () async {
      // Check if the user is logged in by checking if a valid token exists
      bool isLoggedIn = await _authService.isUserLoggedIn();

      // Navigate to the appropriate page based on login status
      if (isLoggedIn) {
        // Navigate to MyCommunityPage if logged in
        context.go('/my_community');
      } else {
        // Navigate to LoginPage if not logged in
        context.go('/login');
      }
    });

    // Display the splash screen with the logo
    return const Scaffold(
      body: Center(
        child: Logo(size: 100), // Show logo for splash screen
      ),
    );
  }
}

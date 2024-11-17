import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'views/main.dart' show AppTheme, SplashPage, LoginPage, MyCommunityPage;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  void toggleTheme(bool isDarkMode) {
    setState(() {
      _themeMode = isDarkMode ? ThemeMode.dark : ThemeMode.light;
    });
  }

  late final GoRouter _router = GoRouter(
    initialLocation: '/', // Start at splash page
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) =>
            const SplashPage(), // Show splash page first
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginPage(), // Show login page
      ),
      GoRoute(
        path: '/my_community',
        builder: (context, state) =>
            const MyCommunityPage(), // Show MyCommunityPage
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Bato',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,
      routerConfig: _router, // Use routerConfig here
    );
  }
}

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'views/main.dart'
    show
        AppTheme,
        HomePage,
        LoginPage,
        SignupPage,
        MyCommunity,
        Explore,
        PlanTrip,
        Account;

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
    routes: [
      // Define your routes here
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context, state) => SignupPage(),
      ),
      GoRoute(
        path: '/my_community',
        builder: (context, state) => MyCommunity(),
      ),
      GoRoute(
        path: '/explore',
        builder: (context, state) => Explore(),
      ),
      GoRoute(
        path: '/plan_trip',
        builder: (context, state) => PlanTrip(),
      ),
      GoRoute(
        path: '/account',
        builder: (context, state) => Account(),
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
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
    );
  }
}

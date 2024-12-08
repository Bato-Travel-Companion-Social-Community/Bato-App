import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bato_app/main.dart' show ThemeNotifier;

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: Center(
        child: Switch(
          value: themeNotifier.themeMode == ThemeMode.dark,
          onChanged: themeNotifier.toggleTheme,
        ),
      ),
    );
  }
}

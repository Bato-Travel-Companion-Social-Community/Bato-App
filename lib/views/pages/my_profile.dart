import 'package:flutter/material.dart';
import '../../views/main.dart' show CustomAppBar;

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Welcome to the Profile Page"),
      ),
    );
  }
}

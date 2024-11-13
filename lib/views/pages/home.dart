import 'package:flutter/material.dart';
import '../../views/main.dart' show CustomAppBar;

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        child: Center(
          child: Text('Home Page'),
        ),
      ),
    );
  }
}

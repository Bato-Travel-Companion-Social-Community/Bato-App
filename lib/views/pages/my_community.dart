import 'package:flutter/material.dart';
import '../../views/main.dart' show CustomAppBar, CustomBottomBar;

class MyCommunityPage extends StatelessWidget {
  const MyCommunityPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: 200, // Add a height to the container
            color: Colors.red,
          ),
          Container(
            height: 200, // Add a height to the container
            color: Colors.blue,
          ),
          Container(
            height: 200, // Add a height to the container
            color: Colors.green,
          ),
          Container(
            height: 200, // Add a height to the container
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}

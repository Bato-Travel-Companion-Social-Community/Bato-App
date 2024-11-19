import 'package:flutter/material.dart';

class CustomBottomBar extends StatelessWidget {
  final int pageIndex;
  final List<Widget> bottomBarActions;

  const CustomBottomBar({
    super.key,
    required this.pageIndex,
    this.bottomBarActions = const [],
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: bottomBarActions, // Use actions passed dynamically
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../views/main.dart' show AppColors;

class CustomBottomBar extends StatelessWidget {
  final int pageIndex;
  const CustomBottomBar({
    super.key,
    required this.pageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape:
          const CircularNotchedRectangle(), // Optional: Creates rounded corners at the middle
      color: Theme.of(context)
          .scaffoldBackgroundColor, // Use the current theme's background color
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceEvenly, // Spacing between the icons
        children: [
          IconButton(
            icon: const Icon(Icons.home_outlined),
            color: pageIndex == 0
                ? AppColors.primary
                : Theme.of(context).primaryColor,
            iconSize: 35,
            onPressed: () {}, // Empty onPressed
          ),
          IconButton(
            icon: const Icon(Icons.explore_outlined),
            color: pageIndex == 1
                ? AppColors.primary
                : Theme.of(context).primaryColor,
            iconSize: 35,
            onPressed: () {}, // Empty onPressed
          ),
          IconButton(
            icon: const Icon(Icons.airplane_ticket_outlined),
            color: pageIndex == 2
                ? AppColors.primary
                : Theme.of(context).primaryColor,
            iconSize: 35,
            onPressed: () {}, // Empty onPressed
          ),
          IconButton(
            icon: const Icon(Icons.account_box_outlined),
            color: pageIndex == 3
                ? AppColors.primary
                : Theme.of(context).primaryColor,
            iconSize: 35,
            onPressed: () {}, // Empty onPressed
          ),
        ],
      ),
    );
  }
}

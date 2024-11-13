import 'package:flutter/material.dart';
import '../../views/main.dart' show AppTheme, Logo;

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Logo(
        size: 30,
      ),
      // Use the scaffold background color from Theme if desired
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
    );
  }

  // Implement the preferredSize property
  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

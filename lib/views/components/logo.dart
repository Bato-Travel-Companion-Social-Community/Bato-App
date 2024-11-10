import 'package:flutter/material.dart';
import '../../views/main.dart' show AppTextStyles, AppColors;

class Logo extends StatelessWidget {
  final double size;

  /// The [size] parameter controls the font size of the text.

  const Logo({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Bato',
      style: TextStyle(
        fontFamily: AppTextStyles.fontFamily,
        fontSize: size, // Use size to set the font size
        fontWeight: FontWeight.bold,
        color: AppColors.primary, // You can customize the color as needed
      ),
    );
  }
}

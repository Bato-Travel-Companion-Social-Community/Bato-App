import 'package:flutter/material.dart';
import '../../views/main.dart' show AppTextStyles, AppColors;

/// A stateless widget that displays the logo text.
///
/// The [Logo] widget takes a [size] parameter which controls the font size of the text.
/// The text displayed is 'Bato' with a bold font weight and a primary color defined in [AppColors].
///
/// Example usage:
/// ```dart
/// Logo(size: 24.0);
/// ```
class Logo extends StatelessWidget {
  /// The size of the font for the logo text.
  final double size;

  /// Creates a [Logo] widget.
  ///
  /// The [size] parameter must not be null and is required to set the font size of the text.
  const Logo({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Bato',
      style: TextStyle(
        fontFamily:
            AppTextStyles.fontFamilyPrimary, // Use the primary font family
        fontSize: size, // Use size to set the font size
        fontWeight: FontWeight.w900,
        color: AppColors.primary, // You can customize the color as needed
      ),
    );
  }
}

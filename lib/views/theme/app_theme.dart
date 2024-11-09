import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// A class that holds the theme data for the application.
///
/// This class provides a centralized place to define the visual styling of the
/// application, including colors, fonts, and other theme-related properties.
/// It helps maintain a consistent look and feel throughout the app.
class AppTheme {
  /// The light theme for the application.
  ///
  /// This theme is used when the application is in light mode. It defines
  /// various properties such as primary color, background color, text styles,
  /// and button styles.
  static final ThemeData lightTheme = ThemeData(
    // The primary color used in the application.
    primaryColor: AppColors.primary,

    // The background color for scaffold widgets.
    scaffoldBackgroundColor: AppColors.lightBackground,

    // The brightness of the theme, set to light.
    brightness: Brightness.light,

    // The default font family for the application.
    fontFamily: 'sans-serif',

    // The text theme for the application, defining styles for different text elements.
    textTheme: TextTheme(
      // The default text style for medium-sized body text.
      bodyMedium: const TextStyle(color: Color(0xff0D0C0C)),

      // The text style for large display text, using the Fredoka font.
      displayLarge: GoogleFonts.fredoka(
        fontSize: 32,
        color: Color(0xff0D0C0C),
      ),

      // The text style for large labels, such as button text, using the Fredoka font.
      labelLarge: GoogleFonts.fredoka(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),

    // The theme for elevated buttons, defining their appearance.
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        // The background color of elevated buttons.
        backgroundColor: AppColors.primary,

        // The text style for elevated buttons, using the Fredoka font.
        textStyle: GoogleFonts.fredoka(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),

        // The shape of elevated buttons, with rounded corners.
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    brightness: Brightness.dark,
    fontFamily: 'sans-serif', // Explicitly set to sans-serif
    textTheme: TextTheme(
      bodyMedium: const TextStyle(color: Color(0xffffffff)), // Uses sans-serif
      displayLarge: GoogleFonts.fredoka(
        fontSize: 32,
        color: Color(0xffffffff),
      ), // Fredoka for large displays
      labelLarge: GoogleFonts.fredoka(
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ), // Fredoka for button text
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        textStyle: GoogleFonts.fredoka(
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    ),
  );
}

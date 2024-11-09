import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// A class that holds the theme data for the application.
class AppTheme {
  /// The light theme for the application.
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    brightness: Brightness.light,
    fontFamily: 'sans-serif', // Explicitly set to sans-serif
    textTheme: TextTheme(
      bodyMedium: const TextStyle(color: Color(0xff0D0C0C)), // Uses sans-serif
      displayLarge: GoogleFonts.fredoka(
        fontSize: 32,
        color: Color(0xff0D0C0C),
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

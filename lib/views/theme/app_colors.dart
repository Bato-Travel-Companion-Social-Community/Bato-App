import 'package:flutter/material.dart';

/// A class that holds the color constants used throughout the application.
///
/// This class provides a centralized place to define the color palette for the
/// application. By using these constants, you can ensure a consistent color
/// scheme throughout the app.
class AppColors {
  /// The primary color used in the application.
  ///
  /// This color is used as the main color for the app's branding and primary
  /// UI elements.
  static const primary = Color(0xff40E0D0);

  /// The background color used in light theme.
  ///
  /// This color is used as the background color for screens and components
  /// when the app is in light mode.
  static const lightBackground = Color(0xffffffff);

  /// The background color used in dark theme.
  ///
  /// This color is used as the background color for screens and components
  /// when the app is in dark mode.
  static const darkBackground = Color(0xff0D0C0C);

  /// A grey color used for various UI elements.
  ///
  /// This color can be used for borders, dividers, and other UI elements that
  /// require a neutral grey color.
  static const grey = Color(0xffBEBEBE);

  /// A darker grey color used for various UI elements.
  ///
  /// This color can be used for text, icons, and other UI elements that require
  /// a darker grey color.
  static const darkGrey = Color(0xff343434);
}

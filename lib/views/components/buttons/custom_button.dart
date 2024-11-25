import 'package:flutter/material.dart';
import '../../index.dart' show AppColors, AppTextStyles;

/// CustomButton is a reusable widget that encapsulates an ElevatedButton with
/// customizable text, action, and styling. It also integrates optional form validation
/// by checking if a FormKey is passed, and triggering a callback function when pressed.
class CustomButton extends StatelessWidget {
  // The text to display on the button.
  final String text;

  // The optional onPressed callback function, executed when the button is pressed.
  final Function? onPressed;

  // The optional formKey to validate the form before executing the onPressed callback.
  final GlobalKey<FormState>? formKey;

  // Optional width of the button. Defaults to 120.
  final double? width;

  // Optional height of the button. Defaults to 60.
  final double? height;

  /// Constructs a CustomButton widget with the provided parameters.
  ///
  /// [text] is the label shown on the button.
  /// [onPressed] is the callback function that is triggered when the button is pressed.
  /// [formKey] is the key used for form validation. If provided, the form will be validated
  /// before executing the onPressed callback.
  /// [width] is the width of the button. Defaults to 120.
  /// [height] is the height of the button. Defaults to 60.
  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.formKey,
    this.width = 120,
    this.height = 60,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width, // Sets the width of the button
      height: height, // Sets the height of the button
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
              AppColors.primary), // Background color of the button
        ),
        onPressed: () {
          // If a formKey is provided, validate the form before proceeding
          if (formKey != null && formKey!.currentState!.validate()) {
            // Show a snackbar indicating that data is being processed
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Processing Data'),
              ),
            );
          }

          // If onPressed is not null, execute the provided callback
          if (onPressed != null) {
            onPressed!();
          }
        },
        child: Text(
          text, // Display the button text
          style: TextStyle(
            color: Theme.of(context).scaffoldBackgroundColor, // Text color
            fontFamily:
                AppTextStyles.fontFamilyPrimary, // Font family for the text
            fontWeight: FontWeight.bold, // Font weight for the text
            fontSize: 22, // Font size for the text
          ),
        ),
      ),
    );
  }
}

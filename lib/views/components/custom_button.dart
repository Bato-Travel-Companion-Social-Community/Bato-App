import 'package:flutter/material.dart';
import '../../views/main.dart' show AppColors, AppTextStyles;

class CustomButton extends StatelessWidget {
  final String text;
  final Function? onPressed;
  final GlobalKey<FormState>? formKey;
  final double? width;
  final double? height;

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
      width: width,
      height: height,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(AppColors.primary),
        ),
        onPressed: () {
          if (formKey != null && formKey!.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Processing Data'),
              ),
            );
          }
          if (onPressed != null) {
            onPressed!();
          }
        },
        child: Text(
          text,
          style: TextStyle(
            color: AppColors.lightBackground,
            fontFamily: AppTextStyles.fontFamilyPrimary,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
    );
  }
}

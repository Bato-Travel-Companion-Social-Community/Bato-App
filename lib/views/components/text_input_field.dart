import 'package:flutter/material.dart';
import '../../views/main.dart' show AppColors;

class TextInputField extends StatelessWidget {
  final String errorText;
  final String hintText;
  final bool isPassword;

  const TextInputField(
      {super.key,
      required this.errorText,
      required this.hintText,
      this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: AppColors.grey),
          border: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.grey),
              borderRadius: BorderRadius.circular(10),
              gapPadding: 2.0),
          contentPadding: const EdgeInsets.all(8.0)),
      obscureText: isPassword,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return errorText;
        }
        return null;
      },
    );
  }
}

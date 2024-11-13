import 'package:flutter/material.dart';
import '../../views/main.dart' show AppColors;

class TextInputField extends StatefulWidget {
  final String errorText;
  final String hintText;
  final bool isPassword;

  const TextInputField({
    super.key,
    required this.errorText,
    required this.hintText,
    this.isPassword = false,
  });

  @override
  TextInputFieldState createState() => TextInputFieldState();
}

class TextInputFieldState extends State<TextInputField> {
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: AppColors.grey),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.grey, width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.grey, width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.grey, width: 1.0),
          borderRadius: BorderRadius.circular(10),
        ),
        contentPadding: const EdgeInsets.all(8.0),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
      cursorColor: AppColors.grey, // Set the cursor color to keep it consistent
      obscureText: widget.isPassword ? _obscureText : false,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return widget.errorText;
        }
        return null;
      },
    );
  }
}

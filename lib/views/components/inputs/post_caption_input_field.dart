import 'package:flutter/material.dart';

class PostCaptionInputField extends StatelessWidget {
  final TextEditingController inputController;

  PostCaptionInputField({required this.inputController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 600, // Set the fixed height
        child: TextField(
          controller: inputController,
          maxLines: null, // Allow unlimited lines
          expands: true, // Makes the TextField fill the given height
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.grey,
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Colors.grey, // Keep the border gray when focused
                width: 1,
              ),
            ),
            hintText: 'Tell us about your trip ...',
          ),
          textAlignVertical: TextAlignVertical.top, // Align text at the top
          cursorColor: Colors.grey, // Set the cursor color to gray
        ));
  }
}

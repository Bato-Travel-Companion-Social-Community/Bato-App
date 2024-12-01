import 'dart:io';
import 'package:flutter/material.dart';
import 'package:bato_app/views/index.dart' show AppTextStyles;

// ignore: must_be_immutable
class SendPostButton extends StatelessWidget {
  List<File> files;
  final String caption;

  SendPostButton({required this.files, required this.caption});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(
            Theme.of(context).scaffoldBackgroundColor,
          ),
          elevation: WidgetStateProperty.all<double>(0),
          side: WidgetStateProperty.all<BorderSide>(
            BorderSide(
              color: Theme.of(context).primaryColor,
              width: 1.0,
            ),
          ),
        ),
        onPressed: () {
          // Send the post data
          print('Sending post data...');
          print('Caption: $caption');
          print('Files: $files');
        },
        child: Text(
          'Post',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 16.0,
            fontWeight: FontWeight.normal,
            fontFamily: AppTextStyles.fontFamilyPrimary,
          ),
        ),
      ),
    );
  }
}

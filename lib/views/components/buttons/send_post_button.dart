import 'dart:io';
import 'package:flutter/material.dart';
import 'package:bato_app/views/index.dart' show AppTextStyles;
import 'package:bato_app/controllers/index.dart' show AddPostService;
import 'package:go_router/go_router.dart';

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
          AddPostService().addPostService(
            images: files,
            caption: caption,
            location: 'Berlin, Germany',
          );

          context.go('/my_community');
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

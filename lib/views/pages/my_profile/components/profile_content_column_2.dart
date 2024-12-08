import 'package:flutter/material.dart';
import 'package:bato_app/views/index.dart'
    show AppTextStyles, AppColors; // Import text styles

class ProfileContentColumn2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              iconSize: 30,
              onPressed: () {},
              icon: Icon(
                Icons.edit,
              ),
              color: AppColors.primary),
          IconButton(
              iconSize: 30,
              onPressed: () {},
              icon: Icon(Icons.share),
              color: AppColors.primary),
          IconButton(
              iconSize: 30,
              onPressed: () {},
              icon: Icon(Icons.message),
              color: AppColors.primary),
        ],
      ),
    );
  }
}

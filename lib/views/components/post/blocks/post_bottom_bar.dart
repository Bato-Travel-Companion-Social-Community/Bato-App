import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostBottomBar extends StatelessWidget {
  const PostBottomBar({Key? key}) : super(key: key);

  final double iconSize = 25.0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 6.0,
        horizontal: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: FaIcon(FontAwesomeIcons.heart),
                iconSize: iconSize,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {},
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.comment),
                iconSize: iconSize,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {},
              ),
              IconButton(
                icon: FaIcon(FontAwesomeIcons.paperPlane),
                iconSize: iconSize,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {},
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.luggage_outlined),
            iconSize: 30,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

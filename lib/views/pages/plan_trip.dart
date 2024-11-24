import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../views/main.dart' show AppColors;

class PlanTripPage extends StatelessWidget {
  const PlanTripPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Column(
        children: [
          // TabBar can be placed here in the body
          TabBar(
            tabs: const [
              FaIcon(FontAwesomeIcons.plane),
              FaIcon(FontAwesomeIcons.hotel),
            ],
            splashFactory: NoSplash.splashFactory,
            overlayColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                return states.contains(MaterialState.focused)
                    ? null
                    : Colors.transparent;
              },
            ),
            labelColor: Theme.of(context).primaryColor,
            labelPadding: EdgeInsets.all(10),
            unselectedLabelColor: Colors.grey,
            indicatorColor: AppColors.primary,
          ),
          // TabBarView to show content for each tab
          Expanded(
            child: TabBarView(
              children: [
                Center(child: Text('Content of Tab 1')),
                Center(child: Text('Content of Tab 2')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

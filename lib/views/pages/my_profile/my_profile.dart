import 'package:flutter/material.dart';
import '../../../controllers/index.dart' show ProfileService; // Import services
import '../../../models/index.dart' show UserModel; // Import user model
import 'components/index.dart'
    show ProfileDetails, MyTrips; // Import profile details

class MyProfilePage extends StatefulWidget {
  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  late Future<UserModel?> _profileFuture;

  @override
  void initState() {
    super.initState();
    _profileFuture = ProfileService().getMyProfileDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder<UserModel?>(
        future: _profileFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading profile'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No profile data found'));
          } else {
            final user = snapshot.data!;
            return Column(
              children: [
                SizedBox(height: 10),
                ProfileDetails(
                    profileAvatar: user.avatar, displayName: user.displayName),
                SizedBox(height: 10),
                Expanded(
                  child: MyTrips(),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}

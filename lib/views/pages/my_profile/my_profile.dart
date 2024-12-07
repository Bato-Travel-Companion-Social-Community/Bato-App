import 'package:flutter/material.dart';
import '../../../controllers/index.dart' show ProfileService; // Import services
import '../../../models/index.dart' show UserModel; // Import user model
import 'package:bato_app/views/index.dart'
    show AppTextStyles, AppColors; // Import text styles
import 'components/index.dart' show ProfileDetails; // Import profile details

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
    print('Profile future: $_profileFuture');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel?>(
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
          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              ProfileDetails(profileAvatar: user.avatar),
              SizedBox(height: 40), // Larger spacing for sectioning
              Text(
                "Welcome, ${user.displayName}!",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              // Add more content below here, it will be scrollable
              SizedBox(height: 20),

              Text(
                "More profile content goes here...",
                style: TextStyle(fontSize: 18),
              ),
            ],
          );
        }
      },
    );
  }
}

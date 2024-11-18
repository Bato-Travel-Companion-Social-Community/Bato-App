import 'package:flutter/material.dart';
import '../../views/main.dart'
    show CustomAppBar, CustomBottomBar, PostComponent;

class MyCommunityPage extends StatelessWidget {
  const MyCommunityPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          PostComponent(
            ownerName: 'John Doe',
            location: 'San Francisco, CA',
            profileImageUrl:
                'https://images.pexels.com/photos/1542085/pexels-photo-1542085.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', // Example profile picture URL
            imageUrl:
                'https://www.wns.co.za/Portals/0/Images/HeaderBanner/desktop/1087/53/travel_HD.jpg', // Example post image URL
            description: 'Exploring the beauty of nature! 🌿✨',
          ),
          PostComponent(
            ownerName: 'John Doe',
            location: 'San Francisco, CA',
            profileImageUrl:
                'https://images.pexels.com/photos/3763188/pexels-photo-3763188.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            imageUrl:
                'https://images.pexels.com/photos/28271625/pexels-photo-28271625/free-photo-of-carretera-trafico-paisaje-arena.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            description: 'Exploring the beauty of nature! 🌿✨',
          ),
          PostComponent(
            ownerName: 'John Doe',
            location: 'San Francisco, CA',
            profileImageUrl:
                'https://images.pexels.com/photos/3763188/pexels-photo-3763188.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            imageUrl:
                'https://images.pexels.com/photos/28931627/pexels-photo-28931627/free-photo-of-calabazas-blancas-y-naranjas-en-una-escena-de-cosecha-de-otono.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
            description: 'Exploring the beauty of nature! 🌿✨',
          ),
          Container(
            height: 200, // Add a height to the container
            color: Colors.yellow,
          ),
        ],
      ),
    );
  }
}

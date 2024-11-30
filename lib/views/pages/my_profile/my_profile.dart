import 'package:flutter/material.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 48),
            // Profile Header
            _buildProfileHeader(),
            const SizedBox(height: 20),
            // Stats Row
            _buildStatsRow(),
            const SizedBox(height: 20),
            // Navigation Tabs
            _buildNavigationTabs(),
            const SizedBox(height: 20),
            // Recent Destinations
            _buildSectionTitle('Recent Destinations'),
            _buildDestinationsGrid(recentDestinations),
            const SizedBox(height: 20),
            // Bucket List
            _buildSectionTitle('Bucket List'),
            _buildDestinationsGrid(bucketList),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
            'https://cdn.prod.website-files.com/670e0ce761868ff9e8915a06/6716559d5cf12e6cc0460879_65f863d2b8a8f574defc2744_Photographer_Instagram_Bio_Ideas_9b21b83a87.webp', // Replace with your image URL
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Heather Young',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            fixedSize: const Size(125, 10),
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Text(
            'FOLLOW',
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        ),
      ],
    );
  }

  Widget _buildStatsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildStatItem('I am in Peru', Icons.location_on),
        _buildStatItem('14 Countries', Icons.check),
        _buildStatItem('1,563 Followers', Icons.person),
      ],
    );
  }

  Widget _buildStatItem(String text, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 20, color: Colors.grey),
        const SizedBox(height: 4),
        Text(
          text,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildNavigationTabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildTab('Destinations', true),
        _buildTab('Blog', false),
        _buildTab('Reviews', false),
      ],
    );
  }

  Widget _buildTab(String text, bool isSelected) {
    return Column(
      children: [
        Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.grey,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        if (isSelected)
          Container(
            margin: const EdgeInsets.only(top: 4),
            height: 2,
            width: 40,
            color: Colors.black,
          ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildDestinationsGrid(List<Destination> destinations) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.7,
        ),
        itemCount: destinations.length,
        itemBuilder: (context, index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              destinations[index].imageUrl,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}

class Destination {
  final String imageUrl;
  final String name;
  final String location;

  Destination({
    required this.imageUrl,
    required this.name,
    required this.location,
  });
}

// Sample data
final List<Destination> recentDestinations = [
  Destination(
    imageUrl:
        'https://charlieswanderings.com/wp-content/uploads/2022/07/LAKE-LOUISE-THINGS-TO-DO-8-scaled.jpg',
    name: 'Lake Louise',
    location: 'Canada',
  ),
  Destination(
    imageUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkVxrT93qftiP4BfEetKNzctiVod2jjwW0G_OxvED9iX18fKvcjv4aFrZjW_qBANR9QEI&usqp=CAU',
    name: 'Ao Nang',
    location: 'Thailand',
  ),
  Destination(
    imageUrl:
        'https://i.insider.com/5a4b97757101ad3d94104d27?width=800&format=jpeg&auto=webp',
    name: 'Nerja',
    location: 'Spain',
  ),
];

final List<Destination> bucketList = [
  Destination(
    imageUrl:
        'https://suchscience.net/wp-content/uploads/2024/09/v2-invzi-lrsit.jpg',
    name: 'Destination 1',
    location: 'Location 1',
  ),
  Destination(
    imageUrl:
        'https://humanidades.com/wp-content/uploads/2016/07/clima-tropical-playa-e1559929560445-800x400.jpg',
    name: 'Destination 2',
    location: 'Location 2',
  ),
  Destination(
    imageUrl:
        'https://static.toiimg.com/photo/msid-88558148,width-96,height-65.cms',
    name: 'Destination 3',
    location: 'Location 3',
  ),
];

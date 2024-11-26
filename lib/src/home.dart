import 'package:flutter/material.dart';
import 'package:flutter_application_buoi2/src/layou/FeaturedTours.dart';

import 'package:flutter_application_buoi2/src/layou/best_guides.dart';
import 'package:flutter_application_buoi2/src/layou1/TravelNews.dart';
import 'package:flutter_application_buoi2/src/layou1/chat_page.dart';
// import 'package:flutter_application_buoi2/src/layou1/explore_page.dart';
import 'package:flutter_application_buoi2/src/layou1/my_trip_page.dart';
import 'package:flutter_application_buoi2/src/layou1/notifications_page.dart';
import 'package:flutter_application_buoi2/src/layou1/profile_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getSelectedPage(), // Hiển thị trang tương ứng
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _getSelectedPage() {
    List<Widget> pages = [
      _buildHomePage(),
      // ExplorePage(), 
      MyTripPage(),
      ChatPage(),
      NotificationsPage(),
      ProfilePage(),
    ];
    return pages[_selectedIndex];
  }

  Widget _buildHomePage() {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(),
            _buildSearchField(),
            _buildSectionTitle('Top Journeys'),
            _buildJourneyCards(),
            _buildSectionTitle('Best Guides', showSeeMore: true),
            BestGuides(),
            _buildSectionTitle('Featured Tours', showSeeMore: true),
            FeaturedTours(),
            _buildSectionTitle('Travel News', showSeeMore: true),
            TravelNews(),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      selectedItemColor: Colors.teal,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Khám phá'),
        BottomNavigationBarItem(icon: Icon(Icons.location_on), label: 'My Trip'),
        BottomNavigationBarItem(icon: Icon(Icons.message), label: 'Chat'),
        BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildHeader() {
    return Stack(
      children: [
        Image.asset(
          'images/image 3.png',
          width: double.infinity,
          height: 200,
          fit: BoxFit.cover,
          semanticLabel: 'Header Image',
        ),
        Positioned(
          top: 40,
          left: 16,
          right: 16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Home', style: _headerTextStyle()),
                  const SizedBox(height: 8),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildLocationInfo(Icons.location_on, 'Da Nang'),
                  _buildLocationInfo(Icons.wb_sunny, '26°C'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  TextStyle _headerTextStyle() {
    return const TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold);
  }

  Widget _buildLocationInfo(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.white),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Hi, where do you want to explore?',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, {bool showSeeMore = false}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          if (showSeeMore)
            GestureDetector(
              onTap: () {
                // Logic khi người dùng nhấn vào 'SEE MORE'
                print('SEE MORE tapped');
              },
              child: const Text('SEE MORE', style: TextStyle(color: Colors.green)),
            ),
        ],
      ),
    );
  }

  Widget _buildJourneyCards() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          JourneyCard(
            imageUrl: 'images/1.png',
            title: 'Da Nang - Ba Na - Hoi An',
            date: 'Jan 30, 2020',
            duration: '3 days',
            price: '400.00',
            likes: '1247 likes',
          ),
          const SizedBox(width: 16),
          JourneyCard(
            imageUrl: 'images/2.png',
            title: 'Thailand',
            date: 'Jan 30, 2020',
            duration: '3 days',
            price: '600.00',
            likes: '1247 likes',
          ),
          const SizedBox(width: 16),
          JourneyCard(
            imageUrl: 'images/3.png',
            title: 'Vietnam',
            date: 'Jan 30, 2020',
            duration: '3 days',
            price: '500.00',
            likes: '1247 likes',
          ),
        ],
      ),
    );
  }
}

class JourneyCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String date;
  final String duration;
  final String price;
  final String likes;

  const JourneyCard({
    required this.imageUrl,
    required this.title,
    required this.date,
    required this.duration,
    required this.price,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: _cardDecoration(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(imageUrl, width: double.infinity, height: 100, fit: BoxFit.cover),
            ),
            const SizedBox(height: 8),
            _buildLikesInfo(likes),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            _buildDateInfo(Icons.calendar_today, date),
            const SizedBox(height: 4),
            _buildDateInfo(Icons.access_time, duration),
            const SizedBox(height: 8),
            Text(price, style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: const [
        BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
      ],
    );
  }

  Widget _buildLikesInfo(String likes) {
    return Row(
      children: [
        Icon(Icons.star, color: Colors.yellow[700], size: 16),
        const SizedBox(width: 4),
        Text(likes, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildDateInfo(IconData icon, String info) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey),
        const SizedBox(width: 4),
        Text(info, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

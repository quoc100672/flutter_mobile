import 'package:flutter/material.dart';

class FeaturedTours extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        shrinkWrap: true, // Điều này giúp ListView hoạt động trong Column
        physics: NeverScrollableScrollPhysics(), // Đảm bảo rằng ListView không bị cuộn nếu nó nằm trong SingleChildScrollView
        children: [
          TravelCard(
            imageUrl: 'images/5.png',
            imageDescription: 'Aerial view of Sydney Opera House and Sydney Harbour Bridge',
            title: 'Melbourne - Sydney',
            date: 'Jan 30, 2020',
            duration: '3 days',
            price: '\$600.00',
            likes: '1247 likes',
          ),
          SizedBox(height: 16),
          TravelCard(
            imageUrl: 'images/6.png',
            imageDescription: 'Aerial view of Ha Long Bay with boats and islands',
            title: 'Hanoi - Ha Long Bay',
            date: 'Jan 30, 2020',
            duration: '3 days',
            price: '\$300.00',
            likes: '1247 likes',
          ),
        ],
      ),
    );
  }
}

class TravelCard extends StatelessWidget {
  final String imageUrl;
  final String imageDescription;
  final String title;
  final String date;
  final String duration;
  final String price;
  final String likes;

  const TravelCard({
    required this.imageUrl,
    required this.imageDescription,
    required this.title,
    required this.date,
    required this.duration,
    required this.price,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(Icons.star, color: Colors.yellow[700], size: 20);
                      }),
                    ),
                    SizedBox(width: 8),
                    Text(
                      likes,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.calendar_today, color: Colors.grey[600], size: 20),
                    SizedBox(width: 8),
                    Text(
                      date,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.access_time, color: Colors.grey[600], size: 20),
                    SizedBox(width: 8),
                    Text(
                      duration,
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      price,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green[500]),
                    ),
                    Icon(Icons.favorite, color: Colors.green[500], size: 24),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

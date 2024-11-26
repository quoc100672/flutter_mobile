import 'package:flutter/material.dart';

class TravelNews extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section title

          // List of TravelNewsItem
          ListView(
            shrinkWrap: true, // Allows the ListView to take only necessary space
            physics: NeverScrollableScrollPhysics(), // Disable scrolling for the ListView
            children: [
              TravelNewsItem(
                title: 'New Destination in Danang City',
                date: 'Feb 5, 2020',
                imageUrl: 'images/7.png',
              ),
              TravelNewsItem(
                title: '\$1 Flight Ticket',
                date: 'Feb 5, 2020',
                imageUrl: 'images/8.png',
              ),
              TravelNewsItem(
                title: 'Visit Korea in this Tet Holiday',
                date: 'Jan 26, 2020',
                imageUrl: 'images/9.png',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TravelNewsItem extends StatelessWidget {
  final String title;
  final String date;
  final String imageUrl;

  TravelNewsItem({
    required this.title,
    required this.date,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              date,
              style: TextStyle(color: Colors.grey),
            ),
            SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(imageUrl),
            ),
          ],
        ),
      ),
    );
  }
}

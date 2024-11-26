import 'package:flutter/material.dart';

class BestGuides extends StatelessWidget {
  final List<Guide> guides = [
    Guide(name: "Tuan Tran", location: "Danang, Vietnam", reviews: 127, imageUrl: "images/3.png"),
    Guide(name: "Emmy", location: "Hanoi, Vietnam", reviews: 127, imageUrl: "images/4.png"),
    Guide(name: "Linh Hana", location: "Danang, Vietnam", reviews: 127, imageUrl: "images/3.png"),
    Guide(name: "Khai Ho", location: "Ho Chi Minh, Vietnam", reviews: 127, imageUrl: "images/3.png"),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: guides.length,
          itemBuilder: (context, index) {
            final guide = guides[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                    child: Image.network(
                      guide.imageUrl,
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.yellow, size: 16),
                            Icon(Icons.star, color: Colors.yellow, size: 16),
                            Icon(Icons.star, color: Colors.yellow, size: 16),
                            Icon(Icons.star, color: Colors.yellow, size: 16),
                            Icon(Icons.star, color: Colors.yellow, size: 16),
                            SizedBox(width: 4),
                            Text('${guide.reviews} Reviews', style: TextStyle(color: Colors.grey)),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(guide.name, style: TextStyle(fontWeight: FontWeight.bold)),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.green, size: 16),
                            SizedBox(width: 4),
                            Text(guide.location, style: TextStyle(color: Colors.green)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}

class Guide {
  final String name;
  final String location;
  final int reviews;
  final String imageUrl;

  Guide({
    required this.name,
    required this.location,
    required this.reviews,
    required this.imageUrl,
  });
}

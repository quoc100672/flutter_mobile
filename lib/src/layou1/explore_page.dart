// import 'package:flutter/material.dart';

// class ExplorePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ExplorePage(),
//     );
//   }
// }

// class ExplorePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         flexibleSpace: Image(
//           image: NetworkImage('https://placehold.co/375x150'),
//           fit: BoxFit.cover,
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Text(
//           'My Trips', // Tiêu đề vẫn giữ nguyên
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search, color: Colors.white),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Column(
//         children: [
//           Container(
//             color: Colors.white,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 TabButton(text: 'Current Trips', isSelected: true),
//                 TabButton(text: 'Next Trips', isSelected: false),
//                 TabButton(text: 'Past Trips', isSelected: false),
//                 TabButton(text: 'Wish List', isSelected: false),
//               ],
//             ),
//           ),
//           Expanded(
//             child: ListView(
//               padding: EdgeInsets.all(16),
//               children: [
//                 TripCard(),
//               ],
//             ),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {},
//         backgroundColor: Colors.green,
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

// class TabButton extends StatelessWidget {
//   final String text;
//   final bool isSelected;

//   TabButton({required this.text, required this.isSelected});

//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: () {},
//       child: Text(
//         text,
//         style: TextStyle(
//           color: isSelected ? Colors.green : Colors.grey,
//           fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
//         ),
//       ),
//     );
//   }
// }

// class TripCard extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Stack(
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
//                 child: Image.network(
//                   'https://placehold.co/300x150',
//                   width: double.infinity,
//                   height: 150,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Positioned(
//                 top: 8,
//                 left: 8,
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                   decoration: BoxDecoration(
//                     color: Colors.black54,
//                     borderRadius: BorderRadius.circular(4),
//                   ),
//                   child: Row(
//                     children: [
//                       Icon(Icons.location_on, color: Colors.white, size: 16),
//                       SizedBox(width: 4),
//                       Text(
//                         'Da Nang, Vietnam',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Positioned(
//                 top: 8,
//                 right: 8,
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                   decoration: BoxDecoration(
//                     color: Colors.white70,
//                     borderRadius: BorderRadius.circular(4),
//                   ),
//                   child: Row(
//                     children: [
//                       Icon(Icons.check_circle, color: Colors.grey, size: 16),
//                       SizedBox(width: 4),
//                       Text(
//                         'Mark Finished',
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           Padding(
//             padding: EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Dragon Bridge Trip',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 Row(
//                   children: [
//                     Icon(Icons.calendar_today, size: 16, color: Colors.grey),
//                     SizedBox(width: 8),
//                     Text('Jan 30, 2020', style: TextStyle(color: Colors.grey)),
//                   ],
//                 ),
//                 SizedBox(height: 4),
//                 Row(
//                   children: [
//                     Icon(Icons.access_time, size: 16, color: Colors.grey),
//                     SizedBox(width: 8),
//                     Text('13:00 - 15:00', style: TextStyle(color: Colors.grey)),
//                   ],
//                 ),
//                 SizedBox(height: 4),
//                 Row(
//                   children: [
//                     Icon(Icons.person, size: 16, color: Colors.grey),
//                     SizedBox(width: 8),
//                     Text('Tuan Tran', style: TextStyle(color: Colors.grey)),
//                   ],
//                 ),
//                 SizedBox(height: 16),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     OutlinedButton(
//                       onPressed: () {},
//                       child: Text('Detail', style: TextStyle(color: Colors.green)),
//                       style: OutlinedButton.styleFrom(
//                         side: BorderSide(color: Colors.green),
//                       ),
//                     ),
//                     CircleAvatar(
//                       backgroundImage: NetworkImage('https://placehold.co/40'),
//                       radius: 20,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

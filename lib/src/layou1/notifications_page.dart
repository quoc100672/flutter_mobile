import 'package:flutter/material.dart';


class NotificationsPage extends StatelessWidget {
  final List<NotificationData> notifications = [
    NotificationData(
      avatar: 'images/3.png',
      icon: Icons.location_on,
      color: Colors.orange,
      title: 'Yoo Jin chose you for the trip in Da Nang,      Viet Nam on Jan 20,2020',
      content: 'Jan 16',
    ),
    NotificationData(
      avatar: 'images/3.png',
      icon: Icons.attach_money,
      color: Colors.green,
      title: 'Yoo Jin paid upfront 50% for the trip in Danang, Vietnam on Jan 20, 2020. You can start the trip as scheduled.',
      content: 'Jan 16',
    ),
    NotificationData(
      avatar: 'images/3.png',
      icon: Icons.rate_review,
      color: Colors.blue,
      title: 'Yoo Jin left a review for you',
      content: 'Jan 16',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                'images/image 3.png',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                top: 20,
                left: 16,
                child: Text(
                  'Notifications',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 10.0,
                        color: Colors.black,
                        offset: Offset(0.0, 0.0),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final notification = notifications[index];
                return NotificationItem(
                  avatar: notification.avatar,
                  icon: notification.icon,
                  iconColor: notification.color,
                  title: notification.title,
                  content: notification.content,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NotificationDetailScreen(
                          title: notification.title,
                          content: notification.content,
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String avatar;
  final IconData icon;
  final Color iconColor;
  final String title;
  final String content;
  final VoidCallback onTap;

  const NotificationItem({
    Key? key,
    required this.avatar,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.content,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 4,
      child: GestureDetector(
        onTap: onTap,
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(avatar),
          ),
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(content),
          trailing: Icon(icon, color: iconColor),
        ),
      ),
    );
  }
}

class NotificationDetailScreen extends StatelessWidget {
  final String title;
  final String content;

  const NotificationDetailScreen({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(content, style: TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}

// Model cho dữ liệu thông báo
class NotificationData {
  final String avatar;
  final IconData icon;
  final Color color;
  final String title;
  final String content;

  NotificationData({
    required this.avatar,
    required this.icon,
    required this.color,
    required this.title,
    required this.content,
  });
}

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ChatPage(),
    );
  }
}

class ChatPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<ChatUser> friends = [];
  final List<ChatUser> allUsers = [
    ChatUser(name: 'Pena Valdez', message: 'Hi!', time: '10:00 AM'),
    ChatUser(name: 'Gil Hajoon', message: 'Hey!', time: '11:00 AM'),
    ChatUser(name: 'Fitzgerald', message: 'Hello!', time: '12:00 PM'),
    ChatUser(name: 'Kerri Barber', message: 'Good morning!', time: '09:30 AM'),
    ChatUser(name: 'White Castaneda', message: 'What\'s up!', time: '10:15 AM'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.person_add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddFriendScreen(onAddFriend: addFriend),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search Chat',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: friends.length,
              itemBuilder: (context, index) {
                final friend = friends[index];
                return ChatListItem(
                  name: friend.name,
                  message: friend.message,
                  time: friend.time,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatDetailScreen()),
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

  void addFriend(ChatUser user) {
    setState(() {
      friends.add(user);
    });
  }
}

class ChatListItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final VoidCallback onTap;

  ChatListItem({
    required this.name,
    required this.message,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage('https://placehold.co/40'),
      ),
      title: Text(name),
      subtitle: Text(message),
      trailing: Text(time),
      onTap: onTap,
    );
  }
}

class ChatDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person_add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddFriendScreen(onAddFriend: (ChatUser user) {}),
                ),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(8.0),
              children: [
                Center(
                  child: Text(
                    'Jan 28, 2020',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                ChatBubble(
                  message: 'Hi, this is Emmy',
                  isMe: true,
                ),
                ChatBubble(
                  message: 'It is a long established fact that a reader will be distracted by the',
                  isMe: true,
                ),
                ChatBubble(
                  message: "as opposed to using 'Content here",
                  isMe: false,
                ),
                ChatBubble(
                  message: 'There are many variations of passages',
                  isMe: false,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.camera_alt),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type message',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isMe;

  ChatBubble({
    required this.message,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.0),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: isMe ? Colors.green[200] : Colors.grey[200],
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Text(message),
      ),
    );
  }
}

class AddFriendScreen extends StatefulWidget {
  final Function(ChatUser) onAddFriend;

  AddFriendScreen({required this.onAddFriend});

  @override
  _AddFriendScreenState createState() => _AddFriendScreenState();
}

class _AddFriendScreenState extends State<AddFriendScreen> {
  final List<ChatUser> allUsers = [
    ChatUser(name: 'Pena Valdez', message: 'Hi!', time: '10:00 AM'),
    ChatUser(name: 'Gil Hajoon', message: 'Hey!', time: '11:00 AM'),
    ChatUser(name: 'Fitzgerald', message: 'Hello!', time: '12:00 PM'),
    ChatUser(name: 'Kerri Barber', message: 'Good morning!', time: '09:30 AM'),
    ChatUser(name: 'White Castaneda', message: 'What\'s up!', time: '10:15 AM'),
  ];

  List<ChatUser> filteredUsers = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    filteredUsers = allUsers; // Hiển thị tất cả người dùng khi khởi động
  }

  void filterUsers(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredUsers = allUsers;
      });
    } else {
      setState(() {
        filteredUsers = allUsers
            .where((user) => user.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: filterUsers,
          decoration: InputDecoration(
            hintText: 'Search Friend',
            border: InputBorder.none,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'DONE',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: filteredUsers.length,
        itemBuilder: (context, index) {
          final user = filteredUsers[index];
          return AddFriendItem(
            name: user.name,
            onAdd: () {
              widget.onAddFriend(user);
              Navigator.pop(context); // Trở lại khi đã thêm bạn
            },
          );
        },
      ),
    );
  }
}

class AddFriendItem extends StatelessWidget {
  final String name;
  final VoidCallback onAdd;

  AddFriendItem({
    required this.name,
    required this.onAdd,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      trailing: IconButton(
        icon: Icon(Icons.add),
        onPressed: onAdd,
      ),
    );
  }
}

class ChatUser {
  final String name;
  final String message;
  final String time;

  ChatUser({
    required this.name,
    required this.message,
    required this.time,
  });
}

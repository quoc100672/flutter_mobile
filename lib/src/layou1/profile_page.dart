import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For restricting number input


class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60), // Space at the top
                Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('images/3.png'),
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nguyen Dung',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, color: Colors.amber, size: 18),
                            SizedBox(width: 5),
                            Text(
                              '127 Reviews',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.grey),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfileScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: 30),

                // Languages Section
                Text(
                  'Languages',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  children: [
                    Chip(
                      label: Text('Vietnamese'),
                      backgroundColor: Colors.blueAccent.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Chip(
                      label: Text('English'),
                      backgroundColor: Colors.greenAccent.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    Chip(
                      label: Text('Korean'),
                      backgroundColor: Colors.purpleAccent.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),

                // Introduction Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Introduction',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        // Handle edit introduction
                      },
                    ),
                  ],
                ),
                Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text since the 1500s...',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            right: 20,
            child: IconButton(
              icon: Icon(Icons.settings, color: Colors.black, size: 30),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SettingsScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  // Controllers to manage text fields
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Initializing with sample data
    passwordController.text = '********';
    addressController.text = 'Mat Trang';
    cityController.text = 'Danang';
    countryController.text = 'Vietnam';
    phoneController.text = '+84 912 345 678';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
              appBar: AppBar(
                title: Text('Edit Profile'),
                leading: IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context); // Close the screen
                  },
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      // Handle save action here
                      print("Profile Saved");
                    },
                    child: Text('SAVE', style: TextStyle(color: Colors.teal)),
                  ),
                ],
              ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('images/3.png'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Icon(Icons.camera_alt, color: Colors.teal),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Password Field
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    passwordController.clear(); // Clear text on click
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Handle "Change Password" action
              },
              child: Text('Change Password', style: TextStyle(color: Colors.teal)),
            ),

            // Address Field
            TextFormField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: 'Address',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    addressController.clear(); // Clear text on click
                  },
                ),
              ),
            ),
            SizedBox(height: 10),

            // City and Country Fields (Row)
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: cityController,
                    decoration: InputDecoration(
                      labelText: 'City',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          cityController.clear(); // Clear text on click
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    controller: countryController,
                    decoration: InputDecoration(
                      labelText: 'Country',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          countryController.clear(); // Clear text on click
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Phone Number Field with number input restriction
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9+]')),
              ],
              decoration: InputDecoration(
                labelText: 'Phone number',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    phoneController.clear(); // Clear text on click
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () {
                // Handle "Change Available time" action
              },
              child: Text('Change Available time', style: TextStyle(color: Colors.teal)),
            ),
          ],
        ),
      ),
    );
  }
}
// Settings Screen
class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}
class _SettingsScreenState extends State<SettingsScreen> {
  bool _isNotificationsEnabled = true; // Status of the switch

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Settings", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('images/3.png'),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nguyen Dung',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Guide'),
                  ],
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfileScreen(),
                      ),
                    );
                  },
                  child: Text('EDIT PROFILE'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Notifications'),
              trailing: Switch(
                value: _isNotificationsEnabled,
                onChanged: (val) {
                  setState(() {
                    _isNotificationsEnabled = val; // Update state
                  });
                },
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.language),
              title: Text('Languages'),
              trailing: Icon(Icons.chevron_right),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.payment),
              title: Text('Payment Info'),
              trailing: Icon(Icons.chevron_right),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.bar_chart),
              title: Text('Income Stats'),
              trailing: Icon(Icons.chevron_right),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.security),
              title: Text('Privacy & Policies'),
              trailing: Icon(Icons.chevron_right),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.feedback),
              title: Text('Feedback'),
              trailing: Icon(Icons.chevron_right),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Usage'),
              trailing: Icon(Icons.chevron_right),
            ),
            Spacer(),
            Center(
              child: TextButton(
                onPressed: () {
                  // Handle Sign out action
                },
                child: Text('Sign out', style: TextStyle(color: Colors.red)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

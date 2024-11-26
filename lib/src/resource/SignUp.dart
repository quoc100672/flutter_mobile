// ignore_for_file: file_names

import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class SignUpPage extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String? _role = 'traveler'; // Trạng thái cho radio button

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  color: Colors.teal,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                     
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'SignUp',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 15, 15, 15),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Traveler'),
                              leading: Radio<String>(
                                value: 'traveler',
                                groupValue: _role,
                                onChanged: (value) {
                                  setState(() {
                                    _role = value;
                                  });
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: const Text('Guide'),
                              leading: Radio<String>(
                                value: 'guide',
                                groupValue: _role,
                                onChanged: (value) {
                                  setState(() {
                                    _role = value;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                      children: [
                        Expanded(
                          child: _buildTextField('First Name', 'Yoo'),
                        ),
                          const SizedBox(width: 10), // Khoảng cách giữa hai trường
                              Expanded(
                                child: _buildTextField('Last Name', 'Jin'),
                           ),
                          ],
                        ),

                      _buildTextField('Country', 'Country'),
                      _buildTextField('Email', 'Type email'),
                      _buildTextField('Password', 'Type password', obscure: true),
                      const Text(
                        'Password has more than 6 letters',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      _buildTextField('Confirm Password', '●●●●●●●', obscure: true),
                      const SizedBox(height: 20),
                      const Center(
                        child: Text(
                          'By Signing Up, you agree to our  Terms & Conditions',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                          
                        ),
                        
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // Xử lý đăng ký ở đây
                            
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.teal,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                          ),
                          child: const Text('SIGN UP'),
                          
                        ),
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            // Chuyển đến trang đăng nhập
                            Navigator.pop(context); // Trở về trang trước
                          },
                          child: const Text.rich(
                            // ignore: unnecessary_const
                            const TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(fontSize: 14, color: Colors.grey),
                              children: [
                                TextSpan(
                                  text: 'Sign In',
                                  style: TextStyle(color: Colors.teal),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, {bool obscure = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          obscureText: obscure,
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            border: const UnderlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}

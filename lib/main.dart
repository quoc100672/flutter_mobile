import 'package:flutter/material.dart';
import 'src/resource/login.dart';

 // Đảm bảo đường dẫn đúng

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginPage(), 
      debugShowCheckedModeBanner: false,
    );
  }
}

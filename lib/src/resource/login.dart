import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../home.dart'; // Đảm bảo rằng đường dẫn này đúng
import 'SignUp.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  final TextStyle boldStyle = const TextStyle(fontWeight: FontWeight.bold);
  final TextStyle tealStyle = const TextStyle(color: Colors.teal, fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          ClipPath(
            clipper: CustomRectangularClipper(),
            child: Container(
              color: const Color(0xFF00CEA6),
              height: 250,
              width: double.infinity,
            ),
          ),
          Center(
            child: Container(
              width: 350,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 20),
                  const Text('Login', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text('Welcome back, Yoo Jin', style: tealStyle),
                  const SizedBox(height: 20),
                  Align(alignment: Alignment.centerLeft, child: Text("Email", style: boldStyle)),
                  const TextField(),
                  const SizedBox(height: 20),
                  Align(alignment: Alignment.centerLeft, child: Text("Password", style: boldStyle)),
                  const TextField(obscureText: true),
                  const SizedBox(height: 15),
                  const Align(alignment: Alignment.centerLeft, child: Text("Forgot Password")),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00CEA6),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    child: const Center(child: Text('LOGIN')),
                  ),
                  const SizedBox(height: 20),
                  const Text('or login with'),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/iconFacebook.png'),
                      const SizedBox(width: 20),
                      Image.asset('images/iconKakao.png'),
                      const SizedBox(width: 20),
                      Image.asset('images/iconLine.png'),
                    ],
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Don’t have an account? ',
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: const TextStyle(color: Colors.teal),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                               Navigator.push(
                                context,
                                 MaterialPageRoute(builder: (context) => SignUpPage()),
                               );
                              // Chuyển đến trang đăng ký
                            },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>  HomePage()),
                      );
                    },
                    child: const Text(
                      'Go to Home',
                      style: TextStyle(color: Colors.teal),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomRectangularClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 100);
    path.quadraticBezierTo(size.width / 2, size.height - 200, size.width, size.height - 100);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

import 'package:flutter/material.dart';
import 'package:flutter_basics/Home/home.dart';

class Login extends StatelessWidget {
  static String routeName = 'login';

  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body:
          Center(child: ElevatedButton(onPressed: () {
            Navigator.pushNamed(context, Home.routeName);
            // Navigator.pushReplacementNamed(context, 'home');
          }, child: Text('Lohin'))),
    );
  }
}

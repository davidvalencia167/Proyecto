import 'package:flutter/material.dart';
import 'dart:async';
import 'package:proyecto/Register.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 6), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const RegisterScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/shoeprints.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 30),
            const CircularProgressIndicator(
              color: Colors.orange,
              strokeWidth: 4,
            ),
          ],
        ),
      ),
    );
  }
}
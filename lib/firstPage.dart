import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intelli_click/onoboarding1.dart';

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 1),
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => Onboarding1()),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity, // Ensure it takes the full height
        child: FittedBox(
          fit: BoxFit.cover,
          child: Image.asset('assets/Splash Screen.png'),
        ),
      ),
    );
  }
}

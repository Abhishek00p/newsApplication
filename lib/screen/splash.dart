import 'dart:async';

import 'package:application/auth/login_signup.dart';
import 'package:flutter/material.dart';

import '../home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  myTimer() => Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage())));

  @override
  void initState() {
    myTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      child: Center(
        child: Text(
          "Welcome ",
          style: TextStyle(fontSize: 26),
        ),
      ),
    );
  }
}

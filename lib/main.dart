import 'package:application/auth/login_signup.dart';
import 'package:application/home.dart';
import 'package:application/news.dart';
import 'package:application/screen/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      initialRoute: 'first',
      routes: {
        'first': (context) => LoginPage(),
        'homeScreen': (context) => HomePage(),
        // When navigating to the "secondScreen" route, build the SecondScreen widget.
      },
    );
  }
}

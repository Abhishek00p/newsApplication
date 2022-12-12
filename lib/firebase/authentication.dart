import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../home.dart';

class getAuth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  createAccount(String email, String pass) async {
    try {
      var userCred = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
    } catch (e) {
      print("ERror $e");
    }
  }

  googleLogin(context) async {
    try {
      await _googleSignIn.signIn();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } catch (e) {
      print("er $e");
    }
  }

  gmailLogin(email, pass, context) async {
    try {
      var user =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } catch (e) {
      print("Error $e");
    }
  }

  gmailOut() async {
    try {
      await _auth.signOut();
      await _googleSignIn.signOut();
    } catch (e) {
      print("ee $e");
    }
  }
}

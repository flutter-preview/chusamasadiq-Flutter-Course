import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttercourse/utlis/utils.dart';
import 'package:flutter/material.dart';
import '../screen/homefeed_screen.dart';

class AuthMethods {
  final _auth = FirebaseAuth.instance;

  Future<void> signUpUser({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: email.toString(), password: password.toString());
      if (userCredential != null) {
        Utils.toastMessage('Account created successfully');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeFeedScreen(),
          ),
        );
      }
    } on FirebaseAuthException catch (ex) {
      Utils.toastMessage(ex.message.toString());
    }
  }
}

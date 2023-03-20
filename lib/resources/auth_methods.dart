import 'package:firebase_auth/firebase_auth.dart';

class AuthMethods {
  // Firebase Auth Instance
  final _auth = FirebaseAuth.instance;

  // Sign Up User Function
  Future<String> signUpUser({
    required String email,
    required String password,
  }) async {
    String response;
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email.toString(),
        password: password.toString(),
      );
      response = 'success';
    } on FirebaseAuthException catch (ex) {
      return response = (ex.message.toString());
    }
    return response;
  }

  // SignIn User Function
  Future<String> signInUser({
    required String email,
    required String password,
  }) async {
    String response;
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.toString(),
        password: password.toString(),
      );
      response = 'success';
    } on FirebaseAuthException catch (ex) {
      return response = (ex.message.toString());
    }
    return response;
  }

  // Forgot Password Function
  Future<String> forgotPassword({
    required String email,
  }) async {
    String response;
    try {
      await _auth.sendPasswordResetEmail(
        email: email.toString(),
      );
      response = 'success';
    } on FirebaseAuthException catch (ex) {
      return response = (ex.message.toString());
    }
    return response;
  }

  // Logout Function
  String logout() {
    _auth.signOut();
    String response = 'success';
    return response;
  }
}

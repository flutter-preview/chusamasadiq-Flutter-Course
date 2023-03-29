import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttercourse/screen/homefeed_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? loggedInEmail;

  void isLogin() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var token = sharedPreferences.getString('email');
    setState(() {
      loggedInEmail = token;
    });

    if (loggedInEmail != null && mounted) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeFeedScreen()));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const LoginScreen()));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      isLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.height / 40),
        child: Center(
          child: Image.asset(
            'assets/images/online-delivery.png',
            scale: 3,
          ),
        ),
      ),
    );
  }
}

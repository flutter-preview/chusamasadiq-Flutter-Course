import 'package:flutter/material.dart';
import 'package:fluttercourse/screen/splash_screen.dart';

void main() {
  runApp(const FlutterCourse());
}

class FlutterCourse extends StatelessWidget {
  const FlutterCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}

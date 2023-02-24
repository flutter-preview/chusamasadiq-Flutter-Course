import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  late String email;
  late String password;

  HomeScreen({super.key, required this.email, required this.password});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 300,
          child: Card(
            color: Colors.orangeAccent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Email: ${widget.email}'),
                const SizedBox(height: 10),
                Text('Password: ${widget.password}')
              ],
            ),
          ),
        ),
      ),
    );
  }
}

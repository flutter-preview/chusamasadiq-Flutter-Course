import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            const SizedBox(height: 50),
            SizedBox(
              height: 40,
              width: 400,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Login'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

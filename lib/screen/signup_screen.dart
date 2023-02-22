import 'package:flutter/material.dart';
import 'package:fluttercourse/screen/login_screen.dart';
import '../components/textfield_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();
  late final TextEditingController _usernameController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/online-delivery.png',
              scale: 1.5,
            ),
            TextFieldWidget(
                controller: _usernameController,
                labelText: 'Username',
                hintText: 'Username'),
            const SizedBox(height: 20),
            TextFieldWidget(
              controller: _emailController,
              labelText: 'Email',
              hintText: 'Email',
            ),
            const SizedBox(height: 20),
            TextFieldWidget(
              controller: _passwordController,
              labelText: 'Password',
              hintText: 'Password',
              obscureText: true,
            ),
            const SizedBox(height: 40),
            SizedBox(
              height: 40,
              width: 400,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Sign Up'),
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Have an account'),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    child: const Text('Login'))
              ],
            )
          ],
        ),
      ),
    );
  }
}

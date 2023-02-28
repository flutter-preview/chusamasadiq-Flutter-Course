import 'package:flutter/material.dart';
import 'package:fluttercourse/components/button.dart';
import 'package:fluttercourse/components/textfield_widget.dart';
import 'package:fluttercourse/screen/forgot_screen.dart';
import 'package:fluttercourse/screen/signup_screen.dart';
import 'homefeed_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgotPassword(),
                        ),
                      );
                    },
                    child: const Text('Forgot Password'))
              ],
            ),
            const SizedBox(height: 20),
            ButtonWidget(
                title: 'Login',
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeFeedScreen(),
                    ),
                  );
                }),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Don\'t have an account'),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ),
                    );
                  },
                  child: const Text('Sign Up'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

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
  late final TextEditingController _passwordController = TextEditingController();
  late final TextEditingController _usernameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.03),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  SizedBox(height: screenWidth * 0.04),
                  TextFieldWidget(
                    controller: _emailController,
                    labelText: 'Email',
                    hintText: 'Email',
                  ),
                  SizedBox(height: screenWidth * 0.04),
                  TextFieldWidget(
                    controller: _passwordController,
                    labelText: 'Password',
                    hintText: 'Password',
                    obscureText: true,
                  ),
                  SizedBox(height: screenWidth * 0.04),
                  SizedBox(
                    height: screenWidth * 0.12,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Sign Up'),
                    ),
                  ),
                  SizedBox(height: screenWidth * 0.15),
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
          ),
        ),
      ),
    );
  }
}

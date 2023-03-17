import 'package:flutter/material.dart';
import 'package:fluttercourse/resources/auth_methods.dart';
import 'package:fluttercourse/screen/homefeed_screen.dart';
import 'package:fluttercourse/screen/login_screen.dart';
import 'package:fluttercourse/utils/utils.dart';
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
  late bool isLoading = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void signUpUser() async {
    setState(() {
      isLoading = true;
    });
    String response = await AuthMethods().signUpUser(
      email: _emailController.text.toString(),
      password: _passwordController.text.toString(),
    );
    setState(() {
      setState(() {
        isLoading = false;
      });
    });
    if (response == 'success' && mounted) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeFeedScreen()));
    } else {
      setState(() {
        isLoading = false;
      });
    }

    if (response != 'success') {
      Utils.toastMessage(response);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.03),
          child: SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/online-delivery.png',
                    scale: 1.5,
                  ),
                  SizedBox(height: screenWidth * 0.04),
                  TextFieldWidget(
                    controller: _emailController,
                    labelText: 'Email',
                    hintText: 'Email',
                    onValidator: (value) =>
                        (value.isEmpty) ? 'Enter your email' : null,
                  ),
                  SizedBox(height: screenWidth * 0.04),
                  TextFieldWidget(
                      controller: _passwordController,
                      labelText: 'Password',
                      hintText: 'Password',
                      obscureText: true,
                      onValidator: (value) {
                        if (value.isEmpty) {
                          return 'Enter your password';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        } else {
                          return null;
                        }
                      }),
                  SizedBox(height: screenWidth * 0.04),
                  SizedBox(
                    height: screenWidth * 0.12,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          signUpUser();
                        }
                      },
                      child: isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.orange,
                              ),
                            )
                          : const Text('Sign Up'),
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

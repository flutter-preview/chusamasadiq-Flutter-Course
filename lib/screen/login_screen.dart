import 'package:flutter/material.dart';
import 'package:fluttercourse/components/textfield_widget.dart';
import 'package:fluttercourse/screen/forgot_screen.dart';
import 'package:fluttercourse/screen/otp_screen.dart';
import 'package:fluttercourse/screen/signup_screen.dart';
import '../resources/auth_methods.dart';
import '../utils/utils.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late bool isLoading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void signInUser() async {
    setState(() {
      isLoading = true;
    });
    String response = await AuthMethods().signInUser(
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
      _passwordController.clear();
      _emailController.clear();
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
    // Gain Height of the Screen
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(screenHeight * 0.01),
        child: Form(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          key: _formKey,
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
                onValidator: (value) =>
                    (value.isEmpty) ? 'Enter your email' : null,
              ),
              SizedBox(height: screenWidth * 0.04),
              TextFieldWidget(
                controller: _passwordController,
                labelText: 'Password',
                hintText: 'Password',
                obscureText: true,
                onValidator: (value) =>
                    (value.isEmpty) ? 'Enter your password' : null,
              ),
              SizedBox(height: screenWidth * 0.04),
              SizedBox(
                height: screenWidth * 0.12,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      signInUser();
                    }
                  },
                  child: isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.orange,
                          ),
                        )
                      : const Text('Login'),
                ),
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
                    child: const FittedBox(
                      child: Text('Forgot Password'),
                    ),
                  )
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FittedBox(child: Text('Don\'t have an account')),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PhoneVerificationScreen(),
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
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fluttercourse/resources/auth_methods.dart';
import 'package:fluttercourse/screen/homefeed_screen.dart';
import 'package:fluttercourse/screen/login_screen.dart';
import 'package:fluttercourse/utils/utils.dart';
import '../components/textfield_widget.dart';

// ignore: must_be_immutable
class SignUpScreen extends StatefulWidget {
  late String phoneNo;
  late String countryCode;

  SignUpScreen({super.key, required this.countryCode, required this.phoneNo});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final TextEditingController _emailController = TextEditingController();
  late final TextEditingController _passwordController =
      TextEditingController();
  late final TextEditingController _usernameController =
      TextEditingController();
  late final TextEditingController _phoneNoController = TextEditingController();
  late bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _phoneNoController.text = widget.countryCode + widget.phoneNo;
  }

  void signUpUser() async {
    setState(() {
      isLoading = true;
    });
    String response = await AuthMethods().signUpUser(
      email: _emailController.text.toString(),
      password: _passwordController.text.toString(),
      phoneNo: _phoneNoController.text.toString(),
      username: _usernameController.text.toString(),
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
                    controller: _usernameController,
                    labelText: 'Username',
                    hintText: 'Username',
                    onValidator: (value) =>
                        (value.isEmpty) ? 'Enter your username' : null,
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
                      enabled: false,
                      controller: _phoneNoController,
                      labelText: 'Phone Number',
                      hintText: 'Phone Number',
                      onValidator: (value) {
                        if (value.isEmpty) {
                          return 'Enter your phone number';
                        } else if (value.length < 10) {
                          return 'Phone number must be at least 10 characters';
                        } else {
                          return null;
                        }
                      }),
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

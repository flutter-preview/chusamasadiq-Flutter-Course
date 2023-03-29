import 'package:flutter/material.dart';
import 'package:fluttercourse/resources/auth_methods.dart';
import 'package:fluttercourse/utils/utils.dart';
import '../components/textfield_widget.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  late final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late bool isLoading = false;

  void userForgotPassword() async {
    setState(() {
      isLoading = true;
    });
    String response = await AuthMethods().forgotPassword(
      email: _emailController.text.toString(),
    );
    setState(() {
      setState(() {
        isLoading = false;
      });
    });
    if (response == 'success' && mounted) {
      Utils.toastMessage('Reset password link has been sent on your email');
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
      appBar: AppBar(
        title: const Text('Forgot Password'),
        centerTitle: true,
      ),
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
                scale: 5,
              ),
              TextFieldWidget(
                controller: _emailController,
                labelText: 'Email',
                hintText: 'Email',
                onValidator: (value) =>
                    (value.isEmpty) ? 'Enter your email' : null,
              ),
              SizedBox(height: screenWidth * 0.04),
              SizedBox(
                height: screenWidth * 0.12,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      userForgotPassword();
                    }
                  },
                  child: isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.orange,
                          ),
                        )
                      : const Text('Send Email'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

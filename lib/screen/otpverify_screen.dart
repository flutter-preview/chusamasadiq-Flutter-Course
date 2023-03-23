import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({Key? key}) : super(key: key);

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late bool isLoading = false;
  String otpPin = '';

  @override
  Widget build(BuildContext context) {
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
              Text(
                "We just sent a code to",
                style: TextStyle(
                  fontSize: screenWidth / 20,
                ),
              ),
              SizedBox(height: screenWidth / 50),
              Text(
                "Enter the code here and we can continue!",
                style: TextStyle(
                  fontSize: screenWidth / 30,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: screenWidth * 0.04),
              // OTP Verify
              PinCodeTextField(
                appContext: context,
                length: 6,
                onChanged: (value) {
                  setState(() {
                    otpPin = value;
                  });
                },
              ),
              SizedBox(height: screenWidth * 0.04),
              SizedBox(
                height: screenWidth * 0.12,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {}
                  },
                  child: isLoading
                      ? const Center(
                          child: CircularProgressIndicator(
                            color: Colors.orange,
                          ),
                        )
                      : const Text('Verify'),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const FittedBox(
                    child: Text('Don\'t receive the Code'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Resend'),
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

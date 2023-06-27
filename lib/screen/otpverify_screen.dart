import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttercourse/screen/signup_screen.dart';
import 'package:fluttercourse/utils/utils.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// ignore: must_be_immutable
class OTPVerificationScreen extends StatefulWidget {
  late String verId;
  late String dialCode;
  late String phoneNumber;

  OTPVerificationScreen({
    super.key,
    required this.verId,
    required this.dialCode,
    required this.phoneNumber,
  });

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  late bool isLoading = false;
  String otpPin = ' ';

  Future<void> verifyOTP() async {
    try {
      setState(() {
        isLoading = true;
      });
      await FirebaseAuth.instance
          .signInWithCredential(
        PhoneAuthProvider.credential(
          verificationId: widget.verId,
          smsCode: otpPin,
        ),
      )
          .whenComplete(() {
        setState(() {
          isLoading = false;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => SignUpScreen(
              countryCode: widget.dialCode,
              phoneNo: widget.phoneNumber,
            ),
          ),
        );
      });
    } catch (e) {
      Utils.toastMessage(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(screenHeight * 0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/online-delivery.png',
              scale: 1.5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "We just sent a code to ",
                  style: TextStyle(
                      fontSize: screenWidth / 25,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.dialCode + widget.phoneNumber,
                  style: TextStyle(
                    fontSize: screenWidth / 25,
                  ),
                ),
              ],
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
              keyboardType: TextInputType.number,
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
                  if (otpPin.length >= 6) {
                    verifyOTP();
                  } else {
                    Utils.toastMessage('Enter otp correctly!');

                  }
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
    );
  }
}

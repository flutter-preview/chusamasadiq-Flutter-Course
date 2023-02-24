import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  late String title;
  late VoidCallback onPress;

  ButtonWidget({required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 400,
      child: ElevatedButton(
        onPressed: onPress,
        child: Text(title),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  late VoidCallback onPress;
  final Widget child;

  ButtonWidget({super.key, required this.onPress, required this.child, required String title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ElevatedButton(
        onPressed: onPress,
        child: child,
      ),
    );
  }
}

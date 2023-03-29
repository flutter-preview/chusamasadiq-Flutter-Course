import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final Color? color;
  final VoidCallback onPress;
  final Widget child;

  const ButtonWidget({
    super.key,
    required this.height,
    required this.width,
    required this.color,
    required this.onPress,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenHeight * height!,
      width: screenWidth * width!,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(screenWidth * 0.1),
          ),
        ),
        onPressed: onPress,
        child: child,
      ),
    );
  }
}

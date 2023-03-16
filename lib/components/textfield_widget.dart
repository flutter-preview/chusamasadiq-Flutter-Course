import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  late TextEditingController controller = TextEditingController();
  late String? labelText;
  late String? hintText;
  late bool obscureText;
  dynamic onValidator;

  TextFieldWidget({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.onValidator,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: onValidator,
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText.toString(),
        hintText: hintText.toString(),
        border: const OutlineInputBorder(
          borderSide: BorderSide(),
        ),
      ),
    );
  }
}

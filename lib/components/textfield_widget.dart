import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldWidget extends StatelessWidget {
  late TextEditingController controller = TextEditingController();
  late String? labelText;
  late String? hintText;
  late bool obscureText;
  late bool enabled;
  dynamic onValidator;

  TextFieldWidget({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.onValidator,
    this.obscureText = false,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      validator: onValidator,
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
          labelText: labelText.toString(),
          hintText: hintText.toString(),
          border: const OutlineInputBorder(
            borderSide: BorderSide(),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(),
          )),
    );
  }
}

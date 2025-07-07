import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final String? maskText;
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType? keyboardType;

  CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.maskText = "",
    this.obscureText = false,
    this.keyboardType
  });

  @override
  Widget build(BuildContext context) {
    List<TextInputFormatter>? inputFormatters;

    if (maskText != null && maskText!.isNotEmpty) {
      inputFormatters = [MaskTextInputFormatter(mask: maskText!)];
    }
    return TextField(
      textAlign: TextAlign.center,
      controller: controller,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
    );
  }
}

import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  const CustomTextField({
    super.key,
    this.validator,
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    required this.controller,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      decoration: BoxDecoration(
        color: sageGreen,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(color: blackColor),
        validator: validator,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          icon: Icon(icon, color: deepForestGreen),
          border: InputBorder.none,
          hintText: hintText,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:slide_team_project/constants/colors.dart';

class ResetPasswordTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const ResetPasswordTextField({
    super.key,
    required this.controller,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        labelText: 'Email',
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: darkTeal, width: 2),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}

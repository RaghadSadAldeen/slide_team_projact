import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class CreateAccountTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final TextInputType keyboardType;

  const CreateAccountTextField({
    required this.hintText,
    required this.icon,
    this.obscureText = false,
    required this.controller,
    this.validator,
    super.key,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
    margin: EdgeInsets.only(top : 20.0,),
    decoration: BoxDecoration(
    color: sageGreen,
    borderRadius: BorderRadius.circular(8),
    ),
      child :TextFormField(
      controller: controller,
        validator: validator,
        keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor:sageGreen,
        prefixIcon: Icon(icon, color: deepForestGreen),
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}



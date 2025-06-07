// lib/widgets/common/custom_button.dart
import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/text_styles.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const CustomButton({required this.onPressed, required this.text, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: deepForestGreen,
        padding: const EdgeInsets.symmetric(vertical: 16),
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: buttonTextStyle),
          const SizedBox(width: 8),
          const Icon(Icons.arrow_forward, color: whiteColor),
        ],
      ),
    );
  }
}

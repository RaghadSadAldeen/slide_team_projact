import 'package:flutter/material.dart';
import 'package:slide_team_project/constants/colors.dart';

class CustomProfileButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const CustomProfileButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.backgroundColor,
    this.foregroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 310, // العرض الثابت
      height: 50, // الارتفاع الثابت
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon, size: 20),
        label: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? Colors.green[100],
          foregroundColor: foregroundColor ?? blackColor,
        ),
      ),
    );
  }
}

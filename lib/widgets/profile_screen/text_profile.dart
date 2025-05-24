// lib/widgets/text_profile.dart
import 'package:flutter/material.dart';
import 'package:slide_team_project/constants/colors.dart'; // تأكد أن هذا الملف يحتوي على تعريف whiteColor مثلاً: const whiteColor = Colors.white;

class TextProfile extends StatelessWidget {
  final String name;
  final String major;
  final String email;
  final String phone;

  const TextProfile({
    super.key,
    required this.name,
    required this.major,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    final subtitleStyle = const TextStyle(color: Colors.white70);

    return Column(
      children: [
        Text(
          name,
          style: const TextStyle(
            color: whiteColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(major, style: subtitleStyle),
        const SizedBox(height: 4),
        Text(email, style: subtitleStyle),
        const SizedBox(height: 4),
        Text(phone, style: subtitleStyle),
      ],
    );
  }
}



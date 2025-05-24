import 'package:flutter/material.dart';
import 'dart:io';
import 'package:slide_team_project/constants/colors.dart';
import 'package:slide_team_project/screens/get_slide_screen.dart';

class SaveButton extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController slideTitleController;
  final TextEditingController descriptionController;
  final File? selectedImage;

  const SaveButton({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.slideTitleController,
    required this.descriptionController,
    required this.selectedImage,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (nameController.text.isEmpty ||
            emailController.text.isEmpty ||
            slideTitleController.text.isEmpty ||
            descriptionController.text.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please fill all fields')),
          );
          return;
        }

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GetSlideScreen(
              name: nameController.text,
              email: emailController.text,
              slideTitle: slideTitleController.text,
              description: descriptionController.text,
              imageFile: selectedImage,
            ),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: deepForestGreen,
        padding: const EdgeInsets.symmetric(vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        minimumSize: const Size(double.infinity, 48), // ⬅️ العرض كامل
      ),
      child: const Text('Save', style: TextStyle(color: Colors.white)),
    );
  }
}
import 'package:flutter/material.dart';

class SlideFormFields extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController slideTitleController;
  final TextEditingController descriptionController;

  const SlideFormFields({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.slideTitleController,

    required this.descriptionController,
  });

  InputDecoration get fieldDecoration => InputDecoration(
    filled: true,
    fillColor: Colors.grey.shade200,
    contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.grey.shade400),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.grey.shade400),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildField('Name', Icons.person, TextInputType.name, nameController),
        buildField('Email', Icons.email, TextInputType.emailAddress, emailController),
        buildField('Slide Title', Icons.title, TextInputType.text, slideTitleController),
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: TextField(
            controller: descriptionController,
            maxLines: 2,
            decoration: fieldDecoration.copyWith(
              labelText: 'Description',
              prefixIcon: const Icon(Icons.description),
              alignLabelWithHint: true,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildField(String label, IconData icon, TextInputType type, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        keyboardType: type,
        decoration: fieldDecoration.copyWith(
          labelText: label,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}
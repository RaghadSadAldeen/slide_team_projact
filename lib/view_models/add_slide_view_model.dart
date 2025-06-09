import 'dart:io';
import 'package:flutter/material.dart';

class AddSlideViewModel extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController slideTitleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  File? selectedImage;


  void setImage(File image) {
    selectedImage = image;
    notifyListeners();
  }

  bool get isFormValid {
    return nameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        slideTitleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        selectedImage != null;
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    slideTitleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}

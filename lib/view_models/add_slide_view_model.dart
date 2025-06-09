import 'dart:io';
import 'package:flutter/material.dart';
import '../models/add_slide_model.dart';
import '../services/database_service.dart';

class AddSlideViewModel extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController slideTitleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  File? selectedImage;
  bool isLoading = false;

  final DatabaseService _databaseService = DatabaseService();

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
  Future<bool> saveSlideToFirebase() async {
    print("📤 Starting to save slide...");

    if (!isFormValid) {
      print("❌ Form is invalid");
      return false;
    }

    try {
      isLoading = true;
      notifyListeners();

      final slide = SlideModel(
        name: nameController.text,
        email: emailController.text,
        slideTitle: slideTitleController.text,
        description: descriptionController.text,
        createdAt: DateTime.now(),
      );

      print("Slide data prepared: ${slide.toJson()}");
      await _databaseService.saveSlide(slide);
      print("Slide saved successfully to Firestore.");
      return true;
    } catch (e) {
      print("Error saving slide: $e");
      return false;
    } finally {
      isLoading = false;
      notifyListeners();
    }
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

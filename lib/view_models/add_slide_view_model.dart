import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/add_slide_model.dart';

class AddSlideViewModel extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late AddSlideModel _slide;
  AddSlideModel get slide => _slide;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController slideTitleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  String imagePath = '';
  String slideId = '';

  bool get isFormValid {
    return nameController.text.trim().isNotEmpty &&
        emailController.text.trim().isNotEmpty &&
        slideTitleController.text.trim().isNotEmpty &&
        descriptionController.text.trim().isNotEmpty &&
        imagePath.isNotEmpty;
  }

  void initialize(AddSlideModel slide, String slideId) {
    _slide = slide;
    this.slideId = slideId;

    nameController.text = slide.name;
    emailController.text = slide.email;
    slideTitleController.text = slide.slideTitle;
    descriptionController.text = slide.description;
    imagePath = slide.imageUrl;
  }

  void setImagePath(String path) {
    imagePath = path;
    notifyListeners();
  }

  void clearImage() {
    imagePath = '';
    notifyListeners();
  }

  Future<String?> addSlide(String slideId) async {
    try {
      _slide = AddSlideModel(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        slideTitle: slideTitleController.text.trim(),
        description: descriptionController.text.trim(),
        imageUrl: imagePath,
        createdAt: DateTime.now(),
      );

      await _firestore.collection('slides').doc(slideId).set({
        'name': _slide.name,
        'email': _slide.email,
        'slideTitle': _slide.slideTitle,
        'description': _slide.description,
        'imageUrl': _slide.imageUrl,
        'createdAt': _slide.createdAt?.toIso8601String(),
      }, SetOptions(merge: true));

      notifyListeners();
      return null;
    } catch (e) {
      return e.toString();
    }
  }


  void clearForm() {
    nameController.clear();
    emailController.clear();
    slideTitleController.clear();
    descriptionController.clear();
    clearImage();
  }

  void disposeControllers() {
    nameController.dispose();
    emailController.dispose();
    slideTitleController.dispose();
    descriptionController.dispose();
  }
}

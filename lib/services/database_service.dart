import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import '../models/add_slide_model.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadImageToStorage({
    required File file,
    required String path,
  }) async {
    try {
      final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
      final ref = _storage.ref().child('$path/$fileName');
      await ref.putFile(file);
      return await ref.getDownloadURL();
    } catch (e) {
      rethrow;
    }
  }


  Future<void> saveSlide(AddSlideModel slide) async {
    try {
      print("Saving slide data to Firestore: ${slide.toJson()}");
      await _firestore.collection('slides').add(slide.toJson());
      print("Slide successfully saved to Firestore.");
    } catch (e) {
      print("Firestore save error: $e");
      rethrow;
    }
  }
}

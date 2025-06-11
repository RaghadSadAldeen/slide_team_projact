import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as path;
import '../models/add_slide_model.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadImage(File imageFile) async {
    print("uploadImage() called with path: ${imageFile.path}");

    if (!await imageFile.exists()) {
      print("The file does NOT exist at path: ${imageFile.path}");
      throw Exception("Image file does not exist.");
    }
    try {
      print("Uploading image...");
      final fileExtension = path.extension(imageFile.path); // e.g. .jpg

      final fileName = '${DateTime.now().millisecondsSinceEpoch}$fileExtension';


      final storageRef = _storage.ref().child('slides_images').child(fileName);


      final uploadTask = await storageRef.putFile(imageFile);
      print("Image uploaded successfully");

      await Future.delayed(Duration(seconds: 1));
      final url = await uploadTask.ref.getDownloadURL();
      print("Image URL: $url");

      return url;
    } catch (e) {
      print("Failed to upload image: $e");
      rethrow;
    }
  }

  Future<void> saveSlide(SlideModel slide) async {
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

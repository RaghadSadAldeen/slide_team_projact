import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_profile.dart';

class ProfileViewModel extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final firebase_storage.FirebaseStorage _storage = firebase_storage.FirebaseStorage.instance;

  UserProfile _userProfile = UserProfile.empty();
  UserProfile get userProfile => _userProfile;

  bool isLoading = true;

  Future<void> loadUserProfile(String userId) async {
    if (userId.isEmpty) {
      _userProfile = UserProfile.empty();
      isLoading = false;
      notifyListeners();
      return;
    }

    isLoading = true;
    notifyListeners();

    try {
      final doc = await _firestore.collection('users').doc(userId).get();

      if (doc.exists) {
        final data = doc.data()!;
        String imageUrl = data['imagePath'] ?? '';

        if (imageUrl.isNotEmpty && !imageUrl.startsWith('http')) {
          imageUrl = await _storage.ref(imageUrl).getDownloadURL();
        }

        _userProfile = UserProfile.fromMap({
          ...data,
          'imagePath': imageUrl,
        });
      } else {
        _userProfile = UserProfile.empty();
      }
    } catch (e) {
      _userProfile = UserProfile.empty();
    }

    isLoading = false;
    notifyListeners();
  }

  void setUserProfile(UserProfile profile) {
    _userProfile = profile;
    notifyListeners();
  }
}

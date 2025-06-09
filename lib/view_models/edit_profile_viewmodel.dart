import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_profile.dart';

class EditProfileViewModel extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  late UserProfile _userProfile;
  UserProfile get userProfile => _userProfile;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController majorController = TextEditingController();

  String imagePath = '';
  String userId = '';

  void initialize(UserProfile userProfile, String userId) {
    _userProfile = userProfile;
    this.userId = userId;

    nameController.text = userProfile.name;
    phoneController.text = userProfile.phone;
    addressController.text = userProfile.address;
    emailController.text = userProfile.email;
    majorController.text = userProfile.major;
    imagePath = userProfile.imagePath;
  }

  void setImagePath(String path) {
    imagePath = path;
    notifyListeners();
  }

  Future<String?> saveProfile() async {
    if (userId.isEmpty) {
      return 'User ID is empty. Cannot save profile.';
    }

    try {
      _userProfile = UserProfile(
        userId: userId,
        name: nameController.text,
        phone: phoneController.text,
        address: addressController.text,
        email: emailController.text,
        major: majorController.text,
        imagePath: imagePath,
      );

      await _firestore.collection('users').doc(userId).set({
        'userId': userId,
        'name': _userProfile.name,
        'phone': _userProfile.phone,
        'address': _userProfile.address,
        'email': _userProfile.email,
        'major': _userProfile.major,
        'imagePath': _userProfile.imagePath,
      }, SetOptions(merge: true));

      notifyListeners();
      return null;
    } catch (e) {
      return e.toString();
    }
  }
}

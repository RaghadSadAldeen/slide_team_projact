// lib/providers/user_provider.dart
import 'package:flutter/material.dart';
import '../models/user_profile.dart';

class UserProvider extends ChangeNotifier {
  UserProfile _userProfile = UserProfile.empty();

  UserProfile get userProfile => _userProfile;

  void setUserProfile(UserProfile profile) {
    _userProfile = profile;
    notifyListeners();
  }

  void updateImagePath(String newPath) {
    _userProfile = UserProfile(
      name: _userProfile.name,
      email: _userProfile.email,
      phone: _userProfile.phone,
      address: _userProfile.address,
      major: _userProfile.major,
      imagePath: newPath,
    );
    notifyListeners();
  }
}

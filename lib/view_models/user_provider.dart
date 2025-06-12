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
    _userProfile = _userProfile.copyWith(imagePath: newPath);
    notifyListeners();
  }

  void setUid(String uid) {
    _userProfile = _userProfile.copyWith(userId: uid);
    notifyListeners();
  }
}

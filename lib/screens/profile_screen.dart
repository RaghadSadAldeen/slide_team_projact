import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import '../models/user_profile.dart';
import '../view_models/profile_view_model.dart';
import '../view_models/user_provider.dart';
import '../widgets/common/custom_button.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';
import 'edit_profile_screen.dart';
import '../widgets/profile_screen/bottom_curve_clipper.dart';

class ProfileScreen extends StatelessWidget {
  final UserProfile userProfile;

  const ProfileScreen({super.key, required this.userProfile});

  @override
  Widget build(BuildContext context) {
    final userId = FirebaseAuth.instance.currentUser?.uid ?? '';

    if (userId.isEmpty) {
      return Scaffold(
        body: Center(
          child: Text('User not logged in', style: TextStyle(color: Colors.red)),
        ),
      );
    }

    return ChangeNotifierProvider(
      create: (_) {
        final vm = ProfileViewModel();
        vm.setUserProfile(userProfile);
        return vm;
      },
      child: Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: deepForestGreen,
          centerTitle: true,
          title: const Text('Profile', style: TextStyle(color: Colors.white)),
          elevation: 0,
        ),
        body: Consumer2<ProfileViewModel, UserProvider>(
          builder: (context, profileVM, userProvider, _) {
            final userProfile = profileVM.userProfile;

            // فقط أول مرة قمنا بتحميل البيانات، لا تكرر التحديث كل مرة.
            if (userProvider.userProfile.userId.isEmpty) {
              userProvider.setUserProfile(userProfile);
            }

            return SingleChildScrollView(
              child: Column(
                children: [
                  ClipPath(
                    clipper: BottomCurveClipper(),
                    child: Container(
                      color: deepForestGreen,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.grey.shade300,
                            backgroundImage: userProfile.imagePath.isNotEmpty
                                ? (userProfile.imagePath.startsWith('http')
                                ? NetworkImage(userProfile.imagePath)
                                : FileImage(File(userProfile.imagePath)) as ImageProvider)
                                : null,
                            child: userProfile.imagePath.isEmpty
                                ? const Icon(Icons.person, size: 60, color: whiteColor)
                                : null,
                          ),
                          const SizedBox(height: 10),
                          Text(userProfile.name, style: sectionTitleStyle.copyWith(color: Colors.white)),
                          const SizedBox(height: 4),
                          Text(userProfile.major, style: bodyTextStyle.copyWith(color: Colors.white70)),
                          const SizedBox(height: 4),
                          Text(userProfile.email, style: bodyTextStyle.copyWith(color: Colors.white70)),
                          Text(userProfile.phone, style: bodyTextStyle.copyWith(color: Colors.white70)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        CustomButton(
                          text: 'Edit Profile',
                          onPressed: () async {
                            final updatedProfile = await Navigator.push<UserProfile>(
                              context,
                              MaterialPageRoute(
                                builder: (_) => EditProfileScreen(
                                  userProfile: userProfile,
                                  userId: userId,
                                ),
                              ),
                            );
                            if (updatedProfile != null) {
                              profileVM.setUserProfile(updatedProfile);
                              userProvider.setUserProfile(updatedProfile);
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        CustomButton(
                          text: 'Logout',
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

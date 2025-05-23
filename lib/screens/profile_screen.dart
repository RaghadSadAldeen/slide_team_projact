import 'dart:io';
import 'package:flutter/material.dart';
import 'package:slide_app/constants/colors.dart';
import 'package:slide_app/widgets/profile_screen/text_profile.dart';
import 'package:slide_app/widgets/profile_screen/bottom_profile.dart';
import 'package:slide_app/screens/edit_profile_screen.dart';
import 'package:slide_app/constants/text_styles.dart';
import '../widgets/profile_screen/profile_avatar.dart';

class ProfileScreen extends StatefulWidget {
  final String name;
  final String phone;
  final String address;
  final String email;
  final String major;
  final File? imageFile;

  const ProfileScreen({
    super.key,
    required this.name,
    required this.phone,
    required this.address,
    required this.email,
    required this.major,
    this.imageFile,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String name, phone, address, email, major;

  @override
  void initState() {
    super.initState();
    name = widget.name;
    phone = widget.phone;
    address = widget.address;
    email = widget.email;
    major = widget.major;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            color: darkTeal,
            alignment: Alignment.center,
            child: Text(
            'profile',
              style: sectionTitleStyle.copyWith(color: Colors.white),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              ClipPath(
                clipper: ArcClipper(),
                child: Container(
                  height: 370,
                  color: darkTeal,
                ),
              ),
              Column(
                children: [
                  const SizedBox(height: 20),
                  ProfileAvatar(
                    imageFile: widget.imageFile,
                    size: 175,
                  ),
                  const SizedBox(height: 10),
                  TextProfile(
                    name: name,
                    major: major,
                    email: email,
                    phone: phone,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 30),
          Column(
            children: [
              CustomProfileButton(
                label: 'Edit Profile',
                icon: Icons.edit,
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfileScreen(),
                    ),
                  );

                  if (result != null && result is Map<String, String>) {
                    setState(() {
                      name = result['name'] ?? name;
                      phone = result['phone'] ?? phone;
                      address = result['address'] ?? address;
                      email = result['email'] ?? email;
                      major = result['major'] ?? major;
                    });
                  }
                },
              ),
              const SizedBox(height: 15),
              CustomProfileButton(
                label: 'Logout',
                icon: Icons.logout,
                onPressed: () {
                  //مع شبارو ع صفحة sign in
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 60);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 60);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

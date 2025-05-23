import 'package:flutter/material.dart';
import 'package:slide_app/constants/colors.dart';
import 'package:slide_app/widgets/profile_screen/text_profile.dart';
import 'package:slide_app/widgets/profile_screen/bottom_profile.dart';
import 'package:slide_app/screens/edit_profile_screen.dart';
import 'package:slide_app/constants/text_styles.dart';


class ProfileScreen extends StatelessWidget {
  final String name;
  final String phone;
  final String address;
  final String email;
  final String major;

  const ProfileScreen({
    super.key,
    required this.name,
    required this.phone,
    required this.address,
    required this.email,
    required this.major,
  });

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
              "Profile",
              style: sectionTitleStyle,
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
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      'https://th.bing.com/th/id/OIP.vJ_K7NuQb8FWYUnvYZo6BAHaLH?cb=iwc2&rs=1&pid=ImgDetMain',
                      height: 175,
                      width: 175,
                      fit: BoxFit.cover,
                    ),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: BottomProfileButtons(
              onEditPressed: () {
                // رابط زر Edit Profile
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditProfileScreen()),
                );
              },
              onLogoutPressed: () {
                // وظيفة زر Logout

              },
            ),
          ),

        ],
      ),
    );
  }
}

// ClipPath لتصميم منحني علوي
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

// import 'package:flutter/material.dart';
// import 'colors.dart';
// class BottomNavBar extends StatelessWidget {
//   final int selectedIndex;
//   final Function(int) onItemTapped;
//
//   const BottomNavBar({
//     super.key,
//     required this.selectedIndex,
//     required this.onItemTapped,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: selectedIndex,
//       onTap: onItemTapped,
//       type: BottomNavigationBarType.fixed,
//       backgroundColor: const Color(0xFF1D3B2A),
//       selectedItemColor: whiteColor,
//       unselectedItemColor: Colors.white54,
//       showSelectedLabels: false,
//       showUnselectedLabels: false,
//       items: const [
//         BottomNavigationBarItem(
//           icon: Center(child: Icon(Icons.home, size: 30)),
//           label: 'Home',
//         ),
//         BottomNavigationBarItem(
//           icon: Center(child: Icon(Icons.notifications_none, size: 28)),
//           label: 'Notifications',
//         ),
//         BottomNavigationBarItem(
//           icon: Center(child: Icon(Icons.add_circle_outline, size: 32)),
//           label: 'Add',
//         ),
//         BottomNavigationBarItem(
//           icon: Center(child: Icon(Icons.person_outline, size: 28)),
//           label: 'Profile',
//         ),
//       ],
//     );
//   }
// }
//
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../models/user_profile.dart';
import '../screens/add_slide_screen.dart';
import '../screens/home_page.dart';
import '../screens/profile_screen.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  final UserProfile? userProfile;


  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
    this.userProfile, // نمررها فقط لصفحة البروفايل
  });

  void _navigate(BuildContext context, int index) {
    switch (index) {
      case 0: // Home
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const CollegeGridScreen( )),
          // عدل هنا لو لازم تمرر userId
        );
        break;
      case 1: // Notifications (غير مفعلة حالياً)
      // ممكن تضيف إشعارات مستقبلاً
        break;
      case 2: // Add Slide
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const AddSlideScreen()),
        );
        break;
      case 3: // Profile
        if (userProfile != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => ProfileScreen(userProfile: userProfile!, userId: '6KmAerGzEKUWLIUJMIU9ZDkDSzY2',),
            ),
          );
        }
        break;
    }
    // استدعاء الدالة لتمييز العنصر الحالي
    onItemTapped(index);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: (index) => _navigate(context, index),
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color(0xFF1D3B2A),
      selectedItemColor: whiteColor,
      unselectedItemColor: Colors.white54,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          icon: Center(child: Icon(Icons.home, size: 30)),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Center(child: Icon(Icons.notifications_none, size: 28)),
          label: 'Notifications',
        ),
        BottomNavigationBarItem(
          icon: Center(child: Icon(Icons.add_circle_outline, size: 32)),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: Center(child: Icon(Icons.person_outline, size: 28)),
          label: 'Profile',
        ),
      ],
    );
  }
}

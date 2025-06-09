// import 'package:flutter/material.dart';
// import 'package:slide_team_project/screens/profile_screen.dart';
// import '../constants/bottom_nav_bar.dart';
// import 'add_slide_screen.dart';
// import 'chat_screen.dart';
// import 'home_page.dart';
//
// class MainNavigation extends StatefulWidget {
//   final int initialIndex;
//   const MainNavigation({super.key, this.initialIndex = 0});
//
//   @override
//   State<MainNavigation> createState() => _MainNavigationState();
// }
//
// class _MainNavigationState extends State<MainNavigation> {
//   late int _selectedIndex;
//
//   @override
//   void initState() {
//     super.initState();
//     _selectedIndex = widget.initialIndex;
//   }
//
//   void _onItemTapped(int index) {
//     if (_selectedIndex == index) return;
//
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   Widget _getScreen(int index) {
//     switch (index) {
//       case 0:
//         return CollegeGridScreen();
//       case 1:
//         return ChatScreen();
//       case 2:
//         return AddSlideScreen();
//       case 3:
//         return ProfileScreen(
//           name: 'User Name',
//           phone: '1234567890',
//           address: 'City, Country',
//           email: 'user@example.com',
//           major: 'Computer Science',
//         );
//       default:
//         return const Center(child: Text("Invalid page"));
//     }
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _getScreen(_selectedIndex),
//       bottomNavigationBar: BottomNavBar(
//         selectedIndex: _selectedIndex,
//         onItemTapped: _onItemTapped,
//       ),
//     );
//   }
// }

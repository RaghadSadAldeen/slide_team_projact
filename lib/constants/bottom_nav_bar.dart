import 'package:flutter/material.dart';
import 'colors.dart';
class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      onTap: onItemTapped,
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
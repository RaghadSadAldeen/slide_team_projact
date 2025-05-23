import 'package:flutter/material.dart';
import 'package:slide_app/constants/colors.dart'; // لو تستخدم متغيرات الألوان هنا

class BottomProfileButtons extends StatelessWidget {
  final VoidCallback? onEditPressed;
  final VoidCallback? onLogoutPressed;

  const BottomProfileButtons({
    super.key,
    this.onEditPressed,
    this.onLogoutPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton.icon(
          onPressed: onEditPressed ?? () {},
          icon: const Icon(Icons.edit, size: 20),
          label: const Text('Edit Profile'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[100],
            foregroundColor: blackColor,
            minimumSize: const Size(double.infinity, 45),
          ),
        ),
        const SizedBox(height: 15),
        ElevatedButton.icon(
          onPressed: onLogoutPressed ?? () {},
          icon: const Icon(Icons.logout),
          label: const Text('Logout'),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[100],
            foregroundColor: blackColor,
            minimumSize: const Size(double.infinity, 45),
          ),
        ),
      ],
    );
  }
}

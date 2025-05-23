import 'dart:io';
import 'package:flutter/material.dart';
import 'package:slide_app/constants/colors.dart';

class ProfileAvatar extends StatelessWidget {
  final File? imageFile;
  final String? imageUrl;  // ممكن رابط إنترنت أو اسم صورة assets
  final double size;

  const ProfileAvatar({
    super.key,
    this.imageFile,
    this.imageUrl,
    this.size = 175,
  });

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (imageFile != null) {
      imageWidget = CircleAvatar(
        radius: size / 2,
        backgroundImage: FileImage(imageFile!),
      );
    } else if (imageUrl != null && imageUrl!.startsWith('http')) {
      imageWidget = CircleAvatar(
        radius: size / 2,
        backgroundImage: NetworkImage(imageUrl!),
      );
    } else if (imageUrl != null) {
      imageWidget = CircleAvatar(
        radius: size / 2,
        backgroundImage: AssetImage(imageUrl!),
      );
    } else {
      imageWidget = CircleAvatar(
        radius: size / 2,
        backgroundImage: AssetImage('assets/images/icons8-user-96.png'),
      );
    }
    return CircleAvatar(
      radius: (size / 2) ,
      backgroundColor: whiteColor,
      child: imageWidget,
    );
  }
}

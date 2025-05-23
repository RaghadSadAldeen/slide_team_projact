import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:slide_app/constants/colors.dart';

class ProfileImagePicker extends StatelessWidget {
  final File? imageFile;
  final void Function(File) onImagePicked;

  const ProfileImagePicker({
    super.key,
    required this.imageFile,
    required this.onImagePicked,
  });

  Future<void> _pickImage(BuildContext context) async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      onImagePicked(File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: imageFile != null
              ? Image.file(
            imageFile!,
            height: 175,
            width: 175,
            fit: BoxFit.cover,
          )
              : Image.asset(
            'assets/images/icons8-user-96.png',
            height: 175,
            width: 175,
            fit: BoxFit.cover,
          ),
        ),

        Positioned(
          bottom: 8,
          right: 8,
          child: GestureDetector(
            onTap: () => _pickImage(context),
            child: Container(
              decoration: BoxDecoration(
                color: deepForestGreen,
                shape: BoxShape.circle,
                border: Border.all(color: whiteColor, width: 2),
              ),
              padding: const EdgeInsets.all(6),
              child: const Icon(
                Icons.camera_alt,
                size: 20,
                color: whiteColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

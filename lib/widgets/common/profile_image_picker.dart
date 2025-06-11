import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../constants/colors.dart';

class ProfileImagePicker extends StatefulWidget {
  final Function(String) onImageSelected;

  const ProfileImagePicker({super.key, required this.onImageSelected});

  @override
  State<ProfileImagePicker> createState() => _ProfileImagePickerState();
}

class _ProfileImagePickerState extends State<ProfileImagePicker> {
  String? _imagePath;

  Future<void> _pickImage() async {
    try {
      final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (picked != null) {
        setState(() {
          _imagePath = picked.path;
        });
        widget.onImageSelected(picked.path);
      }
    } catch (e) {
      debugPrint('Image picking failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade400, width: 2),
            ),
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey.shade300,
              backgroundImage:
              _imagePath != null ? FileImage(File(_imagePath!)) : null,
              child: _imagePath == null
                  ? const Icon(Icons.person, size: 60, color: whiteColor)
                  : null,
            ),
          ),
          const CircleAvatar(
            radius: 18,
            backgroundColor: deepForestGreen,
            child: Icon(Icons.camera_alt, size: 16, color: whiteColor),
          ),
        ],
      ),
    );
  }
}

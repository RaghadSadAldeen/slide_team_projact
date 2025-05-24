import 'package:flutter/material.dart';
import 'dart:io';
import 'package:slide_team_project/widgets/Add_screen/slide_form_fields.dart';
import 'package:slide_team_project/widgets/Add_screen/upload_image_widget.dart';
import 'package:slide_team_project/widgets/Add_screen/save_button.dart';
import 'package:slide_team_project/widgets/profile_screen/profile_avatar.dart';
import '../constants/text_styles.dart';

class AddSlideScreen extends StatefulWidget {
  final File? profileImage;

  const AddSlideScreen({super.key, this.profileImage});

  @override
  State<AddSlideScreen> createState() => _AddSlideScreenState();
}

class _AddSlideScreenState extends State<AddSlideScreen> {
  File? uploadedSlideImage;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final slideTitleController = TextEditingController();
  final descriptionController = TextEditingController();

  void updateUploadedSlideImage(File image) {
    setState(() {
      uploadedSlideImage = image;
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    slideTitleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Add Slide', style: sectionTitleStyle),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: ProfileAvatar(
                  imageFile: widget.profileImage,
                  size: 75,
                ),
              ),
              const SizedBox(height: 33),
              SlideFormFields(
                nameController: nameController,
                emailController: emailController,
                slideTitleController: slideTitleController,
                descriptionController: descriptionController,
              ),

              const SizedBox(height: 16),

              UploadImageWidget(
                selectedImage: uploadedSlideImage,
                onImageSelected: updateUploadedSlideImage,
              ),

              const SizedBox(height: 12),
              SaveButton(
                nameController: nameController,
                emailController: emailController,
                slideTitleController: slideTitleController,
                descriptionController: descriptionController,
                selectedImage: uploadedSlideImage, // فقط صورة الـ Slide
              ),
            ],
          ),
        ),
      ),
    );
  }
}

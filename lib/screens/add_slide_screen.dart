import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import '../view_models/add_slide_view_model.dart';
import '../view_models/get_slide_view_model.dart';
import '../view_models/user_provider.dart';
import '../widgets/common/custom_button.dart';
import '../widgets/common/custom_text_field.dart';
import '../constants/colors.dart';
import 'get_slide_screen.dart';

class AddSlideScreen extends StatelessWidget {
  const AddSlideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddSlideViewModel(),
      child: const _AddSlideBody(),
    );
  }
}

class _AddSlideBody extends StatelessWidget {
  const _AddSlideBody();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<AddSlideViewModel>(context);
    final userProfile = Provider.of<UserProvider>(context).userProfile;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: blackColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Add Slide',
          style: TextStyle(color: blackColor, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // User info (Profile Image + Name)
              Row(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey.shade300,
                    backgroundImage: userProfile.imagePath.isNotEmpty
                        ? (userProfile.imagePath.startsWith('http')
                        ? NetworkImage(userProfile.imagePath)
                        : FileImage(File(userProfile.imagePath)) as ImageProvider)
                        : null,
                    child: userProfile.imagePath.isEmpty
                        ? const Icon(Icons.person, size: 60, color: whiteColor)
                        : null,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    userProfile.name.isNotEmpty ? userProfile.name : 'No Name',
                    style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Form Fields
              CustomTextField(
                hintText: 'Name',
                icon: Icons.person,
                controller: viewModel.nameController,
              ),
              CustomTextField(
                hintText: 'Email',
                icon: Icons.email,
                keyboardType: TextInputType.emailAddress,
                controller: viewModel.emailController,
              ),
              CustomTextField(
                hintText: 'Slide Title',
                icon: Icons.title,
                controller: viewModel.slideTitleController,
              ),
              CustomTextField(
                hintText: 'Description',
                icon: Icons.description,
                controller: viewModel.descriptionController,
                keyboardType: TextInputType.multiline,
              ),

              const SizedBox(height: 16),

              // Slide image preview
              if (viewModel.imagePath.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: FileImage(File(viewModel.imagePath)),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

              // Slide image picker button
              ElevatedButton.icon(
                onPressed: () async {
                  final picked = await ImagePicker().pickImage(source: ImageSource.gallery);
                  if (picked != null) {
                    viewModel.setImagePath(picked.path);
                  }
                },
                icon: const Icon(Icons.image),
                label: const Text('Pick Slide Image'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: deepForestGreen,
                  foregroundColor: whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Save Button
              CustomButton(
                onPressed: () async {
                  if (!viewModel.isFormValid) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please fill all fields')),
                    );
                    return;
                  }

                  final slideId = const Uuid().v4();
                  final error = await viewModel.addSlide(slideId);

                  if (error == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Slide added successfully!')),
                    );

                    viewModel.clearForm();

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChangeNotifierProvider(
                          create: (_) => GetSlideViewModel(),
                          child: const GetSlideScreen(),
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Failed to add slide: $error')),
                    );
                  }
                },
                text: 'Save',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
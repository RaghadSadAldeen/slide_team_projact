import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/add_slide_view_model.dart';
import '../view_models/user_provider.dart';
import '../widgets/Add_screen/upload_image_widget.dart';
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
              const SizedBox(height: 12),
              UploadImageWidget(
                selectedImage: viewModel.selectedImage,
                onImageSelected: (file) => viewModel.setImage(file),
              ),
              const SizedBox(height: 24),
              CustomButton(
                onPressed: () async {
                  if (!viewModel.isFormValid) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please fill all fields')),
                    );
                    return;
                  }

                  print("🟢 Save button pressed");
                  await viewModel.saveSlideToFirebase();
                  print("🟢 saveSlideToFirebase() finished");

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => GetSlideScreen(
                        name: viewModel.nameController.text,
                        email: viewModel.emailController.text,
                        slideTitle: viewModel.slideTitleController.text,
                        description: viewModel.descriptionController.text,
                        imageFile: viewModel.selectedImage,
                      ),
                    ),
                  );
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

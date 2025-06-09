import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants/colors.dart';
import '../constants/text_styles.dart';
import '../models/user_profile.dart';
import '../view_models/edit_profile_viewmodel.dart';
import '../widgets/common/custom_button.dart';
import '../widgets/common/custom_text_field.dart';
import '../widgets/common/profile_image_picker.dart';

class EditProfileScreen extends StatelessWidget {
  final UserProfile userProfile;
  final String userId;

  const EditProfileScreen({
    super.key,
    required this.userProfile,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final viewModel = EditProfileViewModel();
        viewModel.initialize(userProfile, userId);
        return viewModel;
      },
      child: const _EditProfileBody(),
    );
  }
}

class _EditProfileBody extends StatefulWidget {
  const _EditProfileBody();

  @override
  State<_EditProfileBody> createState() => _EditProfileBodyState();
}

class _EditProfileBodyState extends State<_EditProfileBody> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<EditProfileViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Edit Profile', style: sectionTitleStyle),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ProfileImagePicker(onImageSelected: viewModel.setImagePath),
              const SizedBox(height: 20),
              CustomTextField(
                hintText: 'Name',
                icon: Icons.person,
                controller: viewModel.nameController,
                validator: (val) =>
                val == null || val.isEmpty ? 'Required' : null,
              ),
              CustomTextField(
                hintText: 'Phone',
                icon: Icons.phone,
                controller: viewModel.phoneController,
                keyboardType: TextInputType.phone,
                validator: (val) =>
                val == null || val.isEmpty ? 'Required' : null,
              ),
              CustomTextField(
                hintText: 'Address',
                icon: Icons.location_on,
                controller: viewModel.addressController,
                validator: (val) =>
                val == null || val.isEmpty ? 'Required' : null,
              ),
              CustomTextField(
                hintText: 'Email',
                icon: Icons.email,
                controller: viewModel.emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (val) =>
                val == null || !val.contains('@') ? 'Invalid email' : null,
              ),
              CustomTextField(
                hintText: 'Major',
                icon: Icons.school,
                controller: viewModel.majorController,
                validator: (val) =>
                val == null || val.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 40),
              CustomButton(
                text: 'Save',
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final error = await viewModel.saveProfile();
                    if (error == null) {
                      Navigator.pop(context, viewModel.userProfile);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: $error')),
                      );
                    }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
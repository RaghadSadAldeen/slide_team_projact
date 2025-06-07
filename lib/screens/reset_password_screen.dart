import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';
import '../utils/validators.dart';
import '../view_models/reset_password_viewmodel.dart';
import '../widgets/common/custom_button.dart';
import '../widgets/common/custom_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final ResetPasswordViewModel _viewModel = ResetPasswordViewModel();

  @override
  void dispose() {
    _viewModel.disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _viewModel.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lock, size: 100, color: darkTeal),
                const SizedBox(height: 32),
                Text("Forget your password ?", style: sectionTitleStyle),
                const SizedBox(height: 8),
                Text(
                  "you can reset your password here",
                  style: bodyTextStyle.copyWith(fontSize: 14, color: Colors.grey[700]),
                ),
                const SizedBox(height: 32),
                CustomTextField(
                  hintText: "Email",
                  icon: Icons.email,
                  controller: _viewModel.emailController,
                  validator: validateEmail,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 24),
                CustomButton(
                  text: "Send Reset Link",
                  onPressed: () => _viewModel.resetPassword(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

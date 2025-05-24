import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/text_styles.dart';
import 'package:slide_team_project/widgets/reset_password/reset_password_text_field.dart';
import 'package:slide_team_project/widgets/reset_password/reset_password_button.dart';
import 'package:slide_team_project/utils/validators.dart';

class ResetPasswordScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
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
                ResetPasswordTextField(
                  controller: emailController,
                  validator: validateEmail,
                ),
                const SizedBox(height: 24),
                ResetPasswordButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("need routing)")),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class CreateAccountViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _authService = AuthService();

  Future<void> createAccount(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    try {
      final user = await _authService.registerUser(name, email, password);

      if (context.mounted && user != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Account created for ${user.email}")),
        );
        Navigator.of(context).pushReplacementNamed('/main');
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("$error")),
        );
      }
    }
  }

  void disposeControllers() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}

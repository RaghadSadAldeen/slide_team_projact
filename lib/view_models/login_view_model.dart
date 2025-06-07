import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    final email = emailController.text.trim();
    final password = passwordController.text;

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (context.mounted) {
        Navigator.pushReplacementNamed(context, '/CollegeGridScreen');
      }

    } on FirebaseAuthException catch (e) {
      String errorMessage;

      switch (e.code) {
        case 'user-not-found':
          errorMessage = 'No account found for this email.';
          break;
        case 'wrong-password':
          errorMessage = 'Incorrect password.';
          break;
        case 'invalid-email':
          errorMessage = 'Invalid email format.';
          break;
        default:
          errorMessage = 'Login failed: Invalid email or password';
      }

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
    }
  }

  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
  }
}

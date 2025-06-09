import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<bool> login() async {
    if (!formKey.currentState!.validate()) return false;

    final email = emailController.text.trim();
    final password = passwordController.text;

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return true; // نجاح تسجيل الدخول
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

      // لا تعرض رسالة الخطأ هنا (الـ View هو اللي يعرضها)
      notifyListeners();

      // بدلها، يمكنك حفظ رسالة الخطأ لو تحب
      _errorMessage = errorMessage;

      return false; // فشل تسجيل الدخول
    }
  }

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  void disposeControllers() {
    emailController.dispose();
    passwordController.dispose();
  }
}

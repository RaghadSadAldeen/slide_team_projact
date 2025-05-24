import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';
import '../utils/validators.dart';
import '../widgets/login/login_text_field.dart';
import '../widgets/login/login_button.dart';
import 'reset_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void handleLogin() {
    if (_formKey.currentState!.validate()) {
      // ✅ بعد التحقق من صحة البيانات، ننتقل إلى MainNavigation
      Navigator.pushReplacementNamed(context, '/main');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Center(child: Text("Sign In", style: appTitleStyle)),
                  const SizedBox(height: 120),
                  const Text("Login to your account", style: sectionTitleStyle),
                  const SizedBox(height: 16),
                  CustomTextField(
                    hintText: 'Email',
                    icon: Icons.email,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: validateEmail,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    hintText: 'Password',
                    icon: Icons.lock,
                    obscureText: true,
                    controller: passwordController,
                    validator: (value) =>
                    value == null || value.isEmpty ? 'Password is required' : null,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ResetPasswordScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Forget your password?",
                        style: TextStyle(color: deepForestGreen),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  LoginButton(
                    text: 'Sign In',
                    onPressed: handleLogin,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

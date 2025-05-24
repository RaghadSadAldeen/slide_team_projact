import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';
import '../widgets/create_account/create_account_text_field.dart';
import '../widgets/create_account/create_account_button.dart';
import '../utils/validators.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40),
                  Center(
                    child: Text(
                      'Sign Up',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  const SizedBox(height: 70),
                  const Text('Create your account', style: appTitleStyle),
                  const SizedBox(height: 20),

                  CreateAccountTextField(
                    hintText: 'Name',
                    icon: Icons.person,
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Name is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12),

                  CreateAccountTextField(
                    hintText: 'Email',
                    icon: Icons.email,
                    controller: emailController,
                    validator: validateEmail,
                     // keyboardType: TextInputType.emailAddress

                  ),
                  const SizedBox(height: 12),

                  CreateAccountTextField(
                    hintText: 'Password',
                    icon: Icons.lock,
                    obscureText: true,
                    controller: passwordController,
                    validator: validatePassword,
                  ),
                  const SizedBox(height: 24),

                  CreateAccountButton(
                    text: 'Sign Up',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                      }
                    },
                  ),
                  const SizedBox(height: 16),

                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text('Already have an Account? Sign In'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

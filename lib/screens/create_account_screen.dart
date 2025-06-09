import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';
import '../utils/validators.dart';
import '../view_models/create_account_viewmodel.dart';
import '../widgets/common/custom_text_field.dart';
import '../widgets/common/custom_button.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CreateAccountViewModel(),
      child: const _CreateAccountScreenBody(),
    );
  }
}

class _CreateAccountScreenBody extends StatelessWidget {
  const _CreateAccountScreenBody();

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CreateAccountViewModel>(context);

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Form(
              key: viewModel.formKey,
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

                  CustomTextField(
                    hintText: 'Name',
                    icon: Icons.person,
                    controller: viewModel.nameController,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Name is required';
                      }
                      return null;
                    },
                  ),

                  CustomTextField(
                    hintText: 'Email',
                    icon: Icons.email,
                    controller: viewModel.emailController,
                    keyboardType: TextInputType.emailAddress,
                    validator: validateEmail,
                  ),

                  CustomTextField(
                    hintText: 'Password',
                    icon: Icons.lock,
                    obscureText: true,
                    controller: viewModel.passwordController,
                    validator: validatePassword,
                  ),

                  const SizedBox(height: 24),

                  CustomButton(
                    text: 'Sign Up',
                    onPressed: () => viewModel.createAccount(context),
                  ),

                  const SizedBox(height: 16),

                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text('Already have an Account? Sign In'),
                    ),
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

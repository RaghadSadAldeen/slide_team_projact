import 'package:flutter/material.dart';
import 'package:slide_team_project/widgets/common/custom_button.dart';
import 'package:slide_team_project/constants/text_styles.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                SizedBox(
                  height: 180,
                  child: Image.asset('images/slide.png'),
                ),
                Text(
                  'Welcome To Slide',
                  style: appTitleStyle,
                ),
              ],
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: 'Log In',
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),
            const SizedBox(height: 12),
            CustomButton(
              text: 'Sign Up',
              onPressed: () {
                Navigator.pushNamed(context, '/create-account');
              },
            ),
          ],
        ),
      ),
    );
  }
}

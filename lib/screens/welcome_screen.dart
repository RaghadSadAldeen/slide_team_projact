
  import 'package:flutter/material.dart';
  import 'package:slide_team_project/widgets/my_button.dart';
  import 'package:slide_team_project/constants/colors.dart';
  import 'package:slide_team_project/constants/text_styles.dart';

  class WelcomeScreen extends StatefulWidget {
    const WelcomeScreen({Key? key}) : super(key: key);

    @override
    _WelcomeScreenState createState() => _WelcomeScreenState();
  }

  class _WelcomeScreenState extends State<WelcomeScreen> {


    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.white ,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Container(
                    height: 180,
                    child: Image.asset('images/slide.png'),
                  ),
                  Text(
                    'Welcome To Slide',
                    style: appTitleStyle,
                  ),
                ],
              ),
              SizedBox(height: 30),
              MyButton(
                color: sageGreen,
                title: 'Log In',
                onPressed: () {},
              ),
              MyButton(
                color: sageGreen,
                title: 'Sign Up',
                onPressed: () {},
              )
            ],
          ),
        ),
      );
    }
  }
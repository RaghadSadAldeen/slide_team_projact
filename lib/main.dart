import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/create_account_screen.dart';
import 'screens/subject_content_screen.dart';
import 'package:slide_team_project/screens/reset_password_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
//test
  //sdskc
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Slide App',
      initialRoute: '/create-account',
      routes: {
        '/create-account': (context) => const CreateAccountScreen(),
        '/login': (context) => const LoginScreen(),
      },
      //home:SubjectContentScreen(),
    );
  }
}



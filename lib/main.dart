import 'package:flutter/material.dart';
import 'package:slide_team_project/screens/welcome_screen.dart';
import 'package:slide_team_project/screens/login_screen.dart';
import 'package:slide_team_project/screens/create_account_screen.dart';
import 'package:slide_team_project/screens/main_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Slide App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/create-account': (context) => const CreateAccountScreen(),
        '/main': (context) => const MainNavigation(),
      },
    );
  }
}

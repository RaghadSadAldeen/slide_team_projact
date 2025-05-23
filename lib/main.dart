import 'package:flutter/material.dart';
import 'package:slide_app/screens/add_slide_screen.dart';
import 'package:slide_app/screens/edit_profile_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
home: AddSlideScreen(),
    // home: EditProfileScreen(),
    );
  }
}



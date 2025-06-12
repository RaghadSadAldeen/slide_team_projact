import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:slide_team_project/screens/welcome_screen.dart';
import 'package:slide_team_project/screens/login_screen.dart';
import 'package:slide_team_project/screens/create_account_screen.dart';
import 'package:slide_team_project/screens/main_navigation.dart';
import 'package:slide_team_project/screens/home_page.dart';

import 'package:slide_team_project/view_models/user_provider.dart';
import 'package:slide_team_project/view_models/materials_view_model.dart';
import 'package:slide_team_project/view_models/add_slide_view_model.dart'; // تأكد من المسار الصحيح

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => MaterialsViewModel()),
        ChangeNotifierProvider(create: (_) => AddSlideViewModel()), // أضف هذا السطر
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slide App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/welcome',
      routes: {
        '/welcome': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/create-account': (context) => const CreateAccountScreen(),
        '/main': (context) => const MainNavigation(),
        '/': (context) => const LoginScreen(),
        '/CollegeGridScreen': (context) => const CollegeGridScreen(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:slide_team_project/screens/create_account_screen.dart';
import 'package:slide_team_project/screens/login_screen.dart';
import 'package:slide_team_project/screens/welcome_screen.dart';
import 'package:slide_team_project/screens/main_navigation.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slide App',
      debugShowCheckedModeBanner: false,
      initialRoute: '/welcome', // ← تبدأ من شاشة الترحيب
      routes: {
        '/welcome': (context) => const WelcomeScreen(),
        '/login': (context) => const LoginScreen(),
        '/create-account': (context) => const CreateAccountScreen(),
        '/main': (context) => const MainNavigation(), // ← لازم تكون موجودة عشان التنقل ما يضرب
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:slide_team_project/screens/welcome_screen.dart';
// import 'package:slide_team_project/screens/login_screen.dart';
// import 'package:slide_team_project/screens/create_account_screen.dart';
// import 'package:slide_team_project/screens/main_navigation.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Slide App',
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//       ),
//       initialRoute: '/welcome',
//       routes: {
//         '/welcome': (context) => const WelcomeScreen(), // ✅ Welcome screen
//         '/login': (context) => const LoginScreen(),
//         '/create-account': (context) => const CreateAccountScreen(),
//         '/main': (context) => const MainNavigation(),
//       },
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:slide_team_project/screens/create_account_screen.dart';
import 'package:slide_team_project/screens/login_screen.dart';
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
      initialRoute: '/register',
      routes: {
        '/register': (context) => const CreateAccountScreen(),
        '/login': (context) => const LoginScreen(),
      },
    );
  }
}




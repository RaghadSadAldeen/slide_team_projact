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

////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:provider/provider.dart';
// import 'firebase_options.dart';
// import 'view_models/materials_view_model.dart';
// import 'screens/profile_screen.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => MaterialsViewModel()),
//       ],
//       child: MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   final String demoUserId = 'user123'; // استبدلها بمعرف المستخدم الحقيقي بعد تسجيل الدخول
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Slide App',
//       debugShowCheckedModeBanner: false,
//       home: ProfileScreen(userId: demoUserId),
//     );
//   }
// }

////////////////////////////////////////////////////////////////////////
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:slide_team_project/screens/create_account_screen.dart';
// import 'package:slide_team_project/screens/home_page.dart';
// import 'package:slide_team_project/screens/login_screen.dart';
// //import 'package:slide_team_project/screens/college_grid_screen.dart' as college_screen;
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Slide App',
//       initialRoute: '/',
//       routes: {
//         '/': (context) => const CreateAccountScreen(),
//       },
//       onGenerateRoute: (settings) {
//         if (settings.name == '/CollegeGridScreen') {
//           final uid = settings.arguments as String;
//           return MaterialPageRoute(
//             builder: (context) =>CollegeGridScreen(userId: uid),
//           );
//         }
//         return null;
//       },
//     );
//   }
// }
////////////////////////////////////////////////////////////////////////
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:provider/provider.dart';
// import 'package:slide_team_project/screens/home_page.dart';
// import 'package:slide_team_project/screens/main_navigation.dart';
// import 'package:slide_team_project/screens/welcome_screen.dart';
// import 'package:slide_team_project/screens/profile_screen.dart'; // ✅ استيراد البروفايل
// import 'firebase_options.dart';
// import 'models/user_profile.dart';
// import 'view_models/materials_view_model.dart';
// import 'screens/subject_content_screen.dart';
// import 'screens/create_account_screen.dart';
// import 'screens/login_screen.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => MaterialsViewModel()),
//       ],
//       child: const MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Slide App',
//       debugShowCheckedModeBanner: false,
//       initialRoute: '/profile', // ✅ نقطة الدخول الجديدة
//       routes: {
//         '/subject': (context) => const SubjectContentScreen(materialTitle: 'Materials name'),
//         '/register': (context) => const CreateAccountScreen(),
//         '/login': (context) => const LoginScreen(),
//         '/': (context) => LoginScreen(),
//         '/CollegeGridScreen': (context) => CollegeGridScreen(),
//         '/profile': (context) => ProfileScreen(
//           userId: 'test_user_id',
//           userProfile: UserProfile(
//             name: 'Test User',
//             email: 'test@example.com',
//             phone: '1234567890',
//             address: '123 Test Street',
//             major: 'Computer Science',
//             imagePath: 'assets/images/default_profile.png', // أو أي صورة تجريبية عندك
//           ),
//         ),
//       },
//     );
//   }
// }
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'screens/add_slide_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slide App',
      debugShowCheckedModeBanner: false,
      home: const AddSlideScreen(),
    );
  }
}







import 'package:flutter/material.dart';
import 'screens/notifications_screen.dart';
import 'screens/welcome_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/chatlist_screen.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message: ${message.messageId}');
}


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final FirebaseMessaging _messaging;
  String? _token;

  @override
  void initState() {
    super.initState();

    _messaging = FirebaseMessaging.instance;

    // طلب صلاحيات الإشعارات (خاصة على iOS)
    _requestNotificationPermission();

    // الحصول على توكن الجهاز وتخزينه محلياً أو في Firestore حسب حاجتك
    _getToken();

    // الاستماع لإشعارات التطبيق عندما يكون في الواجهة (foreground)
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Received a message while in the foreground!');
      if (message.notification != null) {
        final notification = message.notification!;
        // إظهار Snackbar داخل التطبيق عند استقبال إشعار
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${notification.title ?? ""} - ${notification.body ?? ""}'),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    });

    // الاستماع للنقر على الإشعار (عندما يكون التطبيق في الخلفية أو مغلق ثم يُفتح)
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('User clicked on a notification and opened the app.');
      // هنا يمكن التنقل إلى صفحة معينة حسب بيانات الإشعار
      // مثلاً لو في chatId في data:
      final chatId = message.data['chatId'];
      if (chatId != null) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChatScreen(
              chatId: chatId,
              otherUserEmail: message.data['senderEmail'] ?? '',
              currentUserEmail: '', // حط هنا الإيميل الحالي حسب حالتك
            ),
          ),
        );
      }
    });

    // تحقق هل التطبيق تم فتحه من خلال إشعار (عندما يكون مغلق)
    _checkForInitialMessage();
  }

  Future<void> _requestNotificationPermission() async {
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );
    print('User granted permission: ${settings.authorizationStatus}');
  }

  Future<void> _getToken() async {
    _token = await _messaging.getToken();
    print('FCM Token: $_token');
    // يمكنك هنا إرسال التوكن إلى Firestore إذا أردت
  }

  Future<void> _checkForInitialMessage() async {
    RemoteMessage? initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      final chatId = initialMessage.data['chatId'];
      if (chatId != null) {
        // يجب استخدام Future.microtask أو WidgetsBinding لإتاحة السياق
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ChatScreen(
                chatId: chatId,
                otherUserEmail: initialMessage.data['senderEmail'] ?? '',
                currentUserEmail: '', // حط هنا الإيميل الحالي
              ),
            ),
          );
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Slide app',

      title: 'Flutter Demo',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const NotificationsScreen(),
    );
  }
}

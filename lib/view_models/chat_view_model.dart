import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ChatViewModel {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get user => _auth.currentUser;

  Future<void> send({
    required String chatId,
    required String text,
    required String receiverUid,
    required String receiverEmail,
  }) async {
    if (text.trim().isEmpty) return;

    // إضافة الرسالة إلى الدردشة
    await _db.collection('chats').doc(chatId).collection('messages').add({
      'text': text.trim(),
      'sender': user?.email,
      'time': FieldValue.serverTimestamp(),
    });

    // تحديث آخر رسالة وتاريخها في الدردشة
    await _db.collection('chats').doc(chatId).update({
      'lastMessage': text.trim(),
      'timestamp': FieldValue.serverTimestamp(),
    });

    // جلب توكن FCM للمستلم من Firestore
    final userDoc = await _db.collection('users').doc(receiverUid).get();
    final receiverFcmToken = userDoc.data()?['fcmToken'];

    if (receiverFcmToken != null) {
      await sendPushMessage(receiverFcmToken, text, user?.email ?? 'Someone', chatId);
    }
  }

  // دالة إرسال إشعار عبر FCM API
  Future<void> sendPushMessage(String token, String message, String senderEmail, String chatId) async {
    try {
      const serverKey = '3726596232'; // ضع هنا مفتاح السيرفر الخاص بك من Firebase Console

      final data = {
        'to': token,
        'notification': {
          'title': 'رسالة جديدة من $senderEmail',
          'body': message,
          'sound': 'default',
        },
        'data': {
          'click_action': 'FLUTTER_NOTIFICATION_CLICK',
          'chatId': chatId,
          'senderEmail': senderEmail,
          'type': 'chat_message',
        },
      };

      final response = await http.post(
        Uri.parse('https://fcm.googleapis.com/fcm/send'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'key=$serverKey',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode != 200) {
        print('Failed to send FCM notification: ${response.body}');
      }
    } catch (e) {
      print('Error sending FCM notification: $e');
    }
  }
}

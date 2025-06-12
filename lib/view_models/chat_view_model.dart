import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/message_model.dart';

class ChatViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final String chatId;

  ChatViewModel(this.chatId);

  User? get currentUser => _auth.currentUser;

  Stream<List<Message>> getMessagesStream() {
    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')

        .orderBy('time', descending: true)
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => Message.fromMap(doc.data())).toList());
  }

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty || currentUser == null) return;

    await _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .add({
      'text': text,
      'sender': currentUser!.email,
      'time': FieldValue.serverTimestamp(), // تأكد أن الحقل هو 'time' في قاعدة البيانات
    });
  }
}

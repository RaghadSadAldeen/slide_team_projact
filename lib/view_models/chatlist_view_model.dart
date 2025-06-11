import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/chat_model.dart';

class ChatListViewModel {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  String get currentUserEmail => _auth.currentUser?.email ?? '';

  Stream<List<Chat>> getChatsForCurrentUser() {
    return _db
        .collection('chats')
        .where('users', arrayContains: currentUserEmail)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => Chat.fromDoc(doc)).toList());
  }
}

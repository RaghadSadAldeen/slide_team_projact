import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/chat_model.dart';

class ChatListViewModel {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? get currentUser => _auth.currentUser;

  // جلب كل الـ chats اللي المستخدم الحالي جزء منها
  Stream<List<ChatSummary>> getChats() {
    final currentUserEmail = currentUser?.email ?? '';

    return _firestore
        .collection('chats')
        .where('participants', arrayContains: currentUserEmail)
        .snapshots()
        .asyncMap((snapshot) async {
      List<ChatSummary> chats = [];

      for (var doc in snapshot.docs) {
        final data = doc.data();

        // نفرض أن كل chat يحتوي على participants: List<String>
        List participants = data['participants'] ?? [];

        // الآخر في المحادثة هو الذي ليس المستخدم الحالي
        String otherUserEmail = participants.firstWhere(
                (email) => email != currentUserEmail,
            orElse: () => 'Unknown');

        // نحتاج نجيب آخر رسالة من المجموعة الفرعية messages داخل chat
        QuerySnapshot messagesSnapshot = await doc.reference
            .collection('messages')
            .orderBy('time', descending: true)
            .limit(1)
            .get();

        String lastMsg = '';
        DateTime lastMsgTime = DateTime.fromMillisecondsSinceEpoch(0);

        if (messagesSnapshot.docs.isNotEmpty) {
          var lastMessageData = messagesSnapshot.docs.first.data() as Map<String, dynamic>;
          lastMsg = lastMessageData['text'] ?? '';
          lastMsgTime = (lastMessageData['time'] as Timestamp?)?.toDate() ?? DateTime.now();
        }

        chats.add(ChatSummary(
          chatId: doc.id,
          otherUserEmail: otherUserEmail,
          lastMessage: lastMsg,
          lastMessageTime: lastMsgTime,
        ));
      }

      // ترتيب المحادثات حسب اخر رسالة
      chats.sort((a, b) => b.lastMessageTime.compareTo(a.lastMessageTime));

      return chats;
    });
  }
}
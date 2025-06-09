import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';
import '../view_models/chat_view_model.dart';
import '../widgets/message_line.dart';
import '../models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ChatScreen extends StatefulWidget {
  final String chatId;
  final String otherUserEmail;
  final String currentUserEmail;

  const ChatScreen({
    super.key,
    required this.chatId,
    required this.otherUserEmail,
    required this.currentUserEmail,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatViewModel _vm = ChatViewModel();
  final TextEditingController _ctrl = TextEditingController();

  /// احصل على uid عن طريق الإيميل (من مجموعة المستخدمين)
  Future<String?> _getUidByEmail(String email) async {
    final snap = await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: email)
        .limit(1)
        .get();
    if (snap.docs.isEmpty) return null;
    return snap.docs.first.id; // الـ document ID هو uid المستخدم
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Image.asset('images/slide.png', height: 25),
            const SizedBox(width: 8),
            Text(widget.otherUserEmail, style: appBarTitleStyle),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: sageGreen,
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('chats')
                    .doc(widget.chatId)
                    .collection('messages')
                    .orderBy('time', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(color: deepForestGreen),
                    );
                  }
                  final docs = snapshot.data!.docs;
                  if (docs.isEmpty) {
                    return const Center(
                      child: Text('لا توجد رسائل بعد', style: TextStyle(fontSize: 16)),
                    );
                  }

                  return ListView.builder(
                    reverse: true,
                    padding: const EdgeInsets.all(12),
                    itemCount: docs.length,
                    itemBuilder: (context, i) {
                      final data = docs[i].data()! as Map<String, dynamic>;
                      final message = Message(
                        sender: data['sender'] ?? '',
                        text: data['text'] ?? '',
                        time: data['time'] != null
                            ? (data['time'] as Timestamp).toDate()
                            : DateTime.now(),
                      );
                      return MessageLine(
                        msg: message,
                        isMe: message.sender == widget.currentUserEmail,
                      );
                    },
                  );
                },
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(
                top: BorderSide(color: deepForestGreen, width: 2),
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _ctrl,
                    decoration: const InputDecoration(
                      hintText: 'Write your message here...',
                      border: InputBorder.none,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () async {
                    final receiverUid = await _getUidByEmail(widget.otherUserEmail);
                    if (receiverUid == null || _ctrl.text.trim().isEmpty) return;

                    await _vm.send(
                      chatId: widget.chatId,
                      receiverUid: receiverUid,
                      receiverEmail: widget.otherUserEmail,
                      text: _ctrl.text.trim(),
                    );
                    _ctrl.clear();
                  },
                  child: Text(
                    'send',
                    style: buttonTextStyle.copyWith(color: deepForestGreen),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';

class Chat {
  final String id;
  final List<String> users;
  final String lastMessage;
  final DateTime? timestamp;

  Chat({
    required this.id,
    required this.users,
    required this.lastMessage,
    this.timestamp,
  });

  factory Chat.fromDoc(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Chat(
      id: doc.id,
      users: List<String>.from(data['users'] ?? []),
      lastMessage: data['lastMessage'] ?? '',
      timestamp: (data['timestamp'] as Timestamp?)?.toDate(),
    );
  }
}

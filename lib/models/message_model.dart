import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String text;
  final String sender;
  final DateTime time;

  Message({
    required this.text,
    required this.sender,
    required this.time,
  });

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      text: map['text'] ?? '',
      sender: map['sender'] ?? '',
      time: (map['time'] as Timestamp).toDate(),
    );
  }
}

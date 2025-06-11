import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String text;
  final String sender;
  final DateTime? time;

  Message({required this.text, required this.sender, this.time});

  factory Message.fromMap(Map<String, dynamic> data) {
    return Message(
      text: data['text'],
      sender: data['sender'],
      time: (data['time'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'sender': sender,
      'time': time,
    };
  }
}
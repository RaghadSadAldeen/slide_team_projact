import 'package:flutter/material.dart';
import '../models/message_model.dart';
import '../constants/colors.dart';

class MessageLine extends StatelessWidget {
  final Message msg;
  final bool isMe;
  const MessageLine({super.key, required this.msg, required this.isMe});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment:
      isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(msg.sender, style: const TextStyle(fontSize: 12)),
        Material(
          color: isMe ? deepForestGreen : Colors.white,
          borderRadius: BorderRadius.only(
            topLeft : const Radius.circular(30),
            topRight: const Radius.circular(30),
            bottomLeft :
            isMe ? const Radius.circular(30) : Radius.zero,
            bottomRight:
            isMe ? Radius.zero : const Radius.circular(30),
          ),
          elevation: 4,
          child: Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
            child: Text(
              msg.text,
              style: TextStyle(
                  color: isMe ? Colors.white : Colors.black,
                  fontSize: 15),
            ),
          ),
        ),
      ],
    ),
  );
}

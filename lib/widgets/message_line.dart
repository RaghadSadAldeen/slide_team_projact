import 'package:flutter/material.dart';
import '../models/message_model.dart';
import '../constants/colors.dart';

class MessageLine extends StatelessWidget {
  const MessageLine({
    required this.message,
    required this.isMe,
    Key? key,
  }) : super(key: key);

  final Message message;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
        isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(message.sender,
              style: const TextStyle(fontSize: 12, color: Colors.black45)),
          Material(
            elevation: 5,
            borderRadius: isMe
                ? const BorderRadius.only(
              topLeft: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )
                : const BorderRadius.only(
              topRight: Radius.circular(30),
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            color: isMe ? deepForestGreen : Colors.white,
            child: Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                message.text,
                style: TextStyle(
                  fontSize: 15,
                  color: isMe ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
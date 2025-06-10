import 'package:flutter/material.dart';
import '../models/notification_model.dart';
import 'package:intl/intl.dart';

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;
  final VoidCallback onDelete;

  const NotificationCard({
    super.key,
    required this.notification,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final formattedTime = DateFormat('hh:mm a').format(notification.receivedAt);

    return Card(
      color: const Color(0xFF163D35),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      child: ListTile(
        title: Text(notification.title,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        subtitle:
        Text(notification.description, style: const TextStyle(color: Colors.white70)),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: onDelete,
            ),
            Text(formattedTime,
                style: const TextStyle(color: Colors.white70, fontSize: 12)),
          ],
        ),
      ),
    );
  }
}

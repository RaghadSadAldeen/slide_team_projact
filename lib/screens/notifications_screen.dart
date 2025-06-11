import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../constants/colors.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CollectionReference notificationsRef =
    FirebaseFirestore.instance.collection('notifications');

    return Scaffold(
      backgroundColor: sageGreen,
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('images/slide.png', height: 30),
            const SizedBox(width: 8),
            const Text(
              'Notification',
              style: TextStyle(
                color: deepForestGreen,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        iconTheme: const IconThemeData(color: deepForestGreen),
        elevation: 0,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: notificationsRef.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator(color: deepForestGreen));
          }

          final docs = snapshot.data!.docs;
          if (docs.isEmpty) {
            return const Center(
              child: Text(
                'No notifications',
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final doc = docs[index];
              final data = doc.data()! as Map<String, dynamic>;
              return Card(
                color: Colors.white.withOpacity(0.9),
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: ListTile(
                  title: Text(
                    data['title'] ?? 'No Title',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(data['body'] ?? 'No Content'),
                  trailing: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () async {
                      await notificationsRef.doc(doc.id).delete();
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

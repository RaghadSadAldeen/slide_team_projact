import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/notification_model.dart';

class NotificationsViewModel {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<List<NotificationModel>> notificationsStream(String userEmail) {
    return _db
        .collection('notifications')
        .where('userEmail', isEqualTo: userEmail)
        .orderBy('receivedAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
      final data = doc.data();
      return NotificationModel(
        id: doc.id,
        title: data['title'] ?? '',
        description: data['description'] ?? '',
        receivedAt: (data['receivedAt'] as Timestamp).toDate(),
      );
    }).toList());
  }

  Future<void> deleteNotification(String id) async {
    await _db.collection('notifications').doc(id).delete();
  }
}

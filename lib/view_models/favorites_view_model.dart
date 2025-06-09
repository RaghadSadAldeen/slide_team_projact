import 'package:cloud_firestore/cloud_firestore.dart';

class FavoritesViewModel {
  final _favoritesCollection = FirebaseFirestore.instance.collection('favorites');

  Future<void> addFavorite({
    required String name,
    required String userId,
    required String major,
  }) async {
    await _favoritesCollection.add({
      'name': name,
      'userId': userId,
      'major': major,
    });
  }

  Stream<List<Map<String, dynamic>>> getFavoritesForUser(String userId) {
    return _favoritesCollection
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) =>
        snapshot.docs.map((doc) => {'id': doc.id, ...doc.data()}).toList());
  }

  Future<void> removeFavorite(String docId) async {
    await _favoritesCollection.doc(docId).delete();
  }
}

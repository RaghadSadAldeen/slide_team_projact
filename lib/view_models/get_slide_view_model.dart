import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import '../models/get_slide_model.dart';

class GetSlideViewModel extends ChangeNotifier {
  List<GetSlideModel> _slides = [];
  List<GetSlideModel> get slides => _slides;

  final _firestore = FirebaseFirestore.instance;

  Future<void> fetchSlides() async {
    final snapshot = await _firestore.collection('slides').get();
    _slides = snapshot.docs.map((doc) => GetSlideModel.fromMap(doc.data())).toList();
    notifyListeners();
  }
}

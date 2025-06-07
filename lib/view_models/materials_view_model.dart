import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/material_model.dart';

class MaterialsViewModel extends ChangeNotifier {
  List<MaterialModel> _materials = [];

  List<MaterialModel> get materials => _materials;

  Future<void> fetchMaterials() async {
    final snapshot = await FirebaseFirestore.instance.collection('materials').get();
    _materials = snapshot.docs.map((doc) => MaterialModel.fromMap(doc.data())).toList();
    notifyListeners();
  }
}

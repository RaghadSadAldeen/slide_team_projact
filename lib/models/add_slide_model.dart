import 'package:cloud_firestore/cloud_firestore.dart';

class SlideModel {
  final String name;
  final String email;
  final String slideTitle;
  final String description;
 // final String imageUrl;
  final DateTime? createdAt;

  SlideModel({
    required this.name,
    required this.email,
    required this.slideTitle,
    required this.description,
  //  required this.imageUrl,
    this.createdAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'slideTitle': slideTitle,
      'description': description,
     // 'imageUrl': imageUrl,
      'createdAt': createdAt ?? FieldValue.serverTimestamp(),
    };
  }

  factory SlideModel.fromJson(Map<String, dynamic> json) {
    return SlideModel(
      name: json['name'],
      email: json['email'],
      slideTitle: json['slideTitle'],
      description: json['description'],
      //imageUrl: json['imageUrl'],
      createdAt: (json['createdAt'] as Timestamp?)?.toDate(),
    );
  }
}

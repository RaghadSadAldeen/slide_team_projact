import 'dart:io';

class GetSlideModel {
  final String name;
  final String email;
  final String title;
  final String description;
  final String? imageUrl;

  GetSlideModel({
    required this.name,
    required this.email,
    required this.title,
    required this.description,
    this.imageUrl, File? imageFile,
  });

  factory GetSlideModel.fromMap(Map<String, dynamic> data) {
    return GetSlideModel(
      name: data['name'],
      email: data['email'],
      title: data['slideTitle'],
      description: data['description'],
      imageUrl: data['imageUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
    };
  }
}

class MaterialModel {
  final String title;
  final String url;

  MaterialModel({required this.title, required this.url});

  factory MaterialModel.fromMap(Map<String, dynamic> data) {
    return MaterialModel(
      title: data['title'] ?? '',
      url: data['url'] ?? '',
    );
  }
}

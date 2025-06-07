class FavoriteStudyMaterial {
  final String id;
  final String name;
  final String userId;
  final String major;

  FavoriteStudyMaterial({
    required this.id,
    required this.name,
    required this.userId,
    required this.major,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'userId': userId,
      'major': major,
    };
  }

  factory FavoriteStudyMaterial.fromMap(String id, Map<String, dynamic> map) {
    return FavoriteStudyMaterial(
      id: id,
      name: map['name'] ?? '',
      userId: map['userId'] ?? '',
      major: map['major'] ?? '',
    );
  }
}

class UserProfile {
  final String userId;
  final String name;
  final String email;
  final String phone;
  final String address;
  final String major;
  final String imagePath;

  UserProfile({
    required this.userId,
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.major,
    required this.imagePath,
  });

  factory UserProfile.empty() {
    return UserProfile(
      userId: '',
      name: '',
      email: '',
      phone: '',
      address: '',
      major: '',
      imagePath: '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'major': major,
      'imagePath': imagePath,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      userId: map['userId'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      address: map['address'] ?? '',
      major: map['major'] ?? '',
      imagePath: map['imagePath'] ?? '',
    );
  }
}

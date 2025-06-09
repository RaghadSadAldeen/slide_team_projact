class UserProfile {
  final String name;
  final String email;
  final String phone;
  final String address;
  final String major;
  final String imagePath;

  UserProfile({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.major,
    required this.imagePath,
  });

  factory UserProfile.empty() {
    return UserProfile(
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
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      address: map['address'] ?? '',
      major: map['major'] ?? '',
      imagePath: map['imagePath'] ?? '',
    );
  }
}

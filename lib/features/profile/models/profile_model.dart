class ProfileModel {
  final String userId;
  final String name;
  final String email;
  final String phone;
  final String role;
  final String department;
  final String joinDate;
  final String photoUrl;

  ProfileModel({
    required this.userId,
    required this.name,
    required this.email,
    required this.phone,
    required this.role,
    required this.department,
    required this.joinDate,
    required this.photoUrl,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      userId: json['userId'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      role: json['role'] as String,
      department: json['department'] as String,
      joinDate: json['joinDate'] as String,
      photoUrl: json['photoUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'phone': phone,
      'role': role,
      'department': department,
      'joinDate': joinDate,
      'photoUrl': photoUrl,
    };
  }
}

class MahasiswaModel {
  final String id;
  final String name;
  final String nim;
  final String email;
  final String phone;
  final String address;
  final String semester;
  final String initials;
  final int colorIndex;

  MahasiswaModel({
    required this.id,
    required this.name,
    required this.nim,
    required this.email,
    required this.phone,
    required this.address,
    required this.semester,
    required this.initials,
    required this.colorIndex,
  });

  factory MahasiswaModel.fromJson(Map<String, dynamic> json) {
    return MahasiswaModel(
      id: json['id'] as String,
      name: json['name'] as String,
      nim: json['nim'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      semester: json['semester'] as String,
      initials: json['initials'] as String,
      colorIndex: json['colorIndex'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'nim': nim,
      'email': email,
      'phone': phone,
      'address': address,
      'semester': semester,
      'initials': initials,
      'colorIndex': colorIndex,
    };
  }
}

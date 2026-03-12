class MahasiswaAktifModel {
  final String id;
  final String name;
  final String nim;
  final String email;
  final String status;
  final String semester;
  final double gpa;
  final int initials;
  final int colorIndex;

  MahasiswaAktifModel({
    required this.id,
    required this.name,
    required this.nim,
    required this.email,
    required this.status,
    required this.semester,
    required this.gpa,
    required this.initials,
    required this.colorIndex,
  });

  factory MahasiswaAktifModel.fromJson(Map<String, dynamic> json) {
    return MahasiswaAktifModel(
      id: json['id'] as String,
      name: json['name'] as String,
      nim: json['nim'] as String,
      email: json['email'] as String,
      status: json['status'] as String,
      semester: json['semester'] as String,
      gpa: json['gpa'] as double,
      initials: json['initials'] as int,
      colorIndex: json['colorIndex'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'nim': nim,
      'email': email,
      'status': status,
      'semester': semester,
      'gpa': gpa,
      'initials': initials,
      'colorIndex': colorIndex,
    };
  }
}

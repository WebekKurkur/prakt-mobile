class DosenModel {
  final String id;
  final String name;
  final String nip;
  final String email;
  final String department;
  final String initials;
  final int colorIndex;

  DosenModel({
    required this.id,
    required this.name,
    required this.nip,
    required this.email,
    required this.department,
    required this.initials,
    required this.colorIndex,
  });

  factory DosenModel.fromJson(Map<String, dynamic> json) {
    return DosenModel(
      id: json['id'] as String,
      name: json['name'] as String,
      nip: json['nip'] as String,
      email: json['email'] as String,
      department: json['department'] as String,
      initials: json['initials'] as String,
      colorIndex: json['colorIndex'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'nip': nip,
      'email': email,
      'department': department,
      'initials': initials,
      'colorIndex': colorIndex,
    };
  }
}

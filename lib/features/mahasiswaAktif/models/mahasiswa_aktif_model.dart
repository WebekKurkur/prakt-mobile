class MahasiswaAktifModel {
  final int userId;      // ID dari user yang membuat post
  final int id;          // ID dari post
  final String title;    // Judul post
  final String body;     // Isi post
 
  MahasiswaAktifModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });
 
  // Factory untuk membuat object dari JSON API response
  factory MahasiswaAktifModel.fromJson(Map<String, dynamic> json) {
    return MahasiswaAktifModel(
      userId: json['userId'] ?? 0,
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      body: json['body'] ?? '',
    );
  }
 
  // Convert object ke JSON
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
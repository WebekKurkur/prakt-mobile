class MahasiswaModel {
  final int postId;      // ID dari post yang di-comment
  final int id;          // ID dari comment
  final String name;     // Nama dari comment (author)
  final String email;    // Email dari comment author
  final String body;     // Isi comment
 
  MahasiswaModel({
    required this.postId,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });
 
  // Factory untuk membuat object dari JSON API response
  factory MahasiswaModel.fromJson(Map<String, dynamic> json) {
    return MahasiswaModel(
      postId: json['postId'] ?? 0,
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      body: json['body'] ?? '',
    );
  }
 
  // Convert object ke JSON (untuk kebutuhan lain)
  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'id': id,
      'name': name,
      'email': email,
      'body': body,
    };
  }
}
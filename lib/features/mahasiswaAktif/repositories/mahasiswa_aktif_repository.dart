import '../models/mahasiswa_aktif_model.dart';

class MahasiswaAktifRepository {
  final List<MahasiswaAktifModel> _mahasiswaAktifList = [
    MahasiswaAktifModel(
      id: '1',
      name: 'Bagus Santoso',
      nim: '2022001',
      email: 'bagus.santoso@student.example.com',
      status: 'Aktif',
      semester: '5',
      gpa: 3.85,
      initials: 66, // ASCII code for 'B'
      colorIndex: 0,
    ),
    MahasiswaAktifModel(
      id: '2',
      name: 'Siti Nurhaliza',
      nim: '2022002',
      email: 'siti.nurhaliza@student.example.com',
      status: 'Aktif',
      semester: '5',
      gpa: 3.92,
      initials: 83, // ASCII code for 'S'
      colorIndex: 1,
    ),
    MahasiswaAktifModel(
      id: '3',
      name: 'Rido Pratama',
      nim: '2022003',
      email: 'rido.pratama@student.example.com',
      status: 'Aktif',
      semester: '3',
      gpa: 3.45,
      initials: 82, // ASCII code for 'R'
      colorIndex: 2,
    ),
  ];

  Future<List<MahasiswaAktifModel>> getAllMahasiswaAktif() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mahasiswaAktifList;
  }

  Future<MahasiswaAktifModel?> getMahasiswaAktifById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      return _mahasiswaAktifList.firstWhere((mahasiswa) => mahasiswa.id == id);
    } catch (e) {
      return null;
    }
  }
}

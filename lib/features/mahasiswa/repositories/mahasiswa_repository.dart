import '../models/mahasiswa_model.dart';

class MahasiswaRepository {
  final List<MahasiswaModel> _mahasiswaList = [
    MahasiswaModel(
      id: '1',
      name: 'Bagus Santoso',
      nim: '2024001',
      email: 'bagus.santoso@student.example.com',
      phone: '+62812345678',
      address: 'Jl. Merdeka No. 10, Jakarta',
      semester: '1',
      initials: 'B',
      colorIndex: 0,
    ),
    MahasiswaModel(
      id: '2',
      name: 'Siti Nurhaliza',
      nim: '2024002',
      email: 'siti.nurhaliza@student.example.com',
      phone: '+62812345679',
      address: 'Jl. Ahmad Yani No. 20, Bandung',
      semester: '1',
      initials: 'S',
      colorIndex: 1,
    ),
    MahasiswaModel(
      id: '3',
      name: 'Rido Pratama',
      nim: '2024003',
      email: 'rido.pratama@student.example.com',
      phone: '+62812345680',
      address: 'Jl. Sultan Iskandar No. 30, Medan',
      semester: '1',
      initials: 'R',
      colorIndex: 2,
    ),
    MahasiswaModel(
      id: '4',
      name: 'Eka Putri',
      nim: '2024004',
      email: 'eka.putri@student.example.com',
      phone: '+62812345681',
      address: 'Jl. Gajah Mada No. 40, Semarang',
      semester: '1',
      initials: 'E',
      colorIndex: 3,
    ),
  ];

  Future<List<MahasiswaModel>> getAllMahasiswa() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return _mahasiswaList;
  }

  Future<MahasiswaModel?> getMahasiswaById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      return _mahasiswaList.firstWhere((mahasiswa) => mahasiswa.id == id);
    } catch (e) {
      return null;
    }
  }
}

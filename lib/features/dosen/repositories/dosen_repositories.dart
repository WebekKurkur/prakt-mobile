import '../models/dosen_model.dart';

class DosenRepository {
  
  final List<DosenModel> _dosenList = [
    DosenModel(
      id: '1',
      name: 'Anang Prasetyo',
      nip: '123456789',
      email: 'anang.prasetyo@example.com',
      department: 'Teknik Informatika',
      initials: 'A',
      colorIndex: 0, // Purple
    ),
    DosenModel(
      id: '2',
      name: 'Rachman Sinatriya',
      nip: '987654321',
      email: 'rachman.sinatriya@example.com',
      department: 'Teknik Informatika',
      initials: 'R',
      colorIndex: 1, // Pink
    ),
    DosenModel(
      id: '3',
      name: 'Alfian Sukma',
      nip: '456789123',
      email: 'alfian.sukma@example.com',
      department: 'Teknik Informatika',
      initials: 'A',
      colorIndex: 2, // Cyan
    ),
  ];

  Future<List<DosenModel>> getAllDosen() async {
    // Simulasi API call
    await Future.delayed(const Duration(milliseconds: 500));
    return _dosenList;
  }

  Future<DosenModel?> getDosenById(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    try {
      return _dosenList.firstWhere((dosen) => dosen.id == id);
    } catch (e) {
      return null;
    }
  }
}

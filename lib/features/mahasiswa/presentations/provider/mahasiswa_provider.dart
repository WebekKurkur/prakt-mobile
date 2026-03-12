import 'package:flutter/material.dart';
import '../../models/mahasiswa_model.dart';
import '../../repositories/mahasiswa_repository.dart';

class MahasiswaProvider extends ChangeNotifier {
  final MahasiswaRepository _repository;
  
  List<MahasiswaModel> _mahasiswaList = [];
  bool _isLoading = false;
  String? _error;

  MahasiswaProvider(this._repository);

  List<MahasiswaModel> get mahasiswaList => _mahasiswaList;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchAllMahasiswa() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _mahasiswaList = await _repository.getAllMahasiswa();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<MahasiswaModel?> getMahasiswaById(String id) async {
    try {
      return await _repository.getMahasiswaById(id);
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return null;
    }
  }
}

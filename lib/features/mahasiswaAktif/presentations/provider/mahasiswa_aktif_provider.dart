import 'package:flutter/material.dart';
import '../../models/mahasiswa_aktif_model.dart';
import '../../repositories/mahasiswa_aktif_repository.dart';

class MahasiswaAktifProvider extends ChangeNotifier {
  final MahasiswaAktifRepository _repository;
  
  List<MahasiswaAktifModel> _mahasiswaAktifList = [];
  bool _isLoading = false;
  String? _error;

  MahasiswaAktifProvider(this._repository);

  List<MahasiswaAktifModel> get mahasiswaAktifList => _mahasiswaAktifList;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchAllMahasiswaAktif() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _mahasiswaAktifList = await _repository.getAllMahasiswaAktif();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<MahasiswaAktifModel?> getMahasiswaAktifById(String id) async {
    try {
      return await _repository.getMahasiswaAktifById(id);
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return null;
    }
  }
}

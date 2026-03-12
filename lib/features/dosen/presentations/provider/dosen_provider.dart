import 'package:flutter/material.dart';
import '../../models/dosen_model.dart';
import '../../repositories/dosen_repositories.dart';

class DosenProvider extends ChangeNotifier {
  final DosenRepository _repository;
  
  List<DosenModel> _dosenList = [];
  bool _isLoading = false;
  String? _error;

  DosenProvider(this._repository);

  List<DosenModel> get dosenList => _dosenList;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchAllDosen() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _dosenList = await _repository.getAllDosen();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<DosenModel?> getDosenById(String id) async {
    try {
      return await _repository.getDosenById(id);
    } catch (e) {
      _error = e.toString();
      notifyListeners();
      return null;
    }
  }
}

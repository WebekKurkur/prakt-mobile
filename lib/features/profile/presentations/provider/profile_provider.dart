import 'package:flutter/material.dart';
import '../../models/profile_model.dart';
import '../../repositories/profile_repository.dart';

class ProfileProvider extends ChangeNotifier {
  final ProfileRepository _repository;
  
  ProfileModel? _profile;
  bool _isLoading = false;
  String? _error;

  ProfileProvider(this._repository);

  ProfileModel? get profile => _profile;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchProfile() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _profile = await _repository.getProfile();
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateProfile(ProfileModel profile) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      await _repository.updateProfile(profile);
      _profile = profile;
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}

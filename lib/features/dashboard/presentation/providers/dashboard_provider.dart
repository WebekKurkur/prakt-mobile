import 'package:flutter/material.dart';
import '../../data/models/dashboard_model.dart';
import '../../data/repositories/dashboard_repository.dart';

class DashboardProvider extends ChangeNotifier {
  final DashboardRepository _repository;

  DashboardData? _dashboardData;
  bool _isLoading = false;
  String? _error;

  DashboardProvider(this._repository);

  DashboardData? get dashboardData => _dashboardData;
  bool get isLoading => _isLoading;
  String? get error => _error;

  /// Load dashboard data
  Future<void> loadDashboard() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final data = await _repository.getDashboardData();
      _dashboardData = data;
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  /// Refresh dashboard
  Future<void> refresh() async {
    _isLoading = true;
    notifyListeners();

    try {
      final data = await _repository.refreshDashboard();
      _dashboardData = data;
    } catch (e) {
      _error = e.toString();
    }

    _isLoading = false;
    notifyListeners();
  }

  /// Update username
  void updateUserName(String newName) {
    if (_dashboardData != null) {
      _dashboardData =
          _dashboardData!.copyWith(userName: newName);
      notifyListeners();
    }
  }
}

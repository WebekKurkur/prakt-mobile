import '../models/profile_model.dart';

class ProfileRepository {
  late ProfileModel _profile;

  ProfileRepository() {
    _profile = ProfileModel(
      userId: 'USR001',
      name: 'Admin D4TI',
      email: 'admin@d4ti.example.com',
      phone: '+62812345678',
      role: 'Administrator',
      department: 'Teknik Informatika',
      joinDate: '2020-01-15',
      photoUrl: 'https://via.placeholder.com/150',
    );
  }

  Future<ProfileModel> getProfile() async {
    await Future.delayed(const Duration(milliseconds: 300));
    return _profile;
  }

  Future<void> updateProfile(ProfileModel profile) async {
    await Future.delayed(const Duration(milliseconds: 500));
    _profile = profile;
  }
}

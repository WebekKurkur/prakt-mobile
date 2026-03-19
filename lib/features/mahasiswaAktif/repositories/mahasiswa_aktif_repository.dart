import 'package:dio/dio.dart';
import '../models/mahasiswa_aktif_model.dart';
 
class MahasiswaAktifRepository {
  final Dio _dio = Dio();
 
  Future<List<MahasiswaAktifModel>> getAllMahasiswaAktif() async {
    try {
      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/posts',
        options: Options(
          headers: {'Accept': 'application/json'},
        ),
      );
 
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        print('Data mahasiswa aktif berhasil diload: ${data.length} items');
        return data.map((json) => MahasiswaAktifModel.fromJson(json)).toList();
      } else {
        throw Exception('Gagal memuat data mahasiswa aktif: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
      rethrow;
    }
  }
 
  Future<MahasiswaAktifModel?> getMahasiswaAktifById(int id) async {
    try {
      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/posts/$id',
        options: Options(
          headers: {'Accept': 'application/json'},
        ),
      );
 
      if (response.statusCode == 200) {
        return MahasiswaAktifModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
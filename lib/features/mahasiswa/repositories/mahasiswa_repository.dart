import 'package:dio/dio.dart';
import '../models/mahasiswa_model.dart';
 
class MahasiswaRepository {
  final Dio _dio = Dio();
 
  Future<List<MahasiswaModel>> getAllMahasiswa() async {
    try {
      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/comments',
        options: Options(
          headers: {'Accept': 'application/json'},
        ),
      );
 
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        print('Data mahasiswa berhasil diload: ${data.length} items');
        return data.map((json) => MahasiswaModel.fromJson(json)).toList();
      } else {
        throw Exception('Gagal memuat data mahasiswa: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
      rethrow;
    }
  }
 
  Future<MahasiswaModel?> getMahasiswaById(int id) async {
    try {
      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/comments/$id',
        options: Options(
          headers: {'Accept': 'application/json'},
        ),
      );
 
      if (response.statusCode == 200) {
        return MahasiswaModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
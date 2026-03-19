import 'package:dio/dio.dart';
import '../models/dosen_model.dart';
 
class DosenRepository {
  final Dio _dio = Dio();
  
  Future<List<DosenModel>> getAllDosen() async {
    try {
      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/users',
        options: Options(headers: {'Accept': 'application/json'}),
      );
 
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        print('Data dosen: ${data.length} items');
        return data.map((json) => DosenModel.fromJson(json)).toList();
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Exception: $e');
      rethrow;
    }
  }
 
  Future<DosenModel?> getDosenById(int id) async {
    try {
      final response = await _dio.get(
        'https://jsonplaceholder.typicode.com/users/$id',
        options: Options(headers: {'Accept': 'application/json'}),
      );
      if (response.statusCode == 200) {
        return DosenModel.fromJson(response.data);
      }
      return null;
    } catch (e) {
      print('Error: $e');
      return null;
    }
  }
}
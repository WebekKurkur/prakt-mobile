import 'dart:io';

void main() {
  // poin a, membuat map dengan data awal
  Map<String, String> data = {
    'Anang': '08123456890',
    'Arman': '08234567890',
    'Doni': '08345678012',
  };
  print('poin a, data awal = $data');
  print('');

  // poin b, tambah data ke map
  data['Rio'] = '08456789012';
  print('poin b, data telah ditambahkan = $data');
  print('');

  // poin c, tampilkan data berdasarkan key
  print('poin c, nomor Anang = ${data['Anang']}');
  print('');

  // poin d, ubah data berdasarkan key
  data['Arman'] = '08234567891';
  print('poin d, data telah diubah = $data');
  print('');

  // poin e, hapus data berdasarkan key
  data.remove('Doni');
  print('poin e, data telah dihapus = $data');
  print('');

  // poin f, cek data tertentu apakah ada
  print('poin f, cek key Anang ada = ${data.containsKey('Anang')}');
  print('poin f, cek value 08456789012 ada = ${data.containsValue('08456789012')}');
  print('');

  // poin g, hitung jumlah data
  print('poin g, jumlah data pada data = ${data.length}');
  print('');

  // poin h, tampilkan semua key
  print('poin h, semua key = ${data.keys.toList()}');
  print('');

  // poin i, tampilkan semua value
  print('poin i, semua value = ${data.values.toList()}');
  print('');

  // poin j, menampilkan semua data dengan looping
  print('poin j, menampilkan semua elemen =');
  data.forEach((key, value) {
    print('$key: $value');
  });
  print('');

  // poin k, membuat map dengan model input data - single data
  print('=== INPUT DATA MAHASISWA ===');
  Map<String, dynamic> mahasiswa = {};

  stdout.write('masukkan NIM: ');
  String nim = stdin.readLineSync()!;
  
  stdout.write('masukkan Nama: ');
  String nama = stdin.readLineSync()!;
  
  stdout.write('masukkan Jurusan: ');
  String jurusan = stdin.readLineSync()!;
  
  stdout.write('masukkan IPK: ');
  String ipk = stdin.readLineSync()!;

  mahasiswa['nim'] = nim;
  mahasiswa['nama'] = nama;
  mahasiswa['jurusan'] = jurusan;
  mahasiswa['ipk'] = double.parse(ipk);

  print('poin k, data mahasiswa = $mahasiswa');
  print('');

  // poin l, input data dengan multiple
  print('=== INPUT MULTIPLE MAHASISWA ===');
  Map<String, Map<String, dynamic>> mahasiswas = {};

  int count = 0;
  while (count <= 0) {
    stdout.write('masukkan jumlah mahasiswa = ');
    String? input = stdin.readLineSync();
    try {
      count = int.parse(input!);
      if (count <= 0) {
        print('masukkan angka lebih dari 0 cuy!');
      }
    } catch (e) {
      print('input tidak valid, masukkan angka yang benar!');
    }
  }

  for (int i = 0; i < count; i++) {
    print('--- Mahasiswa ke-${i + 1} ---');
    
    stdout.write('masukkan NIM: ');
    String nimInput = stdin.readLineSync()!;
    
    stdout.write('masukkan Nama: ');
    String namaInput = stdin.readLineSync()!;
    
    stdout.write('masukkan Jurusan: ');
    String jurusanInput = stdin.readLineSync()!;
    
    stdout.write('masukkan IPK: ');
    String ipkInput = stdin.readLineSync()!;

    mahasiswas[nimInput] = {
      'nim': nimInput,
      'nama': namaInput,
      'jurusan': jurusanInput,
      'ipk': double.parse(ipkInput),
    };
  }

  print('');

  // poin m, tampilkan semua value
  print('poin m, semua data mahasiswa (value) =');
  mahasiswas.forEach((nim, data) {
    print('$nim: $data');
  });
}

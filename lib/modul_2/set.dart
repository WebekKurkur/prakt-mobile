import 'dart:io';

void main() {
  // poin a, membuat set
  Set<String> burung = {'Merpati', 'Elang', 'Kakatua'};
  print('poin a, burung = $burung');

  // poin b, tambah data set
  burung.add('Beo');
  print('poin b, burung telah ditambahkan = $burung');

  // poin c, tambah data duplicate
  burung.add('Elang');
  print('poin c, burung ditambah duplicate = $burung');

  // poin d, hapus data
  burung.remove('Kakatua');
  print('poin d, burung telah dihapus = $burung');

  // poin e, cek data tertentu apakah ada
  print('poin e, cek Elang ada di burung = ${burung.contains('Elang')}');
  print('poin e, cek Kakatua ada di burung = ${burung.contains('Kakatua')}');

  // poin f, hitung jumlah data
  print('poin f, jumlah data pada burung = ${burung.length}');

  // poin g, menampilkan semua data dengan looping
  print('poin g, menampilkan semua elemen =');
  for (String nama in burung) {
    print(nama);
  }

  // poin h, membuat set dengan model input data
  Set<String> dataSet = {};
  print('poin h, data set kosong = $dataSet');

  int count = 0;
  while (count <= 0) {
    stdout.write('masukkan jumlah set = ');
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
    stdout.write('data ke-${i + 1}: ');
    String x = stdin.readLineSync()!;
    dataSet.add(x);
  }

  print('=== SEMUA DATA ===');
  int index = 1;
  for (String data in dataSet) {
    print('$index. $data');
    index++;
  }

  print('Total data: ${dataSet.length}');

  // poin i, tambah data baru
  stdout.write('masukkan data baru: ');
  String dataBaru = stdin.readLineSync()!;
  dataSet.add(dataBaru);
  print('poin i, data "$dataBaru" berhasil ditambahkan!');

  // poin j, tambah data duplicate
  stdout.write('masukkan data baru (coba duplicate): ');
  String dataDuplicate = stdin.readLineSync()!;
  dataSet.add(dataDuplicate);
  print('poin j, data "$dataDuplicate" ditambahkan!');

  // poin k, hapus data
  stdout.write('masukkan data yang ingin dihapus: ');
  String dataHapus = stdin.readLineSync()!;
  if (dataSet.contains(dataHapus)) {
    dataSet.remove(dataHapus);
    print('poin k, data "$dataHapus" berhasil dihapus!');
  } else {
    print('poin k, data "$dataHapus" tidak ada di Set!');
  }

  // poin l, cek data tertentu
  stdout.write('masukkan data yang ingin dicek: ');
  String dataCek = stdin.readLineSync()!;
  print('poin l, cek data "$dataCek" ada di Set = ${dataSet.contains(dataCek)}');

  // poin m, tampilkan hasil akhir
  print('=== SEMUA DATA ===');
  index = 1;
  for (String data in dataSet) {
    print('$index. $data');
    index++;
  }
  print('Total data: ${dataSet.length}');
}

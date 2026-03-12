import 'dart:io';

void main() {
  // poin d, membuat list nama
  List<String> names = ['adil', 'budi', 'chelsea'];
  print('poin d, names = $names');

  // poin e, tambah data list nama
  names.add('dini');
  print('poin e, names telah ditambahkan = $names');

  //poin f, print index tertentu
  print('poin f, element pertama = ${names[0]}');
  print('poin f, element kedua = ${names[2]}');

  //poin g, mengubah data index tertentu
  names[1] = 'baja';
  print('poin g, names telah diubah = $names');

  //poin h, hapus data
  names.remove('chelsea');
  print('poin h, names telah dihapus = $names');

  // poin i, menghitung jumlah data
  print('poin i, jumlah data yang ada pada names = ${names.length}');

  // poin j, menampilkan semua data dengan looping
  print('poin j, menampilkan semua elemen =');
  for (String name in names) {
    print(name);
  }

  // poin l, membuat list dengan model input data
  List<String> dataList = [];
  print('poin l, data list kosong = $dataList');

  int count = 0;
  while (count <= 0) {
    stdout.write('masukkan jumlah list = ');
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
    dataList.add(x);
  }

  print('data list: ');
  print(dataList);

  // poin m, buatkan dengan inputan untuk tampil/ubah/hapus berdasarkan index
  List<String> dataListM = [];
  print('poin m, data list kosong = $dataListM');

  int countM = 0;
  while (countM <= 0) {
    stdout.write('masukkan jumlah list = ');
    String? input = stdin.readLineSync();
    try {
      countM = int.parse(input!);
      if (countM <= 0) {
        print('masukkan angka lebih dari 0 cuy!');
      }
    } catch (e) {
      print('input tidak valid, masukkan angka yang benar!');
    }
  }

  for (int i = 0; i < countM; i++) {
    stdout.write('data ke-${i + 1}: ');
    String x = stdin.readLineSync()!;
    dataListM.add(x);
  }

  print('data list: ');
  print(dataListM);

  //poin m, tampil berdasarkan index
  stdout.write('masukkan index yang ingin ditampilkan: ');
  int indexTampil = int.parse(stdin.readLineSync()!);
  if (indexTampil >= 0 && indexTampil < dataListM.length) {
    print('poin m, element pada index $indexTampil = ${dataListM[indexTampil]}');
  } else {
    print('poin m, index tidak valid! gunakan index 0-${dataListM.length - 1}');
  }

  //poin m, ubah data berdasarkan index
  stdout.write('masukkan index yang ingin diubah: ');
  int indexUbah = int.parse(stdin.readLineSync()!);
  if (indexUbah >= 0 && indexUbah < dataListM.length) {
    stdout.write('masukkan data baru: ');
    String dataBaru = stdin.readLineSync()!;
    dataListM[indexUbah] = dataBaru;
    print('poin m, data telah diubah = $dataListM');
  } else {
    print('poin m, index tidak valid! gunakan index 0-${dataListM.length - 1}');
  }

  //poin m, hapus data berdasarkan index
  stdout.write('masukkan index yang ingin dihapus: ');
  int indexHapus = int.parse(stdin.readLineSync()!);
  if (indexHapus >= 0 && indexHapus < dataListM.length) {
    dataListM.removeAt(indexHapus);
    print('poin m, data telah dihapus = $dataListM');
  } else {
    print('poin m, index tidak valid! gunakan index 0-${dataListM.length - 1}');
  }

  // poin m, tampilkan hasil akhir
  print('=== SEMUA DATA ===');
  for (int i = 0; i < dataListM.length; i++) {
    print('Index $i: ${dataListM[i]}');
  }
}
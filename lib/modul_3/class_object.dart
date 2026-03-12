import 'dart:io';

class Mahasiswa {
  String? nama;
  int? nim;
  String? jurusan;

  void tampilkanData() {
    print("Nama: ${nama ?? 'Belum diisi'}");
    print("NIM: ${nim ?? 'Belum diisi'}");
    print("Jurusan: ${jurusan ?? 'Belum diisi'}");
  }
}

mixin Presensi {
  void tampilkanPresensi() {
    print("Presensi: Sudah presensi");
  }
}

mixin Penilaian {
  void tampilkanPenilaian() {
    print("Penilaian: Nilai sudah diberikan");
  }
}

mixin Informasi {
  void tampilkanInformasi() {
    print("Informasi: Terakreditasi A");
  }
}

class Dosen extends Mahasiswa with Presensi, Penilaian, Informasi {
  void tampilkanSemuaData() {
    print('Data Dosen');
    tampilkanData();
    tampilkanPresensi();
    tampilkanPenilaian();
    tampilkanInformasi();
  }
}

class Fakultas extends Mahasiswa with Presensi, Penilaian, Informasi {
  void tampilkanSemuaData() {
    print('Data Fakultas');
    tampilkanData();
    tampilkanPresensi();
    tampilkanPenilaian();
    tampilkanInformasi();
  }
}

void main() {
  print('Pilih Role');
  print("1. Dosen");
  print("2. Fakultas");
  print("Pilihan (1/2): ");
  String? pilihan = stdin.readLineSync();

  if (pilihan == "1") {
    Dosen dosen = Dosen();
    print('Input Data Dosen');
    print("Masukkan nama: ");
    dosen.nama = stdin.readLineSync();
    print("Masukkan NIP: ");
    dosen.nim = int.tryParse(stdin.readLineSync() ?? '');
    print("Masukkan jurusan: ");
    dosen.jurusan = stdin.readLineSync();
    dosen.tampilkanSemuaData();
  } else if (pilihan == "2") {
    Fakultas fakultas = Fakultas();
    print('Input Data Fakultas');
    print("Masukkan nama: ");
    fakultas.nama = stdin.readLineSync();
    print("Masukkan NIM: ");
    fakultas.nim = int.tryParse(stdin.readLineSync() ?? '');
    print("Masukkan jurusan: ");
    fakultas.jurusan = stdin.readLineSync();
    fakultas.tampilkanSemuaData();
  } else {
    print("Pilihan tidak valid!");
  }
}



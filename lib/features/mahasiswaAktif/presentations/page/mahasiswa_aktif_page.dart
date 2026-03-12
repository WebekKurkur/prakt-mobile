import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/mahasiswa_aktif_provider.dart';
import '../widget/mahasiswa_aktif_card_widget.dart';

class MahasiswaAktifPage extends StatefulWidget {
  const MahasiswaAktifPage({Key? key}) : super(key: key);

  @override
  State<MahasiswaAktifPage> createState() => _MahasiswaAktifPageState();
}

class _MahasiswaAktifPageState extends State<MahasiswaAktifPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MahasiswaAktifProvider>().fetchAllMahasiswaAktif();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Mahasiswa Aktif',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color(0xFF1976D2),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<MahasiswaAktifProvider>().fetchAllMahasiswaAktif();
            },
          ),
        ],
      ),
      body: Consumer<MahasiswaAktifProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (provider.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 48,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Error: ${provider.error}',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      context.read<MahasiswaAktifProvider>().fetchAllMahasiswaAktif();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (provider.mahasiswaAktifList.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.people_outline,
                    color: Colors.grey,
                    size: 48,
                  ),
                  SizedBox(height: 16),
                  Text('Tidak ada data mahasiswa aktif'),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: provider.mahasiswaAktifList.length,
            itemBuilder: (context, index) {
              final mahasiswa = provider.mahasiswaAktifList[index];
              return MahasiswaAktifCardWidget(
                mahasiswa: mahasiswa,
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${mahasiswa.name} dipilih'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

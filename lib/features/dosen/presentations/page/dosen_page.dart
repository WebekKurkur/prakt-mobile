import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/dosen_provider.dart';
import '../widget/dosen_card_widget.dart';

class DosenPage extends StatefulWidget {
  const DosenPage({Key? key}) : super(key: key);

  @override
  State<DosenPage> createState() => _DosenPageState();
}

class _DosenPageState extends State<DosenPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DosenProvider>().fetchAllDosen();
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
          'Data Dosen',
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
              context.read<DosenProvider>().fetchAllDosen();
            },
          ),
        ],
      ),
      body: Consumer<DosenProvider>(
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
                      context.read<DosenProvider>().fetchAllDosen();
                    },
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (provider.dosenList.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.people_outline,
                    color: Colors.grey,
                    size: 48,
                  ),
                  const SizedBox(height: 16),
                  const Text('Tidak ada data dosen'),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: provider.dosenList.length,
            itemBuilder: (context, index) {
              final dosen = provider.dosenList[index];
              return DosenCardWidget(
                dosen: dosen,
                onTap: () {
                  // TODO: Navigate to detail page
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${dosen.name} dipilih'),
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

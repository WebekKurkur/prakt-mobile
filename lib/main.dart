import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider/provider.dart' as provider;
import 'core/theme/app_theme.dart';
import 'features/dashboard/data/repositories/dashboard_repository.dart';
import 'features/dashboard/presentation/providers/dashboard_provider.dart';
import 'features/dashboard/presentation/pages/dashboard_page.dart';

import 'features/mahasiswaAktif/repositories/mahasiswa_aktif_repository.dart';
import 'features/mahasiswaAktif/presentations/provider/mahasiswa_aktif_provider.dart';
import 'features/profile/repositories/profile_repository.dart';
import 'features/profile/presentations/provider/profile_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: provider.MultiProvider(
        providers: [
          provider.Provider<DashboardRepository>(create: (_) => DashboardRepository()),
          provider.ChangeNotifierProxyProvider<DashboardRepository, DashboardProvider>(
            create: (context) => DashboardProvider(
              context.read<DashboardRepository>(),
            ),
            update: (context, repository, previous) =>
                DashboardProvider(repository),
          ),
          provider.Provider<MahasiswaAktifRepository>(create: (_) => MahasiswaAktifRepository()),
          provider.ChangeNotifierProxyProvider<MahasiswaAktifRepository, MahasiswaAktifProvider>(
            create: (context) => MahasiswaAktifProvider(
              context.read<MahasiswaAktifRepository>(),
            ),
            update: (context, repository, previous) =>
                MahasiswaAktifProvider(repository),
          ),
          provider.Provider<ProfileRepository>(create: (_) => ProfileRepository()),
          provider.ChangeNotifierProxyProvider<ProfileRepository, ProfileProvider>(
            create: (context) => ProfileProvider(
              context.read<ProfileRepository>(),
            ),
            update: (context, repository, previous) =>
                ProfileProvider(repository),
          ),
        ],
        child: MaterialApp(
          title: 'Dashboard App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.light,
          home: const DashboardPage(),
        ),
      ),
    );
  }
}

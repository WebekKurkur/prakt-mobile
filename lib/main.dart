import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'features/dashboard/data/repositories/dashboard_repository.dart';
import 'features/dashboard/presentation/providers/dashboard_provider.dart';
import 'features/dashboard/presentation/pages/dashboard_page.dart';
import 'features/dosen/repositories/dosen_repositories.dart';
import 'features/dosen/presentations/provider/dosen_provider.dart';
import 'features/mahasiswa/repositories/mahasiswa_repository.dart';
import 'features/mahasiswa/presentations/provider/mahasiswa_provider.dart';
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
    return MultiProvider(
      providers: [
        Provider<DashboardRepository>(create: (_) => DashboardRepository()),
        ChangeNotifierProxyProvider<DashboardRepository, DashboardProvider>(
          create: (context) => DashboardProvider(
            context.read<DashboardRepository>(),
          ),
          update: (context, repository, previous) =>
              DashboardProvider(repository),
        ),
        Provider<DosenRepository>(create: (_) => DosenRepository()),
        ChangeNotifierProxyProvider<DosenRepository, DosenProvider>(
          create: (context) => DosenProvider(
            context.read<DosenRepository>(),
          ),
          update: (context, repository, previous) =>
              DosenProvider(repository),
        ),
        Provider<MahasiswaRepository>(create: (_) => MahasiswaRepository()),
        ChangeNotifierProxyProvider<MahasiswaRepository, MahasiswaProvider>(
          create: (context) => MahasiswaProvider(
            context.read<MahasiswaRepository>(),
          ),
          update: (context, repository, previous) =>
              MahasiswaProvider(repository),
        ),
        Provider<MahasiswaAktifRepository>(create: (_) => MahasiswaAktifRepository()),
        ChangeNotifierProxyProvider<MahasiswaAktifRepository, MahasiswaAktifProvider>(
          create: (context) => MahasiswaAktifProvider(
            context.read<MahasiswaAktifRepository>(),
          ),
          update: (context, repository, previous) =>
              MahasiswaAktifProvider(repository),
        ),
        Provider<ProfileRepository>(create: (_) => ProfileRepository()),
        ChangeNotifierProxyProvider<ProfileRepository, ProfileProvider>(
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'features/dashboard/data/repositories/dashboard_repository.dart';
import 'features/dashboard/presentation/providers/dashboard_provider.dart';
import 'features/dashboard/presentation/pages/dashboard_page.dart';

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

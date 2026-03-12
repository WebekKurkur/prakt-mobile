import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../widgets/common_widgets.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_theme.dart';
import '../providers/dashboard_provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      Provider.of<DashboardProvider>(context, listen: false)
          .loadDashboard();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        elevation: 0,
      ),
      body: Consumer<DashboardProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading && provider.dashboardData == null) {
            return const LoadingWidget();
          }

          if (provider.error != null && provider.dashboardData == null) {
            return CustomErrorWidget(
              message: provider.error ?? 'Terjadi kesalahan',
              onRetry: () => provider.loadDashboard(),
            );
          }

          final data = provider.dashboardData;
          if (data == null) {
            return const EmptyWidget(message: 'Tidak ada data');
          }

          return Column(
            children: [
              // Header Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(AppConstants.paddingLarge),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Selamat Datang,',
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(
                              height: AppConstants.paddingSmall,
                            ),
                            Text(
                              data.userName,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            color: Colors.white24,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppConstants.paddingMedium),
                    const Text(
                      'Data Mahasiswa D4TI',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              // Stats Section
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(AppConstants.paddingMedium),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Statistik',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: AppConstants.paddingMedium),
                      GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: AppConstants.paddingMedium,
                        mainAxisSpacing: AppConstants.paddingMedium,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: data.stats
                            .map(
                              (stat) => StatCard(
                                title: stat.title,
                                value: stat.value,
                                subtitle: stat.subtitle,
                                percentage: stat.percentage,
                                isIncrease: stat.isIncrease,
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<DashboardProvider>(context, listen: false)
              .refresh();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Memperbarui data...'),
              duration: Duration(seconds: 1),
            ),
          );
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

// StatCard Widget - Display individual statistics
class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final double percentage;
  final bool isIncrease;

  const StatCard({
    Key? key,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.percentage,
    required this.isIncrease,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.paddingMedium),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                color: AppTheme.textSecondaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: AppConstants.paddingSmall),
            Text(
              value,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: AppConstants.paddingMedium),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppTheme.textSecondaryColor,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: AppConstants.paddingSmall),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: isIncrease
                        ? AppTheme.successColor.withOpacity(0.1)
                        : AppTheme.errorColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        isIncrease
                            ? Icons.trending_up
                            : Icons.trending_down,
                        size: 12,
                        color: isIncrease
                            ? AppTheme.successColor
                            : AppTheme.errorColor,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        '${percentage}%',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: isIncrease
                              ? AppTheme.successColor
                              : AppTheme.errorColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

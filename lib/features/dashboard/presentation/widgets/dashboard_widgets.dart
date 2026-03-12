import 'package:flutter/material.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_theme.dart';

// Header Widget untuk Dashboard
class DashboardHeader extends StatelessWidget {
  final String userName;
  final String subtitle;

  const DashboardHeader({
    Key? key,
    required this.userName,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  const SizedBox(height: AppConstants.paddingSmall),
                  Text(
                    userName,
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
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

// Stat Card Widget untuk menampilkan statistik
class StatisticCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final double percentage;
  final bool isIncrease;

  const StatisticCard({
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

// Section Title Widget
class SectionTitle extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeMore;

  const SectionTitle({
    Key? key,
    required this.title,
    this.onSeeMore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        if (onSeeMore != null)
          GestureDetector(
            onTap: onSeeMore,
            child: const Text(
              'Lihat Semua',
              style: TextStyle(
                fontSize: 12,
                color: AppTheme.primaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
      ],
    );
  }
}

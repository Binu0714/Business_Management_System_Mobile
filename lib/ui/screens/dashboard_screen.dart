import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../widgets/common/fade_slide_in.dart';
import '../widgets/dashboard/metric_card.dart';
import '../widgets/dashboard/alert_banner.dart';
import '../widgets/dashboard/activity_chart.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          FadeSlideIn(
            controller: _controller,
            start: 0.0,
            end: 0.5,
            slideOffset: 30.0,
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.45,
              children: const [
                MetricCard(
                  title: 'Expected Revenue',
                  value: 'LKR 889,640',
                  icon: Icons.trending_up_rounded,
                  iconColor: AppColors.info,
                  iconBgColor: AppColors.infoLight,
                ),
                MetricCard(
                  title: 'Current Revenue',
                  value: 'LKR 489,140',
                  icon: Icons.attach_money_rounded,
                  iconColor: AppColors.success,
                  iconBgColor: AppColors.successLight,
                ),
                MetricCard(
                  title: 'Outstanding Credit',
                  value: 'LKR 82,110',
                  icon: Icons.access_time_rounded,
                  iconColor: AppColors.error,
                  iconBgColor: AppColors.errorLight,
                ),
                MetricCard(
                  title: 'Total Expenses',
                  value: 'LKR 774,580',
                  icon: Icons.wallet_rounded,
                  iconColor: AppColors.slateDark,
                  iconBgColor: AppColors.slateLight,
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          FadeSlideIn(
            controller: _controller,
            start: 0.2,
            end: 0.7,
            slideOffset: 30.0,
            child: const AlertBanner(),
          ),

          const SizedBox(height: 20),

          FadeSlideIn(
            controller: _controller,
            start: 0.4,
            end: 0.9,
            slideOffset: 30.0,
            child: const ActivityChart(),
          ),
        ],
      ),
    );
  }
}
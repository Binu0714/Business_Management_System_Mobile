import 'package:flutter/material.dart';
import '../../core/theme.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTabSelected;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 16,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, Icons.home_rounded, Icons.home_outlined, 'Home'),
              _buildNavItem(1, Icons.account_balance_wallet_rounded, Icons.account_balance_wallet_outlined, 'Purchases'),
              _buildNavItem(2, Icons.pie_chart_rounded, Icons.pie_chart_outline_rounded, 'Inventory'),
              _buildNavItem(3, Icons.point_of_sale_rounded, Icons.point_of_sale_outlined, 'Sales'),
            ],
          ),
        ),
      ),
    );
  }

  // Custom Nav Item Builder
  Widget _buildNavItem(int index, IconData activeIcon, IconData inactiveIcon, String label) {
    final bool isActive = currentIndex == index;

    return GestureDetector(
      onTap: () => onTabSelected(index), // Triggers the callback in parent widget
      child: Container(
        color: Colors.transparent,
        width: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top Active Indicator Line
            Container(
              height: 3,
              width: 36,
              decoration: BoxDecoration(
                color: isActive ? AppColors.primary : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 10),

            // Tab Icon
            Icon(
              isActive ? activeIcon : inactiveIcon,
              color: isActive ? AppColors.primary : AppColors.textSecondary,
              size: 24,
            ),
            const SizedBox(height: 4),

            // Tab Label
            Text(
              label,
              style: TextStyle(
                color: isActive ? AppColors.primary : AppColors.textSecondary,
                fontSize: 11,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
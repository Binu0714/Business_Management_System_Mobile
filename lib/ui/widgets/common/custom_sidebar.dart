import 'package:flutter/material.dart';
import '../../../core/theme.dart';
import '../../screens/login_screen.dart';
import 'fade_slide_in.dart';

class CustomSidebar extends StatefulWidget {
  final String activeRouteName;

  const CustomSidebar({
    super.key,
    this.activeRouteName = 'Dashboard',
  });

  @override
  State<CustomSidebar> createState() => _CustomSidebarState();
}

class _CustomSidebarState extends State<CustomSidebar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateToPage(BuildContext context, String targetRouteName, Widget targetPage) {
    Navigator.pop(context);
    if (widget.activeRouteName == targetRouteName) return;

    Navigator.popUntil(context, (route) => route.isFirst);
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => targetPage,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Drawer(
      backgroundColor: Colors.transparent,
      elevation: 0,
      width: screenWidth * 0.70,
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(28),
            bottomRight: Radius.circular(28),
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF0F172A).withOpacity(0.08),
              blurRadius: 32,
              offset: const Offset(4, 0),
            ),
            BoxShadow(
              color: const Color(0xFF0F172A).withOpacity(0.04),
              blurRadius: 12,
              offset: const Offset(2, 0),
            ),
          ],
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Animated Centered Logo
              FadeSlideIn(
                controller: _controller,
                start: 0.0,
                end: 0.4,
                slideOffset: -20.0,
                child: _buildLogoHeader(),
              ),

              const Divider(height: 1, color: Color(0xFFF1F5F9)),

              // Scrollable Menu List
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 0.0, bottom: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      FadeSlideIn(
                        controller: _controller,
                        start: 0.2,
                        end: 0.6,
                        slideOffset: 20.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSectionHeader('MANAGEMENT'),
                            _buildMenuItem(
                              icon: Icons.grid_view_rounded,
                              title: 'Dashboard',
                              isActive: widget.activeRouteName == 'Dashboard',
                              onTap: () {},
                            ),
                            _buildMenuItem(
                              icon: Icons.people_alt_outlined,
                              title: 'Supplier Manage',
                              isActive: widget.activeRouteName == 'Supplier Manage',
                              onTap: () {},
                            ),
                            _buildMenuItem(
                              icon: Icons.shopping_cart_outlined,
                              title: 'Purchase Manage',
                              isActive: widget.activeRouteName == 'Purchase Manage',
                              onTap: () {},
                            ),
                            _buildMenuItem(
                              icon: Icons.inventory_2_outlined,
                              title: 'Inventory Manage',
                              isActive: widget.activeRouteName == 'Inventory Manage',
                              onTap: () {},
                            ),
                            _buildMenuItem(
                              icon: Icons.point_of_sale_outlined,
                              title: 'Sales Manage',
                              isActive: widget.activeRouteName == 'Sales Manage',
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      // 3. Animated Operations Section
                      FadeSlideIn(
                        controller: _controller,
                        start: 0.4,
                        end: 0.8,
                        slideOffset: 20.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSectionHeader('OPERATIONS'),
                            _buildMenuItem(
                              icon: Icons.storefront_outlined,
                              title: 'Shop Manage',
                              isActive: widget.activeRouteName == 'Shop Manage',
                              onTap: () {},
                            ),
                            _buildMenuItem(
                              icon: Icons.payments_outlined,
                              title: 'Expense Manage',
                              isActive: widget.activeRouteName == 'Expense Manage',
                              onTap: () {},
                            ),
                            _buildMenuItem(
                              icon: Icons.badge_outlined,
                              title: 'Sales Rep Manage',
                              isActive: widget.activeRouteName == 'Sales Rep Manage',
                              onTap: () {},
                            ),
                            _buildMenuItem(
                              icon: Icons.bar_chart_rounded,
                              title: 'Reports',
                              isActive: widget.activeRouteName == 'Reports',
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),

                      // 4. Animated Logout Button
                      FadeSlideIn(
                        controller: _controller,
                        start: 0.6,
                        end: 1.0,
                        slideOffset: 20.0,
                        child: _buildMenuItem(
                          icon: Icons.logout_outlined,
                          title: 'Logout',
                          textColor: AppColors.error,
                          iconColor: AppColors.error,
                          isActive: false,
                          onTap: () {
                            Navigator.pop(context);
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginScreen()),
                                  (route) => false,
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogoHeader() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 6.0, bottom: 0.0),
        child: Image.asset(
          'assets/logo/logo1.png',
          height: 180,
          fit: BoxFit.contain,
          alignment: Alignment.center,
          errorBuilder: (context, error, stackTrace) => const Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'BMS',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0, bottom: 8.0, top: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 11,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.0,
        ),
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required bool isActive,
    required VoidCallback onTap,
    Color? textColor,
    Color? iconColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 2.0, bottom: 2.0),
      child: Material(
        color: isActive ? AppColors.primary : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          dense: true,
          visualDensity: const VisualDensity(horizontal: -2, vertical: -2),
          leading: Icon(
            icon,
            color: isActive ? Colors.white : (iconColor ?? AppColors.darkSlate),
            size: 22,
          ),
          title: Text(
            title,
            style: TextStyle(
              color: isActive ? Colors.white : (textColor ?? AppColors.darkSlate),
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
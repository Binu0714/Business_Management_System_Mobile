// lib/ui/screens/main_shell_screen.dart
import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../widgets/custom_sidebar.dart';     // Import Sidebar
import '../widgets/custom_bottom_nav.dart';   // Import Bottom Nav

class MainShellScreen extends StatefulWidget {
  const MainShellScreen({super.key});

  @override
  State<MainShellScreen> createState() => _MainShellScreenState();
}

class _MainShellScreenState extends State<MainShellScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const PlaceholderPage(title: 'Home Content Area'),
    const PlaceholderPage(title: 'Wallet Content Area'),
    const PlaceholderPage(title: 'Analytics Content Area'),
    const PlaceholderPage(title: 'Settings Content Area'),
  ];

  final List<String> _titles = [
    'Home',
    'Wallet',
    'Analytics',
    'Settings',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      // 1. Decoupled Sidebar Widget
      drawer: const CustomSidebar(),

      // 2. AppBar
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu_rounded, color: AppColors.darkSlate),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Text(
          _titles[_currentIndex],
          style: const TextStyle(
            color: AppColors.darkSlate,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 18,
              backgroundColor: AppColors.primary.withOpacity(0.1),
              child: const Icon(Icons.person_outline_rounded, color: AppColors.primary, size: 20),
            ),
          ),
        ],
      ),

      // 3. Keep-Alive Page Body
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),

      // 4. Decoupled Custom Bottom Nav Widget
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTabSelected: (index) {
          // Updates the state in this parent widget, causing body to switch
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

// Simple reusable Placeholder page widget
class PlaceholderPage extends StatelessWidget {
  final String title;
  const PlaceholderPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.textSecondary,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
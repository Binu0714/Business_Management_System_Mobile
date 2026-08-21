import 'package:bms_mobile/ui/screens/loading_screen.dart';
import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'ui/screens/welcome_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMS Mobile',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const LoadingScreen(),
    );
  }
}
import 'package:flutter/material.dart';
import '../../core/theme.dart';
import '../widgets/login_background_clipper.dart';
import '../widgets/fade_slide_in.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignupScreen> with SingleTickerProviderStateMixin {
  bool _isPasswordObscured = true;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Layer 1: Curved background shape
          ClipPath(
            clipper: LoginBackgroundClipper(),
            child: Container(
              color: AppColors.primary,
            ),
          ),

          // Layer 2: Form Content
          SafeArea(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                child: Column(
                  children: [

                    // Logo Element
                    FadeSlideIn(
                      controller: _controller,
                      start: 0.0,
                      end: 0.4,
                      slideOffset: -30.0,
                      child: Image.asset(
                        'assets/logo/logo1.png',
                        width: 250,
                        fit: BoxFit.contain,
                      ),
                    ),

                    // Sign-In Card Container
                    FadeSlideIn(
                      controller: _controller,
                      start: 0.2,
                      end: 0.6,
                      slideOffset: 30.0,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 24.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(28),
                          // Dual-shadow configuration for the embossed look
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF0F172A).withOpacity(0.15),
                              blurRadius: 32,
                              offset: const Offset(0, 16),
                            ),
                            BoxShadow(
                              color: const Color(0xFF0F172A).withOpacity(0.08),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // 1. Title
                            FadeSlideIn(
                              controller: _controller,
                              start: 0.4,
                              end: 0.7,
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Sign Up',
                                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.darkSlate,
                                    fontSize: 28,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 24),

                            // 2. Username Label & Input
                            FadeSlideIn(
                              controller: _controller,
                              start: 0.5,
                              end: 0.8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Full Name :',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.darkSlate,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Enter Your Full Name',
                                      hintStyle: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
                                      filled: true,
                                      fillColor: const Color(0xFFE2E8F0).withOpacity(0.4),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none,
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 16),

                            FadeSlideIn(
                              controller: _controller,
                              start: 0.5,
                              end: 0.8,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Email :',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.darkSlate,
                                      fontSize: 15,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    decoration: InputDecoration(
                                      hintText: 'Enter Your email Address',
                                      hintStyle: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
                                      filled: true,
                                      fillColor: const Color(0xFFE2E8F0).withOpacity(0.4),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none,
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            const SizedBox(height: 16),

                            // 3. Password Label & Input
                            FadeSlideIn(
                              controller: _controller,
                              start: 0.6,
                              end: 0.9,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Password :',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.darkSlate,
                                      fontSize: 16,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  TextFormField(
                                    obscureText: _isPasswordObscured,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Your Password',
                                      hintStyle: const TextStyle(color: AppColors.textSecondary, fontSize: 14),
                                      filled: true,
                                      fillColor: const Color(0xFFE2E8F0).withOpacity(0.4),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide.none,
                                      ),
                                      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _isPasswordObscured
                                              ? Icons.visibility_off_outlined
                                              : Icons.visibility_outlined,
                                          color: AppColors.textSecondary,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _isPasswordObscured = !_isPasswordObscured;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),

                            // 4. Sign Up Button
                            FadeSlideIn(
                              controller: _controller,
                              start: 0.7,
                              end: 1.0,
                              child: SizedBox(
                                width: double.infinity,
                                height: 52,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primary,
                                    foregroundColor: AppColors.white,
                                    elevation: 0,
                                    shape: const StadiumBorder(),
                                  ),
                                  child: const Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),

                            // 5. Sign Up Footer Text
                            FadeSlideIn(
                              controller: _controller,
                              start: 0.75,
                              end: 1.0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Already Have an Account ? ",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.darkSlate,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => const LoginScreen()),
                                      );
                                    },
                                    child: const Text(
                                      'Sign In',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

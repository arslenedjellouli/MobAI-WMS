import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_ai/config/routes/app_routes.dart';
import 'package:mobile_ai/features/auth/data/repositories/auth_repository_impl.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkAuthentication();
  }

  Future<void> _checkAuthentication() async {
    // Add a small delay for smooth UX
    await Future.delayed(const Duration(milliseconds: 1500));

    if (!mounted) return;

    final authRepository = GetIt.I<AuthRepository>();
    
    print('🔍 [SplashPage] Checking for existing user session...');
    
    final result = await authRepository.getCurrentUser();
    
    result.fold(
      (failure) {
        print('❌ [SplashPage] No valid session found: ${failure.message}');
        _navigateToLogin();
      },
      (user) {
        if (user != null && user.accessToken != null) {
          print('✅ [SplashPage] Valid session found for: ${user.email}');
          _navigateToDashboard();
        } else {
          print('⚠️ [SplashPage] No user or token found');
          _navigateToLogin();
        }
      },
    );
  }

  void _navigateToLogin() {
    Navigator.of(context).pushReplacementNamed(AppRoutes.login);
  }

  void _navigateToDashboard() {
    Navigator.of(context).pushReplacementNamed(AppRoutes.dashboard);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0093B2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo or App Icon
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Center(
                child: Image.asset(
                  'assets/BlueWMS.png',
                  height: 80,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            const SizedBox(height: 32),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              strokeWidth: 3,
            ),
            const SizedBox(height: 24),
            const Text(
              'Loading...',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

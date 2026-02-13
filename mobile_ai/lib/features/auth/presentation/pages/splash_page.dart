import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile_ai/config/routes/app_routes.dart';
import 'package:mobile_ai/core/database/models/auth/user_collection.dart';
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
    
    // Check if this is a session-only login (Remember Me was not checked)
    final storage = const FlutterSecureStorage();
    final sessionOnly = await storage.read(key: 'session_only');
    
    if (sessionOnly == 'true') {
      // Session-only login shouldn't persist after app restart
      print('🔒 [SplashPage] Session-only login detected, clearing tokens...');
      await storage.delete(key: 'auth_token');
      await storage.delete(key: 'refresh_token');
      await storage.delete(key: 'session_only');
      _navigateToLogin();
      return;
    }
    
    final result = await authRepository.getCurrentUser();
    
    result.fold(
      (failure) {
        print('❌ [SplashPage] No valid session found: ${failure.message}');
        _navigateToLogin();
      },
      (user) {
        if (user != null && user.accessToken != null) {
          print('✅ [SplashPage] Valid session found for: ${user.email}');
          _navigateToDashboard(user);
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


  void _navigateToDashboard(UserCollection user) {
    final route = user.isSupervisor
        ? AppRoutes.supervisorDashboard
        : AppRoutes.dashboard;
    Navigator.of(context).pushReplacementNamed(route);
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

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:mobile_ai/config/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _initialCircleScale;
  late Animation<double> _logoOpacity;
  late Animation<double> _logoScale;
  late Animation<double> _finalScreenFill;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2500),
    );
    _initialCircleScale = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.3, curve: Curves.elasticOut),
      ),
    );
    _logoScale = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 0.85, curve: Curves.elasticOut),
      ),
    );
    _logoOpacity = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 0.85, curve: Curves.easeIn),
      ),
    );
    _finalScreenFill = Tween<double>(begin: 1.0, end: 30.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.6, 1.0, curve: Curves.easeInCirc),
      ),
    );
    _controller.forward();
    Timer(const Duration(milliseconds: 2500), () async {
      final storage = const FlutterSecureStorage();
      final token = await storage.read(key: 'auth_token');
      final role = await storage.read(key: 'user_role');
      if (token == null || token.isEmpty) {
        if (!mounted) return;
        Navigator.of(context).pushReplacementNamed(AppRoutes.login);
      } else {
        if (!mounted) return;
        if (role == 'ADMIN') {
          Navigator.of(context).pushReplacementNamed(AppRoutes.adminDashboard);
        } else if (role == 'SUPERVISOR') {
          Navigator.of(context).pushReplacementNamed(AppRoutes.supervisorDashboard);
        } else {
          Navigator.of(context).pushReplacementNamed(AppRoutes.dashboard);
        }
      }
    });
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
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Container(color: Colors.white),
                Transform.scale(
                  scale: _finalScreenFill.value > 1.0
                      ? _finalScreenFill.value
                      : _initialCircleScale.value,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF0093B2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                  ),
                ),
                Transform.scale(
                  scale: _logoScale.value,
                  child: Opacity(
                    opacity: _controller.value < 0.90
                        ? _logoOpacity.value
                        : _controller.value > 0.95
                            ? 0.0
                            : (1.0 - (_controller.value - 0.90) / 0.05) *
                                _logoOpacity.value,
                    child: Image.asset(
                      'assets/WhiteWMS.png',
                      width: 80,
                      height: 80,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

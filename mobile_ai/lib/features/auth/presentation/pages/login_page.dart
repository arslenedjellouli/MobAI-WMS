import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_ai/config/routes/app_routes.dart';
import 'package:mobile_ai/features/auth/data/repositories/auth_repository_impl.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _obscurePassword = true;
  String? _emailError;
  String? _passwordError;
  bool _isLoading = false;
  late final AuthRepository _authRepository;

  @override
  void initState() {
    super.initState();
    _authRepository = GetIt.I<AuthRepository>();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _validateAndSubmit() async {
    setState(() {
      _emailError = _emailController.text.isEmpty ? 'Email is required' : 
                    !_isValidEmail(_emailController.text) ? 'Invalid email format' : null;
      _passwordError = _passwordController.text.isEmpty ? 'Password is required' : null;
    });

    if (_emailError == null && _passwordError == null) {
      await _performLogin();
    }
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');
    return emailRegex.hasMatch(email);
  }

  Future<void> _performLogin() async {
    setState(() => _isLoading = true);

    final email = _emailController.text.trim();
    final password = _passwordController.text;
    
    print('🚀 [LoginPage] Attempting login with email: $email');
    
    final result = await _authRepository.login(
      email,
      password,
    );

    setState(() => _isLoading = false);

    print('📊 [LoginPage] Login result received');

    result.fold(
      (failure) {
        print('❌ [LoginPage] Login failed: ${failure.message}');
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(failure.message),
            backgroundColor: const Color(0xFFDC2626),
            duration: const Duration(seconds: 4),
          ),
        );
      },
      (user) {
        print('✅ [LoginPage] Login successful: ${user.fullName}');
        // Navigate to dashboard on success
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Welcome, ${user.fullName}!'),
            backgroundColor: const Color(0xFF10B981),
            duration: const Duration(seconds: 2),
          ),
        );
        // Delay navigation to show success message
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) {
            print('🔄 [LoginPage] Navigating to dashboard...');
            Navigator.of(context).pushNamedAndRemoveUntil(
              AppRoutes.dashboard,
              (route) => false,
            );
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              Text(
                'Start your shift',
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                  textStyle: textTheme.headlineMedium,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Connect to WMS !',
                textAlign: TextAlign.center,
                style: GoogleFonts.manrope(
                  textStyle: textTheme.bodyLarge,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 48),
              Text(
                'Email Address',
                style: GoogleFonts.manrope(
                  textStyle: textTheme.bodyMedium,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 8),
              _InputField(
                controller: _emailController,
                hintText: 'Enter your email address',
                keyboardType: TextInputType.emailAddress,
                errorText: _emailError,
                onChanged: (_) => setState(() => _emailError = null),
              ),
              if (_emailError != null) ...[const SizedBox(height: 4),
                Text(
                  _emailError!,
                  style: GoogleFonts.manrope(
                    textStyle: textTheme.bodySmall,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFDC2626),
                  ),
                ),
              ],
              const SizedBox(height: 20),
              Text(
                'Password',
                style: GoogleFonts.manrope(
                  textStyle: textTheme.bodyMedium,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 8),
              _InputField(
                controller: _passwordController,
                hintText: 'Enter your password',
                keyboardType: TextInputType.text,
                obscureText: _obscurePassword,
                errorText: _passwordError,
                onChanged: (_) => setState(() => _passwordError = null),
                suffixIcon: IconButton(
                  onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                  icon: Icon(
                    _obscurePassword ? Icons.visibility_off : Icons.visibility,
                    color: const Color(0xFF94A3B8),
                  ),
                ),
              ),
              if (_passwordError != null) ...[const SizedBox(height: 4),
                Text(
                  _passwordError!,
                  style: GoogleFonts.manrope(
                    textStyle: textTheme.bodySmall,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFDC2626),
                  ),
                ),
              ],
              const SizedBox(height: 16),
              Row(
                children: [
                  GestureDetector(
                    onTap: () => setState(() => _rememberMe = !_rememberMe),
                    child: Container(
                      width: 22,
                      height: 22,
                      decoration: BoxDecoration(
                        color: _rememberMe
                            ? const Color(0xFF0093B2)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: const Color(0xFF0093B2),
                          width: 1.4,
                        ),
                      ),
                      child: _rememberMe
                          ? const Icon(Icons.check, color: Colors.white, size: 16)
                          : null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Remember me',
                    style: GoogleFonts.manrope(
                      textStyle: textTheme.bodyMedium,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF0F172A),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(AppRoutes.authHelp);
                    },
                    child: Text(
                      "Can't Access Your Account?",
                      style: GoogleFonts.manrope(
                        textStyle: textTheme.bodyMedium,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF0093B2),
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),
              SizedBox(
                height: 52,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _validateAndSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0093B2),
                    foregroundColor: Colors.white,
                    disabledBackgroundColor: const Color(0xFFCBD5E1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.5,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Connect',
                              style: GoogleFonts.manrope(
                                textStyle: textTheme.bodyLarge,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(Icons.arrow_forward_rounded, size: 18),
                          ],
                        ),
                ),
              ),
              const SizedBox(height: 48),
              Center(
                child: Image.asset(
                  'assets/BlueWMS.png',
                  height: 36,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InputField extends StatelessWidget {
  const _InputField({
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.errorText,
    this.onChanged,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? errorText;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.manrope(
          textStyle: Theme.of(context).textTheme.bodyMedium,
          color: const Color(0xFF94A3B8),
        ),
        filled: true,
        fillColor: errorText != null ? const Color(0xFFFEE2E2) : const Color(0xFFEFF3F7),
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: errorText != null
              ? const BorderSide(color: Color(0xFFDC2626), width: 1)
              : BorderSide.none,
        ),
      ),
    );
  }
}

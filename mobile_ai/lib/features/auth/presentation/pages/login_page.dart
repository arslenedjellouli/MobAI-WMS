import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_ai/config/routes/app_routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _idController = TextEditingController();
  final _pinController = TextEditingController();
  bool _rememberMe = false;
  bool _obscurePin = true;
  String? _idError;
  String? _pinError;

  @override
  void dispose() {
    _idController.dispose();
    _pinController.dispose();
    super.dispose();
  }

  void _validateAndSubmit() {
    setState(() {
      _idError = _idController.text.isEmpty ? 'Employer ID is required' : null;
      _pinError = _pinController.text.isEmpty ? 'PIN is required' : null;
    });

    if (_idError == null && _pinError == null) {
      // TODO: Proceed with login
      print('Login attempt with ID: ${_idController.text}, PIN: ${_pinController.text}');
    }
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
                'Employer ID',
                style: GoogleFonts.manrope(
                  textStyle: textTheme.bodyMedium,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 8),
              _InputField(
                controller: _idController,
                hintText: 'Enter your unique ID',
                keyboardType: TextInputType.text,
                errorText: _idError,
                onChanged: (_) => setState(() => _idError = null),
              ),
              if (_idError != null) ...[const SizedBox(height: 4),
                Text(
                  _idError!,
                  style: GoogleFonts.manrope(
                    textStyle: textTheme.bodySmall,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFDC2626),
                  ),
                ),
              ],
              const SizedBox(height: 20),
              Text(
                'PIN',
                style: GoogleFonts.manrope(
                  textStyle: textTheme.bodyMedium,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF0F172A),
                ),
              ),
              const SizedBox(height: 8),
              _InputField(
                controller: _pinController,
                hintText: 'Enter your PIN',
                keyboardType: TextInputType.number,
                obscureText: _obscurePin,
                errorText: _pinError,
                onChanged: (_) => setState(() => _pinError = null),
                suffixIcon: IconButton(
                  onPressed: () => setState(() => _obscurePin = !_obscurePin),
                  icon: Icon(
                    _obscurePin ? Icons.visibility_off : Icons.visibility,
                    color: const Color(0xFF94A3B8),
                  ),
                ),
              ),
              if (_pinError != null) ...[const SizedBox(height: 4),
                Text(
                  _pinError!,
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
                  onPressed: _validateAndSubmit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0093B2),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Row(
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

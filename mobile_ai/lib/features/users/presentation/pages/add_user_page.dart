import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  String _selectedRole = 'Supervisor';
  final List<String> _roles = ['Supervisor', 'Employee'];

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  void _generateRandomPassword() {
    // Generate a simple random password
    setState(() {
      _passwordController.text = 'P@ssw0rd${DateTime.now().millisecond}';
      _confirmPasswordController.text = _passwordController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9), // Slate-100
      appBar: AppBar(
        title: Text(
          'Add A User',
          style: GoogleFonts.manrope(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: const Color(0xFF0F172A),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Color(0xFF0F172A)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabel('Username'),
            _buildTextField(_usernameController, 'Enter username'),

            const SizedBox(height: 16),
            _buildLabel('Role'),
            _buildDropdown(),

            const SizedBox(height: 16),
            _buildLabel('Email'),
            _buildTextField(_emailController, 'Enter email', keyboardType: TextInputType.emailAddress),

            const SizedBox(height: 16),
            _buildLabel('Phone Num'),
            _buildTextField(_phoneController, 'Enter phone number', keyboardType: TextInputType.phone),

            const SizedBox(height: 16),
            _buildLabel('Password'),
            _buildPasswordField(_passwordController, _obscurePassword, () {
              setState(() => _obscurePassword = !_obscurePassword);
            }),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: _generateRandomPassword,
                icon: const Icon(Icons.refresh, size: 16),
                label: Text(
                  'Generate Random',
                  style: GoogleFonts.manrope(fontSize: 12),
                ),
                style: TextButton.styleFrom(
                  foregroundColor: const Color(0xFF0093B2),
                ),
              ),
            ),

            _buildLabel('Confirm Password'),
            _buildPasswordField(_confirmPasswordController, _obscureConfirmPassword, () {
              setState(() => _obscureConfirmPassword = !_obscureConfirmPassword);
            }),

            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  // Validate and Submit
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00796B), // Same Teal as dashboard actions
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Add User',
                  style: GoogleFonts.manrope(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: GoogleFonts.manrope(
          fontSize: 14,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF1E293B),
        ),
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String hint, {
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.manrope(
          color: const Color(0xFF94A3B8),
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
    );
  }

  Widget _buildPasswordField(
    TextEditingController controller,
    bool obscure,
    VoidCallback onToggle,
  ) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      decoration: InputDecoration(
        hintText: 'Enter password',
        hintStyle: GoogleFonts.manrope(
          color: const Color(0xFF94A3B8),
        ),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        suffixIcon: IconButton(
          icon: Icon(
            obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
            color: const Color(0xFF94A3B8),
          ),
          onPressed: onToggle,
        ),
      ),
    );
  }

  Widget _buildDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedRole,
          isExpanded: true,
          icon: const Icon(Icons.expand_more, color: Color(0xFF94A3B8)),
          items: _roles.map((role) {
            return DropdownMenuItem(
              value: role,
              child: Text(
                role,
                style: GoogleFonts.manrope(
                  color: const Color(0xFF1E293B),
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() => _selectedRole = value);
            }
          },
        ),
      ),
    );
  }
}

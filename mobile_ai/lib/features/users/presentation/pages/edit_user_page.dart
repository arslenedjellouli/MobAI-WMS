import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditUserPage extends StatefulWidget {
  final Map<String, dynamic> user;
  const EditUserPage({super.key, required this.user});

  @override
  State<EditUserPage> createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  late TextEditingController _usernameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  late String _selectedRole;
  late bool _isActive;
  final List<String> _roles = ['Supervisor', 'Employee'];
  
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController(text: widget.user['name']);
    _emailController = TextEditingController(text: widget.user['email']);
    _phoneController = TextEditingController(text: widget.user['phone']);
    _selectedRole = widget.user['role'] ?? 'Employee';
    _isActive = widget.user['status'] == 'Active';
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _showDeleteDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            const Icon(Icons.delete_outline, color: Color(0xFFDC2626)),
            const SizedBox(width: 8),
            Text('Delete User?', style: GoogleFonts.manrope(fontWeight: FontWeight.w700)),
          ],
        ),
        content: Text(
          'Are you sure you want to permanently delete ${_usernameController.text}? This action cannot be undone.',
          style: GoogleFonts.manrope(color: const Color(0xFF64748B)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: GoogleFonts.manrope(color: const Color(0xFF64748B))),
          ),
          ElevatedButton(
            onPressed: () {
              // Delete logic
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Close page
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFDC2626),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: Text('Delete', style: GoogleFonts.manrope(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showToggleStatusDialog() {
    final isDisabling = _isActive;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            Icon(
              isDisabling ? Icons.pause_circle_outline : Icons.play_circle_outline,
              color: isDisabling ? const Color(0xFFF59E0B) : const Color(0xFF10B981),
            ),
            const SizedBox(width: 8),
            Text(
              isDisabling ? 'Disable User?' : 'Enable User?',
              style: GoogleFonts.manrope(fontWeight: FontWeight.w700),
            ),
          ],
        ),
        content: Text(
          isDisabling
              ? 'Are you sure you want to disable ${_usernameController.text}? They will lose access immediately but can be re-enabled later.'
              : 'Are you sure you want to enable ${_usernameController.text}? They will regain access immediately.',
          style: GoogleFonts.manrope(color: const Color(0xFF64748B)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: GoogleFonts.manrope(color: const Color(0xFF64748B))),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _isActive = !_isActive;
              });
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: isDisabling ? const Color(0xFFF59E0B) : const Color(0xFF10B981),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: Text(
              isDisabling ? 'Disable' : 'Enable',
              style: GoogleFonts.manrope(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9), // Slate-100
      appBar: AppBar(
        title: Text(
          'Edit User',
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
            // User Info Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'User Info',
                  style: GoogleFonts.manrope(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF0F172A),
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        _isActive ? Icons.pause_circle_outline : Icons.play_circle_outline,
                        color: _isActive ? const Color(0xFFF59E0B) : const Color(0xFF10B981),
                      ),
                      onPressed: _showToggleStatusDialog,
                    ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline, color: Color(0xFFDC2626)),
                      onPressed: _showDeleteDialog,
                    ),
                  ],
                ),
              ],
            ),
            
            if (!_isActive) ...[
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFBEB), // Amber-50
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFFFCD34D)), // Amber-300
                ),
                child: Row(
                  children: [
                    const Icon(Icons.warning_amber_rounded, size: 20, color: Color(0xFFF59E0B)),
                    const SizedBox(width: 8),
                    Text(
                      'This user is temporarily disabled',
                      style: GoogleFonts.manrope(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFB45309), // Amber-700
                      ),
                    ),
                  ],
                ),
              ),
            ],

            const SizedBox(height: 24),

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

            const SizedBox(height: 16),
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
                  // Save User Logic
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00796B), // Teal
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'Save Changes',
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
        hintStyle: GoogleFonts.manrope(color: const Color(0xFF94A3B8)),
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
        hintStyle: GoogleFonts.manrope(color: const Color(0xFF94A3B8)),
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
            color: const Color(0xFF94A3B8), // Slate-400
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

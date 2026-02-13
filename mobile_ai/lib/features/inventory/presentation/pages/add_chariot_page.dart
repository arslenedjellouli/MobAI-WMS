import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class AddChariotPage extends StatefulWidget {
  const AddChariotPage({super.key});

  @override
  State<AddChariotPage> createState() => _AddChariotPageState();
}

class _AddChariotPageState extends State<AddChariotPage> {
  final TextEditingController _capacityController = TextEditingController();
  final TextEditingController _identifierController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _generateIdentifier();
  }

  void _generateIdentifier() {
    // Generate a random vehicle identifier
    final random = Random();
    final number = 1000 + random.nextInt(9000); // 1000-9999
    _identifierController.text = 'CH-$number';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9), // Slate-100
      appBar: AppBar(
        title: Text(
          'Add Vehicle',
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
            _buildLabel('Vehicle Identifier'),
            _buildTextField(
              _identifierController, 
              'Generated automatically', 
              readOnly: true,
              suffixIcon: IconButton(
                icon: const Icon(Icons.refresh, color: Color(0xFF64748B)),
                onPressed: _generateIdentifier,
                tooltip: 'Regenerate Identifier',
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'This identifier is automatically generated.',
              style: GoogleFonts.manrope(
                fontSize: 12,
                color: const Color(0xFF64748B),
                fontStyle: FontStyle.italic,
              ),
            ),

            const SizedBox(height: 24),
            _buildLabel('Maximum Capacity (kg)'),
            _buildTextField(_capacityController, '0.0', keyboardType: TextInputType.number),

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
                  'Add Vehicle',
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
    bool readOnly = false,
    Widget? suffixIcon,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      readOnly: readOnly,
      style: GoogleFonts.manrope(
        color: readOnly ? const Color(0xFF64748B) : const Color(0xFF0F172A),
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.manrope(
          color: const Color(0xFF94A3B8),
        ),
        filled: true,
        fillColor: readOnly ? const Color(0xFFF1F5F9) : Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        suffixIcon: suffixIcon,
      ),
    );
  }
}

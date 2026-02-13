import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProductPage extends StatefulWidget {
  final Map<String, dynamic> product;
  const EditProductPage({super.key, required this.product});

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  late TextEditingController _skuController;
  late TextEditingController _nameController;
  late TextEditingController _weightController;
  late TextEditingController _maxWeightController;
  late String _selectedFrequency;
  late bool _isActive;

  final List<String> _frequencies = ['High', 'Medium', 'Low'];

  @override
  void initState() {
    super.initState();
    _skuController = TextEditingController(text: widget.product['sku']);
    _nameController = TextEditingController(text: widget.product['name']);
    _weightController = TextEditingController(text: (widget.product['weight'] as String).replaceAll(' kg', ''));
    _maxWeightController = TextEditingController(text: (widget.product['max_pallet_weight'] as String).replaceAll(' kg', ''));
    _selectedFrequency = widget.product['frequency'] ?? 'Medium';
    _isActive = widget.product['status'] == 'Active';
  }

  @override
  void dispose() {
    _skuController.dispose();
    _nameController.dispose();
    _weightController.dispose();
    _maxWeightController.dispose();
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
            Text('Delete Product?', style: GoogleFonts.manrope(fontWeight: FontWeight.w700)),
          ],
        ),
        content: Text(
          'Are you sure you want to delete ${_nameController.text}? This action cannot be undone.',
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
              isDisabling ? 'Discontinue Product?' : 'Activate Product?',
              style: GoogleFonts.manrope(fontWeight: FontWeight.w700),
            ),
          ],
        ),
        content: Text(
          isDisabling
              ? 'Are you sure you want to discontinue ${_nameController.text}? It will no longer be available for orders.'
              : 'Are you sure you want to activate ${_nameController.text}?',
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
              isDisabling ? 'Discontinue' : 'Activate',
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
          'Edit Product',
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
            // Product Info Header with Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Product Info',
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
                      'This product is discontinued',
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

            _buildLabel('SKU'),
            _buildTextField(_skuController, 'Product SKU'),

            const SizedBox(height: 16),
            _buildLabel('Product Name'),
            _buildTextField(_nameController, 'Product Name'),

            const SizedBox(height: 16),
             _buildLabel('Weight (kg)'),
            _buildTextField(_weightController, '0.0', keyboardType: TextInputType.number),

            const SizedBox(height: 16),
            _buildLabel('Max Pallet Weight (kg)'),
            _buildTextField(_maxWeightController, '0.0', keyboardType: TextInputType.number),

            const SizedBox(height: 16),
            _buildLabel('Frequency'),
            _buildDropdown(),

            const SizedBox(height: 16),
            _buildLabel('Product Image'),
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Stack(
                children: [
                   Center(
                    child: Icon(Icons.image, size: 64, color: Colors.grey[300]),
                   ),
                   Positioned(
                     bottom: 8,
                     right: 8,
                     child: CircleAvatar(
                       backgroundColor: const Color(0xFF00796B),
                       child: IconButton(
                         icon: const Icon(Icons.edit, color: Colors.white),
                         onPressed: () {
                           // Change image logic
                         },
                       ),
                     ),
                   ),
                ],
              ),
            ),


            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  // Save Logic
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

  Widget _buildDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedFrequency,
          isExpanded: true,
          icon: const Icon(Icons.expand_more, color: Color(0xFF94A3B8)),
          items: _frequencies.map((freq) {
            return DropdownMenuItem(
              value: freq,
              child: Text(
                freq,
                style: GoogleFonts.manrope(
                  color: const Color(0xFF1E293B),
                ),
              ),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() => _selectedFrequency = value);
            }
          },
        ),
      ),
    );
  }
}

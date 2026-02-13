import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_ai/features/inventory/data/models/product_api_models.dart';
import 'package:mobile_ai/features/inventory/data/datasources/product_remote_datasource.dart';
import 'package:mobile_ai/features/inventory/data/repositories/product_repository_impl.dart';
import '../../../../core/api/api_client.dart';

class EditProductPage extends StatefulWidget {
  final ProductApiModel product;
  const EditProductPage({super.key, required this.product});

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _skuCodeController;
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _barcodeController;
  late TextEditingController _weightController;
  late TextEditingController _volumeController;
  late TextEditingController _categoryController;
  late TextEditingController _palletSizeController;
  late TextEditingController _quantityController;

  late ProductRepositoryImpl _productRepository;
  bool _isLoading = false;
  late String _selectedUnit;

  final List<String> _units = ['UNIT', 'PCS', 'KG', 'LITER', 'BOX', 'PALLET'];

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _initializeRepository();
  }

  void _initializeControllers() {
    _skuCodeController = TextEditingController(text: widget.product.skuCode);
    _nameController = TextEditingController(text: widget.product.name);
    _descriptionController = TextEditingController(text: widget.product.description);
    _barcodeController = TextEditingController(text: widget.product.barcode ?? '');
    _weightController = TextEditingController(text: widget.product.weight?.toString() ?? '');
    _volumeController = TextEditingController(text: widget.product.volume?.toString() ?? '');
    _categoryController = TextEditingController(text: widget.product.category ?? '');
    _palletSizeController = TextEditingController(text: widget.product.palletSize?.toString() ?? '');
    _quantityController = TextEditingController(text: widget.product.totalQuantity?.toString() ?? '0');
    
    // Fallback to UNIT if backend unit is not in our list
    _selectedUnit = _units.contains(widget.product.unit) ? widget.product.unit : 'UNIT';
  }

  void _initializeRepository() {
    final apiClient = ApiClient();
    final datasource = ProductRemoteDatasourceImpl(dio: apiClient.dio);
    _productRepository = ProductRepositoryImpl(remoteDatasource: datasource);
  }

  Future<void> _updateProduct() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final request = ProductUpdateRequest(
        skuCode: _skuCodeController.text.trim(),
        name: _nameController.text.trim(),
        description: _descriptionController.text.trim(),
        barcode: _barcodeController.text.trim().isEmpty ? null : _barcodeController.text.trim(),
        unit: _selectedUnit,
        weight: _weightController.text.trim().isEmpty ? null : double.parse(_weightController.text.trim()),
        volume: _volumeController.text.trim().isEmpty ? null : double.parse(_volumeController.text.trim()),
        category: _categoryController.text.trim().isEmpty ? null : _categoryController.text.trim(),
        palletSize: _palletSizeController.text.trim().isEmpty ? null : int.parse(_palletSizeController.text.trim()),
        quantity: _quantityController.text.trim().isEmpty ? null : double.parse(_quantityController.text.trim()),
      );

      await _productRepository.updateProduct(widget.product.id, request);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Product updated successfully'),
            backgroundColor: Color(0xFF10B981),
          ),
        );
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to update product: $e'),
            backgroundColor: const Color(0xFFEF4444),
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  Future<void> _deleteProduct() async {
    setState(() => _isLoading = true);

    try {
      await _productRepository.deleteProduct(widget.product.id);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Product deleted successfully'),
            backgroundColor: Color(0xFF10B981),
          ),
        );
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to delete product: $e'),
            backgroundColor: const Color(0xFFEF4444),
          ),
        );
        setState(() => _isLoading = false);
      }
    }
  }

  void _showDeleteConfirmation() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            const Icon(Icons.warning_amber_rounded, color: Color(0xFFEF4444)),
            const SizedBox(width: 12),
            Text(
              'Delete Product',
              style: GoogleFonts.inter(fontWeight: FontWeight.w700),
            ),
          ],
        ),
        content: Text(
          'Are you sure you want to delete "${widget.product.name}"?\n\nThis action cannot be undone.',
          style: GoogleFonts.inter(color: const Color(0xFF64748B)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Cancel',
              style: GoogleFonts.inter(color: const Color(0xFF64748B)),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _deleteProduct();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEF4444),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              'Delete',
              style: GoogleFonts.inter(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _skuCodeController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    _barcodeController.dispose();
    _weightController.dispose();
    _volumeController.dispose();
    _categoryController.dispose();
    _palletSizeController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
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
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Color(0xFFEF4444)),
            onPressed: _showDeleteConfirmation,
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel('SKU Code *'),
              _buildTextField(
                _skuCodeController,
                'Enter SKU code',
                validator: (v) => v?.isEmpty ?? true ? 'Required' : null,
              ),

              const SizedBox(height: 16),
              _buildLabel('Product Name *'),
              _buildTextField(
                _nameController,
                'Enter product name',
                validator: (v) => v?.isEmpty ?? true ? 'Required' : null,
              ),

              const SizedBox(height: 16),
              _buildLabel('Description *'),
              _buildTextField(
                _descriptionController,
                'Enter product description',
                maxLines: 3,
                validator: (v) => v?.isEmpty ?? true ? 'Required' : null,
              ),

              const SizedBox(height: 16),
              _buildLabel('Barcode'),
              _buildTextField(_barcodeController, 'Enter barcode (optional)'),

              const SizedBox(height: 16),
              _buildLabel('Unit *'),
              _buildDropdown(
                value: _selectedUnit,
                items: _units,
                onChanged: (v) => setState(() => _selectedUnit = v!),
              ),

              const SizedBox(height: 16),
              _buildLabel('Weight (kg)'),
              _buildTextField(
                _weightController,
                '0.0',
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 16),
              _buildLabel('Volume (m³)'),
              _buildTextField(
                _volumeController,
                '0.0',
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 16),
              _buildLabel('Category'),
              _buildTextField(_categoryController, 'Enter category (optional)'),

              const SizedBox(height: 16),
              _buildLabel('Current Quantity'),
              _buildTextField(
                _quantityController,
                'Current stock quantity',
                keyboardType: TextInputType.number,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4, left: 4),
                child: Text(
                  'This quantity is per unit selected above (e.g., if BOX is selected, 4 means 4 boxes)',
                  style: GoogleFonts.manrope(
                    fontSize: 12,
                    color: const Color(0xFF64748B),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),

              const SizedBox(height: 16),
              _buildLabel('Pallet Size'),
              _buildTextField(
                _palletSizeController,
                'Colisage palette (optional)',
                keyboardType: TextInputType.number,
              ),

              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _updateProduct,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00796B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(
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
    int maxLines = 1,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      maxLines: maxLines,
      validator: validator,
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

  Widget _buildDropdown({
    required String value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: const Icon(Icons.expand_more, color: Color(0xFF94A3B8)),
          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item, style: GoogleFonts.manrope(color: const Color(0xFF1E293B))),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_ai/features/inventory/data/models/product_api_models.dart';
import 'package:mobile_ai/features/inventory/data/datasources/product_remote_datasource.dart';
import 'package:mobile_ai/features/inventory/data/repositories/product_repository_impl.dart';
import '../../../../core/api/api_client.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _skuCodeController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _barcodeController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _volumeController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _palletSizeController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  late final ProductRepositoryImpl _productRepository;
  bool _isLoading = false;
  String _selectedUnit = 'UNIT';
  
  final List<String> _units = ['UNIT', 'PCS', 'KG', 'LITER', 'BOX', 'PALLET'];

  @override
  void initState() {
    super.initState();
    _initializeRepository();
  }

  void _initializeRepository() {
    final apiClient = ApiClient();
    final datasource = ProductRemoteDatasourceImpl(dio: apiClient.dio);
    _productRepository = ProductRepositoryImpl(remoteDatasource: datasource);
  }

  Future<void> _submitProduct() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      final request = ProductCreateRequest(
        skuCode: _skuCodeController.text.trim(),
        name: _nameController.text.trim(),
        description: _descriptionController.text.trim(),
        barcode: _barcodeController.text.trim().isEmpty ? null : _barcodeController.text.trim(),
        unit: _selectedUnit,
        weight: _weightController.text.trim().isEmpty ? null : double.parse(_weightController.text.trim()),
        volume: _volumeController.text.trim().isEmpty ? null : double.parse(_volumeController.text.trim()),
        category: _categoryController.text.trim().isEmpty ? null : _categoryController.text.trim(),
        imageUrl: null,
        palletSize: _palletSizeController.text.trim().isEmpty ? null : int.parse(_palletSizeController.text.trim()),
        initialQuantity: _quantityController.text.trim().isEmpty ? null : double.parse(_quantityController.text.trim()),
      );

      await _productRepository.createProduct(request);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Product created successfully'),
            backgroundColor: Color(0xFF10B981),
          ),
        );
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to create product: $e'),
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
          'Add Product',
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
                'Enter SKU code (e.g., PROD-001)',
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
              _buildLabel('Initial Quantity'),
              _buildTextField(
                _quantityController,
                'Enter initial quantity (optional)',
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
                  onPressed: _isLoading ? null : _submitProduct,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00796B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(
                          'Add Product',
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

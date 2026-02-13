import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'warehouse_structure_page.dart';
import '../../../../core/api/api_client.dart';
import '../../data/datasources/warehouse_remote_datasource.dart';
import '../../data/datasources/floor_remote_datasource.dart';
import '../../data/repositories/warehouse_repository_impl.dart';
import '../../data/models/warehouse_models.dart';

class AddWarehousePage extends StatefulWidget {
  const AddWarehousePage({super.key});

  @override
  State<AddWarehousePage> createState() => _AddWarehousePageState();
}

class _AddWarehousePageState extends State<AddWarehousePage> {
  // Form controllers
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _lengthController = TextEditingController();
  final TextEditingController _widthController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  late final WarehouseRepositoryImpl _repository;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    _repository = WarehouseRepositoryImpl(
      remoteDatasource: WarehouseRemoteDatasourceImpl(apiClient: ApiClient()),
      floorDatasource: FloorRemoteDatasourceImpl(apiClient: ApiClient()),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _lengthController.dispose();
    _widthController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  void _goToStructureEditor() async {
    // Validate form
    if (_nameController.text.isEmpty ||
        _lengthController.text.isEmpty ||
        _widthController.text.isEmpty ||
        _heightController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill in all fields')),
      );
      return;
    }

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WarehouseStructurePage(
          warehouseName: _nameController.text,
          floorLength: double.parse(_lengthController.text),
          floorWidth: double.parse(_widthController.text),
          floorHeight: double.parse(_heightController.text),
        ),
      ),
    );

    if (result != null && result is List<WarehouseFloor>) {
      // Save warehouse to backend
      await _saveWarehouse(result);
    }
  }

  Future<void> _saveWarehouse(List<WarehouseFloor> floors) async {
    setState(() => _isSaving = true);

    try {
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final code = 'WH-${timestamp.toString().substring(timestamp.toString().length - 8)}';

      await _repository.createWarehouse(
        name: _nameController.text,
        code: code,
        length: double.parse(_lengthController.text),
        width: double.parse(_widthController.text),
        height: double.parse(_heightController.text),
        floors: floors,
      );

      if (mounted) {
        // Pop back to warehouse list (not to this form)
        Navigator.of(context).pop(true);
        
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Warehouse created successfully'),
            backgroundColor: Color(0xFF10B981),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error creating warehouse: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        title: Text('Add A Warehouse', style: GoogleFonts.manrope(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: _buildFormPage(),
    );
  }

  Widget _buildFormPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Warehouse Name
          _buildTextField(
            label: 'Warehouse Name',
            placeholder: 'Placeholder_input',
            controller: _nameController,
          ),
          const SizedBox(height: 16),
          
          // Floor Length
          _buildTextField(
            label: 'Floor Length (meters)',
            placeholder: 'Placeholder_input',
            controller: _lengthController,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          
          // Floor Width
          _buildTextField(
            label: 'Floor Width (meters)',
            placeholder: 'Placeholder_input',
            controller: _widthController,
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 16),
          
          // Floor Height
          _buildTextField(
            label: 'Floor Height (meters)',
            placeholder: 'Placeholder_input',
            controller: _heightController,
            keyboardType: TextInputType.number,
          ),
          
          const SizedBox(height: 40),
          
          // Next Button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: _isSaving ? null : _goToStructureEditor,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0093B2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                disabledBackgroundColor: const Color(0xFF94A3B8),
              ),
              child: _isSaving
                  ? const SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Next',
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(Icons.arrow_forward, color: Colors.white),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required String placeholder,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF475569),
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: placeholder,
            hintStyle: GoogleFonts.inter(
              color: const Color(0xFFCBD5E1),
              fontSize: 14,
            ),
            filled: true,
            fillColor: const Color(0xFFF8FAFC),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFF0093B2), width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
      ],
    );
  }
}

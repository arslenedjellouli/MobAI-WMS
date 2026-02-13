import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';
import 'warehouse_structure_page.dart';
import '../../../../core/api/api_client.dart';
import '../../data/datasources/warehouse_remote_datasource.dart';
import '../../data/datasources/floor_remote_datasource.dart';
import '../../data/repositories/warehouse_repository_impl.dart';
import '../../data/models/warehouse_api_models.dart';
import '../../data/models/warehouse_models.dart';

class EditWarehousePage extends StatefulWidget {
  final WarehouseApiModel warehouse;

  const EditWarehousePage({super.key, required this.warehouse});

  @override
  State<EditWarehousePage> createState() => _EditWarehousePageState();
}

class _EditWarehousePageState extends State<EditWarehousePage> {
  late TextEditingController _nameController;
  late TextEditingController _lengthController;
  late TextEditingController _widthController;
  late TextEditingController _heightController;
  late final WarehouseRepositoryImpl _repository;
  List<FloorApiModel> _floors = [];
  bool _isSaving = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _repository = WarehouseRepositoryImpl(
      remoteDatasource: WarehouseRemoteDatasourceImpl(apiClient: ApiClient()),
      floorDatasource: FloorRemoteDatasourceImpl(apiClient: ApiClient()),
    );
    _nameController = TextEditingController(text: widget.warehouse.name);
    _lengthController = TextEditingController(text: widget.warehouse.length.toString());
    _widthController = TextEditingController(text: widget.warehouse.width.toString());
    _heightController = TextEditingController(text: widget.warehouse.height.toString());
    _loadFloors();
  }

  Future<void> _loadFloors() async {
    setState(() => _isLoading = true);
    try {
      final floors = await _repository.getWarehouseFloors(widget.warehouse.id);
      setState(() {
        _floors = floors;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _lengthController.dispose();
    _widthController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  void _saveWarehouse() async {
    setState(() => _isSaving = true);

    try {
      await _repository.updateWarehouse(
        id: widget.warehouse.id,
        name: _nameController.text,
        code: widget.warehouse.code,
        length: double.tryParse(_lengthController.text),
        width: double.tryParse(_widthController.text),
        height: double.tryParse(_heightController.text),
      );

      if (mounted) {
        Navigator.pop(context, true);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Warehouse updated successfully')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error updating warehouse: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  void _deleteWarehouse() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Warehouse'),
        content: Text('Are you sure you want to delete "${_nameController.text}"? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context); // Close dialog
              setState(() => _isSaving = true);

              try {
                await _repository.deleteWarehouse(widget.warehouse.id);
                if (mounted) {
                  Navigator.pop(context, true); // Go back to list
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('"${_nameController.text}" deleted successfully'),
                      backgroundColor: const Color(0xFF10B981),
                    ),
                  );
                }
              } catch (e) {
                if (mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Error deleting warehouse: $e')),
                  );
                }
              } finally {
                if (mounted) {
                  setState(() => _isSaving = false);
                }
              }
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _editStructure() async {
    // Convert API floors to WarehouseFloor models
    final existingFloors = _floors.map((apiFloor) {
      final items = apiFloor.gridItems.map((gridItem) {
        return GridItem(
          id: gridItem.itemId ?? const Uuid().v4(),
          type: _mapBackendToItemType(gridItem.itemType),
          x: gridItem.x,
          y: gridItem.y,
          width: gridItem.width,
          height: gridItem.height,
        );
      }).toList();
      return WarehouseFloor(level: apiFloor.levelNumber, items: items);
    }).toList();

    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WarehouseStructurePage(
          warehouseName: _nameController.text,
          floorLength: double.tryParse(_lengthController.text) ?? widget.warehouse.length,
          floorWidth: double.tryParse(_widthController.text) ?? widget.warehouse.width,
          floorHeight: double.tryParse(_heightController.text) ?? widget.warehouse.height,
          existingFloors: existingFloors,
        ),
      ),
    );

    if (result != null && result is List<WarehouseFloor>) {
      await _updateFloors(result);
    }
  }

  Future<void> _updateFloors(List<WarehouseFloor> updatedFloors) async {
    setState(() => _isSaving = true);

    try {
      // Delete old floors (ignore 404 errors for already deleted floors)
      for (final floor in _floors) {
        try {
          await _repository.deleteFloor(floor.id);
        } catch (e) {
          // Ignore 404 errors - floor already deleted
          if (!e.toString().contains('404')) {
            rethrow;
          }
        }
      }

      // Create new floors with updated structure
      for (final floor in updatedFloors) {
        await _repository.createFloor(
          widget.warehouse.id,
          floor.level,
          double.tryParse(_lengthController.text) ?? widget.warehouse.length,
          double.tryParse(_widthController.text) ?? widget.warehouse.width,
          floor.items,
        );
      }

      // Reload floors to get fresh data
      await _loadFloors();

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Structure updated successfully')),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error updating structure: $e')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => _isSaving = false);
      }
    }
  }

  WarehouseItemType _mapBackendToItemType(String backendType) {
    switch (backendType) {
      case 'RACK_STORAGE':
        return WarehouseItemType.rackStorage;
      case 'OFFICE':
        return WarehouseItemType.office;
      case 'GOODS_LIFT':
        return WarehouseItemType.goodsLift;
      case 'LIFT':
        return WarehouseItemType.lift;
      case 'VRAC':
        return WarehouseItemType.vrac;
      case 'SHIPPING_AREA':
        return WarehouseItemType.shippingArea;
      case 'FLOOR_STORAGE':
        return WarehouseItemType.floorStorage;
      default:
        return WarehouseItemType.rackStorage;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: Text(
          'Modify Warehouse',
          style: GoogleFonts.inter(
            color: const Color(0xFF0F172A),
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, size: 20, color: Color(0xFF0F172A)),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Color(0xFFEF4444)),
            onPressed: _deleteWarehouse,
            tooltip: 'Delete warehouse',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Information Section
            Text(
              'Warehouse Information',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 16),
            
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
            
            const SizedBox(height: 32),
            
            // Structure Section
            Text(
              'Warehouse Structure',
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF1E293B),
              ),
            ),
            const SizedBox(height: 16),
            
            // Structure Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE2E8F0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.layers_outlined, color: Color(0xFF64748B)),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Floor Layout',
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: const Color(0xFF0F172A),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          _isLoading
                              ? 'Loading...'
                              : '${_floors.length} Floors configured',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            color: const Color(0xFF64748B),
                          ),
                        ),
                      ],
                    ),
                  ),
                  TextButton(
                    onPressed: _editStructure,
                    child: Text(
                      'Edit',
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF0093B2),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 32),
            
            // Save Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _isSaving ? null : _saveWarehouse,
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
                    : Text(
                        'Save Changes',
                        style: GoogleFonts.inter(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
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

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/api/api_client.dart';
import '../../data/datasources/chariot_remote_datasource.dart';
import '../../data/repositories/chariot_repository_impl.dart';
import '../../data/models/chariot_api_models.dart';
import '../../../warehouse/data/datasources/location_remote_datasource.dart';
import '../../../warehouse/data/datasources/warehouse_remote_datasource.dart';
import '../../../warehouse/data/datasources/floor_remote_datasource.dart';
import '../../../warehouse/data/repositories/location_repository_impl.dart';
import '../../../warehouse/data/repositories/warehouse_repository_impl.dart';
import '../../../warehouse/data/models/location_api_models.dart';
import '../../../warehouse/data/models/warehouse_api_models.dart';
import '../../../warehouse/data/datasources/zone_remote_datasource.dart';
import '../../../warehouse/data/repositories/zone_repository_impl.dart';
import '../../../warehouse/data/models/zone_api_models.dart';
import 'select_chariot_location_page.dart';

class EditChariotPage extends StatefulWidget {
  final ChariotApiModel chariot;

  const EditChariotPage({super.key, required this.chariot});

  @override
  State<EditChariotPage> createState() => _EditChariotPageState();
}

class _EditChariotPageState extends State<EditChariotPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _codeController;
  late final TextEditingController _capacityController;

  late final ChariotRepositoryImpl _chariotRepository;
  late final LocationRepositoryImpl _locationRepository;
  late final WarehouseRepositoryImpl _warehouseRepository;
  late final ZoneRepositoryImpl _zoneRepository;

  late String _selectedStatus;
  final List<Map<String, String>> _statuses = [
    {'value': 'AVAILABLE', 'label': 'Available'},
    {'value': 'IN_USE', 'label': 'In Use'},
    {'value': 'MAINTENANCE', 'label': 'Maintenance'},
    {'value': 'OUT_OF_SERVICE', 'label': 'Out of Service'},
  ];

  List<LocationApiModel> _locations = [];
  List<LocationApiModel> _allLocations = [];
  String? _selectedLocationId;
  LocationApiModel? _selectedLocation;
  SelectedGridCell? _selectedCell;
  bool _loadingLocations = false;

  List<WarehouseApiModel> _warehouses = [];
  String? _selectedWarehouseId;
  bool _loadingWarehouses = false;
  List<FloorApiModel> _floors = [];
  bool _loadingFloors = false;
  List<ZoneApiModel> _zones = [];
  bool _loadingZones = false;

  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    
    // Initialize controllers with existing data
    _codeController = TextEditingController(text: widget.chariot.code);
    _capacityController = TextEditingController(text: widget.chariot.capacity.toString());
    _selectedStatus = widget.chariot.status;
    _selectedLocationId = widget.chariot.currentLocation;

    final apiClient = ApiClient();
    
    final chariotDatasource = ChariotRemoteDatasourceImpl(apiClient: apiClient);
    _chariotRepository = ChariotRepositoryImpl(remoteDatasource: chariotDatasource);

    final locationDatasource = LocationRemoteDatasourceImpl(apiClient: apiClient);
    _locationRepository = LocationRepositoryImpl(remoteDatasource: locationDatasource);

    final warehouseDatasource = WarehouseRemoteDatasourceImpl(apiClient: apiClient);
    final floorDatasource = FloorRemoteDatasourceImpl(apiClient: apiClient);
    _warehouseRepository = WarehouseRepositoryImpl(
      remoteDatasource: warehouseDatasource,
      floorDatasource: floorDatasource,
    );

    final zoneDatasource = ZoneRemoteDatasourceImpl(apiClient: apiClient);
    _zoneRepository = ZoneRepositoryImpl(remoteDatasource: zoneDatasource);

    _loadWarehouses();
    _initializeLocationSelection();
  }

  Future<void> _loadWarehouses() async {
    setState(() => _loadingWarehouses = true);
    try {
      final warehouses = await _warehouseRepository.getWarehouses();
      setState(() {
        _warehouses = warehouses;
        _loadingWarehouses = false;
      });

      if (_selectedWarehouseId == null && widget.chariot.warehouse != null) {
        _selectedWarehouseId = widget.chariot.warehouse;
        await _loadWarehouseLayout(widget.chariot.warehouse!);
      }
    } catch (e) {
      setState(() => _loadingWarehouses = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to load warehouses: $e', style: GoogleFonts.inter()),
            backgroundColor: const Color(0xFFEF4444),
          ),
        );
      }
    }
  }

  WarehouseApiModel? _findWarehouse(String? warehouseId) {
    if (warehouseId == null) {
      return null;
    }
    for (final warehouse in _warehouses) {
      if (warehouse.id == warehouseId) {
        return warehouse;
      }
    }
    return null;
  }

  String? _floorLabel(String? floorId) {
    if (floorId == null) {
      return null;
    }
    for (final floor in _floors) {
      if (floor.id == floorId) {
        return floor.levelNumber == 0
            ? 'Ground (0A)'
            : 'Floor ${floor.levelNumber.toString().padLeft(2, '0')}';
      }
    }
    return null;
  }

  Future<void> _initializeLocationSelection() async {
    if (_selectedLocationId == null) {
      return;
    }

    try {
      final location = await _locationRepository.getLocation(_selectedLocationId!);
      if (mounted) {
        setState(() {
          _selectedWarehouseId = location.warehouse;
          _selectedLocation = location;
          _selectedCell = null;
        });
      }

      if (location.warehouse != null) {
        await _loadWarehouseLayout(location.warehouse!);

        if (!_locations.any((item) => item.id == location.id)) {
          setState(() {
            _locations = [location, ..._locations];
          });
        }
      }
    } catch (_) {
      // Ignore and let user select manually
    }
  }

  Future<void> _loadWarehouseLayout(String warehouseId) async {
    setState(() {
      _loadingLocations = true;
      _loadingFloors = true;
      _loadingZones = true;
      _locations = [];
      _allLocations = [];
      _floors = [];
      _zones = [];
    });
    try {
      final results = await Future.wait([
        _warehouseRepository.getWarehouseFloors(warehouseId),
        _locationRepository.getAvailableLocations(warehouseId: warehouseId),
        _locationRepository.getLocations(warehouseId: warehouseId),
        _zoneRepository.getZones(warehouseId: warehouseId),
      ]);
      final floors = results[0] as List<FloorApiModel>;
      final locations = results[1] as List<LocationApiModel>;
      final allLocations = results[2] as List<LocationApiModel>;
      final zones = results[3] as List<ZoneApiModel>;
      setState(() {
        _locations = locations;
        _allLocations = allLocations;
        _floors = floors;
        _loadingLocations = false;
        _loadingFloors = false;
        _loadingZones = false;
        _zones = zones;
      });
    } catch (e) {
      setState(() {
        _loadingLocations = false;
        _loadingFloors = false;
        _loadingZones = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to load warehouse layout: $e', style: GoogleFonts.inter()),
            backgroundColor: const Color(0xFFEF4444),
          ),
        );
      }
    }
  }

  Future<void> _openLocationPicker() async {
    final warehouse = _findWarehouse(_selectedWarehouseId);
    if (warehouse == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select a warehouse first', style: GoogleFonts.inter()),
          backgroundColor: const Color(0xFFEF4444),
        ),
      );
      return;
    }

    if (_floors.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('No floor layout found for this warehouse', style: GoogleFonts.inter()),
          backgroundColor: const Color(0xFFEF4444),
        ),
      );
      return;
    }

    final selected = await Navigator.of(context).push<SelectedGridCell>(
      MaterialPageRoute(
        builder: (context) => SelectChariotLocationPage(
          warehouseName: warehouse.name,
          warehouseLength: warehouse.length,
          warehouseWidth: warehouse.width,
          floors: _floors,
          availableLocations: _locations,
          allLocations: _allLocations,
          initialLocationId: _selectedLocationId,
        ),
      ),
    );

    if (selected != null && mounted) {
      final existing = _allLocations.where((location) {
        return location.floor == selected.floorId &&
            location.xCoord == selected.x &&
            location.yCoord == selected.y;
      }).cast<LocationApiModel?>().firstWhere((item) => item != null, orElse: () => null);

      setState(() {
        _selectedCell = selected;
        _selectedLocation = existing;
        _selectedLocationId = existing?.id;
      });
    }
  }

  ZoneApiModel? _pickZone(SelectedGridCell cell) {
    if (cell.mode == ChariotLocationMode.expedition) {
      for (final zone in _zones) {
        if (zone.zoneType == 'EXPEDITION') {
          return zone;
        }
      }
    } else {
      for (final zone in _zones) {
        if (zone.zoneType == 'VRAC') {
          return zone;
        }
      }
      for (final zone in _zones) {
        if (zone.zoneType == 'PICKING') {
          return zone;
        }
      }
    }
    return _zones.isNotEmpty ? _zones.first : null;
  }

  Future<ZoneApiModel?> _ensureZone(SelectedGridCell cell) async {
    final existing = _pickZone(cell);
    if (existing != null) {
      return existing;
    }

    final warehouseId = _selectedWarehouseId;
    if (warehouseId == null) {
      return null;
    }

    final zoneType = cell.mode == ChariotLocationMode.expedition
        ? 'EXPEDITION'
        : 'VRAC';
    final codePrefix = cell.mode == ChariotLocationMode.expedition
        ? 'EXP'
        : 'VRAC';
    final code = '$codePrefix-${warehouseId.substring(0, 6)}';
    final name = cell.mode == ChariotLocationMode.expedition
        ? 'Expedition Zone'
        : 'Storage Zone';

    final created = await _zoneRepository.createZone(
      warehouseId: warehouseId,
      code: code,
      name: name,
      zoneType: zoneType,
    );

    setState(() {
      _zones = [created, ..._zones];
    });

    return created;
  }

  String _floorCode(FloorApiModel floor) {
    if (floor.levelNumber == 0) {
      return '0A';
    }
    return floor.levelNumber.toString().padLeft(2, '0');
  }

  String _locationCode({
    required WarehouseApiModel warehouse,
    required FloorApiModel floor,
    required int x,
    required int y,
  }) {
    final row = (y + 1).toString().padLeft(2, '0');
    final col = (x + 1).toString().padLeft(2, '0');
    return '${warehouse.code}-${_floorCode(floor)}-$row-$col';
  }

  Future<LocationApiModel?> _ensureLocationForSelection() async {
    if (_selectedLocationId != null) {
      return _selectedLocation;
    }

    final cell = _selectedCell;
    final warehouse = _findWarehouse(_selectedWarehouseId);
    if (cell == null || warehouse == null) {
      return null;
    }

    FloorApiModel? floor;
    for (final item in _floors) {
      if (item.id == cell.floorId) {
        floor = item;
        break;
      }
    }
    if (floor == null) {
      return null;
    }

    final zone = await _ensureZone(cell);
    if (zone == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('No zone configured for this warehouse', style: GoogleFonts.inter()),
            backgroundColor: const Color(0xFFEF4444),
          ),
        );
      }
      return null;
    }

    final code = _locationCode(
      warehouse: warehouse,
      floor: floor,
      x: cell.x,
      y: cell.y,
    );

    final existingByCode = _allLocations
        .where((location) => location.code == code)
        .cast<LocationApiModel?>()
        .firstWhere((item) => item != null, orElse: () => null);
    if (existingByCode != null) {
      setState(() {
        _selectedLocation = existingByCode;
        _selectedLocationId = existingByCode.id;
        _selectedCell = null;
      });
      return existingByCode;
    }

    final payload = {
      'warehouse': warehouse.id,
      'floor': floor.id,
      'zone': zone.id,
      'code': code,
      'x_coord': cell.x,
      'y_coord': cell.y,
      'status': 'FREE',
      'is_active': true,
      'is_pallet_position': false,
      'capacity': 1.3,
      'max_pallets': 1,
    };

    final created = await _locationRepository.createLocation(payload);
    setState(() {
      _selectedLocation = created;
      _selectedLocationId = created.id;
      _selectedCell = null;
      _allLocations = [created, ..._allLocations];
    });
    return created;
  }

  Future<void> _saveChanges() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (_selectedWarehouseId == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select a warehouse', style: GoogleFonts.inter()),
          backgroundColor: const Color(0xFFEF4444),
        ),
      );
      return;
    }

    setState(() => _isSaving = true);

    try {
      if (_selectedLocationId == null && _selectedCell != null) {
        await _ensureLocationForSelection();
        if (_selectedLocationId == null) {
          setState(() => _isSaving = false);
          return;
        }
      }

      final request = ChariotUpdateRequest(
        code: _codeController.text.trim(),
        capacity: double.parse(_capacityController.text.trim()),
        status: _selectedStatus,
        warehouse: _selectedWarehouseId,
        currentLocation: _selectedLocationId,
        currentPosition: _selectedLocation?.code,
      );

      await _chariotRepository.updateChariot(widget.chariot.id, request);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Chariot updated successfully', style: GoogleFonts.inter()),
            backgroundColor: const Color(0xFF10B981),
          ),
        );
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      setState(() => _isSaving = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to update chariot: $e', style: GoogleFonts.inter()),
            backgroundColor: const Color(0xFFEF4444),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _codeController.dispose();
    _capacityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        title: Text(
          'Edit Chariot',
          style: GoogleFonts.manrope(
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
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Chariot ID Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF0093B2).withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF0093B2).withOpacity(0.2)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.local_shipping, color: Color(0xFF0093B2), size: 24),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Chariot ID',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: const Color(0xFF64748B),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          widget.chariot.code,
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: const Color(0xFF0F172A),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Chariot Code
            Text(
              'Chariot Code*',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _codeController,
              decoration: InputDecoration(
                hintText: 'e.g., CH-001',
                hintStyle: GoogleFonts.inter(color: const Color(0xFF94A3B8)),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF0093B2), width: 2),
                ),
                prefixIcon: const Icon(Icons.tag, color: Color(0xFF64748B)),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter chariot code';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Capacity
            Text(
              'Max Capacity (m³)*',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _capacityController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                hintText: 'e.g., 5.0',
                hintStyle: GoogleFonts.inter(color: const Color(0xFF94A3B8)),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFFE2E8F0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF0093B2), width: 2),
                ),
                prefixIcon: const Icon(Icons.inventory_2, color: Color(0xFF64748B)),
                suffixText: 'm³',
                suffixStyle: GoogleFonts.inter(color: const Color(0xFF64748B)),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter capacity';
                }
                final capacity = double.tryParse(value.trim());
                if (capacity == null || capacity <= 0) {
                  return 'Please enter a valid capacity';
                }
                return null;
              },
            ),
            const SizedBox(height: 16),

            // Status
            Text(
              'Status*',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: DropdownButtonFormField<String>(
                value: _selectedStatus,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  prefixIcon: const Icon(Icons.info_outline, color: Color(0xFF64748B)),
                ),
                items: _statuses.map((status) {
                  return DropdownMenuItem<String>(
                    value: status['value'],
                    child: Text(
                      status['label']!,
                      style: GoogleFonts.inter(fontSize: 16),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    setState(() => _selectedStatus = value);
                  }
                },
              ),
            ),
            const SizedBox(height: 16),

            // Warehouse
            Text(
              'Warehouse*',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: DropdownButtonFormField<String>(
                value: _selectedWarehouseId,
                decoration: InputDecoration(
                  hintText:
                      _loadingWarehouses ? 'Loading warehouses...' : 'Select warehouse',
                  hintStyle: GoogleFonts.inter(color: const Color(0xFF94A3B8)),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  prefixIcon: const Icon(Icons.warehouse, color: Color(0xFF64748B)),
                ),
                items: _warehouses.map((warehouse) {
                  return DropdownMenuItem<String>(
                    value: warehouse.id,
                    child: Text(
                      '${warehouse.name} (${warehouse.code})',
                      style: GoogleFonts.inter(fontSize: 16),
                    ),
                  );
                }).toList(),
                onChanged: _loadingWarehouses
                    ? null
                    : (value) {
                        setState(() {
                          _selectedWarehouseId = value;
                          _selectedLocationId = null;
                          _selectedLocation = null;
                        });
                        if (value != null) {
                          _loadWarehouseLayout(value);
                        }
                      },
              ),
            ),
            const SizedBox(height: 16),

            // Current Location
            Text(
              'Current Location',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Format: B7-0A-XX-YY (0A = ground floor, XX = row, YY = column)',
              style: GoogleFonts.inter(
                fontSize: 12,
                color: const Color(0xFF64748B),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OutlinedButton.icon(
                      onPressed: (_selectedWarehouseId == null || _loadingLocations || _loadingFloors || _loadingZones)
                          ? null
                          : _openLocationPicker,
                      icon: const Icon(Icons.grid_4x4, color: Color(0xFF0093B2)),
                      label: Text(
                        _selectedLocation == null ? 'Pick on grid' : 'Change location',
                        style: GoogleFonts.inter(color: const Color(0xFF0F172A)),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF0093B2)),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                      ),
                    ),
                    if (_selectedLocation != null || _selectedCell != null) ...[
                      const SizedBox(height: 8),
                      Text(
                        _selectedLocation != null
                            ? 'Selected: ${_selectedLocation!.code}'
                            : 'Selected cell: R${_selectedCell!.y + 1} C${_selectedCell!.x + 1}',
                        style: GoogleFonts.inter(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF0F172A),
                        ),
                      ),
                      if (_floorLabel((_selectedLocation?.floor ?? _selectedCell?.floorId)) != null)
                        Text(
                          _floorLabel(_selectedLocation?.floor ?? _selectedCell!.floorId)!,
                          style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF64748B)),
                        ),
                    ],
                    if (_selectedWarehouseId == null)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Select a warehouse first',
                          style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF94A3B8)),
                        ),
                      ),
                    if (_loadingLocations || _loadingFloors || _loadingZones)
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          'Loading layout...',
                          style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF94A3B8)),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 32),

            // Save Button
            ElevatedButton(
              onPressed: _isSaving ? null : _saveChanges,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0093B2),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
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
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

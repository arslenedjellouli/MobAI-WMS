import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/api/api_client.dart';
import '../../data/datasources/chariot_remote_datasource.dart';
import '../../data/repositories/chariot_repository_impl.dart';
import '../../data/models/chariot_api_models.dart';
import '../../../warehouse/data/datasources/warehouse_remote_datasource.dart';
import '../../../warehouse/data/repositories/location_repository_impl.dart';
import '../../../warehouse/data/models/location_api_models.dart';

class AddChariotPage extends StatefulWidget {
  const AddChariotPage({super.key});

  @override
  State<AddChariotPage> createState() => _AddChariotPageState();
}

class _AddChariotPageState extends State<AddChariotPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _capacityController = TextEditingController(text: '5.0');
  final TextEditingController _locationController = TextEditingController();

  late final ChariotRepositoryImpl _chariotRepository;
  late final LocationRepositoryImpl _locationRepository;

  String _selectedStatus = 'AVAILABLE';
  final List<Map<String, String>> _statuses = [
    {'value': 'AVAILABLE', 'label': 'Available'},
    {'value': 'IN_USE', 'label': 'In Use'},
    {'value': 'MAINTENANCE', 'label': 'Maintenance'},
    {'value': 'OUT_OF_SERVICE', 'label': 'Out of Service'},
  ];

  List<LocationApiModel> _locations = [];
  String? _selectedLocationId;
  bool _loadingLocations = false;

  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    final apiClient = ApiClient();
    
    final chariotDatasource = ChariotRemoteDatasourceImpl(apiClient: apiClient);
    _chariotRepository = ChariotRepositoryImpl(remoteDatasource: chariotDatasource);

    final locationDatasource = LocationRemoteDatasourceImpl(apiClient: apiClient);
    _locationRepository = LocationRepositoryImpl(remoteDatasource: locationDatasource);

    _loadLocations();
  }

  Future<void> _loadLocations() async {
    setState(() => _loadingLocations = true);
    try {
      final locations = await _locationRepository.getLocations();
      setState(() {
        _locations = locations;
        _loadingLocations = false;
      });
    } catch (e) {
      setState(() => _loadingLocations = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to load locations: $e', style: GoogleFonts.inter()),
            backgroundColor: const Color(0xFFEF4444),
          ),
        );
      }
    }
  }

  Future<void> _saveChariot() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isSaving = true);

    try {
      final request = ChariotCreateRequest(
        code: _codeController.text.trim(),
        type: _typeController.text.trim(),
        capacity: double.parse(_capacityController.text.trim()),
        status: _selectedStatus,
        currentLocation: _selectedLocationId,
      );

      await _chariotRepository.createChariot(request);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Chariot created successfully', style: GoogleFonts.inter()),
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
            content: Text('Failed to create chariot: $e', style: GoogleFonts.inter()),
            backgroundColor: const Color(0xFFEF4444),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _codeController.dispose();
    _typeController.dispose();
    _capacityController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        title: Text(
          'Add Chariot',
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

            // Type
            Text(
              'Type*',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: const Color(0xFF0F172A),
              ),
            ),
            const SizedBox(height: 8),
            TextFormField(
              controller: _typeController,
              decoration: InputDecoration(
                hintText: 'e.g., MANUAL, ELECTRIC, FORKLIFT',
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
                prefixIcon: const Icon(Icons.category, color: Color(0xFF64748B)),
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter chariot type';
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
              child: DropdownButtonFormField<String>(
                value: _selectedLocationId,
                decoration: InputDecoration(
                  hintText: _loadingLocations ? 'Loading locations...' : 'Select location (optional)',
                  hintStyle: GoogleFonts.inter(color: const Color(0xFF94A3B8)),
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  prefixIcon: const Icon(Icons.location_on, color: Color(0xFF64748B)),
                ),
                items: [
                  DropdownMenuItem<String>(
                    value: null,
                    child: Text('None', style: GoogleFonts.inter(fontSize: 16)),
                  ),
                  ..._locations.map((location) {
                    return DropdownMenuItem<String>(
                      value: location.id,
                      child: Text(
                        location.code,
                        style: GoogleFonts.inter(fontSize: 16),
                      ),
                    );
                  }).toList(),
                ],
                onChanged: _loadingLocations
                    ? null
                    : (value) {
                        setState(() => _selectedLocationId = value);
                      },
              ),
            ),
            const SizedBox(height: 32),

            // Save Button
            ElevatedButton(
              onPressed: _isSaving ? null : _saveChariot,
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
                      'Add Chariot',
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

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/api/api_client.dart';
import '../../data/datasources/user_remote_datasource.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../data/models/user_api_models.dart';
import '../../../warehouse/data/datasources/warehouse_remote_datasource.dart';
import '../../../warehouse/data/datasources/floor_remote_datasource.dart';
import '../../../warehouse/data/repositories/warehouse_repository_impl.dart';
import '../../../warehouse/data/models/warehouse_api_models.dart';

class AddUserPage extends StatefulWidget {
  const AddUserPage({super.key});

  @override
  State<AddUserPage> createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  late final UserRepositoryImpl _userRepository;
  late final WarehouseRepositoryImpl _warehouseRepository;

  String _selectedRole = 'EMPLOYEE';
  final List<Map<String, String>> _roles = [
    {'value': 'EMPLOYEE', 'label': 'Employee'},
    {'value': 'SUPERVISOR', 'label': 'Supervisor'},
  ];

  String? _selectedWarehouseId;
  List<WarehouseApiModel> _warehouses = [];
  bool _loadingWarehouses = false;

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isSaving = false;

  @override
  void initState() {
    super.initState();
    final apiClient = ApiClient();
    final userDatasource = UserRemoteDatasourceImpl(apiClient: apiClient);
    _userRepository = UserRepositoryImpl(remoteDatasource: userDatasource);

    final warehouseDatasource = WarehouseRemoteDatasourceImpl(apiClient: apiClient);
    final floorDatasource = FloorRemoteDatasourceImpl(apiClient: apiClient);
    _warehouseRepository = WarehouseRepositoryImpl(
      remoteDatasource: warehouseDatasource,
      floorDatasource: floorDatasource,
    );

    _loadWarehouses();
  }

  Future<void> _loadWarehouses() async {
    setState(() => _loadingWarehouses = true);
    try {
      final warehouses = await _warehouseRepository.getWarehouses();
      setState(() {
        _warehouses = warehouses;
        _loadingWarehouses = false;
      });
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

  void _generateRandomPassword() {
    final password = 'Pass@${DateTime.now().millisecondsSinceEpoch}';
    setState(() {
      _passwordController.text = password;
      _confirmPasswordController.text = password;
    });
  }

  Future<void> _saveUser() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() => _isSaving = true);

    try {
      final request = UserCreateRequest(
        email: _emailController.text.trim(),
        password: _passwordController.text,
        passwordConfirm: _confirmPasswordController.text,
        fullName: _nameController.text.trim(),
        role: _selectedRole,
        phone: _phoneController.text.trim(),
        status: 'ACTIVE',
        warehouseId: _selectedWarehouseId,
      );

      await _userRepository.createUser(request);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('User created successfully', style: GoogleFonts.inter()),
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
            content: Text('Failed to create user: $e', style: GoogleFonts.inter()),
            backgroundColor: const Color(0xFFEF4444),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
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
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildLabel('Full Name'),
              TextFormField(
                controller: _nameController,
                decoration: _inputDecoration('Enter full name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter full name';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),
              _buildLabel('Email'),
              TextFormField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: _inputDecoration('Enter email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),
              _buildLabel('Phone Number'),
              TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: _inputDecoration('Enter phone number (optional)'),
              ),

              const SizedBox(height: 16),
              _buildLabel('Role'),
              _buildRoleDropdown(),

              const SizedBox(height: 16),
              _buildLabel('Warehouse Assignment (Optional)'),
              _buildWarehouseDropdown(),

              const SizedBox(height: 16),
              _buildLabel('Password'),
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: _inputDecoration('Enter password').copyWith(
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                      color: const Color(0xFF94A3B8),
                    ),
                    onPressed: () {
                      setState(() => _obscurePassword = !_obscurePassword);
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter password';
                  }
                  if (value.length < 8) {
                    return 'Password must be at least 8 characters';
                  }
                  return null;
                },
              ),
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
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: _obscureConfirmPassword,
                decoration: _inputDecoration('Confirm password').copyWith(
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureConfirmPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                      color: const Color(0xFF94A3B8),
                    ),
                    onPressed: () {
                      setState(() => _obscureConfirmPassword = !_obscureConfirmPassword);
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm password';
                  }
                  if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 48),
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: _isSaving ? null : _saveUser,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF00796B),
                    disabledBackgroundColor: const Color(0xFF94A3B8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
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

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: GoogleFonts.manrope(color: const Color(0xFF94A3B8)),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
    );
  }

  Widget _buildRoleDropdown() {
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
              value: role['value'],
              child: Text(
                role['label']!,
                style: GoogleFonts.manrope(color: const Color(0xFF1E293B)),
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

  Widget _buildWarehouseDropdown() {
    if (_loadingWarehouses) {
      return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Center(
          child: SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              color: Color(0xFF0093B2),
              strokeWidth: 2,
            ),
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String?>(
          value: _selectedWarehouseId,
          isExpanded: true,
          hint: Text(
            'No warehouse assigned',
            style: GoogleFonts.manrope(color: const Color(0xFF94A3B8)),
          ),
          icon: const Icon(Icons.expand_more, color: Color(0xFF94A3B8)),
          items: [
            DropdownMenuItem<String?>(
              value: null,
              child: Text(
                'No warehouse',
                style: GoogleFonts.manrope(color: const Color(0xFF64748B)),
              ),
            ),
            ..._warehouses.map((warehouse) {
              return DropdownMenuItem<String?>(
                value: warehouse.id,
                child: Text(
                  '${warehouse.name} (${warehouse.code})',
                  style: GoogleFonts.manrope(color: const Color(0xFF1E293B)),
                ),
              );
            }),
          ],
          onChanged: (value) {
            setState(() => _selectedWarehouseId = value);
          },
        ),
      ),
    );
  }
}

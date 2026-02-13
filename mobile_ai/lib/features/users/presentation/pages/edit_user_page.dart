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

class EditUserPage extends StatefulWidget {
  final UserApiModel user;

  const EditUserPage({super.key, required this.user});

  @override
  State<EditUserPage> createState() => _EditUserPageState();
}

class _EditUserPageState extends State<EditUserPage> {
  late final UserRepositoryImpl _userRepository;
  late final WarehouseRepositoryImpl _warehouseRepository;

  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  late String _selectedRole;
  late String _selectedStatus;
  String? _selectedWarehouseId;

  final List<String> _roles = ['SUPERVISOR', 'EMPLOYEE'];
  final List<String> _statuses = ['ACTIVE', 'INACTIVE'];

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isAdminUser = false;

  List<WarehouseApiModel> _warehouses = [];
  bool _loadingWarehouses = false;
  bool _isSaving = false;
  bool _isDeleting = false;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.user.fullName);
    _emailController = TextEditingController(text: widget.user.email);
    _phoneController = TextEditingController(text: widget.user.phone ?? '');
    
    // Check if user is ADMIN
    _isAdminUser = widget.user.role == 'ADMIN';
    
    // Set role - if ADMIN, default to SUPERVISOR for the dropdown (won't be used)
    _selectedRole = _isAdminUser ? 'SUPERVISOR' : widget.user.role;
    _selectedStatus = widget.user.status;
    _selectedWarehouseId = widget.user.warehouseId;

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
    }
  }

  Future<void> _saveUser() async {
    setState(() => _isSaving = true);

    try {
      // Validate password match if password is provided
      if (_passwordController.text.isNotEmpty) {
        if (_passwordController.text != _confirmPasswordController.text) {
          throw Exception('Passwords do not match');
        }
        if (_passwordController.text.length < 8) {
          throw Exception('Password must be at least 8 characters');
        }
      }

      final request = UserUpdateRequest(
        email: _emailController.text.trim(),
        fullName: _nameController.text.trim(),
        role: _isAdminUser ? 'ADMIN' : _selectedRole, // Keep ADMIN role if user is admin
        status: _selectedStatus,
        phone: _phoneController.text.trim(),
        warehouseId: _selectedWarehouseId,
        password: _passwordController.text.isNotEmpty ? _passwordController.text : null,
        passwordConfirm: _confirmPasswordController.text.isNotEmpty ? _confirmPasswordController.text : null,
      );

      await _userRepository.updateUser(widget.user.id, request);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('User updated successfully', style: GoogleFonts.manrope()),
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
            content: Text('Failed to update user: $e', style: GoogleFonts.manrope()),
            backgroundColor: const Color(0xFFEF4444),
          ),
        );
      }
    }
  }

  Future<void> _deleteUser() async {
    setState(() => _isDeleting = true);

    try {
      await _userRepository.deleteUser(widget.user.id);

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('User deleted successfully', style: GoogleFonts.manrope()),
            backgroundColor: const Color(0xFF10B981),
          ),
        );
        Navigator.of(context).pop(true);
      }
    } catch (e) {
      setState(() => _isDeleting = false);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to delete user: $e', style: GoogleFonts.manrope()),
            backgroundColor: const Color(0xFFEF4444),
          ),
        );
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
            const Icon(Icons.warning_amber_rounded, color: Color(0xFFEF4444), size: 28),
            const SizedBox(width: 12),
            Text(
              'Delete User?',
              style: GoogleFonts.manrope(
                fontWeight: FontWeight.w700,
                fontSize: 18,
              ),
            ),
          ],
        ),
        content: Text(
          'Are you sure you want to delete ${widget.user.fullName}? This action cannot be undone and all associated data will be permanently removed.',
          style: GoogleFonts.manrope(
            color: const Color(0xFF64748B),
            fontSize: 14,
            height: 1.5,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: GoogleFonts.manrope(
                color: const Color(0xFF64748B),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: _isDeleting
                ? null
                : () {
                    Navigator.pop(context);
                    _deleteUser();
                  },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFEF4444),
              disabledBackgroundColor: const Color(0xFFEF4444).withOpacity(0.5),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
            child: _isDeleting
                ? const SizedBox(
                    height: 16,
                    width: 16,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : Text(
                    'Delete',
                    style: GoogleFonts.manrope(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        ],
      ),
    );
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
        actions: [
          IconButton(
            onPressed: _isDeleting ? null : _showDeleteConfirmation,
            icon: const Icon(Icons.delete_outline, color: Color(0xFFEF4444)),
            tooltip: 'Delete User',
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLabel('Full Name'),
            TextField(
              controller: _nameController,
              decoration: _inputDecoration('Enter full name'),
            ),

            const SizedBox(height: 16),
            _buildLabel('Email'),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: _inputDecoration('Enter email address'),
            ),

            const SizedBox(height: 16),
            _buildLabel('Phone Number'),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: _inputDecoration('Enter phone number'),
            ),

            const SizedBox(height: 16),
            _buildLabel('Role'),
            _isAdminUser
                ? TextField(
                    enabled: false,
                    decoration: _inputDecoration('Admin').copyWith(
                      fillColor: const Color(0xFFE2E8F0),
                      prefixIcon: const Icon(Icons.admin_panel_settings, color: Color(0xFF00796B)),
                    ),
                    style: GoogleFonts.manrope(
                      color: const Color(0xFF0F172A),
                      fontWeight: FontWeight.w600,
                    ),
                  )
                : _buildRoleDropdown(),

            const SizedBox(height: 16),
            _buildLabel('Status'),
            _buildStatusDropdown(),

            const SizedBox(height: 16),
            _buildLabel('Warehouse Assignment'),
            _buildWarehouseDropdown(),

            const SizedBox(height: 24),
            _buildLabel('Change Password (Optional)'),
            TextField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: _inputDecoration('Enter new password').copyWith(
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
            ),

            const SizedBox(height: 16),
            _buildLabel('Confirm New Password'),
            TextField(
              controller: _confirmPasswordController,
              obscureText: _obscureConfirmPassword,
              decoration: _inputDecoration('Confirm new password').copyWith(
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
              value: role,
              child: Text(
                role,
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

  Widget _buildStatusDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedStatus,
          isExpanded: true,
          icon: const Icon(Icons.expand_more, color: Color(0xFF94A3B8)),
          items: _statuses.map((status) {
            return DropdownMenuItem(
              value: status,
              child: Text(
                status == 'ACTIVE' ? 'Active' : 'Inactive',
                style: GoogleFonts.manrope(color: const Color(0xFF1E293B)),
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

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_ai/config/routes/app_routes.dart';

class UserManagementPage extends StatefulWidget {
  const UserManagementPage({super.key});

  @override
  State<UserManagementPage> createState() => _UserManagementPageState();
}

class _UserManagementPageState extends State<UserManagementPage> {
  String _selectedRole = 'All';
  final List<String> _roles = ['All', 'Supervisor', 'Employee'];

  // Mock Users
  final List<Map<String, dynamic>> _users = [
    {
      'id': '1',
      'name': 'John Doe',
      'email': 'john.doe@mobai.com',
      'role': 'Supervisor',
      'status': 'Active',
      'phone': '+213 555 123 456',
    },
    {
      'id': '2',
      'name': 'Jane Smith',
      'email': 'jane.smith@mobai.com',
      'role': 'Employee',
      'status': 'Active',
      'phone': '+213 555 987 654',
    },
    {
      'id': '3',
      'name': 'Bob Wilson',
      'email': 'bob.wilson@mobai.com',
      'role': 'Employee',
      'status': 'Disabled',
      'phone': '+213 555 555 555',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredUsers = _selectedRole == 'All'
        ? _users
        : _users.where((user) => user['role'] == _selectedRole).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: Text(
          'User Management',
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
      ),
      body: Column(
        children: [
          // Filter Section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            color: Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _roles.map((role) {
                  final isSelected = _selectedRole == role;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(
                        role,
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: isSelected ? Colors.white : const Color(0xFF64748B),
                        ),
                      ),
                      selected: isSelected,
                      selectedColor: const Color(0xFF0093B2),
                      backgroundColor: const Color(0xFFF1F5F9),
                      side: BorderSide.none,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      onSelected: (selected) {
                        if (selected) {
                          setState(() => _selectedRole = role);
                        }
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
          
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                final user = filteredUsers[index];
                return _UserCard(
                  user: user,
                  onTap: () {
                    // Navigate to Edit User
                    Navigator.pushNamed(
                      context, 
                      AppRoutes.editUser, 
                      arguments: user,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addUser); 
        },
        backgroundColor: const Color(0xFF0093B2),
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text(
          'Add User',
          style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }
}

class _UserCard extends StatelessWidget {
  final Map<String, dynamic> user;
  final VoidCallback onTap;

  const _UserCard({
    required this.user,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = user['status'] == 'Active';
    final Color statusColor = isActive ? const Color(0xFF10B981) : const Color(0xFFEF4444);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
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
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color(0xFFE0F2FE),
                  child: Text(
                    (user['name'] as String)[0],
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF0284C7),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user['name'],
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: const Color(0xFF0F172A),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        user['role'],
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          color: const Color(0xFF64748B),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        user['status'],
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: statusColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Icon(Icons.chevron_right, color: Color(0xFFCBD5E1)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

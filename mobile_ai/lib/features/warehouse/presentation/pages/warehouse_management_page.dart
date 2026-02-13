import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_ai/config/routes/app_routes.dart';

class WarehouseManagementPage extends StatefulWidget {
  const WarehouseManagementPage({super.key});

  @override
  State<WarehouseManagementPage> createState() => _WarehouseManagementPageState();
}

class _WarehouseManagementPageState extends State<WarehouseManagementPage> {
  String _selectedType = 'All';
  final List<String> _types = ['All', 'Distribution', 'Cold Storage'];

  // Mock Warehouses
  final List<Map<String, dynamic>> _warehouses = [
    {
      'id': '1',
      'name': 'Main Hub - Algiers',
      'type': 'Distribution',
      'floors': 3,
      'status': 'Active',
    },
    {
      'id': '2',
      'name': 'Oran Zone B',
      'type': 'Cold Storage',
      'floors': 1,
      'status': 'Active',
    },
    {
      'id': '3',
      'name': 'East Side Depot',
      'type': 'Distribution',
      'floors': 2,
      'status': 'Inactive',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredWarehouses = _selectedType == 'All'
        ? _warehouses
        : _warehouses.where((w) => w['type'] == _selectedType).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: Text(
          'Warehouses',
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
                children: _types.map((type) {
                  final isSelected = _selectedType == type;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(
                        type,
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
                          setState(() => _selectedType = type);
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
              itemCount: filteredWarehouses.length,
              itemBuilder: (context, index) {
                final warehouse = filteredWarehouses[index];
                return _WarehouseCard(
                  warehouse: warehouse,
                  onTap: () {
                    // Navigate to Edit Warehouse (Not implemented yet, just simulate for now)
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addWarehouse); 
        },
        backgroundColor: const Color(0xFF0093B2),
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text(
          'Add Warehouse',
          style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }
}

class _WarehouseCard extends StatelessWidget {
  final Map<String, dynamic> warehouse;
  final VoidCallback onTap;

  const _WarehouseCard({
    required this.warehouse,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = warehouse['status'] == 'Active';
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
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE2E8F0),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.warehouse_outlined, color: Color(0xFF64748B)),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        warehouse['name'],
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: const Color(0xFF0F172A),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${warehouse['type']} • ${warehouse['floors']} Floors',
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
                        warehouse['status'],
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

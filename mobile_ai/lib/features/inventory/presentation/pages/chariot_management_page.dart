import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_ai/config/routes/app_routes.dart';

class ChariotManagementPage extends StatefulWidget {
  const ChariotManagementPage({super.key});

  @override
  State<ChariotManagementPage> createState() => _ChariotManagementPageState();
}

class _ChariotManagementPageState extends State<ChariotManagementPage> {
  String _selectedStatus = 'All';
  final List<String> _statuses = ['All', 'Available', 'In Use', 'Maintenance'];

  // Mock Chariots
  final List<Map<String, dynamic>> _chariots = [
    {
      'id': '1',
      'identifier': 'CH-1001',
      'capacity': '500 kg',
      'status': 'Available',
    },
    {
      'id': '2',
      'identifier': 'CH-1002',
      'capacity': '300 kg',
      'status': 'In Use',
    },
    {
      'id': '3',
      'identifier': 'CH-1003',
      'capacity': '1000 kg',
      'status': 'Maintenance',
    },
    {
      'id': '4',
      'identifier': 'CH-1004',
      'capacity': '500 kg',
      'status': 'Available',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredChariots = _selectedStatus == 'All'
        ? _chariots
        : _chariots.where((c) => c['status'] == _selectedStatus).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: Text(
          'Vehicle Management',
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
                children: _statuses.map((status) {
                  final isSelected = _selectedStatus == status;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(
                        status,
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
                          setState(() => _selectedStatus = status);
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
              itemCount: filteredChariots.length,
              itemBuilder: (context, index) {
                final chariot = filteredChariots[index];
                return _ChariotCard(
                  chariot: chariot,
                  onTap: () {
                    // Navigate to Edit Chariot
                    Navigator.pushNamed(
                      context, 
                      AppRoutes.editChariot, 
                      arguments: chariot,
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
          Navigator.pushNamed(context, AppRoutes.addChariot); 
        },
        backgroundColor: const Color(0xFF0093B2),
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text(
          'Add Vehicle',
          style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }
}

class _ChariotCard extends StatelessWidget {
  final Map<String, dynamic> chariot;
  final VoidCallback onTap;

  const _ChariotCard({
    required this.chariot,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final status = chariot['status'];
    Color statusColor;
    Color statusBgColor;

    switch (status) {
      case 'Available':
        statusColor = const Color(0xFF10B981); // Emerald
        statusBgColor = const Color(0xFFDCFCE7);
        break;
      case 'In Use':
        statusColor = const Color(0xFF3B82F6); // Blue
        statusBgColor = const Color(0xFFDBEAFE);
        break;
      case 'Maintenance':
        statusColor = const Color(0xFFF59E0B); // Amber
        statusBgColor = const Color(0xFFFEF3C7);
        break;
      default:
        statusColor = const Color(0xFF64748B);
        statusBgColor = const Color(0xFFF1F5F9);
    }

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
                    color: const Color(0xFFF1F5F9),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: const Icon(Icons.shopping_cart_outlined, color: Color(0xFF64748B)),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        chariot['identifier'],
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: const Color(0xFF0F172A),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Max Capacity: ${chariot['capacity']}',
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
                        color: statusBgColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        status,
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

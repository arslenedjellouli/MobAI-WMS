import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditChariotPage extends StatefulWidget {
  final Map<String, dynamic> chariot;
  const EditChariotPage({super.key, required this.chariot});

  @override
  State<EditChariotPage> createState() => _EditChariotPageState();
}

class _EditChariotPageState extends State<EditChariotPage> {
  late TextEditingController _capacityController;
  late TextEditingController _identifierController;
  late String _status;

  @override
  void initState() {
    super.initState();
    _identifierController = TextEditingController(text: widget.chariot['identifier']);
    _capacityController = TextEditingController(text: (widget.chariot['capacity'] as String).replaceAll(' kg', ''));
    _status = widget.chariot['status'];
  }

  @override
  void dispose() {
    _identifierController.dispose();
    _capacityController.dispose();
    super.dispose();
  }

  void _showDeleteDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Row(
          children: [
            const Icon(Icons.delete_outline, color: Color(0xFFDC2626)),
            const SizedBox(width: 8),
            Text('Delete Vehicle?', style: GoogleFonts.manrope(fontWeight: FontWeight.w700)),
          ],
        ),
        content: Text(
          'Are you sure you want to delete ${_identifierController.text}? This action cannot be undone.',
          style: GoogleFonts.manrope(color: const Color(0xFF64748B)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel', style: GoogleFonts.manrope(color: const Color(0xFF64748B))),
          ),
          ElevatedButton(
            onPressed: () {
              // Delete logic
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Close page
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFDC2626),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            child: Text('Delete', style: GoogleFonts.manrope(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  void _showStatusDialog() {
    showDialog(
      context: context,
      builder: (context) {
        String tempStatus = _status;
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              title: Text('Change Status', style: GoogleFonts.manrope(fontWeight: FontWeight.w700)),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: ['Available', 'Maintenance'].map((s) {
                  return RadioListTile<String>(
                    title: Text(s),
                    value: s,
                    groupValue: tempStatus,
                    onChanged: (value) {
                      setState(() => tempStatus = value!);
                    },
                    activeColor: const Color(0xFF0093B2),
                  );
                }).toList(),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('Cancel', style: GoogleFonts.manrope(color: const Color(0xFF64748B))),
                ),
                ElevatedButton(
                  onPressed: () {
                    this.setState(() => _status = tempStatus); // Update parent state
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0093B2),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text('Update', style: GoogleFonts.manrope(color: Colors.white)),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isMaintenance = _status == 'Maintenance';
    bool isInUse = _status == 'In Use';

    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9), // Slate-100
      appBar: AppBar(
        title: Text(
          'Edit Vehicle',
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Vehicle Info Header with Actions
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Vehicle Info',
                  style: GoogleFonts.manrope(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF0F172A),
                  ),
                ),
                Row(
                  children: [
                    if (!isInUse) // Can't change status if In Use
                      IconButton(
                        icon: Icon(
                          Icons.build_circle_outlined,
                          color: isMaintenance ? const Color(0xFFF59E0B) : const Color(0xFF64748B),
                        ),
                        onPressed: _showStatusDialog,
                        tooltip: 'Change Status',
                      ),
                    IconButton(
                      icon: const Icon(Icons.delete_outline, color: Color(0xFFDC2626)),
                      onPressed: _showDeleteDialog,
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 12),
            _buildStatusBanner(),
            const SizedBox(height: 24),

            _buildLabel('Vehicle Identifier'),
            _buildTextField(_identifierController, 'Identifier', readOnly: true),

            const SizedBox(height: 16),
             _buildLabel('Maximum Capacity (kg)'),
            _buildTextField(_capacityController, '0.0', keyboardType: TextInputType.number),

            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  // Save Logic
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00796B), // Teal
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
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

  Widget _buildStatusBanner() {
    Color bgColor;
    Color borderColor;
    Color textColor;
    IconData icon;
    String text;

    switch (_status) {
      case 'Available':
        bgColor = const Color(0xFFDCFCE7);
        borderColor = const Color(0xFF86EFAC);
        textColor = const Color(0xFF166534);
        icon = Icons.check_circle_outline;
        text = 'Vehicle is available for use';
        break;
      case 'In Use':
        bgColor = const Color(0xFFDBEAFE);
        borderColor = const Color(0xFF93C5FD);
        textColor = const Color(0xFF1E40AF);
        icon = Icons.directions_boat_outlined; // Or similar movement icon
        text = 'Vehicle is currently in use';
        break;
      case 'Maintenance':
        bgColor = const Color(0xFFFEF3C7);
        borderColor = const Color(0xFFFCD34D);
        textColor = const Color(0xFFB45309);
        icon = Icons.warning_amber_rounded;
        text = 'Vehicle is under maintenance';
        break;
      default:
        return const SizedBox.shrink();
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor, 
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: borderColor), 
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: textColor),
          const SizedBox(width: 8),
          Text(
            text,
            style: GoogleFonts.manrope(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: textColor, 
            ),
          ),
        ],
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
    bool readOnly = false,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      readOnly: readOnly,
      style: GoogleFonts.manrope(
        color: readOnly ? const Color(0xFF64748B) : const Color(0xFF0F172A),
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.manrope(color: const Color(0xFF94A3B8)),
        filled: true,
        fillColor: readOnly ? const Color(0xFFF1F5F9) : Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      ),
    );
  }
}

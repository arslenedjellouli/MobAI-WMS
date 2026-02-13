import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_ai/config/routes/app_routes.dart';

class ProductManagementPage extends StatefulWidget {
  const ProductManagementPage({super.key});

  @override
  State<ProductManagementPage> createState() => _ProductManagementPageState();
}

class _ProductManagementPageState extends State<ProductManagementPage> {
  String _selectedFrequency = 'All';
  final List<String> _frequencies = ['All', 'High', 'Medium', 'Low'];

  // Mock Products
  final List<Map<String, dynamic>> _products = [
    {
      'id': '1',
      'name': 'Premium Coffee Beans',
      'sku': 'COF-001',
      'frequency': 'High',
      'weight': '1 kg',
      'max_pallet_weight': '500 kg',
      'image': 'assets/coffee.png', 
      'status': 'Active',
    },
    {
      'id': '2',
      'name': 'Organic Green Tea',
      'sku': 'TEA-002',
      'frequency': 'Medium',
      'weight': '0.5 kg',
      'max_pallet_weight': '300 kg',
      'image': 'assets/tea.png',
      'status': 'Active',
    },
    {
      'id': '3',
      'name': 'Dark Chocolate',
      'sku': 'CHO-003',
      'frequency': 'Low',
      'weight': '0.2 kg',
      'max_pallet_weight': '200 kg',
      'image': 'assets/chocolate.png',
      'status': 'Discontinued',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredProducts = _selectedFrequency == 'All'
        ? _products
        : _products.where((p) => p['frequency'] == _selectedFrequency).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: Text(
          'Product Management',
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
                children: _frequencies.map((freq) {
                  final isSelected = _selectedFrequency == freq;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: ChoiceChip(
                      label: Text(
                        freq,
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
                          setState(() => _selectedFrequency = freq);
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
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return _ProductCard(
                  product: product,
                  onTap: () {
                    // Navigate to Edit Product
                    Navigator.pushNamed(
                      context, 
                      AppRoutes.editProduct, 
                      arguments: product,
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
          Navigator.pushNamed(context, AppRoutes.addProduct); 
        },
        backgroundColor: const Color(0xFF0093B2),
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text(
          'Add Product',
          style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final Map<String, dynamic> product;
  final VoidCallback onTap;

  const _ProductCard({
    required this.product,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final bool isActive = product['status'] == 'Active';
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
                    // In a real app, use Image.network or Image.asset
                  ),
                  child: const Icon(Icons.inventory_2_outlined, color: Color(0xFF64748B)),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product['name'],
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: const Color(0xFF0F172A),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'SKU: ${product['sku']}',
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
                        product['status'],
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

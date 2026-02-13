import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';
import '../../data/models/warehouse_models.dart';
import '../widgets/warehouse_grid.dart'; // Ensure correct import

class AddWarehousePage extends StatefulWidget {
  const AddWarehousePage({super.key});

  @override
  State<AddWarehousePage> createState() => _AddWarehousePageState();
}

class _AddWarehousePageState extends State<AddWarehousePage> {
  final int _gridRows = 20;
  final int _gridCols = 20;
  final double _cellSize = 40.0;
  
  // State
  int _currentFloorIndex = 0;
  List<WarehouseFloor> _floors = [];
  WarehouseItemType? _selectedTool;
  
  // Limits
  final int _maxLiftPerFloor = 1;
  final int _maxGoodsLift = 2;
  final int _maxVracGround = 1;
  final int _maxOfficeGround = 1;

  @override
  void initState() {
    super.initState();
    // Initialize Ground Floor
    _floors.add(WarehouseFloor(level: 0, items: []));
  }

  void _addFloor({bool duplicate = false}) {
    setState(() {
      int newLevel = _floors.length;
      List<GridItem> newItems = [];

      if (duplicate) {
         // Deep copy items from current floor
         final currentItems = _floors[_currentFloorIndex].items;
         newItems = currentItems.map((item) => item.copyWith(id: const Uuid().v4())).toList();
      } else {
        // Automatically copy Lifts from Ground Floor (fixed positions)
        // Wait, requirements say: "automatically lifts are fixed in the previous floors position"
        // Let's copy lifts from the floor below (or ground floor specifically if they must align with ground)
        // Usually aligned vertically from ground up.
        
        final groundFloorItems = _floors[0].items;
        for (var item in groundFloorItems) {
          if (item.type == WarehouseItemType.lift || item.type == WarehouseItemType.goodsLift) {
             newItems.add(item.copyWith(id: const Uuid().v4()));
          }
        }
      }

      _floors.add(WarehouseFloor(level: newLevel, items: newItems));
      _currentFloorIndex = newLevel;
    });
  }

  void _deleteFloor() {
    if (_floors.length <= 1) return; // Cannot delete ground floor
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Floor'),
        content: const Text('Are you sure you want to delete this floor?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              setState(() {
                _floors.removeAt(_currentFloorIndex);
                if (_currentFloorIndex >= _floors.length) {
                  _currentFloorIndex = _floors.length - 1;
                }
              });
              Navigator.pop(context);
            }, 
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void _onCellTap(int x, int y) {
    if (_selectedTool == null) return;

    // Check overlaps
    final newItemWidth = _selectedTool!.defaultWidth;
    final newItemHeight = _selectedTool!.defaultHeight;

    // Boundary check
    if (x + newItemWidth > _gridCols || y + newItemHeight > _gridRows) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Item does not fit here')),
      );
      return;
    }

    // Collision check
    bool collides = false;
    for (var item in _floors[_currentFloorIndex].items) {
      // Check intersection
      bool xOverlap = (x < item.x + item.width) && (x + newItemWidth > item.x);
      bool yOverlap = (y < item.y + item.height) && (y + newItemHeight > item.y);
      if (xOverlap && yOverlap) {
        collides = true;
        break;
      }
    }

    if (collides) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Space is occupied')),
      );
      return;
    }
    
    // Constraints Check
    if (!_checkConstraints(_selectedTool!)) return;

    // Add Item
    setState(() {
      _floors[_currentFloorIndex].items.add(GridItem(
        id: const Uuid().v4(),
        type: _selectedTool!,
        x: x,
        y: y,
        width: newItemWidth,
        height: newItemHeight,
      ));
    });
  }

  void _onItemTap(String id) {
    // For now, just delete on tap or show options
    // Let's make it delete for simplicity or show a small dialog
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Remove Item'),
        content: const Text('Remove this item from the layout?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(
            onPressed: () {
              setState(() {
                _floors[_currentFloorIndex].items.removeWhere((i) => i.id == id);
              });
              Navigator.pop(context);
            },
            child: const Text('Remove', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  bool _checkConstraints(WarehouseItemType type) {
    final items = _floors[_currentFloorIndex].items;
    final level = _currentFloorIndex;

    // Ground Floor Constraints
    if (level == 0) {
       // All allowed
    } else {
       // Upper Floor Constraints
       if (type == WarehouseItemType.vrac || 
           type == WarehouseItemType.office || 
           type == WarehouseItemType.shippingArea ||
           type == WarehouseItemType.rackStorage) {
         
         ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text('${type.label} is only allowed on the Ground Floor')),
         );
         return false;
       }
    }

    // Count Constraints
    if (type == WarehouseItemType.lift) {
      int count = items.where((i) => i.type == WarehouseItemType.lift).length;
      if (count >= _maxLiftPerFloor) {
         ScaffoldMessenger.of(context).showSnackBar(
           const SnackBar(content: Text('Max 1 Lift per floor')),
         );
         return false;
      }
    }

    if (type == WarehouseItemType.goodsLift) {
      int count = items.where((i) => i.type == WarehouseItemType.goodsLift).length;
      if (count >= _maxGoodsLift) {
         ScaffoldMessenger.of(context).showSnackBar(
           const SnackBar(content: Text('Max 2 Goods Lifts per floor')),
         );
         return false;
      }
    }

    if (level == 0) {
      if (type == WarehouseItemType.vrac) {
        int count = items.where((i) => i.type == WarehouseItemType.vrac).length;
        if (count >= _maxVracGround) {
           ScaffoldMessenger.of(context).showSnackBar(
             const SnackBar(content: Text('Max 1 VRAC area in Ground Floor')),
           );
           return false;
        }
      }
      if (type == WarehouseItemType.office) {
        int count = items.where((i) => i.type == WarehouseItemType.office).length;
        if (count >= _maxOfficeGround) {
           ScaffoldMessenger.of(context).showSnackBar(
             const SnackBar(content: Text('Max 1 Office in Ground Floor')),
           );
           return false;
        }
      }
    }

    return true;
  }

  void _showAddFloorDialog() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Add a Floor', style: GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.bold)),
                  IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(context)),
                ],
              ),
              const SizedBox(height: 24),
              ListTile(
                leading: const Icon(Icons.file_copy_outlined, color: Color(0xFF0093B2)),
                title: Text('Duplicate Current Floor', style: GoogleFonts.manrope(fontWeight: FontWeight.w600)),
                trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                onTap: () {
                  Navigator.pop(context);
                  _addFloor(duplicate: true);
                },
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.add_box_outlined, color: Color(0xFF0093B2)),
                title: Text('Empty Floor', style: GoogleFonts.manrope(fontWeight: FontWeight.w600)),
                trailing: const Icon(Icons.chevron_right, color: Colors.grey),
                onTap: () {
                  Navigator.pop(context);
                  _addFloor(duplicate: false);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _saveLayout() {
    TextEditingController nameController = TextEditingController();
    bool isTemplate = false;

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Save Warehouse Layout', style: GoogleFonts.manrope(fontSize: 18, fontWeight: FontWeight.bold)),
              IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(context)),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Review your warehouse configuration before saving'),
              const SizedBox(height: 16),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name: Warehouse Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Floors: ${_floors.length}', style: const TextStyle(fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 16),
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Save as reusable template', style: GoogleFonts.manrope(fontSize: 14, color: Colors.grey)),
                value: isTemplate,
                onChanged: (val) => setState(() => isTemplate = val!),
                controlAffinity: ListTileControlAffinity.leading,
              ),
            ],
          ),
          actions: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Save Logic
                  Navigator.pop(context); // Close dialog
                  Navigator.pop(context); // Close page
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00796B),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Save', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isGround = _currentFloorIndex == 0;
    
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        title: Text('Add A Warehouse', style: GoogleFonts.manrope(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // 1. Grid Area (Expanded)
          Expanded(
            child: WarehouseGridWidget(
              rows: _gridRows,
              columns: _gridCols,
              cellSize: _cellSize,
              items: _floors.isNotEmpty ? _floors[_currentFloorIndex].items : [],
              onCellTap: _onCellTap,
              onItemTap: _onItemTap,
            ),
          ),
          
          // 2. Floor Controls
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  isGround ? 'Ground Floor' : '${_formatOrdinal(_currentFloorIndex + 1)} Floor',
                  style: GoogleFonts.manrope(fontSize: 20, fontWeight: FontWeight.bold, color: const Color(0xFF64748B)),
                ),
                if (!isGround)
                   TextButton(
                     onPressed: _deleteFloor,
                     child: Text('Delete Floor', style: GoogleFonts.manrope(color: Colors.red, fontWeight: FontWeight.bold)),
                   ),
                TextButton(
                  onPressed: _showAddFloorDialog,
                  child: Text('Add a Floor', style: GoogleFonts.manrope(color: const Color(0xFF00796B), fontWeight: FontWeight.bold)),
                ),
              ],
            ),
          ),
          

          // 3. Status/Pagination Area
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_floors.length, (index) {
                return GestureDetector(
                   onTap: () => setState(() => _currentFloorIndex = index),
                   child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentFloorIndex == index ? const Color(0xFF0093B2) : const Color(0xFFE2E8F0),
                    ),
                   ),
                );
              }),
            ),
          ),

          // 4. Tool Palette (Scrollable Row/Wrap)
          Container(
            height: 120, // Height for 2 rows of buttons approx
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 12,
                runSpacing: 12,
                children: WarehouseItemType.values.where((type) {
                  // Filter logic based on floor level
                   if (isGround) {
                     // Ground floor: All except FloorStorage
                     return type != WarehouseItemType.floorStorage;
                   } else {
                     // Upper floors: Only Lift, GoodsLift, FloorStorage, Office(Maybe)
                     // Constraint logic: "VRAC, office and shipping area exist only in the ground floor"
                     return type == WarehouseItemType.floorStorage || 
                            type == WarehouseItemType.lift || 
                            type == WarehouseItemType.goodsLift ||
                            type == WarehouseItemType.office; // Image shows office is possible
                   }
                }).map((type) {
                  final isSelected = _selectedTool == type;
                  return GestureDetector(
                    onTap: () {
                       setState(() {
                         _selectedTool = type;
                       });
                    },
                    child: Container(
                       width: (MediaQuery.of(context).size.width - 60) / 3, // 3 items per row approx
                       height: 40,
                       alignment: Alignment.center,
                       decoration: BoxDecoration(
                         color: isSelected ? _getColorForItem(type).withOpacity(0.2) : Colors.white,
                         borderRadius: BorderRadius.circular(8),
                         border: Border.all(
                           color: isSelected ? _getColorForItem(type) : const Color(0xFFE2E8F0),
                           width: isSelected ? 2 : 1,
                         ),
                       ),
                       child: Text(
                         type.label,
                         style: GoogleFonts.manrope(
                           fontSize: 12,
                           fontWeight: FontWeight.w600,
                           color: const Color(0xFF1E293B),
                         ),
                         textAlign: TextAlign.center,
                       ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          // 5. Action Buttons (Save/Cancel)
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(top: BorderSide(color: Color(0xFFF1F5F9))),
            ),
            child: Column(
              children: [
                if (!isGround)
                  TextButton(
                    onPressed: _deleteFloor, 
                    child: Text('Delete Floor', style: GoogleFonts.manrope(color: Colors.red, fontWeight: FontWeight.bold)),
                  ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: _saveLayout,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF006978),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text('Save Layout', style: GoogleFonts.manrope(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.transparent), // Border handled by shape? No, transparent border
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      backgroundColor: const Color(0xFFF1F5F9), // Light background like in design
                    ),
                    child: Text('Cancel', style: GoogleFonts.manrope(fontSize: 16, fontWeight: FontWeight.bold, color: const Color(0xFF006978))),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper method moved outside build
  Color _getColorForItem(WarehouseItemType type) {
    switch (type) {
      case WarehouseItemType.rackStorage:
        return const Color(0xFFE879F9); // Pink-400
      case WarehouseItemType.office:
        return const Color(0xFFFDE047); // Yellow-300
      case WarehouseItemType.goodsLift:
        return const Color(0xFFA855F7); // Purple-500
      case WarehouseItemType.lift:
        return const Color(0xFF38BDF8); // Sky-400
      case WarehouseItemType.vrac:
        return const Color(0xFFFB7185); // Rose-400
      case WarehouseItemType.shippingArea:
        return const Color(0xFF4ADE80); // Green-400
      case WarehouseItemType.floorStorage:
        return const Color(0xFF94A3B8); // Slate-400
      default:
        return Colors.grey;
    }
  }

  String _formatOrdinal(int number) {
     if (number == 1) return '1st';
     if (number == 2) return '2nd';
     if (number == 3) return '3rd';
     return '${number}th';
  }
}

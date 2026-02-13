import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uuid/uuid.dart';
import '../../data/models/warehouse_models.dart';
import '../widgets/warehouse_grid.dart';

class WarehouseStructurePage extends StatefulWidget {
  final String warehouseName;
  final double floorLength;
  final double floorWidth;
  final double floorHeight;
  final List<WarehouseFloor>? existingFloors;

  const WarehouseStructurePage({
    super.key,
    required this.warehouseName,
    required this.floorLength,
    required this.floorWidth,
    required this.floorHeight,
    this.existingFloors,
  });

  @override
  State<WarehouseStructurePage> createState() => _WarehouseStructurePageState();
}

class _WarehouseStructurePageState extends State<WarehouseStructurePage> {
  late int _gridRows;
  late int _gridCols;
  final double _cellSize = 40.0;
  
  // State
  int _currentFloorIndex = 0;
  List<WarehouseFloor> _floors = [];
  WarehouseItemType? _selectedTool;
  String? _selectedItemId; // For resizing existing items
  
  // Custom size for adjustable items
  int _customWidth = 1;
  int _customHeight = 1;
  
  // Limits
  final int _maxLiftPerFloor = 1;
  final int _maxGoodsLift = 2;
  final int _maxVracGround = 1;
  final int _maxOfficeGround = 1;
  final int _maxFloors = 4;

  @override
  void initState() {
    super.initState();
    // Calculate grid size based on floor dimensions (in meters)
    _gridCols = widget.floorLength.round();
    _gridRows = widget.floorWidth.round();
    
    // Initialize floors
    if (widget.existingFloors != null && widget.existingFloors!.isNotEmpty) {
      _floors = widget.existingFloors!;
    } else {
      // Initialize Ground Floor + 1st Storage Floor by default
      _floors.add(WarehouseFloor(level: 0, items: [])); // Ground floor
      _floors.add(WarehouseFloor(level: 1, items: [])); // 1st storage floor
    }
  }

  void _addFloor({bool duplicate = false}) {
    // Check max floors limit
    if (_floors.length >= _maxFloors) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Maximum 4 floors allowed')),
      );
      return;
    }
    
    setState(() {
      int newLevel = _floors.length;
      List<GridItem> newItems = [];

      if (duplicate) {
         // Duplicate current floor (but not ground floor)
         if (_currentFloorIndex == 0) {
           ScaffoldMessenger.of(context).showSnackBar(
             const SnackBar(content: Text('Cannot duplicate ground floor')),
           );
           return;
         }
         final currentItems = _floors[_currentFloorIndex].items;
         newItems = currentItems.map((item) => item.copyWith(id: const Uuid().v4())).toList();
      } else {
        // Empty floor - automatically copy Lifts from Ground Floor (fixed positions)
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
    // Cannot delete ground floor or first storage floor
    if (_currentFloorIndex <= 1) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cannot delete ground floor or first storage floor')),
      );
      return;
    }
    
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
                // Reassign floor levels
                for (int i = 0; i < _floors.length; i++) {
                  _floors[i] = WarehouseFloor(level: i, items: _floors[i].items);
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

    // Use custom size if item is adjustable, otherwise use default
    final newItemWidth = _selectedTool!.isAdjustable ? _customWidth : _selectedTool!.defaultWidth;
    final newItemHeight = _selectedTool!.isAdjustable ? _customHeight : _selectedTool!.defaultHeight;

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
    setState(() {
      _selectedItemId = id;
      _selectedTool = null; // Deselect tool when selecting item
    });
    
    final item = _floors[_currentFloorIndex].items.firstWhere((i) => i.id == id);
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('${item.type.label} Options'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (item.type.isAdjustable) ...[
              Text('Resize Item', style: GoogleFonts.manrope(fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Width',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      controller: TextEditingController(text: item.width.toString()),
                      onChanged: (value) {
                        final newWidth = int.tryParse(value) ?? item.width;
                        if (newWidth > 0 && newWidth <= _gridCols) {
                          setState(() {
                            final itemIndex = _floors[_currentFloorIndex].items.indexWhere((i) => i.id == id);
                            _floors[_currentFloorIndex].items[itemIndex] = item.copyWith(width: newWidth);
                          });
                        }
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        labelText: 'Height',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      controller: TextEditingController(text: item.height.toString()),
                      onChanged: (value) {
                        final newHeight = int.tryParse(value) ?? item.height;
                        if (newHeight > 0 && newHeight <= _gridRows) {
                          setState(() {
                            final itemIndex = _floors[_currentFloorIndex].items.indexWhere((i) => i.id == id);
                            _floors[_currentFloorIndex].items[itemIndex] = item.copyWith(height: newHeight);
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
            const Divider(),
            ListTile(
              leading: const Icon(Icons.delete, color: Colors.red),
              title: const Text('Remove Item'),
              onTap: () {
                setState(() {
                  _floors[_currentFloorIndex].items.removeWhere((item) => item.id == id);
                  _selectedItemId = null;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() => _selectedItemId = null);
              Navigator.pop(context);
            },
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  bool _checkConstraints(WarehouseItemType type) {
    final level = _floors[_currentFloorIndex].level;
    final items = _floors[_currentFloorIndex].items;

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
    // TODO: Save layout and return to previous page
    Navigator.pop(context, _floors);
  }

  void _previousFloor() {
    if (_currentFloorIndex > 0) {
      setState(() => _currentFloorIndex--);
    }
  }

  void _nextFloor() {
    if (_currentFloorIndex < _floors.length - 1) {
      setState(() => _currentFloorIndex++);
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isGround = _currentFloorIndex == 0;
    
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9),
      appBar: AppBar(
        title: Text('${widget.warehouseName} - Structure', style: GoogleFonts.manrope(color: Colors.black, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
      ),
      body: Column(
        children: [
          // Grid dimensions info
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.info_outline, size: 16, color: Color(0xFF64748B)),
                const SizedBox(width: 8),
                Text(
                  'Grid: ${_gridCols}m × ${_gridRows}m (${_gridCols * _gridRows} m²)',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: const Color(0xFF64748B),
                  ),
                ),
              ],
            ),
          ),
          
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
          
          // 2. Floor Controls with arrows
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Previous arrow
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF0093B2)),
                  onPressed: _currentFloorIndex > 0 ? _previousFloor : null,
                ),
                
                // Floor title and controls
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        isGround ? 'Ground Floor' : '${_formatOrdinal(_currentFloorIndex)} Floor',
                        style: GoogleFonts.manrope(fontSize: 20, fontWeight: FontWeight.bold, color: const Color(0xFF64748B)),
                      ),
                      if (_currentFloorIndex > 1) ...[
                        const SizedBox(width: 16),
                        TextButton(
                          onPressed: _deleteFloor,
                          child: Text('Delete', style: GoogleFonts.manrope(color: Colors.red, fontWeight: FontWeight.bold)),
                        ),
                      ],
                      // Only show Add Floor button on storage floors
                      if (!isGround && _floors.length < _maxFloors) ...[
                        const SizedBox(width: 16),
                        TextButton(
                          onPressed: _showAddFloorDialog,
                          child: Text('Add Floor', style: GoogleFonts.manrope(color: const Color(0xFF00796B), fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ],
                  ),
                ),
                
                // Next arrow
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, color: Color(0xFF0093B2)),
                  onPressed: _currentFloorIndex < _floors.length - 1 ? _nextFloor : null,
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
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Size controls for adjustable items
                if (_selectedTool != null && _selectedTool!.isAdjustable)
                  Container(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Size:', style: GoogleFonts.manrope(fontWeight: FontWeight.w600)),
                        const SizedBox(width: 16),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed: _customWidth > 1 ? () => setState(() => _customWidth--) : null,
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                            Container(
                              width: 40,
                              alignment: Alignment.center,
                              child: Text('$_customWidth', style: GoogleFonts.manrope(fontSize: 16, fontWeight: FontWeight.bold)),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline),
                              onPressed: _customWidth < _gridCols ? () => setState(() => _customWidth++) : null,
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                          ],
                        ),
                        const SizedBox(width: 8),
                        const Text('×'),
                        const SizedBox(width: 8),
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed: _customHeight > 1 ? () => setState(() => _customHeight--) : null,
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                            Container(
                              width: 40,
                              alignment: Alignment.center,
                              child: Text('$_customHeight', style: GoogleFonts.manrope(fontSize: 16, fontWeight: FontWeight.bold)),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add_circle_outline),
                              onPressed: _customHeight < _gridRows ? () => setState(() => _customHeight++) : null,
                              padding: EdgeInsets.zero,
                              constraints: const BoxConstraints(),
                            ),
                          ],
                        ),
                        Text(' m', style: GoogleFonts.manrope(fontSize: 12, color: const Color(0xFF64748B))),
                      ],
                    ),
                  ),
                // Tool buttons
                SingleChildScrollView(
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
                     // Upper floors: Only Lift, GoodsLift, FloorStorage, Office
                     return type == WarehouseItemType.floorStorage || 
                            type == WarehouseItemType.lift || 
                            type == WarehouseItemType.goodsLift ||
                            type == WarehouseItemType.office;
                   }
                }).map((type) {
                  final isSelected = _selectedTool == type;
                  return GestureDetector(
                    onTap: () {
                       setState(() {
                         _selectedTool = type;
                         _selectedItemId = null;
                         // Reset custom size to default when selecting new tool
                         _customWidth = type.defaultWidth;
                         _customHeight = type.defaultHeight;
                       });
                    },
                    child: Container(
                       width: (MediaQuery.of(context).size.width - 60) / 3,
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
          ],
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
                      side: const BorderSide(color: Colors.transparent),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      backgroundColor: const Color(0xFFF1F5F9),
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

  Color _getColorForItem(WarehouseItemType type) {
    switch (type) {
      case WarehouseItemType.rackStorage:
        return const Color(0xFFE879F9);
      case WarehouseItemType.office:
        return const Color(0xFFFDE047);
      case WarehouseItemType.goodsLift:
        return const Color(0xFFA855F7);
      case WarehouseItemType.lift:
        return const Color(0xFF38BDF8);
      case WarehouseItemType.vrac:
        return const Color(0xFFFB7185);
      case WarehouseItemType.shippingArea:
        return const Color(0xFF4ADE80);
      case WarehouseItemType.floorStorage:
        return const Color(0xFF94A3B8);
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

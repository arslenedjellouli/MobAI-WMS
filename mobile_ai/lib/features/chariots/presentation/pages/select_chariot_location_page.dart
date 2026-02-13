import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../warehouse/data/models/location_api_models.dart';
import '../../../warehouse/data/models/warehouse_api_models.dart';
import '../../../warehouse/data/models/warehouse_models.dart';

enum ChariotLocationMode {
  expedition,
  storage,
}

class SelectedGridCell {
  final String floorId;
  final int x;
  final int y;
  final ChariotLocationMode mode;

  SelectedGridCell({
    required this.floorId,
    required this.x,
    required this.y,
    required this.mode,
  });
}

class SelectChariotLocationPage extends StatefulWidget {
  final String warehouseName;
  final double warehouseLength;
  final double warehouseWidth;
  final List<FloorApiModel> floors;
  final List<LocationApiModel> availableLocations;
  final List<LocationApiModel> allLocations;
  final String? initialLocationId;

  const SelectChariotLocationPage({
    super.key,
    required this.warehouseName,
    required this.warehouseLength,
    required this.warehouseWidth,
    required this.floors,
    required this.availableLocations,
    required this.allLocations,
    this.initialLocationId,
  });

  @override
  State<SelectChariotLocationPage> createState() => _SelectChariotLocationPageState();
}

class _SelectChariotLocationPageState extends State<SelectChariotLocationPage> {
  static const double _cellSize = 36.0;

  FloorApiModel? _selectedFloor;
  SelectedGridCell? _selectedCell;
  ChariotLocationMode _mode = ChariotLocationMode.storage;

  @override
  void initState() {
    super.initState();

    final groundFloor = _groundFloor;
    if (groundFloor != null) {
      _mode = ChariotLocationMode.expedition;
      _selectedFloor = groundFloor;
      _selectedCell = _firstExpeditionCell(groundFloor);
    } else if (widget.floors.isNotEmpty) {
      _selectedFloor = widget.floors.first;
    }

    if (widget.initialLocationId != null) {
      final initialLocation = widget.availableLocations
          .where((location) => location.id == widget.initialLocationId)
          .cast<LocationApiModel?>()
          .firstWhere((location) => location != null, orElse: () => null);

      if (initialLocation != null) {
        final floorMatch = widget.floors
            .where((floor) => floor.id == initialLocation.floor)
            .cast<FloorApiModel?>()
            .firstWhere((floor) => floor != null, orElse: () => null);
        if (floorMatch != null) {
          _selectedFloor = floorMatch;
          _mode = floorMatch.levelNumber == 0
              ? ChariotLocationMode.expedition
              : ChariotLocationMode.storage;
          if (initialLocation.xCoord != null && initialLocation.yCoord != null) {
            _selectedCell = SelectedGridCell(
              floorId: floorMatch.id,
              x: initialLocation.xCoord!,
              y: initialLocation.yCoord!,
              mode: _mode,
            );
          }
        }
      }
    }
  }

  FloorApiModel? get _groundFloor {
    if (widget.floors.isEmpty) {
      return null;
    }
    FloorApiModel? ground;
    for (final floor in widget.floors) {
      if (floor.levelNumber == 0) {
        return floor;
      }
      ground ??= floor;
      if (ground != null && floor.levelNumber < ground.levelNumber) {
        ground = floor;
      }
    }
    return ground;
  }

  List<FloorApiModel> get _storageFloors {
    return widget.floors.where((floor) => floor.levelNumber > 0).toList();
  }

  Set<String> _expeditionCells(FloorApiModel floor) {
    final cells = <String>{};
    for (final item in floor.gridItems) {
      if (item.itemType != 'SHIPPING_AREA') {
        continue;
      }
      for (int x = item.x; x < item.x + item.width; x++) {
        for (int y = item.y; y < item.y + item.height; y++) {
          cells.add('$x,$y');
        }
      }
    }
    return cells;
  }

  SelectedGridCell? _firstExpeditionCell(FloorApiModel floor) {
    final cells = _expeditionCells(floor).toList();
    if (cells.isEmpty) {
      return null;
    }
    final parts = cells.first.split(',');
    if (parts.length != 2) {
      return null;
    }
    final x = int.tryParse(parts[0]);
    final y = int.tryParse(parts[1]);
    if (x == null || y == null) {
      return null;
    }
    return SelectedGridCell(
      floorId: floor.id,
      x: x,
      y: y,
      mode: ChariotLocationMode.expedition,
    );
  }

  Set<String> _blockedCells(FloorApiModel floor) {
    final blocked = <String>{};
    for (final item in floor.gridItems) {
      for (int x = item.x; x < item.x + item.width; x++) {
        for (int y = item.y; y < item.y + item.height; y++) {
          blocked.add('$x,$y');
        }
      }
    }
    return blocked;
  }

  bool _isSelectableCell(int x, int y) {
    final floor = _selectedFloor;
    if (floor == null) {
      return false;
    }
    if (_mode == ChariotLocationMode.expedition) {
      final expeditionCells = _expeditionCells(floor);
      return expeditionCells.contains('$x,$y');
    }

    final blocked = _blockedCells(floor);
    return !blocked.contains('$x,$y');
  }

  bool _isBlockedCell(int x, int y) {
    final floor = _selectedFloor;
    if (floor == null) {
      return false;
    }
    final blocked = _blockedCells(floor);
    return blocked.contains('$x,$y');
  }

  bool get _hasSelectableCells {
    final floor = _selectedFloor;
    if (floor == null) {
      return false;
    }
    if (_mode == ChariotLocationMode.expedition) {
      return _expeditionCells(floor).isNotEmpty;
    }

    final blocked = _blockedCells(floor);
    return (floor.matrixRows * floor.matrixColumns) > blocked.length;
  }

  WarehouseItemType _mapBackendToItemType(String backendType) {
    switch (backendType) {
      case 'RACK_STORAGE':
        return WarehouseItemType.rackStorage;
      case 'OFFICE':
        return WarehouseItemType.office;
      case 'GOODS_LIFT':
        return WarehouseItemType.goodsLift;
      case 'LIFT':
        return WarehouseItemType.lift;
      case 'VRAC':
        return WarehouseItemType.vrac;
      case 'SHIPPING_AREA':
        return WarehouseItemType.shippingArea;
      case 'FLOOR_STORAGE':
        return WarehouseItemType.floorStorage;
      default:
        return WarehouseItemType.rackStorage;
    }
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
    }
  }

  String _floorLabel(FloorApiModel floor) {
    if (floor.levelNumber == 0) {
      return 'Ground (0A)';
    }
    return 'Floor ${floor.levelNumber.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final floor = _selectedFloor;
    final rows = floor?.matrixRows ?? 0;
    final columns = floor?.matrixColumns ?? 0;
    final gridWidth = columns * _cellSize;
    final gridHeight = rows * _cellSize;

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: Text(
          'Pick Location',
          style: GoogleFonts.manrope(
            color: const Color(0xFF0F172A),
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF0F172A)),
        actions: [
          TextButton(
            onPressed: (_selectedCell == null && _mode == ChariotLocationMode.storage)
                ? null
                : () {
                    if (_selectedCell != null) {
                      Navigator.of(context).pop(_selectedCell);
                      return;
                    }
                    if (_mode == ChariotLocationMode.expedition && _selectedFloor != null) {
                      final fallback = _firstExpeditionCell(_selectedFloor!);
                      Navigator.of(context).pop(
                        fallback ?? SelectedGridCell(
                          floorId: _selectedFloor!.id,
                          x: 0,
                          y: 0,
                          mode: ChariotLocationMode.expedition,
                        ),
                      );
                    }
                  },
            child: Text(
              'Use',
              style: GoogleFonts.inter(
                color: (_selectedCell == null && _mode == ChariotLocationMode.storage)
                    ? const Color(0xFF94A3B8)
                    : const Color(0xFF0093B2),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.warehouseName,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: const Color(0xFFE2E8F0)),
                  ),
                  child: ToggleButtons(
                    isSelected: [
                      _mode == ChariotLocationMode.expedition,
                      _mode == ChariotLocationMode.storage,
                    ],
                    onPressed: (index) {
                      final nextMode = index == 0
                          ? ChariotLocationMode.expedition
                          : ChariotLocationMode.storage;

                      if (nextMode == ChariotLocationMode.expedition && _groundFloor == null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('No ground floor found', style: GoogleFonts.inter()),
                            backgroundColor: const Color(0xFFEF4444),
                          ),
                        );
                        return;
                      }

                      if (nextMode == ChariotLocationMode.storage && _storageFloors.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('No storage floors found', style: GoogleFonts.inter()),
                            backgroundColor: const Color(0xFFEF4444),
                          ),
                        );
                        return;
                      }

                      setState(() {
                        _mode = nextMode;
                        _selectedCell = null;
                        if (_mode == ChariotLocationMode.expedition) {
                          _selectedFloor = _groundFloor;
                          if (_selectedFloor != null) {
                            _selectedCell = _firstExpeditionCell(_selectedFloor!);
                          }
                        } else {
                          _selectedFloor = _storageFloors.isNotEmpty
                              ? _storageFloors.first
                              : _groundFloor;
                        }
                      });
                    },
                    borderRadius: BorderRadius.circular(12),
                    selectedColor: Colors.white,
                    fillColor: const Color(0xFF0F172A),
                    color: const Color(0xFF0F172A),
                    constraints: const BoxConstraints(minHeight: 44),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Expedition (Ground)',
                          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          'Storage Floors',
                          style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                if (_mode == ChariotLocationMode.storage)
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFE2E8F0)),
                    ),
                    child: DropdownButtonFormField<String>(
                      value: floor?.id,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        prefixIcon: const Icon(Icons.layers, color: Color(0xFF64748B)),
                      ),
                      items: _storageFloors.map((floor) {
                        return DropdownMenuItem<String>(
                          value: floor.id,
                          child: Text(
                            _floorLabel(floor),
                            style: GoogleFonts.inter(fontSize: 16),
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        final nextFloor = _storageFloors.firstWhere(
                          (floor) => floor.id == value,
                          orElse: () => _storageFloors.first,
                        );
                        setState(() {
                          _selectedFloor = nextFloor;
                          if (_selectedCell?.floorId != nextFloor.id) {
                            _selectedCell = null;
                          }
                        });
                      },
                    ),
                  ),
                const SizedBox(height: 12),
                if (floor != null)
                  Text(
                    'Grid: $rows rows x $columns columns',
                    style: GoogleFonts.inter(fontSize: 12, color: const Color(0xFF64748B)),
                  ),
                const SizedBox(height: 8),
                if (_mode == ChariotLocationMode.expedition)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFF6FF),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFF93C5FD)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.local_shipping, color: Color(0xFF2563EB), size: 18),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Expedition zone selected (ground floor)',
                            style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (_mode == ChariotLocationMode.storage && _selectedCell != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFDCFCE7),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFF22C55E)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.check_circle, color: Color(0xFF16A34A), size: 18),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Selected cell: R${_selectedCell!.y + 1} C${_selectedCell!.x + 1}',
                            style: GoogleFonts.inter(fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                if (_mode == ChariotLocationMode.storage && _selectedCell == null && !_hasSelectableCells)
                  Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      _mode == ChariotLocationMode.expedition
                          ? 'No free locations in expedition zone.'
                          : 'No free locations on this floor.',
                      style: GoogleFonts.inter(color: const Color(0xFF64748B)),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: (_mode == ChariotLocationMode.expedition)
                ? Center(
                    child: Text(
                      'Expedition zone active on ground floor.',
                      style: GoogleFonts.inter(color: const Color(0xFF64748B)),
                    ),
                  )
                : (floor == null || rows <= 0 || columns <= 0
                    ? Center(
                        child: Text(
                          'No floor dimensions found',
                          style: GoogleFonts.inter(color: const Color(0xFF64748B)),
                        ),
                      )
                    : InteractiveViewer(
                        constrained: false,
                        boundaryMargin: const EdgeInsets.all(200),
                        minScale: 0.2,
                        maxScale: 4.0,
                        child: SizedBox(
                          width: gridWidth,
                          height: gridHeight,
                          child: Column(
                            children: List.generate(rows, (row) {
                              return Row(
                                children: List.generate(columns, (col) {
                                  final isSelected = _selectedCell != null &&
                                      _selectedCell!.floorId == floor.id &&
                                      _selectedCell!.x == col &&
                                      _selectedCell!.y == row;
                                  final isBlocked = _isBlockedCell(col, row);
                                  final isSelectable = _isSelectableCell(col, row);

                                  Color fillColor = Colors.white;
                                  Color borderColor = const Color(0xFFE2E8F0);

                                  if (isBlocked) {
                                    fillColor = const Color(0xFFE2E8F0);
                                    borderColor = const Color(0xFFCBD5F5);
                                  } else if (isSelected) {
                                    fillColor = const Color(0xFF2563EB);
                                    borderColor = const Color(0xFF1D4ED8);
                                  } else if (isSelectable) {
                                    fillColor = Colors.white;
                                    borderColor = const Color(0xFFD1D5DB);
                                  }

                                  return GestureDetector(
                                    onTap: () {
                                      if (!isSelectable) {
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                            content: Text('No free location here', style: GoogleFonts.inter()),
                                            backgroundColor: const Color(0xFFEF4444),
                                          ),
                                        );
                                        return;
                                      }

                                      setState(() {
                                        _selectedCell = SelectedGridCell(
                                          floorId: floor.id,
                                          x: col,
                                          y: row,
                                          mode: _mode,
                                        );
                                      });
                                    },
                                    child: Container(
                                      width: _cellSize,
                                      height: _cellSize,
                                      decoration: BoxDecoration(
                                        color: fillColor,
                                        border: Border.all(color: borderColor, width: 1),
                                      ),
                                    ),
                                  );
                                }),
                              );
                            }),
                          ),
                        ),
                      )),
          ),
        ],
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  final int rows;
  final int cols;
  final double cellSize;

  _GridPainter({required this.rows, required this.cols, required this.cellSize});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFE2E8F0)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    for (int i = 0; i <= cols; i++) {
      final x = i * cellSize;
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    for (int i = 0; i <= rows; i++) {
      final y = i * cellSize;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

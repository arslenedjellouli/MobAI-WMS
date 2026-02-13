import 'package:flutter/material.dart';
import '../../data/models/warehouse_models.dart';

class WarehouseGridWidget extends StatefulWidget {
  final int rows;
  final int columns;
  final double cellSize;
  final List<GridItem> items;
  final Function(int x, int y) onCellTap;
  final Function(String id) onItemTap;

  const WarehouseGridWidget({
    Key? key,
    required this.rows,
    required this.columns,
    this.cellSize = 20.0,
    required this.items,
    required this.onCellTap,
    required this.onItemTap,
  }) : super(key: key);

  @override
  _WarehouseGridWidgetState createState() => _WarehouseGridWidgetState();
}

class _WarehouseGridWidgetState extends State<WarehouseGridWidget> {
  // Use a TransformationController to control the InteractiveViewer
  final TransformationController _transformationController = TransformationController();

  @override
  void dispose() {
    _transformationController.dispose();
    super.dispose();
  }

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

  @override
  Widget build(BuildContext context) {
    // Total Size
    final double gridWidth = widget.columns * widget.cellSize;
    final double gridHeight = widget.rows * widget.cellSize;

    return Center(
      child: InteractiveViewer(
        transformationController: _transformationController,
        boundaryMargin: const EdgeInsets.all(500),
        minScale: 0.1,
        maxScale: 3.0,
        constrained: false, // Child can be larger than parent viewport
        child: Container(
          width: gridWidth + 200, // Extra space around for easier manipulation
          height: gridHeight + 200, 
          color: Colors.transparent, // Ensure it hits the gesture detector? No, just spacing.
          child: Center(
            child: SizedBox(
               width: gridWidth,
               height: gridHeight,
               child: Stack(
                 children: [
                   // 1. GRID BACKGROUND & TAPS
                   Positioned.fill(
                     child: GestureDetector(
                       onTapUp: (details) {
                         // Local position relative to this SizedBox (which is exact grid size)
                         int x = (details.localPosition.dx / widget.cellSize).floor();
                         int y = (details.localPosition.dy / widget.cellSize).floor();
                         
                         if (x >= 0 && x < widget.columns && y >= 0 && y < widget.rows) {
                           widget.onCellTap(x, y);
                         }
                       },
                       child: Container(
                         decoration: BoxDecoration(
                           color: Colors.white,
                           border: Border.all(color: Colors.grey.shade300),
                         ),
                         child: CustomPaint(
                           painter: _GridPainter(
                             rows: widget.rows,
                             cols: widget.columns,
                             cellSize: widget.cellSize,
                           ),
                         ),
                       ),
                     ),
                   ),

                   // 2. ITEMS
                   ...widget.items.map((item) {
                      final itemColor = _getColorForItem(item.type);
                      final isSmall = item.type == WarehouseItemType.rackStorage || item.type == WarehouseItemType.floorStorage;
                 
                      return Positioned(
                        left: item.x * widget.cellSize,
                        top: item.y * widget.cellSize,
                        width: item.width * widget.cellSize,
                        height: item.height * widget.cellSize,
                        child: GestureDetector(
                          onTap: () {
                             widget.onItemTap(item.id);
                          },
                          // HitTestBehavior.opaque ensures we catch the tap event
                          behavior: HitTestBehavior.opaque,
                          child: Container(
                            margin: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              color: itemColor.withOpacity(isSmall ? 0.8 : 0.4),
                              border: Border.all(
                                color: itemColor, 
                                width: isSmall ? 0 : 2
                              ),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: !isSmall
                               ? Center(
                                   child: FittedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.all(2.0),
                                        child: Text(
                                          item.type.label,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black87,
                                          ),
                                        ),
                                      ),
                                   ),
                                 )
                               : null, // No text for 1x1 cells to reduce clutter
                          ),
                        ),
                      );
                   }).toList(),
                 ],
               ),
            ),
          ),
        ),
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

    // Draw vertical lines
    for (int i = 0; i <= cols; i++) {
      double x = i * cellSize;
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }

    // Draw horizontal lines
    for (int i = 0; i <= rows; i++) {
      double y = i * cellSize;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

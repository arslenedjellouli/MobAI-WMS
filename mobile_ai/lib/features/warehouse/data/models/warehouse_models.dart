enum WarehouseItemType {
  rackStorage(1, 1, 'Rack Storage', true),
  office(1, 1, 'Office', true), // Size can be changed
  goodsLift(3, 4, 'Goods Lift', false),
  lift(5, 2, 'Lift', false),
  vrac(1, 1, 'VRAC', true), // Flexible
  shippingArea(7, 5, 'Shipping Area', false),
  floorStorage(1, 1, 'Floor Storage', true);

  final int defaultWidth;
  final int defaultHeight;
  final String label;
  final bool isAdjustable;

  const WarehouseItemType(this.defaultWidth, this.defaultHeight, this.label, this.isAdjustable);
}

class GridItem {
  String id;
  WarehouseItemType type;
  int x;
  int y;
  int width;
  int height;

  GridItem({
    required this.id,
    required this.type,
    required this.x,
    required this.y,
    required this.width,
    required this.height,
  });

  GridItem copyWith({
    String? id,
    WarehouseItemType? type,
    int? x,
    int? y,
    int? width,
    int? height,
  }) {
    return GridItem(
      id: id ?? this.id,
      type: type ?? this.type,
      x: x ?? this.x,
      y: y ?? this.y,
      width: width ?? this.width,
      height: height ?? this.height,
    );
  }
}

class WarehouseFloor {
  int level;
  List<GridItem> items;

  WarehouseFloor({required this.level, required this.items});
}

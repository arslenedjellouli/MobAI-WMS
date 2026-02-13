// API Models for Warehouse data transfer

class WarehouseApiModel {
  final String id;
  final String name;
  final String code;
  final double length;
  final double width;
  final double height;
  final String? address;
  final String? city;
  final String? country;
  final String? postalCode;
  final String? managerId;
  final String? managerName;
  final String? managerEmail;
  final String status;
  final DateTime createdAt;
  final DateTime? updatedAt;

  WarehouseApiModel({
    required this.id,
    required this.name,
    required this.code,
    required this.length,
    required this.width,
    required this.height,
    this.address,
    this.city,
    this.country,
    this.postalCode,
    this.managerId,
    this.managerName,
    this.managerEmail,
    required this.status,
    required this.createdAt,
    this.updatedAt,
  });

  factory WarehouseApiModel.fromJson(Map<String, dynamic> json) {
    return WarehouseApiModel(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      code: json['code']?.toString() ?? '',
      length: double.tryParse(json['length']?.toString() ?? '0') ?? 0.0,
      width: double.tryParse(json['width']?.toString() ?? '0') ?? 0.0,
      height: double.tryParse(json['height']?.toString() ?? '0') ?? 0.0,
      address: json['address']?.toString(),
      city: json['city']?.toString(),
      country: json['country']?.toString(),
      postalCode: json['postal_code']?.toString(),
      managerId: json['manager']?.toString(),
      managerName: json['manager_name']?.toString(),
      managerEmail: json['manager_email']?.toString(),
      status: json['status']?.toString() ?? 'ACTIVE',
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
      updatedAt: json['updated_at'] != null ? DateTime.tryParse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'length': length,
      'width': width,
      'height': height,
      'address': address,
      'city': city,
      'country': country,
      'postal_code': postalCode,
      'manager': managerId,
      'status': status,
    };
  }
}

class WarehouseDetailApiModel extends WarehouseApiModel {
  final int zonesCount;
  final int floorsCount;
  final int locationsCount;

  WarehouseDetailApiModel({
    required super.id,
    required super.name,
    required super.code,
    required super.length,
    required super.width,
    required super.height,
    super.address,
    super.city,
    super.country,
    super.postalCode,
    super.managerId,
    super.managerName,
    super.managerEmail,
    required super.status,
    required super.createdAt,
    super.updatedAt,
    required this.zonesCount,
    required this.floorsCount,
    required this.locationsCount,
  });

  factory WarehouseDetailApiModel.fromJson(Map<String, dynamic> json) {
    return WarehouseDetailApiModel(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      code: json['code']?.toString() ?? '',
      length: double.tryParse(json['length']?.toString() ?? '0') ?? 0.0,
      width: double.tryParse(json['width']?.toString() ?? '0') ?? 0.0,
      height: double.tryParse(json['height']?.toString() ?? '0') ?? 0.0,
      address: json['address']?.toString(),
      city: json['city']?.toString(),
      country: json['country']?.toString(),
      postalCode: json['postal_code']?.toString(),
      managerId: json['manager']?.toString(),
      managerName: json['manager_name']?.toString(),
      managerEmail: json['manager_email']?.toString(),
      status: json['status']?.toString() ?? 'ACTIVE',
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
      updatedAt: json['updated_at'] != null ? DateTime.tryParse(json['updated_at']) : null,
      zonesCount: json['zones_count'] ?? 0,
      floorsCount: json['floors_count'] ?? 0,
      locationsCount: json['locations_count'] ?? 0,
    );
  }
}

class FloorGridItemApiModel {
  final String? id;
  final String? itemId;
  final String itemType;
  final String? itemTypeDisplay;
  final int x;
  final int y;
  final int width;
  final int height;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  FloorGridItemApiModel({
    this.id,
    this.itemId,
    required this.itemType,
    this.itemTypeDisplay,
    required this.x,
    required this.y,
    required this.width,
    required this.height,
    this.createdAt,
    this.updatedAt,
  });

  factory FloorGridItemApiModel.fromJson(Map<String, dynamic> json) {
    return FloorGridItemApiModel(
      id: json['id']?.toString(),
      itemId: json['item_id']?.toString(),
      itemType: json['item_type'] ?? '',
      itemTypeDisplay: json['item_type_display']?.toString(),
      x: json['x'] ?? 0,
      y: json['y'] ?? 0,
      width: json['width'] ?? 1,
      height: json['height'] ?? 1,
      createdAt: json['created_at'] != null ? DateTime.tryParse(json['created_at']) : null,
      updatedAt: json['updated_at'] != null ? DateTime.tryParse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'item_type': itemType,
      'x': x,
      'y': y,
      'width': width,
      'height': height,
    };
  }
}

class FloorApiModel {
  final String id;
  final String warehouseId;
  final String? warehouseName;
  final int levelNumber;
  final String floorType;
  final String floorTypeDisplay;
  final String? description;
  final int matrixRows;
  final int matrixColumns;
  final List<FloorGridItemApiModel> gridItems;
  final DateTime createdAt;
  final DateTime? updatedAt;

  FloorApiModel({
    required this.id,
    required this.warehouseId,
    this.warehouseName,
    required this.levelNumber,
    required this.floorType,
    required this.floorTypeDisplay,
    this.description,
    required this.matrixRows,
    required this.matrixColumns,
    required this.gridItems,
    required this.createdAt,
    this.updatedAt,
  });

  factory FloorApiModel.fromJson(Map<String, dynamic> json) {
    final gridItemsJson = json['grid_items'] as List<dynamic>? ?? [];
    final gridItems = gridItemsJson.map((item) => FloorGridItemApiModel.fromJson(item as Map<String, dynamic>)).toList();

    return FloorApiModel(
      id: json['id']?.toString() ?? '',
      warehouseId: json['warehouse']?.toString() ?? '',
      warehouseName: json['warehouse_name']?.toString(),
      levelNumber: json['level_number'] ?? 0,
      floorType: json['floor_type']?.toString() ?? 'STORAGE',
      floorTypeDisplay: json['floor_type_display']?.toString() ?? 'Storage',
      description: json['description']?.toString(),
      matrixRows: json['matrix_rows'] ?? 10,
      matrixColumns: json['matrix_columns'] ?? 10,
      gridItems: gridItems,
      createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
      updatedAt: json['updated_at'] != null ? DateTime.tryParse(json['updated_at']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'warehouse': warehouseId,
      'level_number': levelNumber,
      'description': description,
      'matrix_rows': matrixRows,
      'matrix_columns': matrixColumns,
      'grid_items': gridItems.map((item) => item.toJson()).toList(),
    };
  }
}

class CreateWarehouseRequest {
  final String name;
  final String code;
  final double length;
  final double width;
  final double height;
  final String? address;
  final String? city;
  final String? country;
  final String? postalCode;
  final String? managerId;
  final String status;
  final List<FloorRequest>? floors;

  CreateWarehouseRequest({
    required this.name,
    required this.code,
    required this.length,
    required this.width,
    required this.height,
    this.address,
    this.city,
    this.country,
    this.postalCode,
    this.managerId,
    this.status = 'ACTIVE',
    this.floors,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'code': code,
      'length': length,
      'width': width,
      'height': height,
      'address': address ?? '',
      'city': city ?? '',
      'country': country ?? '',
      'postal_code': postalCode ?? '',
      if (managerId != null) 'manager': managerId,
      'status': status,
    };
  }
}

class UpdateWarehouseRequest {
  final String? name;
  final String? code;
  final double? length;
  final double? width;
  final double? height;
  final String? address;
  final String? city;
  final String? country;
  final String? postalCode;
  final String? managerId;
  final String? status;

  UpdateWarehouseRequest({
    this.name,
    this.code,
    this.length,
    this.width,
    this.height,
    this.address,
    this.city,
    this.country,
    this.postalCode,
    this.managerId,
    this.status,
  });

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (name != null) map['name'] = name;
    if (code != null) map['code'] = code;
    if (length != null) map['length'] = length;
    if (width != null) map['width'] = width;
    if (height != null) map['height'] = height;
    if (address != null) map['address'] = address;
    if (city != null) map['city'] = city;
    if (country != null) map['country'] = country;
    if (postalCode != null) map['postal_code'] = postalCode;
    if (managerId != null) map['manager'] = managerId;
    if (status != null) map['status'] = status;
    return map;
  }
}

class FloorRequest {
  final int levelNumber;
  final String? description;
  final int matrixRows;
  final int matrixColumns;
  final List<FloorGridItemRequest> gridItems;

  FloorRequest({
    required this.levelNumber,
    this.description,
    required this.matrixRows,
    required this.matrixColumns,
    required this.gridItems,
  });

  Map<String, dynamic> toJson() {
    return {
      'level_number': levelNumber,
      'description': description,
      'matrix_rows': matrixRows,
      'matrix_columns': matrixColumns,
      'grid_items': gridItems.map((item) => item.toJson()).toList(),
    };
  }
}

class FloorGridItemRequest {
  final String itemType;
  final int x;
  final int y;
  final int width;
  final int height;

  FloorGridItemRequest({
    required this.itemType,
    required this.x,
    required this.y,
    required this.width,
    required this.height,
  });

  Map<String, dynamic> toJson() {
    return {
      'item_type': itemType,
      'x': x,
      'y': y,
      'width': width,
      'height': height,
    };
  }
}

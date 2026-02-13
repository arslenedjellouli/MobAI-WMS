/// Product API models for data transfer with backend
class ProductApiModel {
  final String id;
  final String skuCode;
  final String name;
  final String description;
  final String? barcode;
  final String unit;
  final double? weight;
  final double? volume;
  final String? category;
  final String? imageUrl;
  final int? palletSize;
  final Map<String, dynamic>? statistics;
  final int? stocksCount;
  final double? totalQuantity;
  final String? createdAt;
  final String? updatedAt;

  ProductApiModel({
    required this.id,
    required this.skuCode,
    required this.name,
    required this.description,
    this.barcode,
    required this.unit,
    this.weight,
    this.volume,
    this.category,
    this.imageUrl,
    this.palletSize,
    this.statistics,
    this.stocksCount,
    this.totalQuantity,
    this.createdAt,
    this.updatedAt,
  });

  factory ProductApiModel.fromJson(Map<String, dynamic> json) {
    return ProductApiModel(
      id: json['id']?.toString() ?? '',
      skuCode: json['sku_code']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      barcode: json['barcode']?.toString(),
      unit: json['unit']?.toString() ?? 'UNIT',
      weight: json['weight'] != null ? (json['weight'] is num ? (json['weight'] as num).toDouble() : double.tryParse(json['weight'].toString())) : null,
      volume: json['volume'] != null ? (json['volume'] is num ? (json['volume'] as num).toDouble() : double.tryParse(json['volume'].toString())) : null,
      category: json['category']?.toString(),
      imageUrl: json['image_url']?.toString(),
      palletSize: json['pallet_size'] != null ? (json['pallet_size'] is int ? json['pallet_size'] : int.tryParse(json['pallet_size'].toString())) : null,
      statistics: json['statistics'] as Map<String, dynamic>?,
      stocksCount: json['stocks_count'] != null ? (json['stocks_count'] is int ? json['stocks_count'] : int.tryParse(json['stocks_count'].toString())) : null,
      totalQuantity: json['total_quantity'] != null 
          ? (json['total_quantity'] is num ? (json['total_quantity'] as num).toDouble() : double.tryParse(json['total_quantity'].toString()))
          : null,
      createdAt: json['created_at']?.toString(),
      updatedAt: json['updated_at']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sku_code': skuCode,
      'name': name,
      'description': description,
      if (barcode != null) 'barcode': barcode,
      'unit': unit,
      if (weight != null) 'weight': weight,
      if (volume != null) 'volume': volume,
      if (category != null) 'category': category,
      if (imageUrl != null) 'image_url': imageUrl,
      if (palletSize != null) 'pallet_size': palletSize,
      if (statistics != null) 'statistics': statistics,
      if (stocksCount != null) 'stocks_count': stocksCount,
      if (totalQuantity != null) 'total_quantity': totalQuantity,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    };
  }
}

/// Product Create Request
class ProductCreateRequest {
  final String skuCode;
  final String name;
  final String description;
  final String? barcode;
  final String unit;
  final double? weight;
  final double? volume;
  final String? category;
  final String? imageUrl;
  final int? palletSize;
  final double? initialQuantity;

  ProductCreateRequest({
    required this.skuCode,
    required this.name,
    required this.description,
    this.barcode,
    required this.unit,
    this.weight,
    this.volume,
    this.category,
    this.imageUrl,
    this.palletSize,
    this.initialQuantity,
  });

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{
      'sku_code': skuCode,
      'name': name,
      'description': description,
      'unit': unit,
    };

    if (barcode != null && barcode!.isNotEmpty) {
      json['barcode'] = barcode!;
    }
    if (weight != null) {
      json['weight'] = weight!;
    }
    if (volume != null) {
      json['volume'] = volume!;
    }
    if (category != null && category!.isNotEmpty) {
      json['category'] = category!;
    }
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      json['image_url'] = imageUrl!;
    }
    if (palletSize != null) {
      json['pallet_size'] = palletSize!;
    }
    if (initialQuantity != null) {
      json['initial_quantity'] = initialQuantity!;
    }

    return json;
  }
}

/// Product Update Request
class ProductUpdateRequest {
  final String? skuCode;
  final String? name;
  final String? description;
  final String? barcode;
  final String? unit;
  final double? weight;
  final double? volume;
  final String? category;
  final String? imageUrl;
  final int? palletSize;
  final double? quantity;

  ProductUpdateRequest({
    this.skuCode,
    this.name,
    this.description,
    this.barcode,
    this.unit,
    this.weight,
    this.volume,
    this.category,
    this.imageUrl,
    this.palletSize,
    this.quantity,
  });

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};

    if (skuCode != null) json['sku_code'] = skuCode;
    if (name != null) json['name'] = name;
    if (description != null) json['description'] = description;
    if (barcode != null) json['barcode'] = barcode;
    if (unit != null) json['unit'] = unit;
    if (weight != null) json['weight'] = weight;
    if (volume != null) json['volume'] = volume;
    if (category != null) json['category'] = category;
    if (imageUrl != null) json['image_url'] = imageUrl;
    if (palletSize != null) json['pallet_size'] = palletSize;
    if (quantity != null) json['quantity'] = quantity;

    return json;
  }
}

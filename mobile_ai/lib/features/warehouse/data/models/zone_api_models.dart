class ZoneApiModel {
  final String id;
  final String warehouse;
  final String code;
  final String name;
  final String zoneType;
  final String? status;

  ZoneApiModel({
    required this.id,
    required this.warehouse,
    required this.code,
    required this.name,
    required this.zoneType,
    this.status,
  });

  factory ZoneApiModel.fromJson(Map<String, dynamic> json) {
    return ZoneApiModel(
      id: json['id']?.toString() ?? '',
      warehouse: json['warehouse']?.toString() ?? '',
      code: json['code']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      zoneType: json['zone_type']?.toString() ?? '',
      status: json['status']?.toString(),
    );
  }
}

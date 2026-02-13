import '../datasources/zone_remote_datasource.dart';
import '../models/zone_api_models.dart';

abstract class ZoneRepository {
  Future<List<ZoneApiModel>> getZones({String? warehouseId});
  Future<ZoneApiModel> createZone({
    required String warehouseId,
    required String code,
    required String name,
    required String zoneType,
  });
}

class ZoneRepositoryImpl implements ZoneRepository {
  final ZoneRemoteDatasource remoteDatasource;

  ZoneRepositoryImpl({required this.remoteDatasource});

  @override
  Future<List<ZoneApiModel>> getZones({String? warehouseId}) async {
    return await remoteDatasource.getZones(warehouseId: warehouseId);
  }

  @override
  Future<ZoneApiModel> createZone({
    required String warehouseId,
    required String code,
    required String name,
    required String zoneType,
  }) async {
    return await remoteDatasource.createZone(
      warehouseId: warehouseId,
      code: code,
      name: name,
      zoneType: zoneType,
    );
  }
}

import '../datasources/location_remote_datasource.dart';
import '../models/location_api_models.dart';

/// Repository interface for location operations
abstract class LocationRepository {
  Future<List<LocationApiModel>> getLocations({String? warehouseId});
  Future<List<LocationApiModel>> getAvailableLocations({String? warehouseId});
  Future<LocationApiModel> getLocation(String locationId);
  Future<LocationApiModel> createLocation(Map<String, dynamic> data);
}

/// Implementation of location repository
class LocationRepositoryImpl implements LocationRepository {
  final LocationRemoteDatasource remoteDatasource;

  LocationRepositoryImpl({required this.remoteDatasource});

  @override
  Future<List<LocationApiModel>> getLocations({String? warehouseId}) async {
    return await remoteDatasource.getLocations(warehouseId: warehouseId);
  }

  @override
  Future<List<LocationApiModel>> getAvailableLocations(
      {String? warehouseId}) async {
    return await remoteDatasource.getAvailableLocations(
        warehouseId: warehouseId);
  }

  @override
  Future<LocationApiModel> getLocation(String locationId) async {
    return await remoteDatasource.getLocation(locationId);
  }

  @override
  Future<LocationApiModel> createLocation(Map<String, dynamic> data) async {
    return await remoteDatasource.createLocation(data);
  }
}

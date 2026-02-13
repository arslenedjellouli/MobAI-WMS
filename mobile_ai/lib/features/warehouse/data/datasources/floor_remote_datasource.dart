import 'package:dio/dio.dart';
import '../../../../core/api/api_client.dart';
import '../models/warehouse_api_models.dart';

abstract class FloorRemoteDatasource {
  Future<List<FloorApiModel>> getFloors(String warehouseId);
  Future<FloorApiModel> createFloor(String warehouseId, FloorRequest request);
  Future<FloorApiModel> updateFloor(String floorId, FloorRequest request);
  Future<void> deleteFloor(String floorId);
}

class FloorRemoteDatasourceImpl implements FloorRemoteDatasource {
  final ApiClient apiClient;

  FloorRemoteDatasourceImpl({required this.apiClient});

  @override
  Future<List<FloorApiModel>> getFloors(String warehouseId) async {
    try {
      final response = await apiClient.get('/v1/warehouses/$warehouseId/floors/');
      final results = response.data as List;
      return results.map((json) => FloorApiModel.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FloorApiModel> createFloor(String warehouseId, FloorRequest request) async {
    try {
      final data = request.toJson();
      data['warehouse'] = warehouseId;
      
      final response = await apiClient.post(
        '/v1/floors/',
        data: data,
      );
      return FloorApiModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<FloorApiModel> updateFloor(String floorId, FloorRequest request) async {
    try {
      final response = await apiClient.put(
        '/v1/floors/$floorId/',
        data: request.toJson(),
      );
      return FloorApiModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteFloor(String floorId) async {
    try {
      await apiClient.delete('/v1/floors/$floorId/');
    } catch (e) {
      rethrow;
    }
  }
}

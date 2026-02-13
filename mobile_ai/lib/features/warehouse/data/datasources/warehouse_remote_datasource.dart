import 'package:dio/dio.dart';
import '../../../../core/api/api_client.dart';
import '../models/warehouse_api_models.dart';

abstract class WarehouseRemoteDatasource {
  Future<List<WarehouseApiModel>> getWarehouses();
  Future<WarehouseDetailApiModel> getWarehouse(String id);
  Future<WarehouseDetailApiModel> createWarehouse(CreateWarehouseRequest request);
  Future<WarehouseDetailApiModel> updateWarehouse(String id, UpdateWarehouseRequest request);
  Future<void> deleteWarehouse(String id);
  Future<List<FloorApiModel>> getWarehouseFloors(String warehouseId);
}

class WarehouseRemoteDatasourceImpl implements WarehouseRemoteDatasource {
  final ApiClient apiClient;

  WarehouseRemoteDatasourceImpl({required this.apiClient});

  @override
  Future<List<WarehouseApiModel>> getWarehouses() async {
    try {
      final response = await apiClient.get('/v1/warehouses/');
      final results = response.data['results'] as List;
      return results.map((json) => WarehouseApiModel.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<WarehouseDetailApiModel> getWarehouse(String id) async {
    try {
      final response = await apiClient.get('/v1/warehouses/$id/');
      return WarehouseDetailApiModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<WarehouseDetailApiModel> createWarehouse(CreateWarehouseRequest request) async {
    try {
      final response = await apiClient.post(
        '/v1/warehouses/',
        data: request.toJson(),
      );
      return WarehouseDetailApiModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<WarehouseDetailApiModel> updateWarehouse(String id, UpdateWarehouseRequest request) async {
    try {
      final response = await apiClient.patch(
        '/v1/warehouses/$id/',
        data: request.toJson(),
      );
      return WarehouseDetailApiModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteWarehouse(String id) async {
    try {
      await apiClient.delete('/v1/warehouses/$id/');
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<FloorApiModel>> getWarehouseFloors(String warehouseId) async {
    try {
      final response = await apiClient.get('/v1/warehouses/$warehouseId/floors/');
      final results = response.data as List;
      return results.map((json) => FloorApiModel.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
}

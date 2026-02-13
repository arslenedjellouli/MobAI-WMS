import 'package:uuid/uuid.dart';
import '../datasources/warehouse_remote_datasource.dart';
import '../datasources/floor_remote_datasource.dart';
import '../models/warehouse_api_models.dart';
import '../models/warehouse_models.dart';

abstract class WarehouseRepository {
  Future<List<WarehouseApiModel>> getWarehouses();
  Future<WarehouseDetailApiModel> getWarehouse(String id);
  Future<WarehouseDetailApiModel> createWarehouse({
    required String name,
    required String code,
    required double length,
    required double width,
    required double height,
    List<WarehouseFloor>? floors,
  });
  Future<WarehouseDetailApiModel> updateWarehouse({
    required String id,
    String? name,
    String? code,
    double? length,
    double? width,
    double? height,
  });
  Future<void> deleteWarehouse(String id);
  Future<List<FloorApiModel>> getWarehouseFloors(String warehouseId);
  Future<FloorApiModel> createFloor(String warehouseId, int levelNumber, double length, double width, List<GridItem> items);
  Future<FloorApiModel> updateFloor(String floorId, int levelNumber, double length, double width, List<GridItem> items);
  Future<void> deleteFloor(String floorId);
}

class WarehouseRepositoryImpl implements WarehouseRepository {
  final WarehouseRemoteDatasource remoteDatasource;
  final FloorRemoteDatasource floorDatasource;

  WarehouseRepositoryImpl({
    required this.remoteDatasource,
    required this.floorDatasource,
  });

  @override
  Future<List<WarehouseApiModel>> getWarehouses() async {
    return await remoteDatasource.getWarehouses();
  }

  @override
  Future<WarehouseDetailApiModel> getWarehouse(String id) async {
    return await remoteDatasource.getWarehouse(id);
  }

  @override
  Future<WarehouseDetailApiModel> createWarehouse({
    required String name,
    required String code,
    required double length,
    required double width,
    required double height,
    List<WarehouseFloor>? floors,
  }) async {
    final request = CreateWarehouseRequest(
      name: name,
      code: code,
      length: length,
      width: width,
      height: height,
    );

    final warehouse = await remoteDatasource.createWarehouse(request);

    // Create floors if provided
    if (floors != null && floors.isNotEmpty) {
      for (final floor in floors) {
        await createFloor(
          warehouse.id,
          floor.level,
          length,
          width,
          floor.items,
        );
      }
    }

    return await remoteDatasource.getWarehouse(warehouse.id);
  }

  @override
  Future<WarehouseDetailApiModel> updateWarehouse({
    required String id,
    String? name,
    String? code,
    double? length,
    double? width,
    double? height,
  }) async {
    final request = UpdateWarehouseRequest(
      name: name,
      code: code,
      length: length,
      width: width,
      height: height,
    );

    return await remoteDatasource.updateWarehouse(id, request);
  }

  @override
  Future<void> deleteWarehouse(String id) async {
    return await remoteDatasource.deleteWarehouse(id);
  }

  @override
  Future<List<FloorApiModel>> getWarehouseFloors(String warehouseId) async {
    return await floorDatasource.getFloors(warehouseId);
  }

  @override
  Future<FloorApiModel> createFloor(
    String warehouseId,
    int levelNumber,
    double length,
    double width,
    List<GridItem> items,
  ) async {
    final gridItems = items.map((item) {
      return FloorGridItemRequest(
        itemType: _mapItemTypeToBackend(item.type),
        x: item.x,
        y: item.y,
        width: item.width,
        height: item.height,
      );
    }).toList();

    final request = FloorRequest(
      levelNumber: levelNumber,
      description: levelNumber == 0 ? 'Ground Floor' : 'Storage Floor $levelNumber',
      matrixRows: width.round(),
      matrixColumns: length.round(),
      gridItems: gridItems,
    );

    return await floorDatasource.createFloor(warehouseId, request);
  }

  @override
  Future<FloorApiModel> updateFloor(
    String floorId,
    int levelNumber,
    double length,
    double width,
    List<GridItem> items,
  ) async {
    final gridItems = items.map((item) {
      return FloorGridItemRequest(
        itemType: _mapItemTypeToBackend(item.type),
        x: item.x,
        y: item.y,
        width: item.width,
        height: item.height,
      );
    }).toList();

    final request = FloorRequest(
      levelNumber: levelNumber,
      description: levelNumber == 0 ? 'Ground Floor' : 'Storage Floor $levelNumber',
      matrixRows: width.round(),
      matrixColumns: length.round(),
      gridItems: gridItems,
    );

    return await floorDatasource.updateFloor(floorId, request);
  }

  @override
  Future<void> deleteFloor(String floorId) async {
    return await floorDatasource.deleteFloor(floorId);
  }

  String _mapItemTypeToBackend(WarehouseItemType type) {
    switch (type) {
      case WarehouseItemType.rackStorage:
        return 'RACK_STORAGE';
      case WarehouseItemType.office:
        return 'OFFICE';
      case WarehouseItemType.goodsLift:
        return 'GOODS_LIFT';
      case WarehouseItemType.lift:
        return 'LIFT';
      case WarehouseItemType.vrac:
        return 'VRAC';
      case WarehouseItemType.shippingArea:
        return 'SHIPPING_AREA';
      case WarehouseItemType.floorStorage:
        return 'FLOOR_STORAGE';
    }
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

  GridItem _mapFloorGridItemToGridItem(FloorGridItemApiModel apiItem) {
    return GridItem(
      id: apiItem.itemId ?? const Uuid().v4(),
      type: _mapBackendToItemType(apiItem.itemType),
      x: apiItem.x,
      y: apiItem.y,
      width: apiItem.width,
      height: apiItem.height,
    );
  }

  WarehouseFloor _mapFloorApiToWarehouseFloor(FloorApiModel apiFloor) {
    final items = apiFloor.gridItems.map(_mapFloorGridItemToGridItem).toList();
    return WarehouseFloor(level: apiFloor.levelNumber, items: items);
  }
}

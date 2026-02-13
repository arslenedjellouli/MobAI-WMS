import 'package:dartz/dartz.dart';
import 'package:isar/isar.dart';

import 'package:mobile_ai/core/database/isar_database.dart';
import 'package:mobile_ai/core/database/models/inventory/stock_collection.dart';
import 'package:mobile_ai/core/database/models/inventory/sku_collection.dart';
import 'package:mobile_ai/core/errors/failures.dart';

abstract class StockRepository {
  Future<Either<Failure, int>> getStockQuantity(String skuId, String locationId);
  Future<Either<Failure, SKUCollection?>> getSKUDetails(String skuCode);
  Future<Either<Failure, List<StockCollection>>> getLocationStock(String locationId);
}

class StockRepositoryImpl implements StockRepository {
  final IsarDatabase db;

  StockRepositoryImpl({required this.db});

  @override
  Future<Either<Failure, int>> getStockQuantity(String skuId, String locationId) async {
    try {
      final isar = db.isar;
      final stock = await isar.stockCollections
          .filter()
          .skuIdEqualTo(skuId)
          .and()
          .locationIdEqualTo(locationId)
          .findFirst();
          
      return Right(stock?.quantity ?? 0);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, SKUCollection?>> getSKUDetails(String skuCode) async {
    try {
      final isar = db.isar;
      // Assuming SKUCollection has 'code' index
        final sku = await isar.sKUCollections
          .filter()
          .skuCodeEqualTo(skuCode)
          .findFirst();
          
      return Right(sku);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<StockCollection>>> getLocationStock(String locationId) async {
    try {
      final isar = db.isar;
      final stocks = await isar.stockCollections
          .filter()
          .locationIdEqualTo(locationId)
          .findAll();
          
      return Right(stocks);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}

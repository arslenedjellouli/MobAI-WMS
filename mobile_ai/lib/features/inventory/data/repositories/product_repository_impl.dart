import '../datasources/product_remote_datasource.dart';
import '../models/product_api_models.dart';

abstract class ProductRepository {
  Future<List<ProductApiModel>> getProducts({
    String? search,
    String? category,
  });
  Future<ProductApiModel> getProduct(String id);
  Future<ProductApiModel> createProduct(ProductCreateRequest request);
  Future<ProductApiModel> updateProduct(String id, ProductUpdateRequest request);
  Future<void> deleteProduct(String id);
}

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDatasource _remoteDatasource;

  ProductRepositoryImpl({required ProductRemoteDatasource remoteDatasource})
      : _remoteDatasource = remoteDatasource;

  @override
  Future<List<ProductApiModel>> getProducts({
    String? search,
    String? category,
  }) async {
    return await _remoteDatasource.getProducts(
      search: search,
      category: category,
    );
  }

  @override
  Future<ProductApiModel> getProduct(String id) async {
    return await _remoteDatasource.getProduct(id);
  }

  @override
  Future<ProductApiModel> createProduct(ProductCreateRequest request) async {
    return await _remoteDatasource.createProduct(request);
  }

  @override
  Future<ProductApiModel> updateProduct(
    String id,
    ProductUpdateRequest request,
  ) async {
    return await _remoteDatasource.updateProduct(id, request);
  }

  @override
  Future<void> deleteProduct(String id) async {
    return await _remoteDatasource.deleteProduct(id);
  }
}

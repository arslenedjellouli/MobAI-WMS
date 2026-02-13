import 'package:dio/dio.dart';
import '../models/product_api_models.dart';

abstract class ProductRemoteDatasource {
  Future<List<ProductApiModel>> getProducts({
    String? search,
    String? category,
  });
  Future<ProductApiModel> getProduct(String id);
  Future<ProductApiModel> createProduct(ProductCreateRequest request);
  Future<ProductApiModel> updateProduct(String id, ProductUpdateRequest request);
  Future<void> deleteProduct(String id);
}

class ProductRemoteDatasourceImpl implements ProductRemoteDatasource {
  final Dio _dio;
  static const String _baseUrl = '/v1/skus';

  ProductRemoteDatasourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<ProductApiModel>> getProducts({
    String? search,
    String? category,
  }) async {
    try {
      final queryParams = <String, dynamic>{};
      if (search != null && search.isNotEmpty) {
        queryParams['search'] = search;
      }
      if (category != null && category.isNotEmpty) {
        queryParams['category'] = category;
      }

      final response = await _dio.get(
        '$_baseUrl/',
        queryParameters: queryParams.isNotEmpty ? queryParams : null,
      );

      if (response.statusCode == 200) {
        final List<dynamic> results = response.data['results'] ?? response.data;
        return results.map((json) => ProductApiModel.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Network error while fetching products: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error while fetching products: $e');
    }
  }

  @override
  Future<ProductApiModel> getProduct(String id) async {
    try {
      final response = await _dio.get('$_baseUrl/$id/');

      if (response.statusCode == 200) {
        return ProductApiModel.fromJson(response.data);
      } else {
        throw Exception('Failed to load product: ${response.statusCode}');
      }
    } on DioException catch (e) {
      throw Exception('Network error while fetching product: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error while fetching product: $e');
    }
  }

  @override
  Future<ProductApiModel> createProduct(ProductCreateRequest request) async {
    try {
      final response = await _dio.post(
        '$_baseUrl/',
        data: request.toJson(),
      );

      if (response.statusCode == 201) {
        return ProductApiModel.fromJson(response.data);
      } else {
        throw Exception('Failed to create product: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response?.data != null) {
        throw Exception('Failed to create product: ${e.response?.data}');
      }
      throw Exception('Network error while creating product: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error while creating product: $e');
    }
  }

  @override
  Future<ProductApiModel> updateProduct(
    String id,
    ProductUpdateRequest request,
  ) async {
    try {
      final response = await _dio.patch(
        '$_baseUrl/$id/',
        data: request.toJson(),
      );

      if (response.statusCode == 200) {
        return ProductApiModel.fromJson(response.data);
      } else {
        throw Exception('Failed to update product: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response?.data != null) {
        throw Exception('Failed to update product: ${e.response?.data}');
      }
      throw Exception('Network error while updating product: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error while updating product: $e');
    }
  }

  @override
  Future<void> deleteProduct(String id) async {
    try {
      final response = await _dio.delete('$_baseUrl/$id/');

      if (response.statusCode != 204 && response.statusCode != 200) {
        throw Exception('Failed to delete product: ${response.statusCode}');
      }
    } on DioException catch (e) {
      if (e.response?.data != null) {
        throw Exception('Failed to delete product: ${e.response?.data}');
      }
      throw Exception('Network error while deleting product: ${e.message}');
    } catch (e) {
      throw Exception('Unexpected error while deleting product: $e');
    }
  }
}

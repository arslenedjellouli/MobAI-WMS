import '../datasources/chariot_remote_datasource.dart';
import '../models/chariot_api_models.dart';

/// Repository interface for chariot operations
abstract class ChariotRepository {
  Future<ChariotListResponse> getChariots({int page = 1, int pageSize = 10});
  Future<ChariotApiModel> getChariot(String chariotId);
  Future<ChariotApiModel> createChariot(ChariotCreateRequest request);
  Future<ChariotApiModel> updateChariot(
      String chariotId, ChariotUpdateRequest request);
  Future<void> deleteChariot(String chariotId);
}

/// Implementation of chariot repository
class ChariotRepositoryImpl implements ChariotRepository {
  final ChariotRemoteDatasource remoteDatasource;

  ChariotRepositoryImpl({required this.remoteDatasource});

  @override
  Future<ChariotListResponse> getChariots(
      {int page = 1, int pageSize = 10}) async {
    return await remoteDatasource.getChariots(page: page, pageSize: pageSize);
  }

  @override
  Future<ChariotApiModel> getChariot(String chariotId) async {
    return await remoteDatasource.getChariot(chariotId);
  }

  @override
  Future<ChariotApiModel> createChariot(ChariotCreateRequest request) async {
    return await remoteDatasource.createChariot(request);
  }

  @override
  Future<ChariotApiModel> updateChariot(
      String chariotId, ChariotUpdateRequest request) async {
    return await remoteDatasource.updateChariot(chariotId, request);
  }

  @override
  Future<void> deleteChariot(String chariotId) async {
    return await remoteDatasource.deleteChariot(chariotId);
  }
}

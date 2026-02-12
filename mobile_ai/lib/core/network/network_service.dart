import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:mobile_ai/core/constants/api_constants.dart';
import 'package:mobile_ai/core/errors/exceptions.dart';
import 'package:mobile_ai/core/errors/failures.dart';

/// Network service for API calls
class NetworkService {
  final http.Client client;
  String? _accessToken;

  NetworkService({required this.client});

  /// Set authentication tokens
  void setTokens({String? accessToken, String? refreshToken}) {
    _accessToken = accessToken;
    // Note: refreshToken can be stored if needed for token refresh logic
  }

  /// Clear authentication tokens
  void clearTokens() {
    _accessToken = null;
  }

  /// GET request
  Future<Map<String, dynamic>> get(
    String endpoint, {
    Map<String, String>? queryParameters,
    bool requiresAuth = true,
  }) async {
    final uri = _buildUri(endpoint, queryParameters);
    final headers = _buildHeaders(requiresAuth);

    try {
      final response = await client
          .get(uri, headers: headers)
          .timeout(ApiConstants.apiTimeout);

      return _handleResponse(response);
    } on SocketException {
      throw const NetworkException();
    } on TimeoutException {
      throw const TimeoutException();
    } catch (e) {
      throw ServerException('GET request failed: $e');
    }
  }

  /// POST request
  Future<Map<String, dynamic>> post(
    String endpoint, {
    Map<String, dynamic>? body,
    bool requiresAuth = true,
  }) async {
    final uri = _buildUri(endpoint);
    final headers = _buildHeaders(requiresAuth);

    try {
      final response = await client
          .post(
            uri,
            headers: headers,
            body: body != null ? jsonEncode(body) : null,
          )
          .timeout(ApiConstants.apiTimeout);

      return _handleResponse(response);
    } on SocketException {
      throw const NetworkException();
    } on TimeoutException {
      throw const TimeoutException();
    } catch (e) {
      throw ServerException('POST request failed: $e');
    }
  }

  /// PUT request
  Future<Map<String, dynamic>> put(
    String endpoint, {
    Map<String, dynamic>? body,
    bool requiresAuth = true,
  }) async {
    final uri = _buildUri(endpoint);
    final headers = _buildHeaders(requiresAuth);

    try {
      final response = await client
          .put(
            uri,
            headers: headers,
            body: body != null ? jsonEncode(body) : null,
          )
          .timeout(ApiConstants.apiTimeout);

      return _handleResponse(response);
    } on SocketException {
      throw const NetworkException();
    } on TimeoutException {
      throw const TimeoutException();
    } catch (e) {
      throw ServerException('PUT request failed: $e');
    }
  }

  /// DELETE request
  Future<Map<String, dynamic>> delete(
    String endpoint, {
    bool requiresAuth = true,
  }) async {
    final uri = _buildUri(endpoint);
    final headers = _buildHeaders(requiresAuth);

    try {
      final response = await client
          .delete(uri, headers: headers)
          .timeout(ApiConstants.apiTimeout);

      return _handleResponse(response);
    } on SocketException {
      throw const NetworkException();
    } on TimeoutException {
      throw const TimeoutException();
    } catch (e) {
      throw ServerException('DELETE request failed: $e');
    }
  }

  /// Build URI with base URL and query parameters
  Uri _buildUri(String endpoint, [Map<String, String>? queryParameters]) {
    // TODO: Update with actual base URL from environment config
    const baseUrl = 'http://localhost:3000/api';
    final url = '$baseUrl$endpoint';

    return queryParameters != null && queryParameters.isNotEmpty
        ? Uri.parse(url).replace(queryParameters: queryParameters)
        : Uri.parse(url);
  }

  /// Build headers with authentication
  Map<String, String> _buildHeaders(bool requiresAuth) {
    final headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };

    if (requiresAuth && _accessToken != null) {
      headers['Authorization'] = 'Bearer $_accessToken';
    }

    return headers;
  }

  /// Handle API response
  Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode >= 200 && response.statusCode < 300) {
      if (response.body.isEmpty) {
        return {'success': true};
      }
      return jsonDecode(response.body) as Map<String, dynamic>;
    }

    // Handle error responses
    String errorMessage = 'Request failed';
    try {
      final errorBody = jsonDecode(response.body) as Map<String, dynamic>;
      errorMessage = errorBody['message'] ?? errorMessage;
    } catch (_) {
      // Use status code based message if JSON parsing fails
    }

    switch (response.statusCode) {
      case 400:
        throw ValidationException(errorMessage);
      case 401:
        throw AuthException(errorMessage, code: 401);
      case 403:
        throw const PermissionFailure();
      case 404:
        throw const NotFoundException();
      case 409:
        throw ConflictException(errorMessage, 409);
      case 500:
      case 502:
      case 503:
        throw ServerException(errorMessage, code: response.statusCode);
      default:
        throw ServerException(
          errorMessage,
          code: response.statusCode,
        );
    }
  }
}

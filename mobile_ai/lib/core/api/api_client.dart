import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:logger/logger.dart';

class ApiClient {
  final Dio _dio;
  final FlutterSecureStorage _storage;
  final Logger _logger;

  // Base URL for the backend API
  // Windows Desktop: http://localhost:8000/api
  // Android Emulator: http://10.0.2.2:8000/api
  // iOS Simulator: http://localhost:8000/api
  // Change based on your platform!
  static const String _baseUrl = 'http://localhost:8000/api'; 
  
  ApiClient({
    Dio? dio,
    FlutterSecureStorage? storage,
    Logger? logger,
  })  : _dio = dio ?? Dio(),
        _storage = storage ?? const FlutterSecureStorage(),
        _logger = logger ?? Logger() {
    _initDio();
  }

  void _initDio() {
    _dio.options.baseUrl = _baseUrl;
    // Increased timeouts to handle slower networks
    _dio.options.connectTimeout = const Duration(seconds: 90);
    _dio.options.receiveTimeout = const Duration(seconds: 90);
    _dio.options.sendTimeout = const Duration(seconds: 90);
    _dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
    
    _logger.i('🔧 ApiClient initialized with base URL: $_baseUrl');

    // Add interceptors
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Add Auth Token if available
          final token = await _storage.read(key: 'auth_token');
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          
          _logger.d('📤 Request: ${options.method} ${options.path}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          _logger.d('✅ Response: ${response.statusCode} ${response.statusMessage}');
          return handler.next(response);
        },
        onError: (DioException e, handler) async {
          if (e.type == DioExceptionType.connectionTimeout) {
            _logger.e('⏱️ Connection Timeout: Backend not responding');
          } else if (e.type == DioExceptionType.receiveTimeout) {
            _logger.e('⏱️ Receive Timeout: Backend too slow to respond');
          } else if (e.type == DioExceptionType.unknown) {
            _logger.e('❌ Unknown Error: ${e.message}');
          } else {
            _logger.e('❌ Error: ${e.message}', error: e, stackTrace: e.stackTrace);
          }

          if (e.response?.statusCode == 401) {
            // Token expired or invalid
            _logger.w('🔑 Token expired, clearing authentication');
            await _storage.delete(key: 'auth_token');
          }
          
          return handler.next(e);
        },
      ),
    );
  }

  // GET Request
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // POST Request
  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // PUT Request
  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
  
  // PATCH Request
  Future<Response> patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    onSendProgress,
    onReceiveProgress,
  }) async {
    try {
      final response = await _dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // DELETE Request
  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      final response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

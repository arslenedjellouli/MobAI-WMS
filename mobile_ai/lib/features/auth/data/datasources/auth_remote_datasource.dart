import 'package:dio/dio.dart';
import 'package:mobile_ai/core/api/api_client.dart';

abstract class AuthRemoteDataSource {
  Future<Map<String, dynamic>> login(String email, String password);
  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    print('🌐 [AuthRemoteDataSource] Sending login request for: $email');
    print('🌐 [AuthRemoteDataSource] Making POST request to: /v1/auth/login/');
    
    try {
      final response = await client.post(
        '/v1/auth/login/',
        data: {
          'email': email,
          'password': password,
        },
      );
      
      print('📬 [AuthRemoteDataSource] Response received with status: ${response.statusCode}');
      
      if (response.statusCode == 200) {
        final data = response.data as Map<String, dynamic>;
        print('✅ [AuthRemoteDataSource] Login successful');
        print('📦 [AuthRemoteDataSource] Response keys: ${data.keys.toList()}');
        print('👤 [AuthRemoteDataSource] User ID: ${data['user']?['id']}, Email: ${data['user']?['email']}');
        return data;
      } else {
        print('❌ [AuthRemoteDataSource] Login failed with status: ${response.statusCode}');
        throw Exception('Login failed: ${response.statusMessage}');
      }
    } on DioException catch (e) {
      print('🌐 [AuthRemoteDataSource] DioException caught');
      if (e.type == DioExceptionType.connectionTimeout) {
        print('❌ [AuthRemoteDataSource] Connection Timeout - Backend not responding');
        print('   Check: Is Django backend running on http://10.0.2.2:8000?');
        throw Exception('Connection timeout: Backend server not responding. Make sure Django backend is running.');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        print('❌ [AuthRemoteDataSource] Receive Timeout - Backend too slow');
        throw Exception('Receive timeout: Backend server is responding too slowly.');
      } else if (e.response?.statusCode == 400 || e.response?.statusCode == 401) {
        print('❌ [AuthRemoteDataSource] Invalid credentials');
        throw Exception(e.response?.data['detail'] ?? 'Invalid email or password');
      } else {
        print('❌ [AuthRemoteDataSource] Error: ${e.message}');
        print('   Type: ${e.type}');
        print('   Response Status: ${e.response?.statusCode}');
        throw Exception('Login failed: ${e.message}');
      }
    } catch (e) {
      print('❌ [AuthRemoteDataSource] Unexpected error: $e');
      throw Exception('Login failed: $e');
    }
  }

  @override
  Future<void> logout() async {
    // Optional: Call backend logout if stateful
    // await client.post('/auth/logout/');
  }
}

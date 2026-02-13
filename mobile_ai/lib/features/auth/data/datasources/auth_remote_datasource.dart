import 'package:mobile_ai/core/api/api_client.dart';

abstract class AuthRemoteDataSource {
  Future<Map<String, dynamic>> login(String username, String password);
  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<Map<String, dynamic>> login(String username, String password) async {
    final response = await client.post(
      '/auth/login/', // Verify endpoint path in backend
      data: {
        'username': username,
        'password': password,
      },
    );
    
    if (response.statusCode == 200) {
      return response.data as Map<String, dynamic>;
    } else {
      throw Exception('Login failed: ${response.statusMessage}');
    }
  }

  @override
  Future<void> logout() async {
    // Optional: Call backend logout if stateful
    // await client.post('/auth/logout/');
  }
}

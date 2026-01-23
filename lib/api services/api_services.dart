import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'token_services.dart';

class ApiServices {
  static const String baseUrl = 'http://localhost:8000/api';

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    ),
  );

  final TokenService _tokenService = TokenService();

  ApiServices() {
    _setHeaders();
  }

  // =======================
  // Set Auth Headers
  // =======================
  Future<void> _setHeaders() async {
    final token = await _tokenService.getToken();
    debugPrint("Token for API: $token");
    if (token != null) {
      _dio.options.headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
    }
  }

  // =======================
  // Generic Request Handler
  // =======================
  Future<Response?> request(
    String method,
    String url, {
    dynamic data,
    Map<String, dynamic>? query,
  }) async {
    try {
      await _setHeaders();

      late Response response;

      switch (method.toUpperCase()) {
        case 'GET':
          response = await _dio.get(url, queryParameters: query);
          break;
        case 'POST':
          response = await _dio.post(url, data: data);
          break;
        case 'PUT':
          response = await _dio.put(url, data: data);
          break;
        case 'DELETE':
          response = await _dio.delete(url);
          break;
        default:
          throw Exception('Invalid HTTP method');
      }

      debugPrint('[$method] $url');
      debugPrint('Status: ${response.statusCode}');
      debugPrint('Response: ${response.data}');

      return response;
    } on DioException catch (e) {
      debugPrint('API ERROR: ${e.response?.data ?? e.message}');
      return e.response;
    }
  }

  // =======================
  // AUTH APIs
  // =======================

  Future<Map<String, dynamic>?> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await request(
      'POST',
      '/register',
      data: {'name': name, 'email': email, 'password': password},
    );

    return response?.data;
  }

  Future<Map<String, dynamic>?> login({
    required String email,
    required String password,
  }) async {
    final response = await request(
      'POST',
      '/login',
      data: {'email': email, 'password': password},
    );

    return response?.data;
  }

  Future<Map<String, dynamic>?> logout() async {
    final response = await request('POST', '/logout');
    return response?.data;
  }
}

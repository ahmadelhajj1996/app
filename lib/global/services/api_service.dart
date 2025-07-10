
// api_service.dart
import 'package:dio/dio.dart';
import 'package:alsuwq_albaladii_app/global/data/local/cache_helper.dart';

class ApiService {
  static final Dio _dio = Dio();
  static const String baseUrl = 'http://192.168.56.1:3000/api';

  static void init() {
    _dio.options.baseUrl = baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 30);
    _dio.options.receiveTimeout = const Duration(seconds: 30);

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final token = CacheHelper.getData(key: 'token');
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        options.headers['Content-Type'] = 'application/json';
        handler.next(options);
      },
    ));
  }

  static Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(endpoint, data: data);
      return {'success': true, 'data': response.data};
    } catch (e) {
      if (e is DioException && e.response != null) {
        final errorData = e.response!.data;
        String errorMessage = 'حدث خطأ غير متوقع';

        if (errorData is Map<String, dynamic>) {
          if (errorData['message'] != null) {
            // التعامل مع message كـ String أو List
            final message = errorData['message'];
            if (message is String) {
              errorMessage = message;
            } else if (message is List && message.isNotEmpty) {
              errorMessage = message.first.toString();
            }
          }
        }

        return {'success': false, 'error': errorMessage};
      }
      return {'success': false, 'error': 'خطأ في الاتصال'};
    }
  }

  static Future<Map<String, dynamic>> get(String endpoint) async {
    try {
      final response = await _dio.get(endpoint);
      return {'success': true, 'data': response.data};
    } catch (e) {
      return {'success': false, 'error': e.toString()};
    }
  }

  static Future<Map<String, dynamic>> put(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await _dio.put(endpoint, data: data);
      return {'success': true, 'data': response.data};
    } catch (e) {
      return {'success': false, 'error': e.toString()};
    }
  }

  static Future<Map<String, dynamic>> delete(String endpoint) async {
    try {
      final response = await _dio.delete(endpoint);
      return {'success': true, 'data': response.data};
    } catch (e) {
      return {'success': false, 'error': e.toString()};
    }
  }
}
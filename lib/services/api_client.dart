import 'package:dio/dio.dart';
import 'auth_service.dart';

class ApiClient {
  ApiClient._() {
    // Add auth header automatically if token exists
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      final t = AuthService.instance.token;
      if (t != null && t.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer $t';
      }
      handler.next(options);
    }));
  }
  static final ApiClient instance = ApiClient._();

  static String _sanitize(String raw) {
    var v = raw.replaceAll(RegExp(r'\s+'), '');
    if (!v.startsWith('http://') && !v.startsWith('https://')) v = 'http://$v';
    return v;
  }

  // flutter run --dart-define=HAVENHOA_API=http://localhost:8080
  static final String baseUrl = _sanitize(const String.fromEnvironment(
    'HAVENHOA_API',
    defaultValue: 'http://localhost:8080',
  ));

  final Dio dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 8),
    receiveTimeout: const Duration(seconds: 20),
    headers: {'Content-Type': 'application/json'},
  ));
}

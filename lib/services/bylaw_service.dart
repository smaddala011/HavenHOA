import 'dart:io';
import 'package:dio/dio.dart';
import 'api_client.dart';
import 'auth_service.dart';

class BylawService {
  final _dio = ApiClient.instance.dio;
  final _auth = AuthService.instance;

  Future<Map<String, dynamic>> ask({required String query, int k = 6}) async {
    final res = await _dio.post('/bylaws/ask', data: {
      'community_id': AuthService.communityId,
      'query': query,
      'k': k,
    });
    return Map<String, dynamic>.from(res.data);
  }

  Future<Map<String, dynamic>> ingest({required File file}) async {
    if (!_auth.isBoard) {
      throw Exception('Only board/manager/admin can ingest bylaws.');
    }
    final form = FormData.fromMap({
      'community_id': AuthService.communityId,
      'file': await MultipartFile.fromFile(file.path,
          filename: file.uri.pathSegments.last),
    });
    final res = await _dio.post('/bylaws/ingest', data: form);
    return Map<String, dynamic>.from(res.data);
  }
}

import 'package:flutter/foundation.dart';

class AuthService {
  AuthService._();
  static final AuthService instance = AuthService._();

  // Provide these at build time:
  // flutter run --dart-define=HAVENHOA_COMMUNITY=demo-hoa --dart-define=HAVENHOA_JWT=eyJ...
  static const String communityId =
      String.fromEnvironment('HAVENHOA_COMMUNITY', defaultValue: 'demo-hoa');
  static const String _jwt =
      String.fromEnvironment('HAVENHOA_JWT', defaultValue: '');

  // Simple role flag (optional UI gating for uploads). Replace later with real auth.
  static const String role = String.fromEnvironment('HAVENHOA_ROLE',
      defaultValue: 'board'); // resident|board|manager|admin

  String? get token => _jwt.isEmpty ? null : _jwt;
  bool get isBoard => role == 'board' || role == 'manager' || role == 'admin';

  // For debugging
  void debugPrintConfig() {
    debugPrint(
        '[AuthService] community=$communityId role=$role token=${_jwt.isEmpty ? "(none)" : "(set)"}');
  }
}

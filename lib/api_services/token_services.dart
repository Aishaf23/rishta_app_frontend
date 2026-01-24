import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TokenService {
  static String _accessToken = '';
  final FlutterSecureStorage _storage = FlutterSecureStorage();
  static const String _tokenKey = 'token';

  static String get accessToken => _accessToken;

  static void setAccessToken(String token) {
    _accessToken = token;
  }

  Future<void> saveToken(String token) async {
    setAccessToken(token);
    await _storage.write(key: _tokenKey, value: token);
  }

  Future<String?> getToken() async {
    String? token = await _storage.read(key: _tokenKey);
    if (token != null) {
      setAccessToken(token);
    }
    return token;
  }

  Future<void> deleteToken() async {
    setAccessToken('');
    await _storage.delete(key: _tokenKey);
  }
}

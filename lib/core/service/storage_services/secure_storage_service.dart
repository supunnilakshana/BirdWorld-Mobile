import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final _storage = const FlutterSecureStorage();

  setToken(String token) async =>
      await _storage.write(key: "token", value: token);

  Future<String?> get getToken async => await _storage.read(key: "token");
}

import 'package:birdworld/core/models/app_user.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final _storage = const FlutterSecureStorage();

  Future<void> setToken(String token) async =>
      await _storage.write(key: "token", value: token);

  Future<String?> get getToken async => await _storage.read(key: "token");

  Future<bool> setUserData(AppUser userModel) async {
    bool res = false;
    try {
      await _storage.write(key: "id", value: userModel.id);
      await _storage.write(key: "fName", value: userModel.firstName);
      await _storage.write(key: "lName", value: userModel.lastName);
      await _storage.write(key: "role", value: userModel.role);
      await _storage.write(key: "email", value: userModel.email);
      res = true;
      return res;
    } catch (e) {
      print(e);
      return res;
    }
  }

  Future<AppUser?> getUserData() async {
    try {
      String? id = await _storage.read(key: "id");
      String? fName = await _storage.read(key: "fName");
      String? lName = await _storage.read(key: "lName");
      String? role = await _storage.read(key: "role");
      String? email = await _storage.read(key: "email");

      if (fName != null && lName != null && role != null && email != null) {
        return AppUser(
          firstName: fName,
          id: id,
          lastName: lName,
          role: role,
          email: email,
        );
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<bool> clearStorage() async {
    bool res = false;
    try {
      await _storage.deleteAll();
      res = true;
      return res;
    } catch (e) {
      return res;
    }
  }
}

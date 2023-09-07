import 'package:birdworld/core/api/api_client.dart';
import 'package:birdworld/core/config/endapoints/api_endpoints.dart';
import 'package:birdworld/core/enums/roles_enum.dart';
import 'package:birdworld/core/models/app_user.dart';
import 'package:birdworld/core/models/login_response.dart';
import 'package:birdworld/core/service/dialog_service/dialog_service.dart';
import 'package:birdworld/core/service/storage_services/secure_storage_service.dart';

class AuthService {
  ApiClient apiclient = ApiClient();
  final SecureStorageService _secureStorageService = SecureStorageService();
  final AppDialogServices _appDialogServices = AppDialogServices();

  Future<bool> signin({required String email, required String password}) async {
    try {
      final LoginResponse res = await apiclient.post<LoginResponse>(
          APIendPonts.signin,
          data: {"password": password, "email": email});
      await _secureStorageService.setToken(res.token);
      await _secureStorageService.setUserData(res.user);
      return true;
    } on Exception catch (e) {
      _appDialogServices.showSnackBar(e.toString());
      return false;
    }
  }

  Future<bool> signup(
      {required String fname,
      required String lname,
      required String email,
      required String password}) async {
    try {
      final LoginResponse res =
          await apiclient.post<LoginResponse>(APIendPonts.signup, data: {
        "email": email,
        "firstName": fname,
        "lastName": lname,
        "role": UserRoles.GUser.name,
        "password": password
      });

      await _secureStorageService.setToken(res.token);
      await _secureStorageService.setUserData(res.user);
      return true;
    } on Exception catch (e) {
      print(e);
      _appDialogServices.showSnackBar(e.toString());
      return false;
    }
  }

  Future<bool> isAuthenticated() async {
    try {
      String? token = await _secureStorageService.getToken;
      if (token == null) {
        return false;
      } else {
        await apiclient.post(APIendPonts.authcheck, isTokenNeeded: true);
        AppUser? appuser = await _secureStorageService.getUserData();
        if (appuser != null) {
          return true;
        } else {
          return false;
        }
      }
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> sendResetTokenemail() async {
    try {
      String? token = await _secureStorageService.getToken;
      if (token == null) {
        return false;
      } else {
        await apiclient.post(APIendPonts.authcheck, isTokenNeeded: true);
        AppUser? appuser = await _secureStorageService.getUserData();
        if (appuser != null) {
          return true;
        } else {
          return false;
        }
      }
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> signOut() async {
    try {
      bool res = await _secureStorageService.clearStorage();
      return res;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }
}

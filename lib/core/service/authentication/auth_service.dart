import 'package:birdworld/core/api/api_client.dart';
import 'package:birdworld/core/config/endapoints/api_endpoints.dart';
import 'package:birdworld/core/enums/roles_enum.dart';
import 'package:birdworld/core/models/app_user.dart';
import 'package:birdworld/core/models/login_response.dart';
import 'package:birdworld/core/service/dialog_service/dialog_service.dart';
import 'package:birdworld/core/service/storage_services/secure_storage_service.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  ApiClient apiclient = ApiClient();
  final SecureStorageService _secureStorageService = SecureStorageService();
  final AppDialogServices _appDialogServices = AppDialogServices();
  final googleSignIn = GoogleSignIn(
      clientId:
          '801488927192-41skflgu7tn24kme4vi5s79p2mv4e457.apps.googleusercontent.com',
      serverClientId:
          "801488927192-811loukusmn2epu4oqerro58u71qp41t.apps.googleusercontent.com");

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

  Future<bool> googleAuth() async {
    try {
      final googleUser = await googleSignIn.signIn();
      print(googleUser);

      if (googleUser == null) return false;

      final googleAuth = await googleUser.authentication;
      final idToken = googleAuth.idToken;

      // final databaseReference = FirebaseDatabase.instance.reference();

      // final databasePath =
      //     'users/${googleUser.id}';

      // await databaseReference.child(databasePath).set({
      //   'idToken': idToken,
      // });
      final LoginResponse res = await apiclient.post<LoginResponse>(
          APIendPonts.googleauth,
          data: {"token": idToken, "role": UserRoles.GUser.name});
      await _secureStorageService.setToken(res.token);
      await _secureStorageService.setUserData(res.user);
      return true;
    } catch (e) {
      print(e.toString());
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
      _appDialogServices.showSnackBar(e.toString());
      return false;
    }
  }

  Future<bool> sendResetTokenemail({required String email}) async {
    try {
      await apiclient
          .get(APIendPonts.reqpwrest, queryParameters: {"email": email});
      _appDialogServices.showSnackBar("Check your inbox");
      return true;
    } on Exception catch (e) {
      print(e);
      _appDialogServices.showSnackBar(e.toString(),
          backgroundColor: Colors.red);
      return false;
    }
  }

  Future<bool> resetPassword(
      {required String email,
      required String token,
      required String newpasssowrd}) async {
    try {
      String? token = await _secureStorageService.getToken;
      if (token == null) {
        return false;
      } else {
        await apiclient.post(APIendPonts.reqpwrest, data: {
          "email": email,
          "token": token,
          "newPassword": newpasssowrd
        });

        return true;
      }
    } on Exception catch (e) {
      print(e);
      _appDialogServices.showSnackBar(e.toString());
      return false;
    }
  }

  Future<bool> signOut() async {
    try {
      bool res = await _secureStorageService.clearStorage();
      await googleSignIn.signOut();
      return res;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }
}

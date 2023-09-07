import 'dart:async';
import 'package:birdworld/core/config/routes/router.router.dart';
import 'package:birdworld/core/models/app_user.dart';
import 'package:birdworld/core/service/authentication/auth_service.dart';
import 'package:birdworld/core/service/storage_services/secure_storage_service.dart';
import 'package:get_it/get_it.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  final NavigationService _navigationService = GetIt.I.get();
  final AuthService _authService = AuthService();
  final SecureStorageService _securestorageService = SecureStorageService();
  SplashViewModel();
  void init() async {
    Timer(const Duration(seconds: 3), () async {
      final authstatus = await _authService.isAuthenticated();
      if (authstatus) {
        final AppUser? user = await _securestorageService.getUserData();
        if (user == null || user.id == null) {
          _navigationService.replaceWith(Routes.signInView);
        } else {
          _navigationService.replaceWith(Routes.baseHomeView);
        }
      } else {
        _navigationService.replaceWith(Routes.signInView);
      }
    });
  }
}

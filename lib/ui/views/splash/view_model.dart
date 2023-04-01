import 'dart:async';

import 'package:birdworld/core/config/routes/router.router.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SplashViewModel extends BaseViewModel {
  final NavigationService _navigationService = GetIt.I.get();

  SplashViewModel();
  void init() async {
    Timer(const Duration(seconds: 3), () async {
      // final bool authstatus = await _appAuthService.isAuthenticated();
      // await localeProvider.init();
      // if (authstatus) {
      //   final AppUserModel? userModel =
      //       await _localStorageService.getUserData();
      //   if (userModel == null || userModel.id == null) {
      //     final User? user = _appAuthService.currentUser();
      //     print(null);
      //     final AppUserModel? fuser = await _appUserService.fetchUser(user!.id);
      //     if (fuser != null) {
      //       _navigationService.replaceWith(Routes.homeView);
      //     } else {
      //       _navigationService.replaceWith(Routes.loginView);
      //     }
      //   } else {
      //     _navigationService.replaceWith(Routes.homeView);
      //   }
      // } else {
      //   _navigationService.replaceWith(Routes.loginView);
      // }
      _navigationService.replaceWith(Routes.signInView);
    });
  }
}

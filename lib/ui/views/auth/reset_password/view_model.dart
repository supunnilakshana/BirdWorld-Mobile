import 'package:birdworld/core/config/routes/router.router.dart';
import 'package:birdworld/core/service/authentication/auth_service.dart';
import 'package:birdworld/core/service/bottom_sheet_service/bottom_sheet_service.dart';
import 'package:birdworld/core/service/dialog_service/dialog_service.dart';
import 'package:birdworld/core/service/providers/app_user_provider.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ResetPasswordViewModel extends BaseViewModel {
  final NavigationService _navigationService = GetIt.I.get();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final Uri dlinkArg;
  final TextEditingController passwordcon = TextEditingController();
  final TextEditingController confirmpasswordcon = TextEditingController();
  final AppDialogServices appdialogservice = AppDialogServices();
  final AppUserProvider appUserProvider;
  ResetPasswordViewModel(this.dlinkArg, this.appUserProvider);

  goBack() {
    _navigationService.back();
  }

  void init() {}

  void resetpw() async {
    if (formKey.currentState!.validate()) {
      try {
        String? token = dlinkArg.queryParameters['token'];
        String? email = dlinkArg.queryParameters['email'];
        if (token != null && email != null) {
          token = Uri.decodeComponent(token);
          email = Uri.decodeComponent(email);
          print('Token: $token---------------$email');

          appdialogservice.loading();
          final res = await AuthService(appUserProvider).resetPassword(
              email: email, token: token, newpasssowrd: passwordcon.text);
          _navigationService.back();
          if (res) {
            _navigationService.clearStackAndShow(Routes.signInView);
          } else {}
        } else {
          appdialogservice.showSnackBar("invalid password rest url");
        }
      } on Exception catch (e) {
        appdialogservice.showSnackBar("invalid password rest url");
      }
    }
  }
}

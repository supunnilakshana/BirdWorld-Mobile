import 'package:birdworld/core/config/routes/router.router.dart';
import 'package:birdworld/core/service/authentication/auth_service.dart';
import 'package:birdworld/core/service/dialog_service/dialog_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  final NavigationService _navigationService = GetIt.I.get();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailcon = TextEditingController();
  final AppDialogServices _appDialogServices = AppDialogServices();
  ForgotPasswordViewModel();
  AuthService authService = AuthService();

  goBack() {
    _navigationService.back();
  }

  sendVlink() async {
    if (formKey.currentState!.validate()) {
      _appDialogServices.loading();
      final res =
          await authService.sendResetTokenemail(email: emailcon.text.trim());
      _navigationService.back();
      if (res) {
        _navigationService.back();
      }
    }
  }

  void init() {}
}

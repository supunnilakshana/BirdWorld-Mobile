import 'package:birdworld/core/config/routes/router.router.dart';
import 'package:birdworld/core/service/authentication/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ForgotPasswordViewModel extends BaseViewModel {
  final NavigationService _navigationService = GetIt.I.get();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailcon = TextEditingController();

  ForgotPasswordViewModel();

  goBack() {
    _navigationService.back();
  }

  sendVlink() async {
    // _navigationService.navigateTo(Routes.signUpView);
    ;
  }

  void init() {}
}

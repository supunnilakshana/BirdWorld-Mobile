import 'package:birdworld/core/config/routes/router.router.dart';
import 'package:birdworld/core/service/authentication/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignInViewModel extends BaseViewModel {
  final NavigationService _navigationService = GetIt.I.get();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailcon = TextEditingController();
  final TextEditingController passwordcon = TextEditingController();

  SignInViewModel();

  goBack() {
    _navigationService.back();
  }

  goSignUp() {
    _navigationService.navigateTo(Routes.signUpView);
  }

  goForgotPassword() {
    _navigationService.navigateTo(Routes.forgotPasswordView);
  }

  signIn() async {
    AuthService authService = AuthService();
    await authService.signin("email", "password");
    // _navigationService.replaceWithBaseHomeView(initIndex: 1);
  }

  void init() {}
}

import 'package:birdworld/core/config/routes/router.router.dart';
import 'package:birdworld/core/service/authentication/auth_service.dart';
import 'package:birdworld/core/service/dialog_service/dialog_service.dart';
import 'package:birdworld/core/service/providers/app_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignInViewModel extends BaseViewModel {
  final NavigationService _navigationService = GetIt.I.get();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailcon = TextEditingController();
  final AppUserProvider appUserProvider;
  final TextEditingController passwordcon = TextEditingController();
  final AppDialogServices _appDialogServices = AppDialogServices();
  late AuthService authService;
  SignInViewModel(this.appUserProvider);

  goBack() {
    _navigationService.back();
  }

  goSignUp() {
    _navigationService.navigateTo(Routes.signUpView);
  }

  void googlesign() async {
    final bool signres = await authService.googleAuth();
    if (signres) {
      _navigationService.replaceWith(Routes.baseHomeView);
    }
  }

  goForgotPassword() {
    _navigationService.navigateTo(Routes.forgotPasswordView);
  }

  signIn() async {
    if (formKey.currentState!.validate()) {
      _appDialogServices.loading();

      final bool signres = await authService.signin(
          email: emailcon.text.trim(), password: passwordcon.text);
      _navigationService.back();
      if (signres) {
        print(signres);
        _navigationService.replaceWith(Routes.baseHomeView);
      }
    }
  }

  void init() {
    authService = AuthService(appUserProvider);
  }
}

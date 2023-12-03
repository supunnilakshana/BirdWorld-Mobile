import 'package:birdworld/core/config/routes/router.router.dart';
import 'package:birdworld/core/service/authentication/auth_service.dart';
import 'package:birdworld/core/service/dialog_service/dialog_service.dart';
import 'package:birdworld/core/service/providers/app_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignUpViewModel extends BaseViewModel {
  final NavigationService _navigationService = GetIt.I.get();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailcon = TextEditingController();
  final TextEditingController mobilnumecon = TextEditingController();
  final TextEditingController firstnamecon = TextEditingController();
  final TextEditingController lastnamecon = TextEditingController();
  final TextEditingController passwordcon = TextEditingController();
  final TextEditingController confirmpasswordcon = TextEditingController();
  late AuthService _authservice;
  final AppUserProvider appUserProvider;
  final AppDialogServices _appDialogServices = AppDialogServices();
  SignUpViewModel(this.appUserProvider);

  goBack() {
    _navigationService.back();
  }

  signUp() async {
    if (formKey.currentState!.validate()) {
      _appDialogServices.loading();
      final res = await _authservice.signup(
          fname: firstnamecon.text,
          lname: lastnamecon.text,
          email: emailcon.text.trim(),
          password: passwordcon.text);
      _navigationService.back();
      if (res) {
        _navigationService.replaceWith(Routes.baseHomeView);
      }
    }
  }

  void googlesign() async {
    await _authservice.googleAuth();
  }

  void init() {
    _authservice = AuthService(appUserProvider);
  }
}

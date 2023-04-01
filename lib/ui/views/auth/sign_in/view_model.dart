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

  void init() {}
}

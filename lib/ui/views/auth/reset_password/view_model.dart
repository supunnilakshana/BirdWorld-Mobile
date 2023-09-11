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

  ResetPasswordViewModel(this.dlinkArg);

  goBack() {
    _navigationService.back();
  }

  void init() {}
}

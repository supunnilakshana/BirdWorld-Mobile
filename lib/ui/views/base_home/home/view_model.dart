import 'dart:io';
import 'package:birdworld/core/service/providers/app_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../../../core/service/dialog_service/dialog_service.dart';
import '../../../theme/color.dart';

class HomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = GetIt.I.get();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  //AppUpdateInfo? _updateInfo;
  final AppUserProvider appuser;
  HomeViewModel(this.appuser);

  goBack() {
    _navigationService.back();
  }

  DateTime pre_backpress = DateTime.now();
  Future<bool> onBack() {
    final timegap = DateTime.now().difference(pre_backpress);
    final cantExit = timegap >= const Duration(seconds: 2);
    pre_backpress = DateTime.now();
    if (cantExit) {
      AppDialogServices().showSnackBar("Press Back button again to Exit",
          backgroundColor: AppColors.appPrimary);

      return Future<bool>.value(false);
    } else {
      return Future<bool>.value(true);
    }
  }

  void init() {}
}

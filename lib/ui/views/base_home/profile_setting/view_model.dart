import 'package:birdworld/core/config/routes/router.router.dart';
import 'package:birdworld/core/service/authentication/auth_service.dart';
import 'package:birdworld/core/service/dialog_service/custom_popup_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileSettingViewModel extends BaseViewModel {
  final NavigationService navigationService = GetIt.I.get();

  ProfileSettingViewModel();

  goBack() {
    navigationService.back();
  }

  void init() {}
  signout(BuildContext context) {
    CustomPopupDialog.showPopupLogout(
        context, "Sign out", "Do you want to sign out ? ", () async {
      await AuthService().signOut();
      navigationService.clearStackAndShow(Routes.signInView);
    });
  }
}

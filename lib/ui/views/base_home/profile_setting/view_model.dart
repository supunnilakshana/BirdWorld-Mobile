// import 'package:cstoremobile/core/service/tost_service/tost_service.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get_it/get_it.dart';

// import 'package:stacked/stacked.dart';
// import 'package:stacked_services/stacked_services.dart';

// class ProfileSettingViewModel extends BaseViewModel {
//   final NavigationService navigationService = GetIt.I.get();
//   final user = FirebaseAuth.instance.currentUser;
//   final TostService tostservice = TostService();
//   ProfileSettingViewModel();

//   goBack() {
//     navigationService.back();
//   }

//   void init() {}
//   signout(BuildContext context) {
//     // PopupDialog.showPopupLogout(
//     //     context, "Sign out", "Do you want to sign out ? ", () async {
//     //   await AppAuthService().signOut();
//     //   navigationService.clearStackAndShow(Routes.signInView);
//     // });
//   }
// }

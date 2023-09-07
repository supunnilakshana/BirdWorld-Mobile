import 'package:birdworld/core/service/authentication/auth_service.dart';
import 'package:birdworld/core/service/dialog_service/dialog_service.dart';
import 'package:birdworld/ui/theme/color.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = GetIt.I.get();
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  bool isimgload = false;
  // final UserDataProvider userDataProvider;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  HomeViewModel();

  goBack() {
    _navigationService.back();
  }

  goStore() {}

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

  Future<void> selectimgFromGallery() async {
    XFile? selectedimage =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    if (selectedimage != null) {
      image = selectedimage;
      isimgload = true;
    }
    notifyListeners();
  }

  Future<void> selectimgFromCamera() async {
    XFile? selectedimage =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    if (selectedimage != null) {
      image = selectedimage;
      isimgload = true;
    }
    notifyListeners();
  }

  clearImage() {
    isimgload = false;
    image = null;
    notifyListeners();
  }

  void uploadimg() async {}

  void init() {}
}

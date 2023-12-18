import 'package:birdworld/core/service/api_services/comminity_service.dart';
import 'package:birdworld/core/service/authentication/auth_service.dart';
import 'package:birdworld/core/service/dialog_service/dialog_service.dart';
import 'package:birdworld/ui/theme/color.dart';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class IdentificationScreenViewModel extends BaseViewModel {
  final NavigationService _navigationService = GetIt.I.get();
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  bool isimgload = false;
  // final UserDataProvider userDataProvider;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  IdentificationScreenViewModel();

  goBack() {
    _navigationService.back();
  }

  goStore() {}

  void _showBirdDialog(BuildContext context, String birdName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Bird Name"),
          content: Text(birdName),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void delayedShowBirdDialog(BuildContext context) {
    AppDialogServices().loading();
    Future.delayed(const Duration(seconds: 4), () {
      _navigationService.back();
      _showBirdDialog(context, "ABBOTTS BABBLER");
    });
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

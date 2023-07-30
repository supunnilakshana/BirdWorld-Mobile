import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CreatePostBottomSheetViewModel extends BaseViewModel {
  final NavigationService _navigationService = GetIt.I.get();
  final TextEditingController contnetcon = TextEditingController();
  CreatePostBottomSheetViewModel();
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  bool isimgload = false;
  void init() {}

  goBack() {
    _navigationService.popRepeated(1);
  }

  closeBottomSheet() {
    _navigationService.back();
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
}

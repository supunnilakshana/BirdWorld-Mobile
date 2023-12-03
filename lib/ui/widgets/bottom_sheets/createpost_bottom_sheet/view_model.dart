import 'package:birdworld/core/models/post.dart';
import 'package:birdworld/core/service/providers/app_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CreatePostBottomSheetViewModel extends BaseViewModel {
  final NavigationService _navigationService = GetIt.I.get();
  final TextEditingController contnetcon = TextEditingController();
  final AppUserProvider appUserProvider;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CreatePostBottomSheetViewModel(this.appUserProvider);
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

  createPost() {
    if (formKey.currentState!.validate()) {
      final post = Post(
          title: "title",
          description: "description",
          imageUrl: " imageUr",
          created: DateTime.now(),
          updated: DateTime.now(),
          user: appUserProvider.getappUser!,
          comments: [],
          likes: []);
    }
  }
}

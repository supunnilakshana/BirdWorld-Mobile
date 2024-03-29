import 'dart:typed_data';

import 'package:birdworld/core/config/endapoints/api_endpoints.dart';
import 'package:birdworld/core/config/endapoints/storage_collection.dart';
import 'package:birdworld/core/models/post.dart';
import 'package:birdworld/core/service/api_services/comminity_service.dart';
import 'package:birdworld/core/service/dialog_service/dialog_service.dart';
import 'package:birdworld/core/service/providers/app_user_provider.dart';

import 'package:birdworld/core/service/storage_services/cloud_storage_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../../core/config/app/app_config.dart';

class CreatePostBottomSheetViewModel extends BaseViewModel {
  final NavigationService _navigationService = GetIt.I.get();
  final TextEditingController contnetcon = TextEditingController();
  final AppUserProvider appUserProvider;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CreatePostBottomSheetViewModel(
    this.appUserProvider,
  );
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

  createPost() async {
    try {
      if (formKey.currentState!.validate() && isimgload) {
        AppDialogServices().loading();
        List<int> bytes = await image!.readAsBytes();

        // Convert the bytes to Uint8List
        Uint8List uint8List = Uint8List.fromList(bytes);

        String imageurl = await CloudStorageServices().uploadImage(uint8List,
            StroageCollection.postdata, appUserProvider.getappUser!.id!);
        final post = Post(
            title: contnetcon.text,
            description: contnetcon.text,
            imageUrl: imageurl,
            created: DateTime.now(),
            updated: DateTime.now(),
            user: appUserProvider.getappUser!,
            userId: appUserProvider.getappUser!.id!,
            comments: [],
            likes: []);
        print(post.toMap());

        await CommunityService().createPost(post);
        print("done");
        _navigationService.popRepeated(2);

        AppDialogServices().showSnackBar("Successfully Created");
      }
    } on Exception catch (e) {
      _navigationService.popRepeated(2);
    }
  }
}

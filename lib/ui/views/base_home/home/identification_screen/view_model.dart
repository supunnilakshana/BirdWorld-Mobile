import 'dart:io';

import 'package:birdworld/.env/env.dart';
import 'package:birdworld/core/service/api_services/comminity_service.dart';
import 'package:birdworld/core/service/authentication/auth_service.dart';
import 'package:birdworld/core/service/dialog_service/dialog_service.dart';
import 'package:birdworld/core/service/identification_service/bird_identification_service.dart';
import 'package:birdworld/core/service/tost_service/tost_service.dart';
import 'package:birdworld/ui/theme/color.dart';
import 'package:dart_openai/openai.dart';

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

  void showBirdIdentificationDialog(BuildContext context, String birdName,
      String description, bool isIdentified) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:
              Text(isIdentified ? 'Bird Identified!' : 'Identification Failed'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Bird Name: $birdName',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text('Description: $description'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
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

  setApiKeyOnStartup() {}

  void uploadimg(BuildContext context) async {
    try {
      String des = "N/A";
      if (isimgload) {
        AppDialogServices().loading();
        final res =
            await BirdIdentificationService().predictImage(File(image!.path));
        if (res.status == 'IDENTIFILED') {
          OpenAI.apiKey = AppAPIKeys.spOpenApiKey;
          final completion = await OpenAI.instance.completion.create(
            maxTokens: 1500,
            model: "text-davinci-003",
            prompt:
                "Give me a Small and creative description of this bird that bird name is ${res.name}. Include color, County where is living, Size, Weight, and Scientific type.",
          );

          print(completion.choices[0].text);
          des = completion.choices[0].text;
        }

        _navigationService.back();
        // ignore: use_build_context_synchronously
        showBirdIdentificationDialog(
            context, res.name, des, res.status == 'IDENTIFILED');
      } else {
        TostService().failedTost("Please choose image");
      }
    } on Exception catch (e) {
      _navigationService.back();
      TostService().failedTost("Somthing went wrong");
    }
  }

  void init() {
    setApiKeyOnStartup();
  }
}

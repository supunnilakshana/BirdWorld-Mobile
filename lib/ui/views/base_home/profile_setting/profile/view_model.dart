// import 'package:cstoremobile/core/config/collection_path/storage_collection_path.dart';
// import 'package:cstoremobile/core/service/cloud_storage_service/cloud_storage_service.dart';
// import 'package:cstoremobile/core/service/dialog_service/dialog_service.dart';
// import 'package:cstoremobile/core/service/providers/app_user_provider.dart';
// import 'package:cstoremobile/core/service/providers/userdata_provider.dart';
// import 'package:cstoremobile/core/service/tost_service/tost_service.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:get_it/get_it.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:stacked/stacked.dart';
// import 'package:stacked_services/stacked_services.dart';

// class ProfileViewModel extends BaseViewModel {
//   final NavigationService _navigationService = GetIt.I.get();
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   final TextEditingController emailcon = TextEditingController();
//   final TextEditingController firstnamecon = TextEditingController();
//   final TextEditingController lastnamecon = TextEditingController();
//   final TextEditingController mobilenocon = TextEditingController();
//   final TextEditingController studentidcon = TextEditingController();
//   final TextEditingController niccon = TextEditingController();
//   final TextEditingController bidcon = TextEditingController();
//   final user = FirebaseAuth.instance.currentUser;
//   final TextEditingController passwordcon = TextEditingController();
//   final TostService tostservice = TostService();
//   bool isedit = false;
//   late XFile image;
//   bool ispickImg = false;
//   final ImagePicker _picker = ImagePicker();
//   final UserDataProvider userData;
//   ProfileViewModel(this.userData);

//   goBack() {
//     _navigationService.back();
//   }

//   goSignIn() {
//     _navigationService.back();
//   }

//   enableEdit() {
//     isedit = isedit ? false : true;
//     notifyListeners();
//   }

//   update() {
//     if (formKey.currentState!.validate()) {
//       try {} catch (_) {}
//     }
//   }

//   void init() {}

//   pickImage() async {
//     final XFile? pickedimage =
//         await _picker.pickImage(source: ImageSource.gallery);
//     if (pickedimage != null) {
//       image = pickedimage;
//       await updataStoreImage();
//     }
//   }

//   clearImage() {
//     ispickImg = false;
//     notifyListeners();
//   }

//   Future<String> imageUpload(String userID) async {
//     Uint8List imgunitfile = await image.readAsBytes();

//     String imgurl = await CloudStorageServices().uploadImageWithname(
//         imgunitfile, StorageCollectionPaths.image, userID, "userprofile");

//     return imgurl;
//   }

//   updataStoreImage() async {
//     try {
//       AppDialogServices().loading();

//       if (user != null) {
//         String imgurl = await imageUpload(user!.uid);

//         await user!.updatePhotoURL(imgurl);
//         final bool res =
//             await AppUserProvider().updateeAppUserImage(imgurl, user!.uid);
//         if (res) {
//           notifyListeners();
//           tostservice.successTost("Sucessfully Updated");
//         } else {
//           tostservice.failedTost("Updated failed");
//         }

//         _navigationService.back();
//       } else {
//         _navigationService.back();
//         tostservice.failedTost("Updated failed");
//       }
//       notifyListeners();
//     } on Exception catch (_) {
//       _navigationService.back();
//       tostservice.failedTost("Updated failed");
//       notifyListeners();
//     }
//   }
// }

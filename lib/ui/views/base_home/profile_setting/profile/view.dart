// import 'package:cstoremobile/core/service/validation_service/validatation_service.dart';
// import 'package:cstoremobile/ui/theme/color.dart';
// import 'package:cstoremobile/ui/widgets/bottom_bars/button_bottom_bar.dart';
// import 'package:cstoremobile/ui/widgets/text_fileds/primary_textfiled.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:stacked/stacked.dart';
// import 'view_model.dart';

// class ProfileView extends StackedView<ProfileViewModel> {
//   const ProfileView({Key? key}) : super(key: key);

//   @override
//   Widget builder(
//       BuildContext context, ProfileViewModel viewModel, Widget? child) {
//     final size = MediaQuery.of(context).size;
//     final node = FocusScope.of(context);
//     final theme = Theme.of(context);
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         title: Text(viewModel.isedit ? "Edit Profile" : "My Profile"),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 15),
//             child: GestureDetector(
//                 onTap: () {
//                   viewModel.enableEdit();
//                 },
//                 child: Icon(
//                   FontAwesomeIcons.userPen,
//                   color: !viewModel.isedit
//                       ? AppColors.appPrimary
//                       : AppColors.white_gray,
//                 )),
//           )
//         ],
//       ),
//       bottomNavigationBar: viewModel.isedit
//           ? ButtonBottomBar(
//               titel: "Save Changes",
//               onPress: () {},
//             )
//           : null,
//       body: GestureDetector(
//         onTap: () => FocusScope.of(context).unfocus(),
//         child: Form(
//           key: viewModel.formKey,
//           child: SingleChildScrollView(
//             keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//             child: ConstrainedBox(
//               constraints: BoxConstraints(
//                   minHeight: size.height * 0.9, minWidth: size.width),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Padding(
//                     padding: EdgeInsets.only(
//                         left: size.width / 18,
//                         top: size.width / 30,
//                         right: size.width / 18),
//                     child: Column(
//                       children: <Widget>[
//                         Stack(
//                           children: [
//                             viewModel.user!.photoURL != null
//                                 ? CircleAvatar(
//                                     radius: size.height / 12,
//                                     backgroundImage:
//                                         NetworkImage(viewModel.user!.photoURL!),
//                                   )
//                                 : CircleAvatar(
//                                     radius: size.height / 12,
//                                     backgroundImage: const AssetImage(
//                                         "assets/images/defuser_avatar.png"),
//                                   ),
//                             Positioned(
//                                 bottom: 0,
//                                 right: -25,
//                                 child: RawMaterialButton(
//                                   onPressed: () async {
//                                     viewModel.pickImage();
//                                   },
//                                   elevation: 2.0,
//                                   fillColor: AppColors.md_theme_dark_secondary,
//                                   padding: const EdgeInsets.all(5.0),
//                                   shape: const CircleBorder(),
//                                   child: const Icon(Icons.camera_alt_outlined,
//                                       color: AppColors.white_gray),
//                                 )),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         SizedBox(
//                           height: size.height * 0.03,
//                         ),
//                         Column(
//                           children: <Widget>[
//                             Row(
//                               children: [
//                                 Expanded(
//                                   child: Primarytextformfiled(
//                                     isdasable: !viewModel.isedit,
//                                     enableLable: true,
//                                     hintText: "First Name",
//                                     controller: viewModel.firstnamecon,
//                                     onchange: (value) {},
//                                     valid: (value) =>
//                                         ValidatationService.genaralvalid(
//                                             value!),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: size.width / 30,
//                                 ),
//                                 Expanded(
//                                   child: Primarytextformfiled(
//                                     isdasable: !viewModel.isedit,
//                                     enableLable: true,
//                                     hintText: "Last Name",
//                                     controller: viewModel.lastnamecon,
//                                     onchange: (value) {},
//                                     valid: (value) =>
//                                         ValidatationService.genaralvalid(
//                                             value!),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: size.height * 0.03,
//                             ),
//                             Primarytextformfiled(
//                                 isdasable: true,
//                                 enableLable: true,
//                                 hintText: "Email",
//                                 keybordtype: TextInputType.emailAddress,
//                                 controller: viewModel.emailcon,
//                                 onchange: (value) {},
//                                 valid: (value) =>
//                                     ValidatationService.emailvaild(value!)),
//                             SizedBox(
//                               height: size.height * 0.03,
//                             ),
//                             Primarytextformfiled(
//                                 isdasable: true,
//                                 enableLable: true,
//                                 hintText: "Student ID",
//                                 controller: viewModel.studentidcon,
//                                 onchange: (value) {},
//                                 valid: (value) =>
//                                     ValidatationService.genaralvalid(value!)),
//                             SizedBox(
//                               height: size.height * 0.03,
//                             ),
//                             Primarytextformfiled(
//                                 isdasable: !viewModel.isedit,
//                                 enableLable: true,
//                                 hintText: "Mobile No",
//                                 keybordtype: TextInputType.number,
//                                 controller: viewModel.mobilenocon,
//                                 onchange: (value) {},
//                                 valid: (value) =>
//                                     ValidatationService.mobilenumvaild(value!)),
//                             SizedBox(
//                               height: size.height * 0.03,
//                             ),
//                             Primarytextformfiled(
//                                 isdasable: true,
//                                 enableLable: true,
//                                 hintText: "NIC No",
//                                 controller: viewModel.niccon,
//                                 onchange: (value) {},
//                                 valid: (value) =>
//                                     ValidatationService.genaralvalid(value!)),
//                             SizedBox(
//                               height: size.height * 0.03,
//                             ),
//                             Primarytextformfiled(
//                                 isdasable: !viewModel.isedit,
//                                 enableLable: true,
//                                 hintText: "Binance Id",
//                                 controller: viewModel.bidcon,
//                                 onchange: (value) {},
//                                 valid: (value) =>
//                                     ValidatationService.genaralvalid(value!)),
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 20,
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   viewModelBuilder(BuildContext context) =>
//       ProfileViewModel(Provider.of(context));

//   @override
//   void onViewModelReady(ProfileViewModel viewModel) => viewModel.init();
// }

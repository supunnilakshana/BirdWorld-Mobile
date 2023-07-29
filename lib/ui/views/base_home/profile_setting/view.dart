// import 'package:cstoremobile/core/config/constants/default_data.dart';
// import 'package:cstoremobile/core/config/routes/router.router.dart';
// import 'package:cstoremobile/ui/theme/color.dart';
// import 'package:cstoremobile/ui/widgets/tiles/account_list_tile.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import 'package:stacked/stacked.dart';
// import 'view_model.dart';

// class ProfileSettingView extends StackedView<ProfileSettingViewModel> {
//   const ProfileSettingView({Key? key}) : super(key: key);

//   @override
//   Widget builder(
//       BuildContext context, ProfileSettingViewModel viewModel, Widget? child) {
//     final size = MediaQuery.of(context).size;
//     final node = FocusScope.of(context);
//     final theme = Theme.of(context);
//     return Scaffold(
//       backgroundColor: AppColors.md_theme_dark_background,
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: Colors.black),
//         backgroundColor: Colors.transparent,
//         centerTitle: true,
//         elevation: 0.0,
//         title: const Text(
//           "Profile Setting",
//           style: TextStyle(color: AppColors.white_gray),
//         ),
//       ),
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Center(
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       height: size.height * 0.01,
//                     ),
//                     viewModel.user!.photoURL == null
//                         ? CircleAvatar(
//                             backgroundImage: const AssetImage(appuserDefImg),
//                             backgroundColor: AppColors.md_theme_dark_background,
//                             radius: size.width * 0.15,
//                           )
//                         : CircleAvatar(
//                             backgroundImage:
//                                 NetworkImage(viewModel.user!.photoURL!),
//                             backgroundColor: AppColors.md_theme_dark_background,
//                             radius: size.width * 0.15,
//                           ),
//                     SizedBox(
//                       height: size.height * 0.01,
//                     ),
//                     Text(
//                       viewModel.user!.displayName!,
//                       style: const TextStyle(
//                           fontSize: 18, fontWeight: FontWeight.bold),
//                     ),
//                     Text(
//                       viewModel.user!.email!,
//                       style: const TextStyle(
//                           fontSize: 15, color: AppColors.white_gray),
//                     ),
//                     SizedBox(
//                       height: size.height * 0.01,
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                           vertical: size.height * 0.04,
//                           horizontal: size.width * 0.02),
//                       child: Card(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(5)),
//                         elevation: 5,
//                         color: AppColors.md_theme_dark_background,
//                         child: Column(
//                           children: [
//                             AccountListTile(
//                                 title: "My Profile",
//                                 onPress: () {
//                                   viewModel.navigationService
//                                       .navigateTo(Routes.profileView);
//                                 },
//                                 icon: const FaIcon(FontAwesomeIcons.userPen)
//                                     .icon),
//                             AccountListTile(
//                                 title: "Privacy Polices",
//                                 onPress: () {
//                                   viewModel.navigationService
//                                       .navigateTo(Routes.privacyPolicyView);
//                                 },
//                                 icon: const FaIcon(FontAwesomeIcons.fileShield)
//                                     .icon),
//                             AccountListTile(
//                                 title: "Sign Out",
//                                 onPress: () {
//                                   viewModel.signout(context);
//                                 },
//                                 icon:
//                                     const FaIcon(FontAwesomeIcons.signOut).icon)
//                           ],
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: size.width * 0.02),
//                       child: const Align(
//                           alignment: Alignment.topLeft,
//                           child: Text(
//                             "More",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 color: AppColors.white_gray),
//                           )),
//                     ),
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                           vertical: size.height * 0.02,
//                           horizontal: size.width * 0.02),
//                       child: Card(
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(5)),
//                         elevation: 5,
//                         color: AppColors.md_theme_dark_background,
//                         child: Column(
//                           children: [
//                             AccountListTile(
//                                 title: "FAQ",
//                                 onPress: () {
//                                   // viewModel.navigationService
//                                   //     .navigateTo(Routes.fAQView);
//                                 },
//                                 icon: const FaIcon(FontAwesomeIcons.question)
//                                     .icon),
//                             AccountListTile(
//                                 title: "About App",
//                                 onPress: () {
//                                   viewModel.tostservice.customTost(
//                                       "App version 1.0", AppColors.appPrimary);
//                                 },
//                                 icon: const FaIcon(
//                                         FontAwesomeIcons.heartCircleBolt)
//                                     .icon)
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: size.height * 0.1,
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   viewModelBuilder(BuildContext context) => ProfileSettingViewModel();

//   @override
//   void onViewModelReady(ProfileSettingViewModel viewModel) => viewModel.init();
// }

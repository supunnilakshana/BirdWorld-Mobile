import 'package:birdworld/core/service/providers/app_user_provider.dart';
import 'package:birdworld/ui/theme/color.dart';
import 'package:birdworld/ui/widgets/tiles/account_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'view_model.dart';

class ProfileSettingView extends StackedView<ProfileSettingViewModel> {
  const ProfileSettingView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, ProfileSettingViewModel viewModel, Widget? child) {
    final size = MediaQuery.of(context).size;
    final node = FocusScope.of(context);
    final theme = Theme.of(context);
    final AppUserProvider ap = Provider.of(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    CircleAvatar(
                      backgroundImage: const NetworkImage(
                          "https://firebasestorage.googleapis.com/v0/b/birdworld-137aa.appspot.com/o/user34.png?alt=media&token=6c6ff817-7115-4166-9090-a3aafae3c93f"),
                      backgroundColor: AppColors.white_gray,
                      radius: size.width * 0.15,
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      "${ap.getappUser!.firstName} ${ap.getappUser!.lastName}",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ap.getappUser!.email,
                      style:
                          TextStyle(fontSize: 15, color: AppColors.darkblack),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.04,
                          horizontal: size.width * 0.02),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        elevation: 5,
                        color: AppColors.white_gray,
                        child: Column(
                          children: [
                            AccountListTile(
                                title: "My Profile",
                                onPress: () {
                                  // viewModel.navigationService
                                  //     .navigateTo(Routes.profileView);
                                },
                                icon: const FaIcon(FontAwesomeIcons.userPen)
                                    .icon),
                            AccountListTile(
                                title: "Privacy Polices",
                                onPress: () {},
                                icon: const FaIcon(FontAwesomeIcons.fileShield)
                                    .icon),
                            AccountListTile(
                                title: "Sign Out",
                                onPress: () {
                                  viewModel.signout(context);
                                },
                                icon:
                                    const FaIcon(FontAwesomeIcons.signOut).icon)
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: size.width * 0.02),
                      child: const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "More",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: AppColors.md_theme_light_font),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.02,
                          horizontal: size.width * 0.02),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        elevation: 5,
                        color: AppColors.white_gray,
                        child: Column(
                          children: [
                            AccountListTile(
                                title: "FAQ",
                                onPress: () {
                                  // viewModel.navigationService
                                  //     .navigateTo(Routes.fAQView);
                                },
                                icon: const FaIcon(FontAwesomeIcons.question)
                                    .icon),
                            AccountListTile(
                                title: "About App",
                                onPress: () {
                                  // viewModel.tostservice.customTost(
                                  //     "App version 1.0", AppColors.appPrimary);
                                },
                                icon: const FaIcon(
                                        FontAwesomeIcons.heartCircleBolt)
                                    .icon)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.1,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  viewModelBuilder(BuildContext context) =>
      ProfileSettingViewModel(Provider.of(context));

  @override
  void onViewModelReady(ProfileSettingViewModel viewModel) => viewModel.init();
}

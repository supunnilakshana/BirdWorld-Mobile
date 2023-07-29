import 'package:birdworld/ui/theme/color.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:stacked/stacked.dart';
import 'view_model.dart';

class BaseHomeView extends StackedView<BaseHomeViewModel> {
  const BaseHomeView({
    Key? key,
    this.initIndex = 0,
  }) : super(key: key);
  final int initIndex;

  @override
  Widget builder(
      BuildContext context, BaseHomeViewModel viewModel, Widget? child) {
    final size = MediaQuery.of(context).size;
    const Color navActiveColor = AppColors.blue;
    const Color navInActiveColor = AppColors.darkBlue;
    const TextStyle navTextstyle = TextStyle(fontWeight: FontWeight.w700);
    List<FlashyTabBarItem> items = [
      FlashyTabBarItem(
          activeColor: navActiveColor,
          inactiveColor: navInActiveColor,
          icon: const FaIcon(
            FontAwesomeIcons.house,
          ),
          title: const Text(
            'Home',
          )),
      FlashyTabBarItem(
          activeColor: navActiveColor,
          inactiveColor: navInActiveColor,
          icon: const FaIcon(
            FontAwesomeIcons.globe,
          ),
          title: const Text('Community')),
      FlashyTabBarItem(
          activeColor: navActiveColor,
          inactiveColor: navInActiveColor,
          icon: const FaIcon(
            FontAwesomeIcons.shop,
          ),
          title: const Text('Marketplace')),
      FlashyTabBarItem(
          activeColor: navActiveColor,
          inactiveColor: navInActiveColor,
          icon: const FaIcon(
            FontAwesomeIcons.gear,
          ),
          title: const Text('Settings')),
    ];

    return Scaffold(
        bottomNavigationBar: FlashyTabBar(
          onItemSelected: (value) {
            viewModel.changeindex(value);
          },
          items: items,
          backgroundColor: Colors.white,
          selectedIndex: viewModel.currentIndex,
        ),
        body: viewModel.screens[viewModel.currentIndex]);
    // return Scaffold(
    //   body: Stack(
    //     children: [
    //       viewModel.screens[viewModel.currentIndex],
    //       Align(
    //         alignment: Alignment.bottomCenter,
    //         child: BottomNavigationBar(
    //           selectedItemColor: AppColors.appPrimary,
    //           selectedIconTheme:
    //               const IconThemeData(color: AppColors.appPrimary),
    //           type: BottomNavigationBarType.fixed,
    //           backgroundColor: AppColors.md_theme_dark_background,
    //           currentIndex: viewModel.currentIndex,
    //           onTap: (int index) {
    //             viewModel.changeindex(index);
    //           },
    //           items: const [
    //             BottomNavigationBarItem(
    //               icon: FaIcon(FontAwesomeIcons.house),
    //               label: 'Home',
    //             ),
    //             BottomNavigationBarItem(
    //               icon: FaIcon(FontAwesomeIcons.moneyBillTransfer),
    //               label: 'Transacation',
    //             ),
    //             BottomNavigationBarItem(
    //               icon: FaIcon(FontAwesomeIcons.gear),
    //               label: 'Profile Setting',
    //             ),
    //           ],
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  @override
  viewModelBuilder(BuildContext context) => BaseHomeViewModel(initIndex);

  @override
  void onViewModelReady(BaseHomeViewModel viewModel) => viewModel.init();
}

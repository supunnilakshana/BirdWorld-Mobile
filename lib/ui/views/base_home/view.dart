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
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: FlashyTabBar(
          onItemSelected: (value) {
            viewModel.changeindex(value);
          },
          items: items,
          showElevation: true,
          backgroundColor: AppColors.white_gray,
          selectedIndex: viewModel.currentIndex,
        ),
      ),
      body: viewModel.screens[viewModel.currentIndex],
    );
    // );
  }

  @override
  viewModelBuilder(BuildContext context) => BaseHomeViewModel(initIndex);

  @override
  void onViewModelReady(BaseHomeViewModel viewModel) => viewModel.init();
}

import 'package:birdworld/ui/theme/color.dart';
import 'package:birdworld/ui/views/base_home/commnunity/view.dart';
import 'package:birdworld/ui/views/base_home/home/view.dart';
import 'package:birdworld/ui/views/base_home/marketplace/marketplace.dart';
import 'package:birdworld/ui/views/base_home/profile_setting/view.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class BaseHomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = GetIt.I.get();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final int initIndex;
  BaseHomeViewModel(this.initIndex);
  int currentIndex = 0;
  final List<Widget> screens = [
    const HomeView(),
    const CommunityView(),
    const MarketplaceScreen(),
    const ProfileSettingView()
  ];

  bool isSelected = false;
  goBack() {
    _navigationService.back();
  }

  changeindex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void init() {
    currentIndex = initIndex;
  }
}

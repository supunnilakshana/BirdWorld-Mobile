import 'package:birdworld/core/service/bottom_sheet_service/bottom_sheet_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CommunityViewModel extends BaseViewModel {
  final NavigationService _navigationService = GetIt.I.get();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  CommunityViewModel();

  goBack() {
    _navigationService.back();
  }

  openCommentBottom(BuildContext context) {
    AppBottomSheetService().showCommentBottomSheet(context);
  }

  init() {}
}

import 'package:birdworld/core/enums/data_fetch_enum.dart';
import 'package:birdworld/core/models/post.dart';
import 'package:birdworld/core/service/api_services/comminity_service.dart';
import 'package:birdworld/core/service/bottom_sheet_service/bottom_sheet_service.dart';
import 'package:birdworld/core/service/providers/com_dumm_provider.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CommunityViewModel extends BaseViewModel {
  final NavigationService _navigationService = GetIt.I.get();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late List<Post> postlist;
  final DataProvider dataProvider;
  FetchingStatus fetchingstatus = FetchingStatus.wating;
  CommunityViewModel(this.dataProvider);

  goBack() {
    _navigationService.back();
  }

  final TextEditingController postcon = TextEditingController();
  openCommentBottom(BuildContext context, Post post) {
    AppBottomSheetService().showCommentBottomSheet(context, post);
  }

  openCreatePosttBottom(BuildContext context) {
    AppBottomSheetService().showCreatePostBottomSheet(context);
  }

  loaddata() async {
    try {
      fetchingstatus = FetchingStatus.wating;
      postlist = await CommunityService().getAllPost();
      fetchingstatus = FetchingStatus.sucess;
      notifyListeners();
    } catch (e) {
      fetchingstatus = FetchingStatus.error;
      notifyListeners();
    }
  }

  init() async {
    await loaddata();
  }
}

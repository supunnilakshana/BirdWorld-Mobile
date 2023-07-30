import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CommentBottomSheetViewModel extends BaseViewModel {
  final NavigationService _navigationService = GetIt.I.get();
  final TextEditingController commentcon = TextEditingController();
  CommentBottomSheetViewModel();

  bool noComment = true;
  void init() {}

  goBack() {
    _navigationService.popRepeated(1);
  }

  closeBottomSheet() {
    _navigationService.back();
  }
}

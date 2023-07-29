import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

// ignore: depend_on_referenced_packages

class CartBottomSheetViewModel extends BaseViewModel {
  final NavigationService _navigationService = GetIt.I.get();

  CartBottomSheetViewModel();
  void init() {}

  goBack() {
    _navigationService.popRepeated(2);
  }

  closeBottomSheet() {
    _navigationService.back();
  }
}

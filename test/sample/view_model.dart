import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SampleViewModel extends BaseViewModel {
  final NavigationService _navigationService = GetIt.I.get();
  SampleViewModel();

  goBack() {
    _navigationService.back();
  }

  void init() {}
}

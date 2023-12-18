import 'package:birdworld/core/models/app_user.dart';
import 'package:flutter/widgets.dart';

class AppUserProvider extends ChangeNotifier {
  AppUser? _appUser;
  set setappUser(AppUser? appUser) {
    _appUser = appUser;

    notifyListeners();
  }

  AppUser? get getappUser => _appUser;
}

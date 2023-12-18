import 'package:birdworld/core/service/providers/app_user_provider.dart';
import 'package:birdworld/core/service/providers/com_dumm_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
];

List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider(create: (_) => AppUserProvider()),
  ChangeNotifierProvider(create: (_) => DataProvider()),
];

List<SingleChildWidget> dependentServices = [];

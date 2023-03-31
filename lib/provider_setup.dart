import 'package:birdworld/core/service/provider/app_user_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
];

List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider(create: (_) => AppUserProvider()),
];

List<SingleChildWidget> dependentServices = [];

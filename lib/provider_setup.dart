import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
];

List<SingleChildWidget> independentServices = [
  // ChangeNotifierProvider(create: (_) => LocaleProvider()),
];

List<SingleChildWidget> dependentServices = [];

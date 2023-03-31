import 'package:birdworld/main.dart';
import 'package:birdworld/ui/views/splash/view.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(routes: [
  AdaptiveRoute(page: SplashView, initial: true),
])
class $Router {}

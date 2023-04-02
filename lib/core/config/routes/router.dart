import 'package:birdworld/ui/views/auth/sign_in/view.dart';
import 'package:birdworld/ui/views/auth/sign_up/view.dart';
import 'package:birdworld/ui/views/splash/view.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(routes: [
  AdaptiveRoute(page: SplashView, initial: true),
  AdaptiveRoute(page: SignInView),
  AdaptiveRoute(page: SignUpView),
])
class $Router {}

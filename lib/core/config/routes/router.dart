import 'package:birdworld/ui/views/auth/forgot_password/view.dart';
import 'package:birdworld/ui/views/auth/reset_password/view.dart';
import 'package:birdworld/ui/views/auth/sign_in/view.dart';
import 'package:birdworld/ui/views/auth/sign_up/view.dart';
import 'package:birdworld/ui/views/base_home/view.dart';
import 'package:birdworld/ui/views/splash/view.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(routes: [
  AdaptiveRoute(page: SplashView, initial: true),
  AdaptiveRoute(
    page: SignInView,
  ),
  AdaptiveRoute(page: SignUpView),
  AdaptiveRoute(page: ForgotPasswordView),
  AdaptiveRoute(
    page: ResetPasswordView,
  ),
  AdaptiveRoute(
    page: BaseHomeView,
  ),
])
class $Router {}

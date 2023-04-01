import 'package:birdworld/ui/theme/color.dart';
import 'package:birdworld/ui/theme/style.dart';
import 'package:birdworld/ui/views/splash/view_model.dart';
import 'package:flutter/material.dart';

import 'package:stacked/stacked.dart';

class SplashView extends StackedView<SplashViewModel> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, SplashViewModel viewModel, Widget? child) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
                decoration: InputDecoration()
                    .applyDefaults(Theme.of(context).inputDecorationTheme)
                    .copyWith(
                      hintText: "GYGgy",
                    ))

            // SizedBox(
            //   width: size.width * 0.8,
            //   // height: size.height * 0.4,
            //   //  child: SvgPicture.asset("assets/images/podibiz_logo.svg")
            //   child: Image.asset("assets/images/podibiz_logo.png"),
            // ),
            // const LinearProgressIndicator(
            //   backgroundColor: AppColors.light_yellow,
            //   valueColor: AlwaysStoppedAnimation(AppColors.yellow),
            //   minHeight: 5,
            // ),
          ],
        ),
      ),
    );
  }

  @override
  viewModelBuilder(BuildContext context) => SplashViewModel();

  @override
  void onViewModelReady(SplashViewModel viewModel) => viewModel.init();
}

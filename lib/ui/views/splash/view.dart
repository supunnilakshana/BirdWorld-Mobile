import 'package:birdworld/ui/theme/color.dart';
import 'package:birdworld/ui/views/splash/view_model.dart';
import 'package:birdworld/ui/widgets/text_fileds/sufex_textfield.dart';
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
            SizedBox(
              width: size.width * 0.8,
              // height: size.height * 0.4,
              //  child: SvgPicture.asset("assets/images/podibiz_logo.svg")
              child: Image.asset("assets/images/tewmplogo.png"),
            ),
            // const LinearProgressIndicator(
            //   backgroundColor: AppColors.appPrimary,
            //   valueColor: AlwaysStoppedAnimation(AppColors.darkBlue),
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

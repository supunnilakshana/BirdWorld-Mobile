import 'package:birdworld/core/service/validation_service/validatation_service.dart';
import 'package:birdworld/ui/theme/color.dart';
import 'package:birdworld/ui/widgets/backgrounds/sign_in_background.dart';
import 'package:birdworld/ui/widgets/buttons/primary_button.dart';
import 'package:birdworld/ui/widgets/text_fileds/sufex_textfield.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';
import 'view_model.dart';

class ForgotPasswordView extends StackedView<ForgotPasswordViewModel> {
  const ForgotPasswordView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, ForgotPasswordViewModel viewModel, Widget? child) {
    final size = MediaQuery.of(context).size;
    final node = FocusScope.of(context);
    final theme = Theme.of(context);
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
          key: viewModel.formKey,
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Container(
              width: double.infinity,
              height: size.height,
              color: AppColors.appPrimary,
              child: SignInBackground(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Recover your  ",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "Password",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                child: Lottie.asset(
                                    'assets/animations/sign_in_animi.json',
                                    height: size.height * 0.2),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(45),
                                topRight: Radius.circular(45))),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: size.width / 18,
                              top: size.width / 30,
                              right: size.width / 18),
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: size.height * 0.05,
                              ),
                              Column(
                                children: <Widget>[
                                  SufexTextformfiled(
                                      hintText: "Email",
                                      iconData: FontAwesomeIcons.envelope,
                                      controller: viewModel.emailcon,
                                      onchange: (value) {},
                                      valid: (value) =>
                                          ValidatationService.emailvaild(
                                              value!)),
                                  SizedBox(
                                    height: size.height * 0.02,
                                  ),
                                  const Text(
                                    "*If you have account associate with this email we will send the recover link?",
                                    style: TextStyle(color: Colors.redAccent),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Primarybutton(
                                width: size.width,
                                onpress: () {},
                                text: "Send Verification link",
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  viewModelBuilder(BuildContext context) => ForgotPasswordViewModel();

  @override
  void onViewModelReady(ForgotPasswordViewModel viewModel) => viewModel.init();
}

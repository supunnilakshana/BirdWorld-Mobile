import 'package:birdworld/core/service/validation_service/validatation_service.dart';
import 'package:birdworld/ui/theme/color.dart';
import 'package:birdworld/ui/widgets/backgrounds/sign_in_background.dart';
import 'package:birdworld/ui/widgets/buttons/primary_button.dart';
import 'package:birdworld/ui/widgets/checkers/already_have_an_account_acheck.dart';
import 'package:birdworld/ui/widgets/dividers/or_divider.dart';
import 'package:birdworld/ui/widgets/text_fileds/password_field.dart';
import 'package:birdworld/ui/widgets/text_fileds/sufex_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';

import 'view_model.dart';

class SignInView extends StackedView<SignInViewModel> {
  const SignInView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, SignInViewModel viewModel, Widget? child) {
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
                            "Hello again ",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const Text(
                            "Welcome Back",
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
                                    height: size.height * 0.04,
                                  ),
                                  PrimaryPasswordformfiled(
                                    controller: viewModel.passwordcon,
                                    onchange: (val) {},
                                    valid: (val) =>
                                        ValidatationService.signupPassword(
                                            val!),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: (() {
                                      viewModel.goForgotPassword();
                                    }),
                                    child: const Text(
                                      "Forgot Password?",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Primarybutton(
                                width: size.width,
                                onpress: () {
                                  viewModel.signIn();
                                },
                                text: "Sign In",
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              AlreadyHaveAnAccountCheck(
                                login: true,
                                press: () {
                                  viewModel.goSignUp();
                                },
                              ),
                              const OrDivider(),
                              GestureDetector(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  'assets/icons/google_icon.svg',
                                  height: 80,
                                  width: 80,
                                ),
                              )
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
  viewModelBuilder(BuildContext context) => SignInViewModel();

  @override
  void onViewModelReady(SignInViewModel viewModel) => viewModel.init();
}

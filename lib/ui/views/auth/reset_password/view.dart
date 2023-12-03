import 'package:birdworld/core/service/validation_service/validatation_service.dart';
import 'package:birdworld/ui/theme/color.dart';
import 'package:birdworld/ui/widgets/backgrounds/sign_up_background.dart';
import 'package:birdworld/ui/widgets/buttons/primary_button.dart';
import 'package:birdworld/ui/widgets/checkers/already_have_an_account_acheck.dart';
import 'package:birdworld/ui/widgets/text_fileds/password_field.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import 'view_model.dart';

class ResetPasswordView extends StackedView<ResetPasswordViewModel> {
  final Uri dlinkArg;
  const ResetPasswordView(this.dlinkArg, {Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, ResetPasswordViewModel viewModel, Widget? child) {
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
              child: SignUpBackground(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, top: 20, bottom: 20),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "Reset",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Your ",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Password",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  child: Lottie.asset(
                                      'assets/animations/sign_in_animi.json',
                                      width: size.width * 0.45),
                                ),
                              ],
                            ),
                          )
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
                                height: size.height * 0.03,
                              ),
                              Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: size.height * 0.03,
                                  ),
                                  PrimaryPasswordformfiled(
                                    hintText: "New Password",
                                    controller: viewModel.passwordcon,
                                    onchange: (val) {},
                                    valid: (val) =>
                                        ValidatationService.signupPassword(
                                            val!),
                                  ),
                                  SizedBox(
                                    height: size.height * 0.03,
                                  ),
                                  PrimaryPasswordformfiled(
                                    hintText: "Confirm New Password",
                                    controller: viewModel.confirmpasswordcon,
                                    onchange: (val) {},
                                    valid: (val) => ValidatationService
                                        .confirmPasswordvaild(val!,
                                            viewModel.confirmpasswordcon.text),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Primarybutton(
                                width: size.width,
                                onpress: () {
                                  viewModel.resetpw();
                                },
                                text: "Reset ",
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              AlreadyHaveAnAccountCheck(
                                login: false,
                                press: () {
                                  viewModel.goBack();
                                },
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
  viewModelBuilder(BuildContext context) =>
      ResetPasswordViewModel(dlinkArg, Provider.of(context));

  @override
  void onViewModelReady(ResetPasswordViewModel viewModel) => viewModel.init();
}

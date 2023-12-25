import 'package:birdworld/ui/theme/color.dart';
import 'package:birdworld/ui/widgets/dividers/or_divider.dart';
import 'package:birdworld/ui/widgets/image_widgets/picked_image.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';
import 'view_model.dart';

class IdentificationScreenView
    extends StackedView<IdentificationScreenViewModel> {
  const IdentificationScreenView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, IdentificationScreenViewModel viewModel,
      Widget? child) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          color: viewModel.isimgload ? AppColors.blue : AppColors.skyBlue,
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                flex: 10,
                child: viewModel.isimgload
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PickedImage(
                              path: viewModel.image!.path,
                              clearfun: () => viewModel.clearImage(),
                              height: size.height * 0.38,
                              iconsize: 30,
                              width: size.width * 0.8),
                        ],
                      )
                    : Container(
                        height: size.height * 0.6,
                        width: size.width,
                        padding: EdgeInsets.zero,
                        decoration:
                            const BoxDecoration(color: AppColors.skyBlue),
                        child: Lottie.asset(
                          "assets/animations/home_animi2.json",
                        ),
                      ),
              ),
              _buildMidContainerWithButton(size.height * 0.065, viewModel),
              Flexible(
                flex: 9,
                child: Container(
                  width: size.width,
                  //  height: size.height * 0.4,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const OrDivider(),
                      Padding(
                        padding: EdgeInsets.only(
                            top: size.height * 0.008,
                            left: size.width * 0.075,
                            right: size.width * 0.075),
                        child: GestureDetector(
                          onTap: () {
                            viewModel.selectimgFromGallery();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              boxShadow: [
                                BoxShadow(
                                  offset: const Offset(0, 1),
                                  blurRadius: 3,
                                  color: Colors.blueGrey.withOpacity(0.3),
                                ),
                              ],
                            ),
                            child: ListTile(
                              leading: Icon(
                                FontAwesomeIcons.photoFilm,
                                size: size.width * 0.07,
                                color: AppColors.appPrimary.withOpacity(0.9),
                              ),
                              title: Text(
                                "Select the Image from Gallery",
                                style: TextStyle(
                                    fontSize: size.width * 0.043,
                                    fontWeight: FontWeight.w600,
                                    color:
                                        AppColors.appPrimary.withOpacity(0.8)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: RichText(
                      //     textAlign: TextAlign.center,
                      //     text: TextSpan(
                      //       style: TextStyle(
                      //           color: AppColors.blue.withOpacity(0.9),
                      //           fontSize: size.width * 0.048),
                      //       children: <TextSpan>[
                      //         TextSpan(
                      //             text: 'Select and Upload Bird Image to\n',
                      //             style: TextStyle()),
                      //         TextSpan(
                      //             text: ' Identitfy',
                      //             style: TextStyle(
                      //                 color: AppColors.blue.withOpacity(0.9),
                      //                 fontSize: size.width * 0.055,
                      //                 fontWeight: FontWeight.w600)),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: size.height * 0.008,
                                left: size.width * 0.04,
                                right: size.width * 0.04),
                            child: GestureDetector(
                              onTap: () {
                                viewModel.uploadimg(context);
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppColors.darkBlue,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 1),
                                      blurRadius: 3,
                                      color: Colors.blueGrey.withOpacity(0.3),
                                    ),
                                  ],
                                ),
                                child: ListTile(
                                  leading: Icon(
                                    FontAwesomeIcons.upload,
                                    size: size.width * 0.07,
                                    color: AppColors.white.withOpacity(0.9),
                                  ),
                                  title: Text(
                                    "Upload Image to Identify",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: size.width * 0.043,
                                        fontWeight: FontWeight.w600,
                                        color:
                                            AppColors.white.withOpacity(0.9)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMidContainerWithButton(
      double height, IdentificationScreenViewModel viewmodel) {
    final buttonHeight = height;
    return Stack(
      children: [
        // Use same background color like the second container
        Container(
          height: buttonHeight,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(18), topRight: Radius.circular(18))),
        ),
        // Translate the button
        Transform.translate(
          offset: Offset(0.0, -buttonHeight / 2.0),
          child: Center(
            child: GestureDetector(
              onTap: () {
                viewmodel.selectimgFromCamera();
              },
              child: Container(
                height: buttonHeight,
                decoration: BoxDecoration(
                  color: AppColors.appPrimary.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(buttonHeight / 4.0),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 16.0,
                      offset: const Offset(0.0, 6.0),
                      color: Colors.black.withOpacity(0.16),
                    ),
                  ],
                ),
                padding: const EdgeInsets.fromLTRB(24.0, 3.0, 24.0, 0.0),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      FontAwesomeIcons.cameraRetro,
                      size: 20.0,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Text(
                        'Use camera',
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  viewModelBuilder(BuildContext context) => IdentificationScreenViewModel();

  @override
  void onViewModelReady(IdentificationScreenViewModel viewModel) =>
      viewModel.init();
}

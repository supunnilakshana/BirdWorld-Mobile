import 'dart:io';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:birdworld/ui/theme/color.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';
import 'view_model.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    final size = MediaQuery.of(context).size;
    final mainfolocr = AppColors.white_gray.withOpacity(0.7);
    return WillPopScope(
      onWillPop: () {
        return viewModel.onBack();
      },
      child: Scaffold(
          //backgroundColor: AppColors.dark_back,
          body: Column(
        children: <Widget>[
          SizedBox(
            height: size.height * 0.01,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                //_showPicker(context);
              },
              child: Padding(
                padding: EdgeInsets.all(size.width * 0.08),
                child: viewModel.image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(size.width * 0.01),
                        child: Image.file(
                          File(viewModel.image!.path),
                          width: size.width * 0.65,
                          //  height: size.height * 0.06,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius:
                                BorderRadius.circular(size.width * 0.01)),
                        width: size.width * 0.59,
                        height: size.height * 0.06,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image,
                              color: Colors.white,
                            ),
                            Text(
                              "Choose Address Image",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: size.width * 0.039),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
          )
        ],
      )),
    );
  }

  @override
  viewModelBuilder(BuildContext context) => HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) => viewModel.init();
}

import 'package:birdworld/ui/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'view_model.dart';

class CartBottomSheetView extends StackedView<CartBottomSheetViewModel> {
  const CartBottomSheetView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, CartBottomSheetViewModel viewModel, Widget? child) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.8,
      width: size.width,
      child: Padding(
        padding: EdgeInsets.only(
          // left: size.width / 40,
          // right: size.width / 40,
          top: size.height / 50,
        ),
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.only(
                top: size.width / 40,
                left: size.width / 30,
                right: size.width / 30),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "textData.seeProducts",
                          style: AppStyle.textBody1Bold,
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                                onTap: () {
                                  viewModel.closeBottomSheet();
                                },
                                child: const Icon(
                                    Icons.keyboard_arrow_down_rounded))))
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text(
                      "textData.total",
                      style: AppStyle.textBody2Bold,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(
                      560.toStringAsFixed(2),
                      style: AppStyle.textBody1Bold.copyWith(fontSize: 24),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          padding: const EdgeInsets.symmetric(vertical: 2),
                          itemBuilder: (context, index) {
                            return Container();
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  viewModelBuilder(BuildContext context) => CartBottomSheetViewModel();

  @override
  void onViewModelReady(CartBottomSheetViewModel viewModel) => viewModel.init();
}

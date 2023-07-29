import 'package:birdworld/ui/theme/color.dart';
import 'package:birdworld/ui/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'view_model.dart';

class CommentBottomSheetView extends StackedView<CommentBottomSheetViewModel> {
  const CommentBottomSheetView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, CommentBottomSheetViewModel viewModel,
      Widget? child) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.85,
      width: size.width,
      child: Padding(
        padding: EdgeInsets.only(
          // left: size.width / 40,
          // right: size.width / 40,
          top: size.height / 100,
        ),
        child: Scaffold(
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        viewModel.closeBottomSheet();
                      },
                      child: const Icon(FontAwesomeIcons.gripLines))
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Comments",
                        style: AppStyle.textBody1Bold.copyWith(
                            fontSize: 20, color: Colors.black.withOpacity(0.8)),
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.black54,
                height: 20,
                thickness: 2,
              ),
              const SizedBox(
                height: 15,
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
    );
  }

  @override
  viewModelBuilder(BuildContext context) => CommentBottomSheetViewModel();

  @override
  void onViewModelReady(CommentBottomSheetViewModel viewModel) =>
      viewModel.init();
}

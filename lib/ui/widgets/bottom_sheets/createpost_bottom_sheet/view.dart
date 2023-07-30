import 'package:birdworld/ui/theme/color.dart';
import 'package:birdworld/ui/theme/style.dart';
import 'package:birdworld/ui/widgets/buttons/primary_button.dart';
import 'package:birdworld/ui/widgets/empty_views/empty_comment.dart';
import 'package:birdworld/ui/widgets/text_fileds/comment_textfield.dart';
import 'package:birdworld/ui/widgets/text_fileds/primary_textfiled.dart';
import 'package:birdworld/ui/widgets/tiles/comment_item_tiles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';
import 'view_model.dart';

class CreatePostBottomSheetView
    extends StackedView<CreatePostBottomSheetViewModel> {
  const CreatePostBottomSheetView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, CreatePostBottomSheetViewModel viewModel,
      Widget? child) {
    final size = MediaQuery.of(context).size;
    final node = FocusScope.of(context);
    return GestureDetector(
      onTap: () {
        node.unfocus();
      },
      child: SizedBox(
        height: size.height * 0.85,
        width: size.width,
        child: Padding(
          padding: EdgeInsets.only(
            // left: size.width / 40,
            // right: size.width / 40,
            top: size.height / 100,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Scaffold(
            backgroundColor: AppColors.white,
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(size.height * 0.1),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                              onTap: () {
                                viewModel.closeBottomSheet();
                              },
                              child: Icon(
                                FontAwesomeIcons.xmark,
                                color: AppColors.darkBlue.withOpacity(0.8),
                              ))
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Create Post",
                              style: AppStyle.textBody1Bold.copyWith(
                                  fontSize: 20,
                                  color: Colors.black.withOpacity(0.8)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Color.fromARGB(255, 194, 191, 191),
                      height: 20,
                      thickness: 1.5,
                    ),
                  ],
                )),
            bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Primarybutton(
                  onpress: () {},
                  width: size.width * 0.8,
                  text: "Post",
                )),
            body: SingleChildScrollView(
                reverse: true,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: size.width * 0.04,
                      right: size.width * 0.04,
                      top: size.height * 0.01),
                  child: Column(
                    children: [
                      Primarytextformfiled(
                        controller: viewModel.contnetcon,
                        hintText: "What's on your mind..",
                        background: AppColors.appPrimary,
                        onchange: (p0) {},
                        maxLine: 5,
                        valid: (p0) {},
                      )
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }

  @override
  viewModelBuilder(BuildContext context) => CreatePostBottomSheetViewModel();

  @override
  void onViewModelReady(CreatePostBottomSheetViewModel viewModel) =>
      viewModel.init();
}

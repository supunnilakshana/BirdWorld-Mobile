import 'package:birdworld/ui/theme/color.dart';
import 'package:birdworld/ui/theme/style.dart';
import 'package:birdworld/ui/widgets/empty_views/empty_comment.dart';
import 'package:birdworld/ui/widgets/text_fileds/comment_textfield.dart';
import 'package:birdworld/ui/widgets/tiles/comment_item_tiles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';
import 'view_model.dart';

class CommentBottomSheetView extends StackedView<CommentBottomSheetViewModel> {
  const CommentBottomSheetView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, CommentBottomSheetViewModel viewModel,
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
            appBar: PreferredSize(
                preferredSize: Size.fromHeight(size.height * 0.1),
                child: Column(
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
                                  fontSize: 20,
                                  color: Colors.black.withOpacity(0.8)),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      color: Colors.black54,
                      height: 20,
                      thickness: 1.5,
                    ),
                  ],
                )),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Commenttextformfiled(
                  hintText: "Write a comment for  Poreen",
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      radius: size.width * 0.05,
                      backgroundImage: const NetworkImage(
                          "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1600"),
                    ),
                  ),
                  maxLine: null,
                  controller: viewModel.commentcon,
                  onchange: (val) {},
                  suffex: const Icon(FontAwesomeIcons.solidPaperPlane,
                      color: AppColors.appPrimary),
                  valid: (val) {
                    return null;
                  }),
            ),
            body: SingleChildScrollView(
              reverse: true,
              child: viewModel.noComment
                  ? SizedBox(
                      width: size.width,
                      height: size.height * 0.5,
                      child: const Center(child: EmptyComment()))
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: 8,
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      itemBuilder: (context, index) {
                        return const CommentItemTile();
                      },
                    ),
            ),
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

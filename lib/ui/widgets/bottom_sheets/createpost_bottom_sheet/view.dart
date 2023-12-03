import 'package:birdworld/core/service/validation_service/validatation_service.dart';
import 'package:birdworld/ui/theme/color.dart';
import 'package:birdworld/ui/theme/style.dart';
import 'package:birdworld/ui/widgets/buttons/primary_button.dart';
import 'package:birdworld/ui/widgets/dividers/or_divider.dart';
import 'package:birdworld/ui/widgets/empty_views/empty_comment.dart';
import 'package:birdworld/ui/widgets/image_widgets/picked_image.dart';
import 'package:birdworld/ui/widgets/text_fileds/comment_textfield.dart';
import 'package:birdworld/ui/widgets/text_fileds/primary_textfiled.dart';
import 'package:birdworld/ui/widgets/tiles/comment_item_tiles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
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
          child: Form(
            key: viewModel.formKey,
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
                    onpress: () {
                      viewModel.createPost();
                    },
                    width: size.width * 0.8,
                    text: "Post",
                  )),
              body: SingleChildScrollView(
                  reverse: true,
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: size.width * 0.02,
                        right: size.width * 0.02,
                        top: size.height * 0.01),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            "Ponsika Polaj",
                            style: TextStyle(
                                color: AppColors.darkblack.withOpacity(0.9),
                                fontWeight: FontWeight.w500),
                          ),
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 5),
                          leading: CircleAvatar(
                            radius: size.width * 0.05,
                            backgroundImage: const NetworkImage(
                                "https://previews.123rf.com/images/realityimages/realityimages1803/realityimages180300953/97894659-indian-boy-posing-with-motorbike-at-pune-maharashtra.jpg"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 5),
                          child: Primarytextformfiled(
                            controller: viewModel.contnetcon,
                            hintText: "What's on your mind..",
                            background: AppColors.appPrimary,
                            onchange: (p0) {},
                            maxLine: 5,
                            valid: (p0) {
                              return ValidatationService.genaralvalid(p0!);
                            },
                          ),
                        ),
                        viewModel.isimgload
                            ? Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: PickedImage(
                                  path: viewModel.image!.path,
                                  clearfun: () => viewModel.clearImage(),
                                  height: size.height * 0.2,
                                  width: size.width * 0.6,
                                ),
                              )
                            : const SizedBox(),
                        GestureDetector(
                          onTap: () {
                            viewModel.selectimgFromGallery();
                          },
                          child: ListTile(
                            leading: Icon(
                              FontAwesomeIcons.photoFilm,
                              size: 20,
                              color: AppColors.appPrimary.withOpacity(0.9),
                            ),
                            title: Text(
                              "Select the Image from Gallery",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.darkblack.withOpacity(0.8)),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            const Expanded(
                              child: Divider(
                                color: AppColors.white_gray,
                                height: 2,
                                thickness: 2,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                "OR",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        AppColors.darkblack.withOpacity(0.6)),
                              ),
                            ),
                            const Expanded(
                              child: Divider(
                                color: AppColors.white_gray,
                                height: 2,
                                thickness: 2,
                              ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            viewModel.selectimgFromCamera();
                          },
                          child: ListTile(
                            leading: Icon(
                              size: 20,
                              FontAwesomeIcons.cameraRetro,
                              color: AppColors.appPrimary.withOpacity(0.9),
                            ),
                            title: Text(
                              "Take a picture",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.darkblack.withOpacity(0.8)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ),
      ),
    );
  }

  @override
  viewModelBuilder(BuildContext context) =>
      CreatePostBottomSheetViewModel(Provider.of(context));

  @override
  void onViewModelReady(CreatePostBottomSheetViewModel viewModel) =>
      viewModel.init();
}

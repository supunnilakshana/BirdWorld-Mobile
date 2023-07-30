import 'package:birdworld/ui/theme/color.dart';
import 'package:birdworld/ui/widgets/postItem/post_item.dart';
import 'package:birdworld/ui/widgets/text_fileds/comment_textfield.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:stacked/stacked.dart';
import 'view_model.dart';

class CommunityView extends StackedView<CommunityViewModel> {
  const CommunityView({
    Key? key,
    this.initIndex = 0,
  }) : super(key: key);
  final int initIndex;

  @override
  Widget builder(
      BuildContext context, CommunityViewModel viewModel, Widget? child) {
    final size = MediaQuery.of(context).size;
    final post = PostItem(
      commentfun: () {
        viewModel.openCommentBottom(context);
      },
    );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: GestureDetector(
                  onTap: () {
                    viewModel.openCreatePosttBottom(context);
                  },
                  child: ListTile(
                    trailing: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        FontAwesomeIcons.images,
                        color: AppColors.darkblack.withOpacity(0.8),
                      ),
                    ),
                    title: Text(
                      "What is your mind..",
                      style: TextStyle(
                          color: AppColors.darkblack.withOpacity(0.8)),
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 5),
                    leading: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: CircleAvatar(
                        radius: size.width * 0.05,
                        backgroundImage: const NetworkImage(
                            "https://previews.123rf.com/images/realityimages/realityimages1803/realityimages180300953/97894659-indian-boy-posing-with-motorbike-at-pune-maharashtra.jpg"),
                      ),
                    ),
                  ),
                ),
              ),
              const Divider(
                thickness: 3,
                color: AppColors.white_gray,
                height: 2,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      post,
                      const Divider(
                        thickness: 1,
                        color: AppColors.white_gray,
                        height: 2,
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  viewModelBuilder(BuildContext context) => CommunityViewModel();

  @override
  void onViewModelReady(CommunityViewModel viewModel) => viewModel.init();
}

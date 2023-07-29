import 'package:birdworld/ui/theme/color.dart';
import 'package:birdworld/ui/widgets/postItem/post_item.dart';
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
      body: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [post, post, post],
      ),
    );
  }

  @override
  viewModelBuilder(BuildContext context) => CommunityViewModel();

  @override
  void onViewModelReady(CommunityViewModel viewModel) => viewModel.init();
}

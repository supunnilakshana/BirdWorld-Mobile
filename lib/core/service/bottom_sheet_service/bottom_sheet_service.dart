import 'package:birdworld/core/models/post.dart';
import 'package:birdworld/ui/theme/color.dart';
import 'package:birdworld/ui/widgets/bottom_sheets/comment_bottom_sheet/view.dart';
import 'package:birdworld/ui/widgets/bottom_sheets/createpost_bottom_sheet/view.dart';
import 'package:flutter/material.dart';

class AppBottomSheetService {
  void showCommentBottomSheet(BuildContext context, Post post) {
    final size = MediaQuery.of(context).size;

    showModalBottomSheet(
      constraints: BoxConstraints(
        maxHeight: size.height * 0.85,
      ),
      enableDrag: true,
      isDismissible: false,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: AppColors.appPrimary, width: 1),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15.0),
        ),
      ),
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext context) {
        return CommentBottomSheetView(post);
      },
    );
  }

  void showCreatePostBottomSheet(BuildContext context) {
    final size = MediaQuery.of(context).size;

    showModalBottomSheet(
      constraints: BoxConstraints(
        maxHeight: size.height * 0.85,
      ),
      enableDrag: true,
      isDismissible: false,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: AppColors.appPrimary, width: 1),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15.0),
        ),
      ),
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext context) {
        return const CreatePostBottomSheetView();
      },
    );
  }
}

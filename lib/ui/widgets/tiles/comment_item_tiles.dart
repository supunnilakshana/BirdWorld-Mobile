import 'package:birdworld/core/models/post_comment.dart';
import 'package:birdworld/ui/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CommentItemTile extends StatefulWidget {
  final PostComment cooment;
  const CommentItemTile({
    super.key,
    required this.cooment,
  });

  @override
  State<CommentItemTile> createState() => _CommentItemTileState();
}

class _CommentItemTileState extends State<CommentItemTile> {
  bool islike = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundImage: NetworkImage(
          "https://firebasestorage.googleapis.com/v0/b/birdworld-137aa.appspot.com/o/user34.png?alt=media&token=6c6ff817-7115-4166-9090-a3aafae3c93f",
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.cooment.user.firstName,
            style: TextStyle(color: Colors.black.withOpacity(0.8)),
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.cooment.context,
              style: TextStyle(
                color: Colors.black.withOpacity(0.8),
              )),
        ],
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            child: islike
                ? const Icon(
                    FontAwesomeIcons.solidHeart,
                    color: AppColors.red,
                    size: 18,
                  )
                : Icon(
                    FontAwesomeIcons.heart,
                    color: Colors.black.withOpacity(0.8),
                    size: 18,
                  ),
            onTap: () {
              if (islike == false) {
                islike = true;
              } else {
                islike = false;
              }
              setState(() {});
            },
          ),
          Text(
            "5",
            style:
                TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 15),
          ),
        ],
      ),
    );
  }
}

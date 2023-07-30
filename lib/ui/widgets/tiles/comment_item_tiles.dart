import 'package:birdworld/ui/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CommentItemTile extends StatefulWidget {
  const CommentItemTile({
    super.key,
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
          "https://media.istockphoto.com/id/490483300/photo/portrait-of-beautiful-blonde-woman-with-curly-hairstyle.jpg?s=612x612&w=0&k=20&c=Va_kGiVu8GGOZWhREhqD9j8O5TqNn9zGzWZUKQz1_vs=",
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Pomsarii de silva",
            style: TextStyle(color: Colors.black.withOpacity(0.8)),
          ),
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Good morning poreen !!!",
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
            "10",
            style:
                TextStyle(color: Colors.black.withOpacity(0.8), fontSize: 15),
          ),
        ],
      ),
    );
  }
}

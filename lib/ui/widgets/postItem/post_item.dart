import 'package:birdworld/ui/theme/color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readmore/readmore.dart';

class PostItem extends StatefulWidget {
  final Function() commentfun;
  const PostItem({
    Key? key,
    required this.commentfun,
  }) : super(key: key);

  @override
  PostItemState createState() => PostItemState();
}

class PostItemState extends State<PostItem> {
  bool islike = false;
  String date = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      color: AppColors.white,
      elevation: 0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: CircleAvatar(
                            radius: size.width * 0.05,
                            backgroundImage: const NetworkImage(
                                "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1600"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Poreen",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.7),
                                    fontSize: size.width * 0.04,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "(hurar)",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.5),
                                    fontSize: size.width * 0.03,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Column(
                      children: [
                        Icon(
                          FontAwesomeIcons.ellipsisVertical,
                          color: Colors.black.withOpacity(0.7),
                        )
                      ],
                    ),
                  ))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Container(
                // width: size.width * 0.8,
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.all(Radius.circular(size.width * 0)),
                ),
                child: ClipRRect(
                  borderRadius:
                      BorderRadius.all(Radius.circular(size.width * 0.02)),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl:
                        "https://www.vdio.com/wp-content/uploads/2017/01/turaco.jpg",
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Container(
                      //  height: size.height * 0.01,
                      child: Center(
                        child: CircularProgressIndicator(
                            color: Colors.green.shade800,
                            value: downloadProgress.progress),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                )),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.015,
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 15),
                            child: GestureDetector(
                              child: islike
                                  ? FaIcon(FontAwesomeIcons.solidHeart,
                                      color: AppColors.red)
                                  : Icon(FontAwesomeIcons.heart,
                                      color: Colors.black.withOpacity(0.9)),
                              onTap: () {
                                if (islike == false) {
                                  islike = true;
                                } else {
                                  islike = false;
                                }
                                setState(() {});
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: GestureDetector(
                              onTap: () {
                                widget.commentfun();
                              },
                              child: Icon(FontAwesomeIcons.comment,
                                  color: Colors.black.withOpacity(0.9)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: GestureDetector(
                              onTap: () {},
                              child: Icon(FontAwesomeIcons.paperPlane,
                                  color: Colors.black.withOpacity(0.9)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "2 hours ago",
                            style:
                                TextStyle(color: Colors.black.withOpacity(0.6)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: size.height * 0.01,
              left: 10,
              right: 8,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "112 Likes",
                  style: TextStyle(
                      letterSpacing: 0.4,
                      color: Colors.black.withOpacity(0.9),
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5, left: 8, right: 8, bottom: 5),
            child: ReadMoreText(
              "Just finished a long day of work, and there's nothing better than coming home to this view. The sunsets here are always so beautiful, and it's the perfect way to relax and unwind.",
              trimLength: 200,
              style: TextStyle(
                fontSize: size.width * 0.035,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

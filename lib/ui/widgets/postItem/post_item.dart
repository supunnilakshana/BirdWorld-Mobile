import 'dart:math';

import 'package:birdworld/core/models/post.dart';
import 'package:birdworld/ui/theme/color.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:readmore/readmore.dart';

class PostItem extends StatefulWidget {
  final Post post;
  final Function() commentfun;
  const PostItem({
    Key? key,
    required this.commentfun,
    required this.post,
  }) : super(key: key);

  @override
  PostItemState createState() => PostItemState();
}

class PostItemState extends State<PostItem> with TickerProviderStateMixin {
  bool showStar = false;
  int likecount = 1;
  int timec = 1;
  void _toggleStar() {
    setState(() {
      showStar = !showStar;
    });
  }

  bool islike = false;
  String date = '';
  @override
  void initState() {
    likecount = Random().nextInt(8) + 1;
    timec = Random().nextInt(5) + 1;
    super.initState();
  }

  changeLike() {
    if (islike == false) {
      islike = true;
      likecount++;
      _toggleStar();
      Future.delayed(const Duration(seconds: 1), () {
        _toggleStar();
      });
    } else {
      islike = false;
      likecount--;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onDoubleTap: () {
        changeLike();
      },
      child: Card(
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
                                  "https://firebasestorage.googleapis.com/v0/b/birdworld-137aa.appspot.com/o/user34.png?alt=media&token=6c6ff817-7115-4166-9090-a3aafae3c93f"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  " ${widget.post.user.firstName}",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black.withOpacity(0.7),
                                      fontSize: size.width * 0.04,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  "member",
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
              child: Stack(
                children: [
                  Container(
                      // width: size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.all(Radius.circular(size.width * 0)),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                            Radius.circular(size.width * 0.02)),
                        child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: widget.post.imageUrl,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                                color: AppColors.appPrimary,
                                value: downloadProgress.progress),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      )),
                  Positioned.fill(
                    child: Center(
                      child: AnimatedOpacity(
                        opacity: showStar ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 400),
                        child: ScaleTransition(
                          scale: showStar
                              ? CurvedAnimation(
                                  parent: AnimationController(
                                    vsync: this,
                                    duration: const Duration(milliseconds: 400),
                                  )..forward(),
                                  curve: Curves.bounceInOut,
                                )
                              : const AlwaysStoppedAnimation<double>(0.0),
                          child: const FaIcon(FontAwesomeIcons.solidHeart,
                              color: AppColors.red, size: 40),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
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
                              padding:
                                  const EdgeInsets.only(left: 10, right: 15),
                              child: GestureDetector(
                                child: islike
                                    ? const FaIcon(FontAwesomeIcons.solidHeart,
                                        color: AppColors.red)
                                    : Icon(FontAwesomeIcons.heart,
                                        color: Colors.black.withOpacity(0.9)),
                                onTap: () {
                                  changeLike();
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
                              "${timec} hours ago",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
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
                    "${likecount} Likes",
                    style: TextStyle(
                        letterSpacing: 0.4,
                        color: Colors.black.withOpacity(0.9),
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 5, left: 8, right: 8, bottom: 5),
              child: ReadMoreText(
                widget.post.description,
                trimLength: 200,
                style: TextStyle(
                  fontSize: size.width * 0.035,
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

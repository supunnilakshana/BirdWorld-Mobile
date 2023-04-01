import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInBackground extends StatelessWidget {
  final Widget child;
  const SignInBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        child,
        // Positioned(
        //   bottom: 0,
        //   child: SvgPicture.asset("assets/images/signin_clip1.svg",
        //       width: size.width),
        // ),
        Positioned(
          bottom: 0,
          child: SvgPicture.asset("assets/images/signin_clip2.svg",
              width: size.width),
        ),
      ],
    );
  }
}

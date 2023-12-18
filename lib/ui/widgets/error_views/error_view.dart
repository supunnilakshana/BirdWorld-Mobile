import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Errorpage extends StatelessWidget {
  const Errorpage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Text("error");
    //   return Container(
    //       child: Lottie.asset("assets/animations/erroranimi.json", width: size));
    // }
  }
}

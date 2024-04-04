import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Background extends StatelessWidget {
  final Widget? child;
  const Background({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child??const SizedBox.shrink(),
        Positioned(
          right: -10,
          top: 10,
          child: Image.asset("res/images/frame.png", width: 200,)),
        Align(
          alignment: Alignment.centerLeft,
          child: Image.asset("res/images/frame2.png", height: 200,)),
      ],
    );
  }
}
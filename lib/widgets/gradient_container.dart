import 'package:flutter/material.dart';
import 'package:reunirts/constants/color_const.dart';

class GradientContainer extends StatelessWidget {
  final bool radial;
  final double radius;
  final double? height;
  final double? width;
  final EdgeInsets padding;
  final Widget child;
  final bool fullWidth;
  final Alignment alignment;
  const GradientContainer({
    super.key,
    this.radial = false,
    this.radius = 30,
    this.height,
    this.width,
    this.padding = const EdgeInsets.all(20),
    required this.child,
    this.alignment = Alignment.center,
    this.fullWidth = false
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? (fullWidth ? double.infinity : null),
      padding: padding,
      alignment: alignment,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        gradient: LinearGradient(
          begin: radial ? Alignment.topLeft : Alignment.centerLeft,
          end: radial ? Alignment.bottomRight : Alignment.centerRight,
          colors: const [
            ColorConst.primary1,
            ColorConst.primary2,
          ]
        ), 
      ),
      child: child
    );
  }
}
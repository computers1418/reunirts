import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  final double radius;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final Widget child;
  final double? height;
  final double? width;
  final Color? borderColor;
  final Color color;
  final Alignment? align;
  const CircleContainer({super.key, this.radius = 30, this.margin, this.padding, required this.child, this.height, this.width, this.color = Colors.white, this.borderColor, this.align});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: align ?? Alignment.center,
      padding: padding,
      margin: margin,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        border: borderColor!=null ? Border.all(color: borderColor!): null
      ),
      child: child,
    );
  }
}
import 'package:flutter/material.dart';
import 'package:reunirts/responsive/responsive_text.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart' as sgt;



class GradientText extends StatelessWidget {
  final String text;
  final FontWeight? fontWeight;
  final double? fontSize;
  const GradientText({super.key, required this.text, this.fontSize, this.fontWeight});

  @override
  Widget build(BuildContext context) {
    return sgt.GradientText(
      text,
      style: TextStyle(
        fontFamily: "Metropolis",
        fontWeight: fontWeight ?? FontWeight.w800,
        height: 1,
        fontSize: ResponsiveText.get(context, fontSize ?? 10),
      ),
      colors: const [
        Color(0xFFAD37E0),
        Color(0xFFEE2B3B)
      ],
      gradientType: sgt.GradientType.linear,
    );
  }
}
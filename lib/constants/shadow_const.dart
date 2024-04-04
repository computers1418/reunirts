import 'package:flutter/material.dart';

class ShadowConst {

  static const deep = [
    BoxShadow(
      offset: Offset(0, -4), blurRadius: 6, color: Color(0x1AFFFFFF)
    ),
    BoxShadow(
      offset: Offset(0, 4), blurRadius: 6, color: Color(0x1A38113F)
    ),
  ];

  static const light = [
    BoxShadow(
      offset: Offset(-3, -3), blurRadius: 5, color: Color(0xFFFAF6FB)
    ),
    BoxShadow(
      offset: Offset(5, 5), blurRadius: 10, color: Color(0xFFDFD3E1)
    ),
  ];

}
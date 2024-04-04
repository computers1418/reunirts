import 'package:flutter/material.dart';
import 'package:reunirts/constants/color_const.dart';
import 'package:reunirts/responsive/responsive_text.dart';

extension WidgetExtension on String {

  imageToIcon({double size = 24, color = Colors.white, bool imagePath = false}){
    return ImageIcon(AssetImage("res/${imagePath ? "images" : "icons"}/$this.png"), size: size, color: color);
  }

}

extension TextExtension on String {

  black({required BuildContext context, size = 10, color = Colors.white, alignCenter = false}){
    return Text(this, style: TextStyle(
      fontWeight: FontWeight.w900,
      fontFamily: "Metropolis",
      height: 1,
      fontSize: ResponsiveText.get(context, size),
      color: color
    ), textAlign: 
    alignCenter ? TextAlign.center : null);
  }

  extraBold({required BuildContext context, size = 12, color = Colors.white, alignCenter = false}){
    return Text(this, style: TextStyle(
      fontWeight: FontWeight.w800,
      height: 1,
      fontFamily: "Metropolis",
      fontSize: ResponsiveText.get(context, size),
      color: color
    ), textAlign: 
    alignCenter ? TextAlign.center : null);
  }

  bold({required BuildContext context, size = 12, color = Colors.white, alignCenter = false}){
    return Text(this,  style: TextStyle(
      fontWeight: FontWeight.w700,
      fontFamily: "Metropolis",
      fontSize: ResponsiveText.get(context, size),
      height: 1,
      color: color
    ), textAlign: 
    alignCenter ? TextAlign.center : null);
  }

  semiBold({required BuildContext context, bool elipsis = false, size = 20, color = Colors.white, alignCenter = false}){
    return Text(this, overflow: elipsis ? TextOverflow.ellipsis : null, style: TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: "Metropolis",
      
      fontSize: ResponsiveText.get(context, size),
      height: 1,
      color: color
    ), textAlign: 
    alignCenter ? TextAlign.center : null);
  }

  medium({required BuildContext context, size = 20, color = Colors.white, alignCenter = false}){
    return Text(this, style: TextStyle(
      fontWeight: FontWeight.w500,
      fontFamily: "Metropolis",
      fontSize: ResponsiveText.get(context, size),
      height: 1,
      color: color
    ), textAlign: 
    alignCenter ? TextAlign.center : null);
  }

  regular({required BuildContext context, size = 14, color = ColorConst.txtColor, alignCenter = false}){
    return Text(this, style: TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: "Metropolis",
      fontSize: ResponsiveText.get(context, size),
      height: 1,
      color: color
    ), textAlign: 
    alignCenter ? TextAlign.center : null);
  }

}
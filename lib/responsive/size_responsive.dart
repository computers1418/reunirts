import 'package:flutter/material.dart';

class SizeResponsive {

  static getSizeFactor(BuildContext context, size){
    var screenWidth = MediaQuery.of(context).size.width;
    if(screenWidth < 350){

      return 0.85;
    }else if(screenWidth < 420){
      return 0.9;
    }else if(screenWidth < 460){
      return 1;
    }else{
      return 1.3;
    }
  }

  static getHeightFactor(BuildContext context, size){
    var screenWidth = MediaQuery.of(context).size.height;
    if(screenWidth > 900){

      return 1.3;
    }else if(screenWidth > 800){
      return 1;
    }else if(screenWidth > 600){
      return 0.9;
    }else{
      return 0.55;
    }
  }

  static double get(BuildContext context, size){
    return size * getSizeFactor(context, size);
  }

  static getMaxHeight(BuildContext context, size){
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return screenHeight<800 && screenWidth<450 ? size * getSizeFactor(context, size) : size * getSizeFactor(context, size) * 1.3;
  }



  static getHeightverse(BuildContext context, size){
    return size * getHeightFactor(context, size);
  }

  static getMin(BuildContext context, size){
    return size * getSizeFactor(context, size)*0.5;
  }

}
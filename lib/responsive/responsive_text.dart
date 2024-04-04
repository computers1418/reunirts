import 'package:flutter/material.dart';

class ResponsiveText {

  static getSizeFactor(BuildContext context, fontSize){
    var screenWidth = MediaQuery.of(context).size.width;
    if(screenWidth < 350){

      return fontSize>=20 ? 0.75 :  0.85;
    }else if(screenWidth < 420){
      return 0.9;
    }else if(screenWidth < 460){
      return 1;
    }else{
      return 1.2;
    }
  }

  static get(BuildContext context, fontSize){
    return fontSize * getSizeFactor(context, fontSize);
  }

}
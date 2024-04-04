import 'package:flutter/material.dart';
import 'package:reunirts/constants/color_const.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/extensions/string_exten.dart';
import 'package:reunirts/responsive/size_responsive.dart';
import 'package:reunirts/widgets/gradient_text.dart';

import '../constants/shadow_const.dart';

class InfoTag2 extends StatelessWidget {
  const InfoTag2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeResponsive.get(context, 114),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 5),
      decoration: const BoxDecoration(
        color: ColorConst.bgColor1,
        borderRadius: BorderRadius.all(Radius.circular(40)),
        boxShadow: ShadowConst.deep
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          infoIcon("account"),
          8.hgap(context),
          infoContent(context, "1.25L", "Patients")
        ],
      ),
    );
  }

  infoContent(BuildContext context, String text1, String text2){
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GradientText(text: text1, fontSize: 13,),
          text2.bold(context: context, size: 11, color: ColorConst.txtColor)
        ],
      ),
    );
  }

  infoIcon(String path){
    return Container(
      decoration: const BoxDecoration(
        color: ColorConst.bgColor1,
        borderRadius: BorderRadius.all(Radius.circular(50)),
        boxShadow: ShadowConst.light
      ),
      width: 30,
      height: 30,
      alignment: Alignment.center,
      child: Image.asset("res/images/$path.png", width: 15, height: 15),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:reunirts/constants/color_const.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/extensions/string_exten.dart';
import 'package:reunirts/responsive/size_responsive.dart';

import '../responsive/responsive_text.dart';

class CustomAppBar extends StatelessWidget {
  final VoidCallback onOpenDrawer;
  const CustomAppBar({super.key, required this.onOpenDrawer});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConst.bgColor,
      padding: EdgeInsets.symmetric(horizontal: SizeResponsive.get(context, 16)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("res/images/logo.png", width: SizeResponsive.get(context, 27), height: SizeResponsive.get(context, 27)),
          6.hgap(context),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("REUNIRTS", style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                  height: 1,
                  fontSize: ResponsiveText.get(context, 20)
                )),
                Text("ARETHCALHE", style: TextStyle(
                  fontFamily: "Montserrat",
                  height: 1,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  fontSize: ResponsiveText.get(context, 8)
                ))
              ],
            )),
          "Delhi".extraBold(context: context),
          const Icon(Icons.keyboard_arrow_down_outlined, color: Colors.white),
          20.hgap(context),
          GestureDetector(
            onTap: ()=>onOpenDrawer(),
            child: "menu".imageToIcon(),
          )
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/extensions/string_exten.dart';
import 'package:reunirts/widgets/gradient_text.dart';

import '../constants/color_const.dart';
import 'circle_container.dart';

class DialogBottom extends StatelessWidget {
  final bool child;
  final String btnText;
  final VoidCallback onClick;
  const DialogBottom({super.key, this.child = false, required this.btnText, required this.onClick});

  @override
  Widget build(BuildContext context) {
    

    return Stack(
        children: [
          CircleContainer(
            margin: const EdgeInsets.fromLTRB(6, 12, 6, 6),
            padding: const EdgeInsets.all(16),
            color: const Color(0xFFFBE8F3),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: child
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Your appointment will be scheduled for".extraBold(context: context, size: 18, color: const Color(0xFFBE6999)),
                      3.vgap(context),
                      const GradientText(text: "Friday, Nov 12th at 11 am in K.T Nagar", fontSize: 16)
                    ],
                  )
                  : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Download app\nnow!!".extraBold(context: context, size: 18, color: const Color(0xFFBE6999)),
                      5.vgap(context),
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie.".medium(context: context, size: 9, color: ColorConst.txtColor)
                    ],
                  ),
                ),
                16.hgap(context),
                Image.asset("res/images/store.png", width: 100,)
              ],
            )),
        Align(
          alignment: Alignment.topRight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: onClick,
                child: CircleContainer(
                  color: ColorConst.txtColor,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: btnText.semiBold(context: context, size: 14, color: Colors.white)),
              ),
              34.hgap(context)
            ],
          )),
        ],
      );
  }
}
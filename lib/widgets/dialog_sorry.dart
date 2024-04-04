import 'package:flutter/material.dart';
import 'package:reunirts/constants/color_const.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/extensions/string_exten.dart';
import 'package:reunirts/widgets/circle_container.dart';
import 'package:reunirts/widgets/gradient_text.dart';

class DialogSorry extends StatelessWidget {
  const DialogSorry({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleContainer(
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: ()=>Navigator.pop(context),
                child: Image.asset("res/icons/close_icon.png", width: 30, height: 30,)),
            ),
          ),
          const GradientText(text: "Sorry!", fontSize: 28,),
          4.vgap(context),
          "This option is not available, Choose Cash instead.".semiBold(context: context, size: 12, color: ColorConst.txtColor),
          Image.asset("res/images/sorry.png", height: 200,),
          CircleContainer(
            margin: const EdgeInsets.fromLTRB(6, 0, 6, 6),
            padding: const EdgeInsets.all(16),
            color: const Color(0xFFFBE8F3),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Download app now!!".extraBold(context: context, size: 18, color: const Color(0xFFBE6999)),
                      16.vgap(context),
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie.".medium(context: context, size: 8, color: ColorConst.txtColor)
                    ],
                )),
                16.hgap(context),
                Image.asset("res/images/store.png", width: 100,)
              ],
            ))
        ],
      ),
    );
  }
}
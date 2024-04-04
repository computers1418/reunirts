import 'package:flutter/material.dart';
import 'package:reunirts/constants/color_const.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/extensions/string_exten.dart';

class DialogHeader extends StatelessWidget {
  final String icon;
  final String title;
  final String? subtitle;
  const DialogHeader({super.key, required this.icon, required this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 75,
          width: 75,
          decoration: const BoxDecoration(
            color: Color(0xFFFBE8F3),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              bottomRight: Radius.circular(100)
            )
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("res/images/$icon.png", width: 80,),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 20, 8, 4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title.bold(context: context, size: 20, color: ColorConst.txtColor),
                      8.vgap(context),
                      Visibility(
                        visible: subtitle!=null,
                        child: (subtitle??'').medium(context: context, size: 12, color: const Color(0x80252525)))
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: ()=>Navigator.pop(context),
                  child: Image.asset("res/icons/close_icon.png", width: 30, height: 30,)),
              ),
            ],
          ),
        )
      ],
    );
  }
}
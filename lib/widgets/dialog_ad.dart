import 'package:flutter/material.dart';
import 'package:reunirts/constants/color_const.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/extensions/string_exten.dart';
import 'package:reunirts/widgets/gradient_container.dart';
import 'package:reunirts/widgets/gradient_text.dart';

class DialogAd extends StatelessWidget {
  final VoidCallback onClick;
  const DialogAd({super.key, required this.onClick});

  @override
  Widget build(BuildContext context) { 
    
    var max = context.height()>=800 || (context.width()>410 && context.height()>730);
    
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 120),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white
          ),
          child: Column(
            children: [
              Container(
                height: max ? 200: 170,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  image: DecorationImage(
                    image: AssetImage("res/images/ad_background.png"), fit: BoxFit.fill)
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: [
                    "Quality Care at Very Low Price".extraBold(alignCenter: true, context: context, size: 26, color: ColorConst.txtColor),
                    (max ? 16 : 4).vgap(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        "Affordable care begins at ".semiBold(alignCenter: true, context: context, size: 14, color: const Color(0xFFD33080)),
                        const GradientText(text: "Rs. 200.", fontSize: 16)
                      ],
                    ),
                    16.vgap(context),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "T&C Applies*".bold(context: context, size: 8, color: ColorConst.txtColor),
                              5.vgap(context),
                              Image.asset("res/images/store.png", width: 100,)
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: onClick,
                          child: GradientContainer(
                            padding: EdgeInsets.symmetric(vertical: max ? 12 : 8, horizontal: max ? 24 : 20),
                            child: "Done".semiBold(context: context, size: 14, color: Colors.white)),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),

        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.only(top: max ? 180: 170),
            child: Image.asset("res/images/ad_content.png", width: 140,))),

        Align(
          alignment: Alignment.topCenter,
          child: Image.asset("res/images/gift_box.png")),

        Align(
          alignment: Alignment.bottomRight,
          child: GestureDetector(
            onTap: ()=>Navigator.pop(context),
            child: Padding(
              padding: EdgeInsets.only(top: max ? 140: 130, right: 15),
              child: Image.asset("res/icons/close_icon.png", width: 30,)),
          )),
      ],
    );
  }
}
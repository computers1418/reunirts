import 'package:flutter/material.dart';
import 'package:reunirts/constants/color_const.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/extensions/string_exten.dart';
import 'package:reunirts/widgets/appointment_header.dart';
import 'package:reunirts/widgets/circle_container.dart';
import 'package:reunirts/widgets/gradient_container.dart';

import '../responsive/size_responsive.dart';

class AppointmentTop extends StatelessWidget {
  final VoidCallback onBackClick;
  const AppointmentTop({super.key, required this.onBackClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10, top: 4),
      child: Column(
        children: [
          AppointmentHeader(
            onBackClick: onBackClick,
          ),
          GradientContainer(
            padding: EdgeInsets.symmetric(horizontal:  14, vertical: context.aspect()<0.48 ? 15 : context.height()<600 ? 4: 10),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: SizeResponsive.get(context, context.height()<600 ? 30 : 35),
                      backgroundImage: const AssetImage("res/images/profile.png"),
                    ),
                    16.hgap(context),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Dr. Veronica Ray".semiBold(context: context, size: 16,),
                          3.vgap(context),
                          "Orthodontics".semiBold(context: context, size: 10, color: const Color(0x80FFFFFF)),
                          7.vgap(context),
                          Row(
                            children: [
                              ...List.generate(5, (index) => index).map(
                                (e) => const Icon(Icons.star_border_rounded, color: Color(0xFFFFF490), size: 12)),
                              4.hgap(context),
                              "4.5".medium(context: context, size: 11, color: const Color(0xFFFFF490)),
                            ],
                          )
                        ],
                      ),
                    ),
                    Image.asset("res/images/phone_icon.png", width: 40, height: 40)
                  ],
                ),
                (context.height()<700 ? 3 : ((context.width()==360 && context.height()==800) || (context.width()==412 && context.height()==732) || (context.width()==480 && context.height()==853)) ? 6:16).vgap(context),
                Row(  
                  children: [
                    Expanded(
                      flex: 4,
                      child: CircleContainer(
                        borderColor: Colors.white,
                        color: Colors.transparent,
                        height: context.height()<700 ? 30 : 40,
                        child: "Dental Braces".semiBold(context: context, size: 10, color: Colors.white)
                      )
                    ),
                    12.hgap(context),
                    Expanded(
                      flex: 5,
                      child: CircleContainer(
                        height: context.height()<700 ? 30 : 40,
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        color: Colors.white,
                        child: Row(
                          children: [
                            Image.asset("res/icons/date.png", width: 18, height: 18,),
                            Expanded(
                              child: "09 Nov, 22".semiBold(context: context, size: 12, color: ColorConst.txtColor),
                            ),
                            Image.asset("res/icons/time.png", width: 18, height: 18,),
                            Expanded(
                              child: "11:00 am".semiBold(context: context, size: 12, color: ColorConst.txtColor),
                            )
                          ],
                        )
                      )
                    ),
                  ],
                ),
                (context.height()<700 ? 2 : ((context.width()==360 && context.height()==800) || (context.width()==412 && context.height()==732) || (context.width()==480 && context.height()==853)) ? 6: 10).vgap(context),
                Row(
                  children: [
                    12.hgap(context),
                    Expanded(child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        "Dental Clinic".extraBold(context: context, size: 16, color: Colors.white),
                        5.vgap(context),
                        "12/2, Mathura Road, Sector 37, ".medium(context: context, size: 10, color: Colors.white),
                        "Faridabad - Delhi".medium(context: context, size: 10, color: Colors.white),
                      ],
                    )),

                    CircleContainer(
                      width: SizeResponsive.get(context, 130),
                      height: SizeResponsive.get(context, 35),
                      color: const Color(0x1A252525),
                      child: "Cancel Appointment".extraBold(context: context, size: 10, color: const Color(0x80FFFFFF)))
                  ],
                ),
                (context.height()<700 ? 2 : ((context.width()==360 && context.height()==800) || (context.width()==412 && context.height()==732) || (context.width()==480 && context.height()==853)) ? 6: 10).vgap(context),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleContainer(
                      margin: const EdgeInsets.only(left: 12),
                      width: SizeResponsive.get(context, 60),
                      height: SizeResponsive.get(context, 30),
                      color: const Color(0xFFFFFFFF),
                      child: "Map".semiBold(context: context, size: 10, color: ColorConst.txtColor)),

                    CircleContainer(
                      width: SizeResponsive.get(context, 160),
                      height: SizeResponsive.get(context, 35),
                      color: ColorConst.txtColor,
                      child: "Reschedule Appointment".extraBold(context: context, size: 10, color: const Color(0xFFFFFFFF)))
                  ],
                )
              ],
            ))
        ],
      ),
    );
  }
}
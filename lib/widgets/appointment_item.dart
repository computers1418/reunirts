import 'package:flutter/material.dart';
import 'package:reunirts/constants/color_const.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/extensions/string_exten.dart';
import 'package:reunirts/responsive/size_responsive.dart';
import 'package:reunirts/widgets/circle_container.dart';
import 'package:reunirts/widgets/gradient_text.dart';

class AppointmentItem extends StatelessWidget {
  const AppointmentItem({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleContainer(
      padding: EdgeInsets.symmetric(
        horizontal: SizeResponsive.get(context, 16),
        vertical: SizeResponsive.get(context, context.height()<600 ? 10 : 16)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage("res/images/profile.png"),
              ),
              8.hgap(context),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    "Dr. Veronica Ray".semiBold(context: context, size: 16, color: ColorConst.txtColor),
                    4.vgap(context),
                    "Orthodontics".semiBold(context: context, size: 10, color: const Color(0x80252525))
                  ],
                ),
              ),
              CircleContainer(
                color: const Color(0xFFF0D4F5),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                child: "Root Canal".bold(context: context, size: 14, color: const Color(0xFFCA41E1))
              )
            ],
          ),

          const GradientText(text: "09 Nov, 10:00 AM @ Faridabad."),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleContainer(
                height: SizeResponsive.get(context, 38),
                width: SizeResponsive.get(context, 150),
                color: const Color(0x80ECC0D9),
                child: "Cancel Appointment".extraBold(context: context, size: 10, color: const Color(0x8069204A))),
              8.hgap(context),
              CircleContainer(
                height: SizeResponsive.get(context, 38),
                width: SizeResponsive.get(context, 150),
                color: ColorConst.txtColor,
                child: "Reschedule Appointment".extraBold(context: context, size: 10, color: Colors.white))
            ],
          )
        ],
      ),
    );
  }
}

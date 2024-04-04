import 'package:flutter/material.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/extensions/string_exten.dart';
import 'package:reunirts/responsive/size_responsive.dart';

class ProfileTop extends StatelessWidget {
  const ProfileTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Visibility(
            visible: (context.height()>=800 && context.aspect()<0.5) || (context.height()==732) || (context.height()==853),
            child: const SizedBox(height: 20,)
          ),
          Row(
            children: [
              CircleAvatar(
                radius: SizeResponsive.get(context, 45),
                backgroundImage: const AssetImage("res/images/profile.png"),
              ),
              16.hgap(context),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0x33AD37E0),
                            Color(0x33EE2B3B)
                          ]),
                        borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset("res/icons/check-circle.png", width: 14, height: 14,),
                          4.hgap(context),
                          "Top Doctor".bold(context: context, size: 8)
                        ],
                      ),
                    ),
                    8.vgap(context),
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

              Image.asset("res/images/pay_call_icon.png", width: SizeResponsive.get(context, 45), height: SizeResponsive.get(context, 45))
            ],
          ),
          Visibility(
            visible: context.height()>=800 && context.aspect()<0.5,
            child: const SizedBox(height: 16,)
          ),
          20.vgap(context),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      "6+".black(context: context, size: 21),
                      "Years Exp".black(context: context, size: 10)
                    ],
                  ),
                ),
                const VerticalDivider(color: Color(0x1AFFFFFF),),
                Expanded(
                  child: Column(
                    children: [
                      "8K+".black(context: context, size: 21),
                      "Patients".black(context: context, size: 10)
                    ],
                  ),
                ),
                const VerticalDivider(color: Color(0x1AFFFFFF),),
                Expanded(
                  child: Column(
                    children: [
                      "20+".black(context: context, size: 21),
                      "Awards".black(context: context, size: 10)
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
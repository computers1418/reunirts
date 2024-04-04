import 'package:flutter/material.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/extensions/string_exten.dart';
import 'package:reunirts/responsive/size_responsive.dart';
import 'package:reunirts/widgets/gradient_container.dart';
import 'package:reunirts/widgets/gradient_text.dart';
import 'package:reunirts/widgets/profile_tabbar.dart';

import '../constants/color_const.dart';
import '../routes/app_routes.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorConst.bgColor2,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40)
        )
      ),
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 6,
              width: 50,
              decoration: const BoxDecoration(
                color: Color(0xFFDEA7C6),
                borderRadius: BorderRadius.all(Radius.circular(30))
              ),
            ),
          ),
          context.height()<=750 ? 6.vgap(context): 26.vgap(context),
          const ProfileTabbar(),
           ((context.height()<600) || (context.height()<=853 && context.width()==480)) ? 6.vgap(context) : context.height()<=750 ? 16.vgap(context): 26.vgap(context),
          "Dr. Veronica".bold(context: context, size: 20, color: ColorConst.txtColor),
          8.vgap(context),
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie, dictum est a, mattis tellus. Sed dignissim, metus nec fringilla accumsan, risus sem sollicitudin lacus, ut interdum tellus elit sed risus. Maecenas eget condimentum velit, sit amet feugiat lectus. Maecenas eget condimentum velit, sit amet feugiat lectus. Maecenas eget condimentum velit, sit amet feugiat lectus.".regular(context: context, size: context.height()>=800 && context.aspect()<0.5 ? 10: 8, color: const Color(0x80252525)),
          (context.height()<=853 && context.width()==480) ? 8.vgap(context) : context.height()<=750 ? 8.vgap(context): 30.vgap(context),
          "Location".bold(context: context, size: 26, color: ColorConst.txtColor),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(image: AssetImage("res/images/map-frame.png"), fit: BoxFit.fill)
              ),
              padding: EdgeInsets.symmetric(horizontal: context.height()<600 ? 0: 20),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: ()=>Navigator.pushNamedAndRemoveUntil(context, Routes.splash, (route) => false),
                    child: Row(
                      children: [
                        30.hgap(context),
                        Image.asset("res/images/location-profile.png", width: SizeResponsive.get(context, 65),),
                        const Spacer(),
                        Container(
                          margin: const EdgeInsets.only(right: 30),
                          width: MediaQuery.of(context).size.width/2.4,
                          padding: context.height()<600 ? const EdgeInsets.symmetric(horizontal: 14, vertical: 6): EdgeInsets.all(SizeResponsive.get(context, 20)),
                          decoration: BoxDecoration(
                            border: Border.all(color: const Color(0x45FFFFFF)),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x20915f7c),
                                offset: Offset(10, 10),
                                blurRadius: 4
                              )
                            ]
                          ),
                          child: Column(
                            children: [
                              const GradientText(text: "Dental Clinic", fontSize: 20,),
                              6.vgap(context),
                              "12/2, Mathura Road, Sector 37, Faridabad - Delhi".semiBold(context: context, size: 11, color: ColorConst.txtColor)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: (context.height()<600)? const EdgeInsets.symmetric(horizontal: 6, vertical: 6):  EdgeInsets.all(SizeResponsive.get(context, 10)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: const Color(0xFF252525),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: "arrow_back".imageToIcon(color: Colors.white, size: 24),
                        ),
                        "Select Other\nDoctor".medium(context: context, size: 14, color: Colors.white),
                        const Spacer(),
                        GradientContainer(
                          height: 40,
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: "Select".bold(context: context, size: 16))
                      ],
                    ),
                  )
            
                ],
              ),
            ),
          )
        ]
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:reunirts/constants/color_const.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/extensions/string_exten.dart';
import 'package:reunirts/routes/app_routes.dart';
import 'package:reunirts/widgets/circle_container.dart';

class NavOptions extends StatefulWidget {
  const NavOptions({super.key});

  @override
  State<NavOptions> createState() => _NavOptionsState();
}

class _NavOptionsState extends State<NavOptions> {
  String? selected;
  final items = [
    {
      "icon": "nav_account", "name": "Profile", "islock": null
    },
    {
      "icon": "nav_appointment", "name": "Upcoming Appointment", "islock": null
    },
    {
      "icon": "nav_old", "name": "Previous Appointment", "islock": true
    },
    {
      "icon": "nav_doctors", "name": "Top Doctors", "islock": null
    },
    {
      "icon": "nav_insurance", "name": "Insurance", "islock": true
    },
    {
      "icon": "nav_privacy", "name": "Privacy Policy", "islock": true
    },
    {
      "icon": "nav_terms", "name": "Terms & Conditions", "islock": true
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage("res/images/profile_placeholder.png"),
              radius: 32,
            ),
            12.hgap(context),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "Guest User".bold(context: context, size: 20, color: ColorConst.txtColor),
                4.vgap(context),
                "User ID".regular(context: context, size: 12, color: const Color(0x80252525))
              ],
            )
          ],
        ),
        16.vgap(context),

        ...items.map((e) => GestureDetector(
          onTap: (){
            setState(()=>selected='${e["name"]}');
            if(e["name"]=="Upcoming Appointment"){
              Navigator.pop(context);
              Navigator.pushNamed(context, Routes.appointments);
            }
          },
          child: CircleContainer(
            color: selected == '${e["name"]}' ? Colors.white : Colors.transparent, 
            margin: EdgeInsets.only(bottom: context.height()>=800 ? 8 : context.height()<600 ? 4: 4),
            padding: EdgeInsets.symmetric(vertical: context.height()>=800 ? 12 : context.height()<600 ? 4: 8, horizontal: 16),
            child: Row(
              children: [
                '${e["icon"]}'.imageToIcon(size: 24, color: ColorConst.txtColor),
                8.hgap(context),
                '${e["name"]}'.semiBold(context: context, size: 16, color: ColorConst.txtColor),
                4.hgap(context),
                Visibility(
                  visible: e["islock"]!=null,
                  child: 'lock'.imageToIcon(size: 14, color: const Color(0xFFEE2B3B))),
                
              ],
            )),
        )),

        const Spacer(),

        Row(
          children: [
            Image.asset("res/images/login_button.png", width: 60, height: 60,),
            4.hgap(context),
            "Login".semiBold(context: context, size: 16, color: ColorConst.txtColor)
          ],
        )
        
      ],
    );
  }
}
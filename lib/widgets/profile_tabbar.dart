import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/extensions/string_exten.dart';

import 'gradient_text.dart';

class ProfileTabbar extends StatefulWidget {
  const ProfileTabbar({super.key});

  @override
  State<ProfileTabbar> createState() => _ProfileTabbarState();
}

class _ProfileTabbarState extends State<ProfileTabbar> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    
    var items = [
      {
        "icon": "about",
        "name": "About"
      },
      {
        "icon": "experience",
        "name": "Experience"
      },
      {
        "icon": "specialisation",
        "name": "Specialization"
      },
      {
        "icon": "membership",
        "name": "Membership"
      },
    ];

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 1
      ),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (_, idx){
        return GestureDetector(
          onTap: (){
            setState(() {
              selected = idx;
            });
          },
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(selected==idx ? "res/icons/${items[idx]["icon"]}-selected.png" : "res/icons/${items[idx]["icon"]}.png")
                  )
                ),
                padding: EdgeInsets.all( context.height()<600 ?31 : 40),
              ),
              Visibility(
                visible: selected==idx,
                replacement: items[idx]["name"]!.semiBold(context: context, size: 10, color: const Color(0x80C7329C)),
                child: GradientText(text: items[idx]["name"]!, fontSize: 10) 
              )
            ],
          ),
        );
      },
    );
  }
}
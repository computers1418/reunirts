import 'package:flutter/material.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/extensions/string_exten.dart';

import '../constants/color_const.dart';

class TestimonialItem extends StatelessWidget {
  final Map<String, String> item;
  const TestimonialItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorConst.bgColor1,
        borderRadius: BorderRadius.circular(40),
      ), 
      child: Column(
        children: [
          Container(
            height: 160,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
              image: DecorationImage(
                image: AssetImage("res/images/${item["bg"]}"), fit: BoxFit.fill)
            ),
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("res/images/${item["avatar"]}"),
                ),
                15.hgap(context),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      item["name"]?.bold(context: context, size: 14),
                      4.vgap(context),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: ColorConst.secondary2,
                          borderRadius: BorderRadius.circular(40),
                        ), 
                        child: item["treatment"]?.bold(context: context, size: 7, color: ColorConst.secondary1),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: ColorConst.secondary2,
                    borderRadius: BorderRadius.circular(40),
                  ), 
                  child: Row(
                    children: [
                      "rating".imageToIcon(color: ColorConst.secondary3, size: 16),
                      4.hgap(context),
                      "4.5".black(context: context, size: 10, color: ColorConst.secondary3),
                      4.hgap(context),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                item["title"]?.semiBold(context: context, size: 14, color: ColorConst.txtColor),
                10.vgap(context),
                item["content"]?.regular(context: context, size: 10),
                18.vgap(context),
                Row(
                  children: [
                    Image.asset("res/icons/location2.png", width: 14, height: 14),
                    Expanded(
                      child: item["loc"]?.semiBold(context: context, size: 10, color: ColorConst.txtColor),
                    ),
                    item["treatment"]?.semiBold(context: context, size: 10, color: ColorConst.txtColorLight),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
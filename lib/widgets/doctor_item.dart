import 'package:flutter/material.dart';
import 'package:reunirts/constants/color_const.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/extensions/string_exten.dart';
import 'package:reunirts/widgets/gradient_container.dart';

class DoctorItem extends StatelessWidget {
  final bool selected;
  final Map data;
  final VoidCallback onSelect;
  const DoctorItem({super.key, required this.selected, required this.data, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Expanded(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 '${data["name"]}'.semiBold(context: context, elipsis: true, size: 16, color: ColorConst.txtColor),
                 2.vgap(context),
                 '${data["loc"]}'.medium(context: context, size: 10, color: const Color(0x80252525)),
                 5.vgap(context),
                 'Availability : 10:00 am - 07:00 pm'.semiBold(context: context, size: 8, color: const Color(0xFFAD37E0)),
               ],
             ),
           ),
          Row(
            children: [
              GestureDetector(
                onTap: onSelect,
                child: SizedBox(
                  width: context.width()<=375 ? 50: 90,
                  height: context.width()<=375 ? 22: 30,
                  child: GradientContainer(
                    padding: EdgeInsets.zero,
                    child: "View Profile".bold(context: context, size: context.width()<=375 ? 8: 10, color: Colors.white),
                  ),
                ),
              ),
              (context.width()<=375 ? 8: 14).hgap(context),
              Image.asset(selected ? "res/images/radio-selected.png" :"res/images/radio.png", width: (context.width()<=375 ? 15: 18), height: (context.width()<=375 ? 15: 18))
            ],
          )

        ],
      ),
    );
  }
}
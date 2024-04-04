import 'package:flutter/material.dart';
import 'package:reunirts/constants/color_const.dart';
import 'package:reunirts/constants/data.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/extensions/string_exten.dart';
import 'package:reunirts/responsive/size_responsive.dart';
import 'package:reunirts/widgets/gradient_container.dart';
import 'package:reunirts/widgets/testimonial_item.dart';

class Testimonials extends StatelessWidget {
  const Testimonials({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorConst.bgColor2,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40)
        )
      ),
      padding: EdgeInsets.all(SizeResponsive.get(context, 16)),
      child: Column(
        children: [
          Container(
            height: 6,
            width: 50,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30))
            ),
          ),
          context.height()>700 ? 35.vgap(context) : 8.vgap(context),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      'Clients'.bold(context: context, color: ColorConst.txtColor, size: 20),
                      'Testimony'.extraBold(context: context, size: 36, color: ColorConst.txtColor2)
                    ],
                  ),
                ),
                Container(
                  height: 9,
                  width: 50,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30))
                  ),
                  child: const Row(
                    children: [
                      SizedBox(
                        width: 20,
                        child: GradientContainer(child: SizedBox.shrink())),
                    ],
                  ),
                )
              ],
            ),
          ),
          15.vgap(context),
          TestimonialItem(
            item: testimonials[0],
          ),
          20.vgap(context),
          TestimonialItem(
            item: testimonials[1],
          )
        ],
      ),
    );
  }
}
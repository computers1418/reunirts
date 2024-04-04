import 'package:flutter/material.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/widgets/appointment_item.dart';

import '../constants/color_const.dart';
import '../responsive/size_responsive.dart';
import 'gradient_container.dart';

class AppointmentContent extends StatefulWidget {
  const AppointmentContent({super.key});

  @override
  State<AppointmentContent> createState() => _AppointmentContentState();
}

class _AppointmentContentState extends State<AppointmentContent>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> slideLeft;
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    slideLeft = Tween<double>(
      begin: 0,
      end: 30,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut,
    ));

    pageController = PageController();

    // Listen to page changes
    pageController.addListener(() {
      if ((pageController.page ?? 0) > 0.7) {
        controller.forward();
      } else if ((pageController.page ?? 0) < 0.3) {
        controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var min = context.aspect() > 0.5;

    return Container(
      decoration: const BoxDecoration(
        color: ColorConst.bgColor2,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40),
        ),
      ),
      padding: EdgeInsets.fromLTRB(
        0,
        SizeResponsive.get(
          context,
          min ? 4 : context.height() < 600 ? 4 : 16,
        ),
        0,
        SizeResponsive.get(
          context,
          min ? 10 : context.aspect() < 0.48 ? 24 : 16,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: min ? 4 : 6,
            width: 50,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
          ),
          (context.height() < 600 ? 4 : context.height() < 700 ? 12 : 8)
              .vgap(context),
          Expanded(
            child: PageView(
              controller: pageController,
              children: [
                const AppointmentItem(),
                const AppointmentItem(),
              ].map((item) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Expanded(child: item),
                      (context.aspect() < 0.48 ? 16 : 8).vgap(context),
                      Expanded(child: item),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
          (context.height() < 600 ? 4 : context.height() < 700 ? 12 : 8)
              .vgap(context),
          Container(
            height: context.height() < 600 ? 5 : 9,
            width: 50,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            child: Row(
              children: [
                AnimatedBuilder(
                  animation: slideLeft,
                  builder: (_, val) {
                    return Transform.translate(
                      offset: Offset(slideLeft.value, 0),
                      child: const SizedBox(
                        width: 20,
                        child: GradientContainer(child: SizedBox.shrink()),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/extensions/string_exten.dart';
import 'package:reunirts/responsive/size_responsive.dart';
import 'package:reunirts/widgets/gradient_container.dart';

class NavCard extends StatelessWidget {
  const NavCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                "Download app and unlock all features.".extraBold(context: context, size: 12, color: Colors.white),
                5.vgap(context),
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eu turpis molestie.".regular(context: context, size: 8, color: Colors.white),
                10.vgap(context),
                Image.asset("res/images/store.png", width: SizeResponsive.get(context, 126), height: SizeResponsive.get(context, 30))
              ],
            ),
          ),
          14.hgap(context),
          Image.asset("res/images/mobiles.png", height: SizeResponsive.get(context, 110))
        ],
      ),
    );
  }
}
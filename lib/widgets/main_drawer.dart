import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reunirts/constants/color_const.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/widgets/nav_card.dart';
import 'package:reunirts/widgets/nav_options.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {

    var h = MediaQuery.of(context).size.height;

    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero
      ),
      backgroundColor: const Color(0xFFFCF2FD),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(onPressed: ()=>Get.back(), icon: const Icon(Icons.close, color: ColorConst.txtColor, size: 20)),
            ),
            (h>=800 ? 14 : h<600 ? 4 : 10).vgap(context),
            const NavCard(),
            (h>=800 ? 28 : h<600 ? 12 : 20).vgap(context),
            const Expanded(
              child: NavOptions())
          ],
        ),
      ),
    );
  }
}
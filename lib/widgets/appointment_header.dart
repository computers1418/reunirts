import 'package:flutter/material.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/extensions/string_exten.dart';
import 'package:reunirts/responsive/size_responsive.dart';
import 'package:reunirts/widgets/circle_container.dart';
import 'package:reunirts/widgets/gradient_text.dart';

class AppointmentHeader extends StatelessWidget {
  final VoidCallback onBackClick;
  const AppointmentHeader({super.key, required this.onBackClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: context.aspect()<0.48 ? 16 : 0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const GradientText(text: "Upcoming", fontSize: 16,),
                "Appointments".extraBold(context: context, size: 28, color: Colors.white)
              ],
            )),
          
          GestureDetector(
            onTap: ()=>onBackClick(),
            child: CircleContainer(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              borderColor: Colors.white,
              color: Colors.transparent,
              child: Row(
                children: [
                  "arrow_back".imageToIcon(color: Colors.white, size: SizeResponsive.get(context, 24)),
                  4.hgap(context),
                  "Go Back".medium(context: context, size: 11, color: Colors.white)
                ],
              )),
          )
        ],
      ),
    );
  }
}
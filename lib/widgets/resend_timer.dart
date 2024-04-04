import 'package:flutter/material.dart';
import 'package:reunirts/constants/color_const.dart';
import 'package:reunirts/extensions/string_exten.dart';
import 'package:reunirts/widgets/gradient_container.dart';

class ResendTimer extends StatefulWidget {
  const ResendTimer({super.key});

  @override
  State<ResendTimer> createState() => _ResendTimerState();
}

class _ResendTimerState extends State<ResendTimer> with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        children: [
          
          TweenAnimationBuilder<Duration>(
            duration: const Duration(seconds: 30),
            tween: Tween(begin: const Duration(seconds: 30), end: Duration.zero),
            builder: (BuildContext context, Duration value, Widget? child) {
              var seconds = 30 - (value.inSeconds % 60);
      
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "Resend OTP in".medium(context: context, size: 10, color: const Color(0xFF9C527C)),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: '${seconds<10 ? '0$seconds': seconds}'.extraBold(context: context, size: 10, color: ColorConst.txtColor)),
                    ],
                  ),
                  Container(
                    height: 10,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7F6FB),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: (MediaQuery.of(context).size.width - 60) * (seconds / 30), // Calculate the percentage of completion
                          child: const GradientContainer(
                            height: 10,
                            child: SizedBox.shrink(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
          }),
        ],
      ),
    );
  }
}
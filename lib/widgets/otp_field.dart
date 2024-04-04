import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:reunirts/constants/color_const.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/extensions/string_exten.dart';
import 'package:reunirts/widgets/gradient_text.dart';
import 'package:reunirts/widgets/resend_timer.dart';

class OtpField extends StatefulWidget {
  const OtpField({super.key});

  @override
  State<OtpField> createState() => _OtpFieldState();
}

class _OtpFieldState extends State<OtpField> {

  @override
  Widget build(BuildContext context) {
    var max = context.height()>=800;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          max ? 6.vgap(context) : const SizedBox.shrink(),
          Pinput(
            length: 4,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            defaultPinTheme: PinTheme(
              decoration: BoxDecoration(
                color: const Color(0xFFF4F4F7),
                borderRadius: BorderRadius.circular(30)
              ),
              constraints: const BoxConstraints(
                maxHeight: 45, maxWidth: 60
              )
            )
          ),
          max ? 6.vgap(context) : const SizedBox.shrink(),
          const ResendTimer(),
          max ? 6.vgap(context) : const SizedBox.shrink(),
          Row(
            children: [
              "Didn't Receive ?".medium(context: context, size: 10, color: ColorConst.txtColor),
              3.hgap(context),
              const GradientText(text: "Resend", fontSize: 10,)
            ],
          )
        ],
      ),
    );
  }
}
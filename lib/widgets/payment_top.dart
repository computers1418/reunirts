import 'package:flutter/material.dart';
import 'package:reunirts/constants/color_const.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/extensions/string_exten.dart';
import 'package:reunirts/widgets/circle_container.dart';
import 'package:reunirts/widgets/gradient_text.dart';

class PaymentTop extends StatelessWidget {
  const PaymentTop({super.key});

  @override
  Widget build(BuildContext context) {

    const items = [["Consultation Fee", "Rs. 1000"],["Service Fee", "Rs. 100"],["Technology Fee", "Rs. 100"],["Test", "-"],["Surgery", "-"],["Medicine", "-"],];


    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: context.height()>=800 && context.aspect()<0.5,
            child: const SizedBox(height: 8,)
          ),
           Visibility(
            visible: context.height()==853 && context.width()==480,
            child: const SizedBox(height: 20,)
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: GradientText(text: "Invoice", fontSize: 24),  
          ),

          Visibility(
            visible: context.height()>=800 && context.aspect()<0.5,
            child: const SizedBox(height: 8,)
          ),
          CircleContainer(
            radius: 26,
            padding: EdgeInsets.all( context.height()>=800 && context.aspect()<0.5 ? 16 : 8),
            color: const Color(0xFFFCE7F3),
            child: Column(
              children: [
                ...items.map((e){
                  return Padding(
                    padding: EdgeInsets.fromLTRB(4, 0, 4, context.height()<700 ? 3: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        e[0].semiBold(context: context, size: 14, color: ColorConst.txtColor),
                        GradientText(text: e[1], fontSize: 14,)
                      ],
                    ),
                  );
                }),

                Padding(
                  padding: EdgeInsets.fromLTRB(4, 0, 4, context.height()<700 ? 3: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          "Coupon".semiBold(context: context, size: 14, color: ColorConst.txtColor),
                          const GradientText(text: "( CONSULT100 )", fontSize: 14,)
                        ],
                      ),
                      const GradientText(text: "Rs. - 100", fontSize: 14,)
                    ],
                  ),
                ),

                (context.height()<700 ? 7:14).vgap(context),

                CircleContainer(
                  color: const Color(0xFFD73992),
                  padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      "Payable Amount".bold(context: context, color: Colors.white, size: 14),
                      "Rs. 1100".extraBold(context: context, color: Colors.white, size: 16),
                    ],
                  ))

              ],
            ))
        ],
      ),
    );
  }
}
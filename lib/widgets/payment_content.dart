import 'package:flutter/material.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/extensions/string_exten.dart';
import 'package:reunirts/widgets/circle_container.dart';
import 'package:reunirts/widgets/dialog_sorry.dart';
import 'package:reunirts/widgets/gradient_container.dart';
import 'package:reunirts/widgets/payment_item.dart';

import '../constants/color_const.dart';
import '../responsive/size_responsive.dart';

class PaymentContent extends StatelessWidget {
  final Animation animation;
  final VoidCallback onConfirmClick;
  final VoidCallback onBackClick;
  const PaymentContent({super.key, required this.animation, required this.onConfirmClick, required this.onBackClick});

  @override
  Widget build(BuildContext context) {

    var data = [
      ["Pay Cash", "pay_cash", true],
      ["Credit / Debit Card", "credit_card", true],
      ["UPI Payments", "upi_payment", null],
      ["Wallet Payments", "wallet_payment", null]
    ];

    return Container(
      decoration: const BoxDecoration(
        color: ColorConst.bgColor2,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(40)
        )
      ),
      padding: EdgeInsets.fromLTRB(SizeResponsive.get(context, 16), SizeResponsive.get(context, context.height()<700 ? 8 : context.height()>=800 && context.aspect()<0.5 ? 34 : 16), SizeResponsive.get(context, 16), SizeResponsive.get(context, 0)),
      child: Column(
        children: [
          Container(
            height: 6,
            width: 50,
            decoration: const BoxDecoration(
              color: Color(0xFFDEA7C6),
              borderRadius: BorderRadius.all(Radius.circular(30))
            ),
          ),
          (context.height()<700 ? 8 : context.height()>=800 && context.aspect()<0.5 ? 34 : 16).vgap(context),
          Expanded(
            child: AnimatedBuilder(
              animation: animation,
              builder: (_, val) {
                return Container(
                  padding: context.height()>=800 && context.aspect()<0.5 ?  const EdgeInsets.fromLTRB(24, 24, 24, 24): const EdgeInsets.fromLTRB(20, 8, 20, 0),
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage("res/images/visa-frame.png"), fit: BoxFit.fill)
                  ),
                  width: ((context.width() - SizeResponsive.get(context, 32)) * animation.value),
                  child: Column(  
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          "Evelyn Tylor".extraBold(context: context, size: 16, color: Colors.white),
                          "wifi".imageToIcon(color: Colors.white, size: 34),
                        ],
                      ),
                      const Spacer(),
                      6.vgap(context),
                      "3215    6584    8468    5888".extraBold(context: context, size: 20, color: Colors.white),
                      6.vgap(context),
                      const Spacer(),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "Expire".semiBold(context: context, size: 10, color: Colors.white),
                                6.vgap(context),
                                "12/24".extraBold(context: context, size: 16, color: Colors.white)
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "CVV".semiBold(context: context, size: 10, color: Colors.white),
                                6.vgap(context),
                                "229".extraBold(context: context, size: 16, color: Colors.white)
                              ],
                            ),
                          ),
                          "visa".imageToIcon(color: Colors.white, size: 70)
                        ],
                      )
                
                    ],
                  ),
                );
              }
            ),
          ),
          (context.height()<700 ? 8 : context.height()>=800 && context.aspect()<0.5 ? 34 : 16).vgap(context),

          SizedBox(
            height: (context.width()-74)/4,
            child: ListView.builder(
              itemCount: 4,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (_, idx){
                return GestureDetector(
                  onTap: (){
                    if(idx==0){
                      return;
                    }

                    showDialog(
                      context: context, 
                      barrierDismissible: false,
                      builder: (_){
                        return const Dialog(
                          backgroundColor: Colors.transparent,
                          insetPadding: EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DialogSorry()
                            ],                                    
                          ),
                        );
                      });
                  },
                  child: PaymentItem(
                    isSelected: idx==0, 
                    data: data[idx]
                  ),
                );
              }),
          ),

          (context.height()<700 ? 8 : context.height()>=800 && context.aspect()<0.5 ? 34  :16).vgap(context),

          CircleContainer(
            color: ColorConst.txtColor,
            padding: EdgeInsets.all( context.height()<700 ? 8: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: ()=>onBackClick(),
                  child: Row(
                    children: [
                      "arrow_back".imageToIcon(color: Colors.white, size: 24),
                      8.hgap(context),
                      "Go Back".medium(context: context, size: 14, color: Colors.white)
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: ()=>onConfirmClick(),
                  child: GradientContainer(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: context.height()>=800 && context.aspect()<0.5 ? 12: 8),
                    child: "Confirm Booking".bold(context: context, size: 16, color: Colors.white),
                  ),
                )
              ],
            )),
          8.vgap(context)

        ],
      ),
    );
  }
}
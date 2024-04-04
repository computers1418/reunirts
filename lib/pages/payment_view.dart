import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/widgets/dialog_ad.dart';
import 'package:reunirts/widgets/dialog_wrapper.dart';
import 'package:reunirts/widgets/gradient_container.dart';
import 'package:reunirts/widgets/main_drawer.dart';
import 'package:reunirts/widgets/payment_content.dart';
import 'package:reunirts/widgets/payment_top.dart';

import '../responsive/size_responsive.dart';
import '../widgets/animated_ad.dart';
import '../widgets/background.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/marquee_text.dart';

class PaymentsView extends StatefulWidget {
  const PaymentsView({super.key});

  @override
  State<PaymentsView> createState() => _PaymentsViewState();
}

class _PaymentsViewState extends State<PaymentsView> with SingleTickerProviderStateMixin{
  late Animation<double> top;
  late Animation<double> bottom;
  late Animation<double> cardAnim;

  late AnimationController openPayment; 
  
  final GlobalKey<ScaffoldState> key = GlobalKey();

  @override
  void initState() {
    openPayment = AnimationController(duration: const Duration(milliseconds: 800), vsync: this);
    top = Tween<double>(
      begin: -300,
      end: 82
    ).animate(CurvedAnimation(
      parent: openPayment,
      reverseCurve: Curves.ease,
      curve: const Interval(0, 1, curve: Curves.easeOut)
    ));
     bottom = Tween<double>(
      begin: 200,
      end: 0
    ).animate(CurvedAnimation(
      parent: openPayment,
      reverseCurve: Curves.ease,
      curve: const Interval(0, 1, curve: Curves.easeOut)
    ));

     cardAnim = Tween<double>(
      begin: 0,
      end: 1
    ).animate(CurvedAnimation(
      parent: openPayment,
      reverseCurve: Curves.ease,
      curve: const Interval(0, 1, curve: Curves.easeOut)
    ));
    openPayment.forward();

    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    var h = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        key: key,
        endDrawer: const MainDrawer(),
        body: Stack(
          children: [
            const Background(),
    
            AnimatedBuilder(
                animation: top,
                builder: (_, val) {
                  return Positioned(
                    left: 0, right: 0,
                    top: top.value,
                    child: const PaymentTop()
                  );
                }
              ),
    
            Column(
              children: [
                GradientContainer(
                  radius: 0,
                  padding: EdgeInsets.zero,
                  height: SizeResponsive.getHeightverse(context, 30),
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Marquee(text: " on your first treatment and take control of your health today  on your first treatment and take control of your health today"),
                ),
                4.vgap(context),
                CustomAppBar(
                  onOpenDrawer: (){
                    key.currentState!.openEndDrawer();
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: context.aspect()>4.6 ? 20: 0  ),
                  child: const AnimatedAd())
              ],
            ),
    
    
            AnimatedBuilder(
              animation: bottom,
              builder: (_, val) {
                return Transform.translate(
                  offset: Offset(0, bottom.value),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: DraggableScrollableSheet(
                      minChildSize: h<600 ? 0.5 :h>900 ? 0.6 : 0.55,
                      maxChildSize: 0.9,
                      initialChildSize: h<600 ? 0.5 :h>900 ? 0.6 : 0.55,
                      shouldCloseOnMinExtent: false,
                      expand: false,
                      builder: (_, __) {
                        return PaymentContent(
                          animation: cardAnim,
                          onBackClick: ()=>openPayment.reverse().then((value) => Get.back()),
                          onConfirmClick: (){
                            ValueNotifier<bool> notifier = ValueNotifier(false);
                            showDialog(
                              context: context, 
                              barrierDismissible: false,
                              builder: (_){
                                return ValueListenableBuilder(
                                  valueListenable: notifier,
                                  builder: (_, val, __) {
                                    return Dialog(
                                      backgroundColor: Colors.transparent,
                                      insetPadding: const EdgeInsets.symmetric(horizontal: 16),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Visibility(
                                            visible: !val,
                                            replacement: const DialogWrapper(),
                                            child: DialogAd(onClick: ()=>{
                                              notifier.value = true
                                            })
                                          )
                                        ],                                    
                                      ),
                                    );
                                  }
                                );
                              });
                          },  
                        );
                      }
                    )
                  ),
                );
              }
            ),
          ],
        ),
      ),
    );
  }
}
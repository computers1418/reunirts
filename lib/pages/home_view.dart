import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/extensions/string_exten.dart';
import 'package:reunirts/responsive/size_responsive.dart';
import 'package:reunirts/widgets/animated_ad.dart';
import 'package:reunirts/widgets/background.dart';
import 'package:reunirts/widgets/custom_appbar.dart';
import 'package:reunirts/widgets/gradient_container.dart';
import 'package:reunirts/widgets/main_banner.dart';
import 'package:reunirts/widgets/main_drawer.dart';

import '../widgets/marquee_text.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin{

  late Animation<double> slideright;
  late Animation<double> slideleft;
  late Animation<double> containerSlideUp;
  late Animation<double> containerSize;
  late Animation<double> opacity;

  late AnimationController openBooking; 

  final GlobalKey<ScaffoldState> key = GlobalKey();

  @override
  void initState() {
    
    openBooking = AnimationController(duration: const Duration(seconds: 1), vsync: this);
    slideleft = Tween<double>(
      begin: 0,
      end: 1
    ).animate(CurvedAnimation(
      parent: openBooking,
      reverseCurve: Curves.ease,
      curve: Curves.easeOut
    ));
    slideright = Tween<double>(
      begin: 0,
      end: 1
    ).animate(CurvedAnimation(
      parent: openBooking,
      reverseCurve: Curves.ease,
      curve: Curves.easeOut
    ));
    containerSlideUp = Tween<double>(
      begin: 0,
      end: 0.15
    ).animate(CurvedAnimation(
      parent: openBooking,
      reverseCurve: Curves.ease,
      curve: const Interval(0.3, 0.8, curve: Curves.easeOut)
    ));
    containerSize = Tween<double>(
      begin: 0.15,
      end: 1
    ).animate(CurvedAnimation(
      parent: openBooking,
      reverseCurve: Curves.ease,
      curve: const Interval(0.3, 0.8, curve: Curves.easeOut)
    ));
    opacity = Tween<double>(
      begin: 1,
      end: 0
    ).animate(CurvedAnimation(
      parent: openBooking,
      reverseCurve: Curves.ease,
      curve: const Interval(0.2, 0.3, curve: Curves.easeOut)
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    var max = context.height()>=800 && context.width()!=480;

    return SafeArea(
      child: Scaffold(
        endDrawer: const MainDrawer(),
        key: key,
        body: Column(
          children: [
            GradientContainer(
              radius: 0,
              padding: EdgeInsets.zero,
              radial: true,
              height: SizeResponsive.getHeightverse(context, 30),
              width: double.infinity,
              alignment: Alignment.center,
              child: Marquee(text: " on your first treatment and take control of your health today  on your first treatment and take control of your health today"),
            ),
            4.vgap(context),
            Expanded(
              child: Stack(
                children: [
                  const Background(),
              
                  Column(
                    children: [
                      CustomAppBar(
                        onOpenDrawer: (){
                          key.currentState!.openEndDrawer();
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: context.aspect()>4.6 ? 20: 0  ),
                        child: const AnimatedAd()),


                      Visibility(
                        visible: max,
                        child: 32.vgap(context)),
                  
                      Expanded(
                        child: Stack(
                          children: [
                            AnimatedBuilder(
                              animation: slideright,
                              builder: (_, val) {
                                return Positioned(
                                  left: context.width() * slideright.value,
                                  child: Padding(
                                    padding: EdgeInsets.only(top: context.aspect()>4.6 ? 0: 20),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 16),
                                          child: "Taking".bold(context: context, size: 76, color: Colors.white),  
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 16),
                                          child: "care".bold(context: context, size: 20, color: Colors.white),  
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: AnimatedBuilder(
                                animation: slideleft,
                                builder: (_, val) {
                                  return Transform.translate(
                                    offset: Offset(-context.width() * slideleft.value, 0),
                                    child: Padding(
                                      padding: EdgeInsets.only(bottom: SizeResponsive.get(context, 54), right: max ? 20: 0),
                                      child: const MainBanner(),
                                    ),
                                  );
                                } 
                              )),
                            AnimatedBuilder(
                              animation: slideright,
                              builder: (_, val) {
                                return Positioned(
                                  bottom: 0,
                                  right: -context.width() * slideright.value,
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: SizeResponsive.get(context, context.aspect()>4.6 ? 54: 74)),
                                    child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.end,
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                          
                                            Padding(
                                              padding: const EdgeInsets.only(bottom: 16),
                                              child: "of your".bold(context: context, size: 20, color: const Color(0xFFFF6FBD)),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 16),
                                              child: "smile".bold(context: context, size: 76, color: const Color(0xFFFF6FBD)),  
                                            ),  
                                          ],
                                        ),
                                  ),
                                );
                              }
                            ),
                            AnimatedBuilder(
                              animation: slideleft,
                              builder: (_, val) {
                                return Positioned(
                                  bottom: 0,
                                  left: - context.width() * slideleft.value,
                                  child: Padding(
                                    padding: EdgeInsets.only(bottom: context.aspect()>4.6 ? 0: 10),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 16),
                                          child: "made".bold(context: context, size: 76, color: Colors.white),  
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(bottom: 16),
                                          child: "easy".bold(context: context, size: 20, color: Colors.white),  
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                            )
                          ],
                        ),
                      ),

                      Visibility(
                        visible: max,
                        child: 32.vgap(context)),
                      
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: AnimatedBuilder(
                          animation: opacity,
                          builder: (_, val) {
                            return Opacity(
                              opacity: opacity.value,
                              child: GestureDetector(
                                onTap: (){
                                  openBooking.forward().then((value) => Get.toNamed("/booking")?.then((value) => openBooking.reverse()));

                                },
                                child: GradientContainer(
                                  padding: EdgeInsets.zero,
                                  height: SizeResponsive.get(context, context.aspect()>0.48 ? 60: 80),
                                  fullWidth: true,
                                  child: "Book Appointment".bold(context: context, size: 20),
                                ),
                              ),
                            );
                          }
                        ),
                      ),
                      10.vgap(context),
                      Container(
                        height: SizeResponsive.get(context, context.aspect()>0.48 ? 60: 80),
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: const BoxDecoration(
                          color: Color(0x08FFFFFF),
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10),
                        child: "Sign In / Sign up".semiBold(
                          context: context, 
                          color: const Color(0x26FFFFFF)
                        ),
                      ),
                      10.vgap(context)
                    ],
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/extensions/string_exten.dart';
import 'package:reunirts/routes/app_routes.dart';
import 'package:reunirts/widgets/background.dart';
import 'package:reunirts/widgets/main_drawer.dart';

import '../responsive/size_responsive.dart';
import '../widgets/animated_ad.dart';
import '../widgets/booking_form.dart';
import '../widgets/circle_container.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/gradient_container.dart';
import '../widgets/marquee_text.dart';
import '../widgets/testimonials.dart';

class BookingView extends StatefulWidget {
  const BookingView({super.key});

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> with TickerProviderStateMixin{

  late Animation<Offset> formSlideUp;
  late Animation<double> slideright;
  late Animation<double> slideleft;
  late Animation<double> containerSlideUp;
  late Animation<double> containerSlideDown;
  late Animation<double> bottomsheetDown;
  late Animation<double> containerSize;
  late Animation<double> opacity;
  late Animation<double> bottomsheet;

  late AnimationController openBooking; 
  late AnimationController openProfile; 

  final GlobalKey<ScaffoldState> key = GlobalKey();

  @override
  void initState() {
    openProfile = AnimationController(duration: const Duration(seconds: 1), vsync: this);

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
      curve: const Interval(0.3, 0.5, curve: Curves.easeOut)
    ));
     bottomsheet = Tween<double>(
      begin: 200,
      end: 0
    ).animate(CurvedAnimation(
      parent: openBooking,
      reverseCurve: Curves.ease,
      curve: const Interval(0.3, 0.7, curve: Curves.easeOut)
    ));


    formSlideUp = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, 2),
    ).animate(CurvedAnimation(
      parent: openBooking,
      reverseCurve: Curves.ease,
      curve: Curves.easeIn
    ));
    containerSlideDown = Tween<double>(
      begin: 0,
      end: -900
    ).animate(CurvedAnimation(
      parent: openProfile,
      reverseCurve: Curves.ease,
      curve: const Interval(0, 1, curve: Curves.easeOut)
    ));

    bottomsheetDown = Tween<double>(
      begin: 0,
      end: 600
    ).animate(CurvedAnimation(
      parent: openProfile,
      reverseCurve: Curves.ease,
      curve: const Interval(0, 1, curve: Curves.easeOut)
    ));

    openBooking.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  PopScope(
      onPopInvoked: (v){
        // openBooking.reverse().then((value) => Get.back());
      },
      child: SafeArea(
        child: Scaffold(
          key: key,
          resizeToAvoidBottomInset: false,
          endDrawer: const MainDrawer(),
          body: Stack(
            children: [
              const Background(),
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
                  Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: context.aspect()>4.6 ? 20: 0  ),
                        child: const AnimatedAd()),

                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: ()=>{
                            Get.back()
                          },
                          child: CircleContainer(
                            width: 50,
                            margin: const EdgeInsets.only(top: 8, right: 12),
                            padding: const EdgeInsets.symmetric(horizontal:  10, vertical: 6),
                            borderColor: Colors.white,
                            color: Colors.transparent,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                "arrow_back".imageToIcon(color: Colors.white, size: SizeResponsive.get(context, 20)),
                              ],
                            )),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              AnimatedBuilder(
                animation: containerSlideDown,
                builder: (_, val) {
                  return AnimatedBuilder(
                    animation: containerSlideUp,
                    builder: (_, val) {
                      return Positioned(
                        left: 0, right: 0,
                        bottom: MediaQuery.of(context).size.height*0.18,
                        child: Transform.translate(
                              offset: Offset(0, containerSlideDown.value + context.height()<800 ? containerSlideDown.value : containerSlideDown.value),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                child: GestureDetector(
                                  onTap: ()=>openBooking.forward(),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Opacity(
                                        opacity: 1-opacity.value,
                                        child: Padding(
                                          padding: const EdgeInsets.only(left: 8),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              "Quick".semiBold(context: context, size: 24, color: const Color(0xFFEC60C3)),
                                              "Options".bold(context: context, size: 32, color: Colors.white),
                                            ],
                                          ),
                                        ),
                                      ),
                                      4.vgap(context),
                                      Opacity(
                                        opacity: 1-opacity.value,
                                        child: GradientContainer(
                                          fullWidth: true,
                                          radius: context.width()<300 ? 30 : 30,
                                          padding: EdgeInsets.symmetric(horizontal: context.width()<300 ? 8 : 16, vertical: 10),
                                          height: context.height()*(context.height()<800 ? 0.60 : 0.6)*containerSize.value,
                                          child: BookingForm(
                                            onBookNow: (){
                                              openBooking.reverse().then((value) => Get.toNamed(Routes.payment)?.then((value) => openBooking.forward()));
                                            },
                                            onProfileOpen: (){
                                              openProfile.forward().then((value) => Get.toNamed(Routes.profile)?.then((value) => openProfile.reverse()));
                                            },
                                          )
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                          
                        ),
                      );
                    }
                  );
                }
              ),
      
              AnimatedBuilder(
                animation: bottomsheetDown,
                builder: (context, val) {
                  return AnimatedBuilder(
                    animation: bottomsheet,
                    builder: (_, val) {
                      return Transform.translate(
                        offset: Offset(0, bottomsheet.value + bottomsheetDown.value),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child:  DraggableScrollableSheet(
                            minChildSize:0.15,
                            maxChildSize: (context.height()-SizeResponsive.get(context, (context.height()<855 && context.width()==480) ? 90 : 115))/context.height(),
                            initialChildSize:0.15,
                            shouldCloseOnMinExtent: false,
                            expand: false,
                            builder: (_, __) {
                              return SingleChildScrollView(
                                controller: __,
                                child: const Stack(
                                  children: [
                                    Testimonials(),
                                  ],
                                ));
                            }
                          ),
                        ),
                      );
                    }
                  );
                }
              ),
            ],
          ),
        )),
    );
  }
}
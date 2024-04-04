import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/widgets/main_drawer.dart';

import '../responsive/size_responsive.dart';
import '../widgets/animated_ad.dart';
import '../widgets/background.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/gradient_container.dart';
import '../widgets/marquee_text.dart';
import '../widgets/profile_content.dart';
import '../widgets/profile_top.dart';

class DoctorView extends StatefulWidget {
  const DoctorView({super.key});

  @override
  State<DoctorView> createState() => _DoctorViewState();
}

class _DoctorViewState extends State<DoctorView> with TickerProviderStateMixin{
  late Animation<double> profileDown;
  late Animation<double> bottomsheet;

  late AnimationController openProfile; 

  final GlobalKey<ScaffoldState> key = GlobalKey();

  @override
  void initState() {
    openProfile = AnimationController(duration: const Duration(seconds: 1), vsync: this);
    profileDown = Tween<double>(
      begin: -300,
      end: 110
    ).animate(CurvedAnimation(
      parent: openProfile,
      reverseCurve: Curves.ease,
      curve: const Interval(0.3, 0.8, curve: Curves.easeOut)
    ));
     bottomsheet = Tween<double>(
      begin: 200,
      end: 0
    ).animate(CurvedAnimation(
      parent: openProfile,
      reverseCurve: Curves.ease,
      curve: const Interval(0.3, 0.7, curve: Curves.easeOut)
    ));
    openProfile.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: key,
        endDrawer: const MainDrawer(),
        body: Stack(
            children: [
              const Background(),
              AnimatedBuilder(
                    animation: profileDown,
                    builder: (_, val) {
                      return Positioned(
                        left: 0, right: 0,
                        top: profileDown.value,
                        child: const ProfileTop()
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
                animation: bottomsheet,
                builder: (_, val) {
                  return Transform.translate(
                    offset: Offset(0, bottomsheet.value),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: DraggableScrollableSheet(
                        minChildSize: context.height()<600 ? 0.58 :context.height()>=800 && context.aspect()<0.5 ? 0.65 : 0.6,
                        maxChildSize: 0.9,
                        initialChildSize: context.height()<600 ? 0.58 : context.height()>=800 && context.aspect()<0.5 ? 0.65 : 0.6,
                        shouldCloseOnMinExtent: false,
                        expand: false,
                        builder: (_, __) {
                          return GestureDetector(
                            onVerticalDragEnd: (v){
                              openProfile.reverse().then((value) => Get.back());
                            },
                            child: const ProfileContent());
                        }
                      )
                    ),
                  );
                }
              ),
              
            ],
          )
      ));
  }
}
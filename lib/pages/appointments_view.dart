import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/widgets/appointment_content.dart';
import 'package:reunirts/widgets/appointment_top.dart';
import 'package:reunirts/widgets/gradient_container.dart';
import 'package:reunirts/widgets/main_drawer.dart';

import '../responsive/size_responsive.dart';
import '../widgets/animated_ad.dart';
import '../widgets/background.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/marquee_text.dart';

class AppointmentsView extends StatefulWidget {
  const AppointmentsView({super.key});

  @override
  State<AppointmentsView> createState() => _AppointmentsViewState();
}

class _AppointmentsViewState extends State<AppointmentsView> with SingleTickerProviderStateMixin{
  late Animation<double> top;
  late Animation<double> bottom;

  late AnimationController openAppointments; 

  final GlobalKey<ScaffoldState> key = GlobalKey();

  @override
  void initState() {
    openAppointments = AnimationController(duration: const Duration(seconds: 1), vsync: this);
    top = Tween<double>(
      begin: -300,
      end: 90
    ).animate(CurvedAnimation(
      parent: openAppointments,
      reverseCurve: Curves.ease,
      curve: const Interval(0.3, 0.8, curve: Curves.easeOut)
    ));
     bottom = Tween<double>(
      begin: 200,
      end: 0
    ).animate(CurvedAnimation(
      parent: openAppointments,
      reverseCurve: Curves.ease,
      curve: const Interval(0.3, 0.7, curve: Curves.easeOut)
    ));
    openAppointments.forward();

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
                animation: top,
                builder: (_, val) {
                  return Positioned(
                    left: 0, right: 0,
                    top: top.value + (MediaQuery.of(context).size.height<600 ? 0 : 10),
                    child: AppointmentTop(
                      onBackClick: (){
                        openAppointments.reverse().then((value) => Get.back());
                      }
                    )
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
                      minChildSize: MediaQuery.of(context).size.height<600 ? 0.48: 0.5,
                      maxChildSize: 0.9,
                      initialChildSize: MediaQuery.of(context).size.height<600 ? 0.48: 0.5,
                      shouldCloseOnMinExtent: false,
                      expand: false,
                      builder: (_, __) {
                        return const AppointmentContent();
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
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reunirts/constants/color_const.dart';
import 'package:reunirts/responsive/size_responsive.dart';
import 'package:reunirts/widgets/info_tag.dart';

import 'info_tag2.dart';

class AnimatedAd extends StatefulWidget {
  const AnimatedAd({super.key});

  @override
  State<AnimatedAd> createState() => _AnimatedAdState();
}

class _AnimatedAdState extends State<AnimatedAd> {

  int _pageIndex = 0;
  late PageController? _pageController;
  late Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    startTimer();
  }

  startTimer(){
    _timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      if(_pageController!=null){
      _pageIndex = _pageIndex + 1;
      _pageController?.animateToPage(_pageIndex,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
      }
    });
  }

   @override
  void dispose() {
    _timer?.cancel();
    _pageController?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            width: double.infinity,
            height: 22,
            decoration: const BoxDecoration(
              color: ColorConst.bgColor
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: SizedBox(
              width: SizeResponsive.get(context, 210),
              child: PageView.builder(
                itemCount: 10000, 
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 3),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40)
                        ),
                        child: index%2 == 0 
                          ? const InfoTag(): const InfoTag2()),
                    ],
                  );
                }),
            ),
          ),
        ],
      ),
    );
  }
}

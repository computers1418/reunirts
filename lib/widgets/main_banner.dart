import 'package:flutter/material.dart';
import 'package:reunirts/extensions/int_exten.dart';


class MainBanner extends StatefulWidget {
  const MainBanner({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MainBannerState createState() => _MainBannerState();
}

class _MainBannerState extends State<MainBanner> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationUp;
  late Animation<double> _animationDown;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Set the total duration for up and down
    );

    _animationUp = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.3, curve: Curves.easeInOut), // Use the first half for going up
      ),
    );

    _animationDown = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 1, curve: Curves.easeInOut), // Use the second half for going down
      ),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse(); // Reverse the animation when it's completed
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward(); // Start the animation again when it's dismissed
      }
    });

    _controller.forward(); // Start the animation initially
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, -3 * _animationUp.value - 12 * _animationDown.value),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            child: Image.asset("res/images/pattern2.png", height: context.height()*0.55,)
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
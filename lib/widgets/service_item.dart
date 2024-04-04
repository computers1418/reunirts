import 'package:flutter/material.dart';
import 'package:reunirts/extensions/string_exten.dart';
import 'package:reunirts/widgets/gradient_container.dart';
import 'package:reunirts/widgets/gradient_text.dart';

class ServiceItem extends StatelessWidget {
  final bool isSelected;
  final String name;
  const ServiceItem({super.key, required this.isSelected, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      height: 36,
      child: isSelected 
      ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // GradientText(text: name, fontSize: 18),
          name.bold(context: context, size: 17, color: const Color(0xFFD62F77)),
          GradientContainer(
            height: 32,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: 
              "Rs. 300".bold(context: context, size: 14, color: Colors.white))
        ],
      )
      : Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          name.semiBold(context: context, size: 16, color: const Color(0xFFAD648D)),
          Container(
            height: 36,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: "Rs. 300".semiBold(context: context, size: 14, color: const Color(0xFFAD648D)),
          ),
        ],
      ),
    );
  }
}
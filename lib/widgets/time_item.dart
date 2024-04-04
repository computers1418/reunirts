import 'package:flutter/material.dart';
import 'package:reunirts/extensions/string_exten.dart';
import 'package:reunirts/widgets/gradient_container.dart';

class TimeItem extends StatelessWidget {
  final String label;
  final bool isSelected;
  final ValueChanged onTimeSelect;
  const TimeItem({super.key, required this.label, required this.isSelected, required this.onTimeSelect});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>onTimeSelect(label),
      child: isSelected
      
      ? GradientContainer(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: label.extraBold(context: context, size: 10, color: Colors.white)
      )
      
      : Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: const Color(0xFFFCF2FD),
          borderRadius: BorderRadius.circular(30)
        ),
        alignment: Alignment.center,
        child: label.extraBold(context: context, size: 10, color: const Color(0xFFCCA5CF)),
      ),
    );
  }
}
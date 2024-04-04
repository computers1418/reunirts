import 'package:flutter/material.dart';
import 'package:reunirts/extensions/string_exten.dart';
import 'package:reunirts/widgets/gradient_text.dart';

class ConsultationItem extends StatelessWidget {
  final bool isSelected;
  final String name;
  const ConsultationItem({super.key, required this.isSelected, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      height: 36,
      alignment: Alignment.centerLeft,
      child: isSelected 
      // ? GradientText(text: name, fontSize: 16)
      ? name.bold(context: context, size: 17, color: const Color(0xFFD62F77))
      : name.semiBold(context: context, size: 16, color: const Color(0xFFAD648D)),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/extensions/string_exten.dart';
import 'package:reunirts/widgets/circle_container.dart';
import 'package:reunirts/widgets/gradient_container.dart';

class PaymentItem extends StatelessWidget {
  final bool isSelected;
  final List data;
  const PaymentItem({super.key, required this.isSelected, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: isSelected
      ? GradientContainer(
        radius: 24,
        width: (context.width()-64)/4,
        height: (context.width()-104)/4,
        padding: EdgeInsets.zero,
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getIcon(data),
          6.vgap(context),
          getLabel(data, context)
        ],
      )) : CircleContainer(
        radius: 24,
        padding: const EdgeInsets.all(8),
        width: (context.width()-64)/4,
        height: (context.width()-64)/4,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          getIcon(data),
          2.vgap(context),
          getLabel(data, context)
        ],
      )),  
    ) ;
  }

  getIcon(item){
    if(item[2]!=null){
      return '${item[1]}'.imageToIcon(color: !isSelected ? const Color(0xFFD52F7A) : Colors.white, size: 28, imagePath: true);
    }else{
      return Image.asset("res/images/${item[1]}.png", width: 28, height: 28);
    }
  }

  getLabel(item, BuildContext context){
    return "${item[0]}".bold(alignCenter: true, context: context, size: 8, color: !isSelected ? const Color(0xFF252525) : Colors.white);
  }

  

}
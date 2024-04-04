import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reunirts/constants/color_const.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/extensions/string_exten.dart';
import 'package:reunirts/widgets/gradient_container.dart';

class CalendarScroll extends StatelessWidget {
  final String? selected;
  final ValueChanged onDateSelect;
  const CalendarScroll({super.key, this.selected, required this.onDateSelect});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          final date = DateTime.now().add(Duration(days: index));
          final formattedDate = DateFormat('dd MMM').format(date);
          final day = DateFormat('E').format(date);

          bool isSelected = selected == formattedDate;

          if(isSelected){
            return Container(
              width: 90,
              padding: const EdgeInsets.only(right: 8),
              child: GradientContainer(
                radius: 20,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    formattedDate.extraBold(context: context, size: 13, color: Colors.white),
                    4.vgap(context),
                    day.extraBold(context: context, size: 10, color: Colors.white),
                  ],
                ),
              ),
            );
          }else{
            return GestureDetector(
              onTap: (){
                onDateSelect(formattedDate);
              },
              child: Container(
                width: 90,
                margin: const EdgeInsets.only(right: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
                ),
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    formattedDate.medium(context: context, size: 13, color: ColorConst.txtColor),
                    4.vgap(context),
                    day.semiBold(context: context, size: 10, color: const Color(0xFF895472)),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
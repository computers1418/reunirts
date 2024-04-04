import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/widgets/consultation_item.dart';

import '../responsive/responsive_text.dart';
import '../responsive/size_responsive.dart';

class SingleSelect extends StatefulWidget {
  const SingleSelect({super.key});

  @override
  State<SingleSelect> createState() => _SingleSelectState();
}

class _SingleSelectState extends State<SingleSelect> {
  String? selected;

  @override
  Widget build(BuildContext context) {

     var border = OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.transparent)
            );

      var items = [
        "Video Call","Voice Call","Clinic Consultation"
      ];

    return SizedBox(
      height: context.height()>=800 ? 55 : SizeResponsive.get(context, 44),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField2(
          value: selected,
          items: List.generate(3, (index) => index).map(
            (e){
              return DropdownMenuItem(
                  value: items[e],
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: context.width()>375 ? 24 : 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ConsultationItem(isSelected: selected==items[e], name: items[e]),
                        Visibility(
                        visible: true,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Divider(color: e!=2 ? const Color(0x80F5D3E7) : Colors.transparent, height: 1, ),
                        ))
                      ],
                    ),
                  )
                );
            }).toList(),
            menuItemStyleData: const MenuItemStyleData(
                height: 60,
                padding: EdgeInsets.only(left: 0, right: 0),
              ),
          style: TextStyle(
            fontFamily: "Metroplis",
            fontSize: ResponsiveText.get(context, 16),
            height: 1,
            fontWeight: FontWeight.w600,
            color: const Color(0xFFFFFFFF)
          ),
          selectedItemBuilder: (_){
            return items.map((e) => Text(e, style: TextStyle(
                fontFamily: "Metroplis",
                fontSize: ResponsiveText.get(context, 16),
                height: 1,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFFFFFFF)
              ),)).toList();
          },
          iconStyleData: const IconStyleData(
                icon: Icon(Icons.keyboard_arrow_down, color: Color(0x4DFFFFFF)),
                iconSize: 24,
              ),
          dropdownStyleData: DropdownStyleData(
            padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
              decoration: BoxDecoration(
                color: const Color(0xFFFCF2FD),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 24, right: 12),
              hintText: "Choose Consultation",
              labelStyle: TextStyle(
                fontFamily: "Metroplis",
                fontSize: ResponsiveText.get(context, 16),
                height: 1,
                fontWeight: FontWeight.w600,
                color: const Color(0x4DFFFFFF)
              ),
              hintStyle: TextStyle(
                fontFamily: "Metroplis",
                fontSize: ResponsiveText.get(context, 16),
                height: 1,
                fontWeight: FontWeight.w600,
                color: const Color(0x4DFFFFFF)
              ),
              filled: true,
              fillColor: const Color(0x1AFFFFFF),
              border: border,
              enabledBorder: border,
              focusedBorder: border
            ),
          onChanged: (e){
            setState(() {
              selected = e.toString();
            });
          }
        ),
      ),
    );
  }
}
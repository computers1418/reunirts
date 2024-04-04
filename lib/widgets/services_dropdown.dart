import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/widgets/service_item.dart';

import '../responsive/responsive_text.dart';
import '../responsive/size_responsive.dart';

class ServicesDropdown extends StatefulWidget {
  const ServicesDropdown({super.key});

  @override
  State<ServicesDropdown> createState() => _ServicesDropdownState();
}

class _ServicesDropdownState extends State<ServicesDropdown> {
  String? selected;

  @override
  Widget build(BuildContext context) {

     var border = OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.transparent)
            );

      var items = [
        "Dental Braces", "Dental Crown", "Tooth Extraction","Root Canal", "Whitening", "Tooth Straightening"
      ];

    return SizedBox(
      height: context.height()>=800 ? 55 : SizeResponsive.get(context, 44),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField2(
          value: null,
          items: List.generate(6, (index) => index).map(
            (e){
              return DropdownMenuItem(
                value: items[e],
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: context.width()>375 ? 24 : 16.0, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ServiceItem(isSelected: selected==items[e], name: items[e]),
                      Visibility(
                        visible: true,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: Divider(color: e!=5 ? const Color(0x80F5D3E7) : Colors.transparent, height: 1, ),
                        ))
                    ],
                  ),
                )
              );
            }).toList(),
          style: TextStyle(
            fontFamily: "Metroplis",
            fontSize: ResponsiveText.get(context, 16),
            height: 1,
            fontWeight: FontWeight.w600,
            color: const Color(0xFFFFFFFF)
          ),
          menuItemStyleData: const MenuItemStyleData(
                height: 77,
                padding: EdgeInsets.only(left: 0, right: 0),
              ),
          iconStyleData: const IconStyleData(
                icon: Icon(Icons.keyboard_arrow_down, color: Color(0x4DFFFFFF)),
                iconSize: 24,
              ),
          dropdownStyleData: DropdownStyleData(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              decoration: BoxDecoration(
                color: const Color(0xFFFCF2FD),
                borderRadius: BorderRadius.circular(30),
              ),
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
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.only(left: 24, right: 12),
              hintText: "Choose Services",
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
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/widgets/doctor_item.dart';

import '../responsive/responsive_text.dart';
import '../responsive/size_responsive.dart';

class DoctorsSelect extends StatefulWidget {
  final VoidCallback onSelect;
  const DoctorsSelect({super.key, required this.onSelect});

  @override
  State<DoctorsSelect> createState() => _DoctorsSelectState();
}

class _DoctorsSelectState extends State<DoctorsSelect> {
  String? selected;

  @override
  Widget build(BuildContext context) {

     var border = OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.transparent)
            );

      var items = [
        {
          "name": "Dr. David Russ",
          "loc": "K.T Nagar"
        },
        {
          "name": "Dr. Veronica Ray",
          "loc": "K.T Nagar"
        },
        {
          "name": "Dr. Mark Rooney",
          "loc": "K.T Nagar"
        },
        {
          "name": "Dr. Anna Bailey",
          "loc": "K.T Nagar"
        },
        {
          "name": "Dr. Rob Rhodes",
          "loc": "K.T Nagar"
        }
      ];

    return SizedBox(
      height: context.height()>=800 ? 55 : SizeResponsive.get(context, 44),
      child: DropdownButtonHideUnderline(
        child: DropdownButtonFormField2(
          value: selected,
          items: List.generate(5, (index) => index).map(
            (e){
              return DropdownMenuItem(
                  value: items[e]["name"],
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: DoctorItem(
                      onSelect: (){
                        Get.back();
                        widget.onSelect();
                      },
                      selected: items[e]["name"] == selected, data: items[e]))
                );
            }).toList(),
          selectedItemBuilder: (_){
            return items.map((e) => Text(e["name"]!, style: TextStyle(
                fontFamily: "Metroplis",
                fontSize: ResponsiveText.get(context, 16),
                height: 1,
                fontWeight: FontWeight.w600,
                color: const Color(0xFFFFFFFF)
              ),)).toList();
          },
          style: TextStyle(
            fontFamily: "Metroplis",
            fontSize: ResponsiveText.get(context, 16),
            height: 1,
            fontWeight: FontWeight.w600,
            color: const Color(0xFFFFFFFF)
          ),
          
          menuItemStyleData: const MenuItemStyleData(
                height: 92,
                padding: EdgeInsets.only(left: 0, right: 0),
              ),
          iconStyleData: const IconStyleData(
                icon: Icon(Icons.keyboard_arrow_down, color: Color(0x4DFFFFFF)),
                iconSize: 24,
              ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 400,
            scrollPadding: const EdgeInsets.only(right:  0, left: 0),
                        scrollbarTheme: ScrollbarThemeData(
                          radius: const Radius.circular(40),
                          minThumbLength: 40,
                          thumbColor: const MaterialStatePropertyAll(Color(0xFFAD37E0)),
                          trackVisibility: const MaterialStatePropertyAll(true),
                          trackColor: const MaterialStatePropertyAll(Color(0xFFFFFFFF)),
                          thickness: MaterialStateProperty.all(2),
                          thumbVisibility: MaterialStateProperty.all(true),
                        ),
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFFCF2FD),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          decoration: InputDecoration(
            
              contentPadding: const EdgeInsets.only(left: 24, right: 12),
              hintText: "Choose Doctor",
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
          onChanged: (e)async{
            setState(() {
              selected = e.toString();
            });
          }
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:reunirts/constants/color_const.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/extensions/string_exten.dart';
import 'package:reunirts/widgets/calendar_scroll.dart';
import 'package:reunirts/widgets/time_item.dart';

import '../responsive/responsive_text.dart';
import '../responsive/size_responsive.dart';

class DateTimeDropdown extends StatefulWidget {
  const DateTimeDropdown({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DateTimeDropdownState createState() => _DateTimeDropdownState();
}

class _DateTimeDropdownState extends State<DateTimeDropdown> {
  late ValueNotifier<String?> selectedDate;
  late ValueNotifier<String?> selectedTime;
  

  OverlayEntry? _overlayEntry;

  final LayerLink _layerLink = LayerLink();

  var border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.transparent)
      );

  @override
  void initState() {
    super.initState();

    selectedDate = ValueNotifier(null);
    selectedTime = ValueNotifier(null);

    // _focusNode.addListener(() {
    //   print(_focusNode.hasFocus);
    //   if (_focusNode.hasFocus) {

    //     _overlayEntry = _createOverlayEntry();
    //     Overlay.of(context).insert(_overlayEntry);

    //   } else {
    //     _overlayEntry.remove();
    //   }
    // });
  }

  void close(){
    if(selectedDate.value!=null && selectedTime.value!=null){
      Future.delayed(const Duration(milliseconds: 300),(){
        _overlayEntry?.remove();
      });
    }
  }

  OverlayEntry _createOverlayEntry() {

    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Stack(
        children: [
          GestureDetector(
            onTap: () {
              _overlayEntry?.remove(); 
            },
            child: Container(
              color: Colors.transparent, 
            ),
          ),
          Positioned(
            width: size.width,
            child: CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              offset: Offset(0.0, size.height + 5.0),
              child: Material(
                elevation: 4.0,
                borderRadius: BorderRadius.circular( context.width()<300 ? 28: 30),
                child: ValueListenableBuilder(
                  valueListenable: selectedTime,
                  builder: (_, val, __) {
                    return ValueListenableBuilder(
                      valueListenable: selectedDate,
                      builder: (_, val, __) {
                        return Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFFCF2FD),
                            borderRadius: BorderRadius.circular(30)
                          ),
                          padding: EdgeInsets.all( context.width()<300 ? 8 : 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              "Date".bold(context: context, size: 13, color: ColorConst.txtColor),
                              8.vgap(context),
                              CalendarScroll(
                                selected: selectedDate.value,
                                onDateSelect: (d){
                                  setState(() {
                                    selectedDate.value = d;
                                  });
                                  close();
                                },  
                              ),
                              8.vgap(context),
                              "Time".bold(context: context, size: 13, color: ColorConst.txtColor),
                              10.vgap(context),
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: context.width()<300 ? 8 : 16, vertical: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular( context.width()<300 ? 28 : 30),
                                  color: Colors.white
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    "Morning".bold(context: context, size: 10, color: const Color(0xFF895472)),
                                    10.vgap(context),
                                    GridView.builder(
                                      itemCount: 3,
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        childAspectRatio: 2.5,
                                        mainAxisSpacing: 8,
                                        crossAxisSpacing: 8
                                      ), 
                                      padding: EdgeInsets.zero,
                                      itemBuilder: (_, idx){
                                        var items = ["09.00 am", "10.00 am", "11.00 am"];
                                        return TimeItem(
                                          label: items[idx], 
                                          isSelected: selectedTime.value == items[idx],
                                          onTimeSelect: (t){
                                            setState(() {
                                              selectedTime.value = t;
                                            });
                                            close();
                                          }
                                          ,    
                                        );
                                      }),
                                    12.vgap(context),
                                    "Afternoon".bold(context: context, size: 10, color: const Color(0xFF895472)),
                                    10.vgap(context),
                                    GridView.builder(
                                      itemCount: 3,
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.zero,
                                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        childAspectRatio: 2.5,
                                        mainAxisSpacing: 8,
                                        crossAxisSpacing: 8  
                                      ), 
                                      itemBuilder: (_, idx){
                                        var items = ["12.00 pm", "02.00 pm", "03.00 pm"];
                                        return TimeItem(
                                          label: items[idx], 
                                          isSelected: selectedTime.value == items[idx],
                                          onTimeSelect: (t){
                                            setState(() {
                                              selectedTime.value = t;
                                            });
                                            close();
                                          }
                                          ,    
                                        );
                                      }),
                                    12.vgap(context),
                                    "Evening".bold(context: context, size: 10, color: const Color(0xFF895472)),
                                    10.vgap(context),
                                    GridView.builder(
                                      itemCount: 6,
                                      shrinkWrap: true,
                                      physics: const NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.zero,
                                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        childAspectRatio: 2.5,
                                        mainAxisSpacing: 8,
                                        crossAxisSpacing: 8
                                      ), 
                                      itemBuilder: (_, idx){
                                        var items = ["04.00 pm", "05.00 pm", "06.00 pm", "07.00 pm", "08.00 pm", "09.00 pm"];
                                        return TimeItem(
                                          label: items[idx], 
                                          isSelected: selectedTime.value == items[idx],
                                          onTimeSelect: (t){
                                            setState(() {
                                              selectedTime.value = t;
                                            });
                                            close();
                                          }
                                          ,  
                                        );
                                      }),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      }
                    );
                  }
                )
              ),
            ),
          ),
        ],
      )
    );
  }
@override
Widget build(BuildContext context) {
  return PopScope(
    onPopInvoked: (v){
      if(_overlayEntry!=null){
       if(_overlayEntry?.mounted ?? false){
          _overlayEntry?.remove();
        }
      }
    },
    child: CompositedTransformTarget(
      link: _layerLink,
      child: FocusScope(
        node: FocusScopeNode(),
        child: GestureDetector(
          onTap: () {
             if (_overlayEntry!=null  && _overlayEntry!.mounted) {
                _overlayEntry?.remove();
              } else {
                 _overlayEntry = _createOverlayEntry();
                Overlay.of(context).insert(_overlayEntry!);
              }
              // Unfocusing the FocusScope
              FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            height: context.height()>=800 ? 55 : SizeResponsive.get(context, 44),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color(0x1AFFFFFF),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    (selectedDate.value!=null) ? "${selectedDate.value}, ${selectedTime.value??''}": "Choose Date & Time",
                    style: TextStyle(
                      fontFamily: "Metroplis",
                      fontSize: ResponsiveText.get(context, 16),
                      height: 1,
                      fontWeight: FontWeight.w600,
                      color: (selectedDate.value!=null) ? Colors.white: const Color(0x4DFFFFFF),
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down, color: Color(0x4DFFFFFF)),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
}
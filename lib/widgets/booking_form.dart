import 'package:flutter/material.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/extensions/string_exten.dart';
import 'package:reunirts/responsive/responsive_text.dart';
import 'package:reunirts/responsive/size_responsive.dart';
import 'package:reunirts/widgets/consultaion_select_overlay.dart';
import 'package:reunirts/widgets/datetime_dropdown.dart';
import 'package:reunirts/widgets/service_select_overlay.dart';
import 'package:reunirts/widgets/single_select_overlay.dart';

class BookingForm extends StatelessWidget {
  final VoidCallback onProfileOpen;
  final VoidCallback onBookNow;
  const BookingForm({super.key, required this.onProfileOpen, required this.onBookNow});

  @override
  Widget build(BuildContext context) {

    var border = OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(color: Colors.transparent)
            );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        context.height()>800 && context.width()!=480 ? 10.vgap(context) : 0.vgap(context),
        "Book".bold(context: context, size: 20, color: const Color(0x40FFFFFF)),
        "Appointment".black(context: context, size: 24),
        context.width()<=320 && context.height()<=570 ? 4.vgap(context) : context.height()>800 && context.width()!=480 ? 30.vgap(context) : 12.vgap(context),
        SizedBox(
          height: context.height()>=800 ? 55 : SizeResponsive.get(context, 44),
          child: TextFormField(
            style: TextStyle(
              fontFamily: "Metroplis",
              fontSize: ResponsiveText.get(context, 16),
              height: 1,
              fontWeight: FontWeight.w600,
              color: const Color(0xFFFFFFFF)
            ),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: context.height()>=800 ? 24 : 0),
              hintText: "Enter name",
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
          ),
        ),
        context.height()>=800 && context.width()!=480 ? 6.vgap(context) : 4.vgap(context),
        const DateTimeDropdown(),
        context.height()>=800 && context.width()!=480 ? 6.vgap(context) : 4.vgap(context),
        // const ServicesDropdown(),
        const ServiceSelectOverlay(),
        context.height()>=800 && context.width()!=480 ? 6.vgap(context) : 4.vgap(context),
        // DoctorsSelectMenu(onSelect: (){}),
        DoctorsSelectOverlay(onSelect: onProfileOpen),
        // DoctorsSelect(
        //   onSelect: onProfileOpen,
        // ),
        context.height()>=800 && context.width()!=480 ? 6.vgap(context) : 4.vgap(context),
        SizedBox(
          height: context.height()>=800 ? 55 : SizeResponsive.get(context, 44),
          child: TextFormField(
            style: TextStyle(
              fontFamily: "Metroplis",
              fontSize: ResponsiveText.get(context, 16),
              height: 1,
              fontWeight: FontWeight.w600,
              color: const Color(0xFFFFFFFF)
            ),
            cursorColor: Colors.white,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 24, vertical: context.height()>=800 ? 24 : 0),
              hintText: "Choose Test & Medicine",
              hintStyle: TextStyle(
                fontFamily: "Metroplis",
                fontSize: ResponsiveText.get(context, 16),
                height: 1,
                fontWeight: FontWeight.w600,
                color: const Color(0x4DFFFFFF)
              ),
              suffixIcon: const Padding(
                padding: EdgeInsets.only(right: 24),
                child: Icon(Icons.keyboard_arrow_down, color: Color(0x4DFFFFFF)),
              ),
              filled: true,
              fillColor: const Color(0x1AFFFFFF),
              border: border,
              enabledBorder: border,
              focusedBorder: border
            ),
          ),
        ),
        context.height()>=800 && context.width()!=480 ? 6.vgap(context) : 4.vgap(context),
        // const SingleSelect(),
        const ConsultationSelectOverlay(),
        context.width()<=320 && context.height()<=570 ? 6.vgap(context) : context.height()>=800 && context.width()!=480 ? 12.vgap(context) : 6.vgap(context),
        GestureDetector(
          onTap: onBookNow,
          child: Container(
            height: SizeResponsive.get(context, 50),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF252525),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: "BOOK NOW".black(context: context, size: 20, color: Colors.white),
          ),
        )
      ],
    );
  }
}
import 'package:flutter/material.dart';
import 'package:reunirts/extensions/int_exten.dart';

class DialogFields extends StatelessWidget {
  const DialogFields({super.key});

  @override
  Widget build(BuildContext context) {

    var max = context.height()>=800;

    var border = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(30)
    );

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextFormField(
            style: const TextStyle(
              fontFamily: "Metroplis",
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: Color(0xFF252525)
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFF9F9F9),
              contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              border: border,
              hintText: "Phone no",
              hintStyle: const TextStyle(
                fontFamily: "Metroplis",
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: Color(0x80252525)
              ),
              enabledBorder: border,
              focusedBorder: border,
            )),
            (max ? 30 : 20).vgap(context),
            TextFormField(
            style: const TextStyle(
              fontFamily: "Metroplis",
              fontSize: 12,
              fontWeight: FontWeight.w800,
              color: Color(0xFF252525)
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFF9F9F9),
              contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              border: border,
              hintText: "Email ID",
              hintStyle: const TextStyle(
                fontFamily: "Metroplis",
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: Color(0x80252525)
              ),
              enabledBorder: border,
              focusedBorder: border,
            ),
          )
        ],
      ),
    );
  }
}
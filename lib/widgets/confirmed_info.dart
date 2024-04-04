import 'package:flutter/material.dart';
import 'package:reunirts/extensions/int_exten.dart';
import 'package:reunirts/extensions/string_exten.dart';
import 'package:reunirts/widgets/gradient_container.dart';

class ConfirmedInfo extends StatelessWidget {
  const ConfirmedInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var max = context.height()>=800;

    return Container(
      margin: const EdgeInsets.all(16),
      child: GradientContainer(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: "Patients name".medium(context: context, size: 11, color: Colors.white),
                ),
                Expanded(
                  child: "Wayne Barnes".extraBold(context: context, size: 11, color: Colors.white),
                )
              ],
            ),
            (max ? 16 : 10).vgap(context),
            Row(
              children: [
                Expanded(
                  child: "Date & Time".medium(context: context, size: 11, color: Colors.white),
                ),
                Expanded(
                  child: "12 Nov, 11:00 am".extraBold(context: context, size: 11, color: Colors.white),
                )
              ],
            ),
            (max ? 16 : 10).vgap(context),
            Row(
              children: [
                Expanded(
                  child: "Service".medium(context: context, size: 11, color: Colors.white),
                ),
                Expanded(
                  child: "Dental Braces".extraBold(context: context, size: 11, color: Colors.white),
                )
              ],
            ),
            (max ? 16 : 10).vgap(context),
            Row(
              children: [
                Expanded(
                  child: "Address".medium(context: context, size: 11, color: Colors.white),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Wayne Barnes".extraBold(context: context, size: 11, color: Colors.white),
                      (max ? 4 : 2).vgap(context),
                      "12/2, Mathura Road, Sector 37, Faridabad - Delhi".semiBold(context: context, size: 8, color: Colors.white)
                    ],
                  ),
                )
              ],
            ),
          ],
        )),
    );
  }
}
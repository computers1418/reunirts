import 'package:flutter/material.dart';
import 'package:reunirts/extensions/string_exten.dart';
import 'package:reunirts/utils/data.dart';
import 'package:reunirts/widgets/circle_container.dart';
import 'package:reunirts/widgets/gradient_container.dart';

class CityList extends StatefulWidget {
  const CityList({super.key});

  @override
  State<CityList> createState() => _CityListState();
}

class _CityListState extends State<CityList> {
  String? selected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12, bottom: 10),
      child: Theme(
        data: ThemeData(scrollbarTheme: ScrollbarThemeData(
              thumbColor: MaterialStateProperty.all<Color>(const Color(0xFFD62F77)),
              trackColor: MaterialStateProperty.all<Color>(const Color(0xFFF6F6F6)),
              trackBorderColor: MaterialStateProperty.all<Color>(Colors.transparent),
            ),),
        child: Scrollbar(
          interactive: true,
          thumbVisibility: true,
          trackVisibility: true,
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemCount: cities.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 6,
              crossAxisSpacing: 6,
              childAspectRatio: 5
            ), itemBuilder: (_, idx){
              return cities[idx]==selected 
                ? GradientContainer(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: cities[idx].bold(context: context, size: 14, color: Colors.white))
                : GestureDetector(
                  onTap: ()=>setState(()=>selected = cities[idx]),
                  child: CircleContainer(
                    align: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: cities[idx].bold(context: context, size: 14, color: const Color(0xFFD4ABC5))),
                );
            }),
        ),
      ),
    );
  }
}
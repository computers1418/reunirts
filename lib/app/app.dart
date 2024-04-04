import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:reunirts/constants/color_const.dart';
import 'package:reunirts/pages/home_view.dart';

import '../routes/app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'REUNIRTS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: ColorConst.bgColor),
        useMaterial3: true,
        scaffoldBackgroundColor: ColorConst.bgColor,
        fontFamily: "Metropolis",
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
      getPages: RouteGenerator.pages,
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
          child: child!,
        );
      },
    );
  }


  static navigateBack(){
    Get.back();
  }

}
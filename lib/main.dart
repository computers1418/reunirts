import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reunirts/constants/color_const.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app/app.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle( const SystemUiOverlayStyle(
    statusBarColor: ColorConst.bgColor,
    statusBarIconBrightness: Brightness.light,
  ));

  setPathUrlStrategy();

  runApp(const App());
}
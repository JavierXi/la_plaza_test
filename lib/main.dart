import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:la_plaza/splash/splash.dart';
import 'package:la_plaza/utils/colors.dart' as color;

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
    );
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: color.AppColor.statusBarColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
        systemNavigationBarColor: color.AppColor.darkGrayColor,
        systemNavigationBarDividerColor: color.AppColor.darkGrayColor,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarContrastEnforced: false,
      ),
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'La Plaza',
      theme: ThemeData.light().copyWith(
          scaffoldBackgroundColor: color.AppColor.backgroundColor,
          primaryColor: color.AppColor.lightGreenColor,
          unselectedWidgetColor: color.AppColor.lightGrayColor),
      home: const Splash(),
    );
  }
}

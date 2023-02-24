import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:shop/route/route_constants.dart';
import 'package:shop/route/router.dart' as router;

import 'theme/dark_theme.dart';
import 'theme/light_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'The Flutter Way',
        theme: lightTheme(context),
        darkTheme: darkTheme(context),
        themeMode: ThemeMode.light,
        onGenerateRoute: router.generateRoute,
        initialRoute: onbordingScreenRoute,
      ),
    );
  }
}
